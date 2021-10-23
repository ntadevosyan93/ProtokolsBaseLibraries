-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SMStoPUSH]
	-- Add the parameters for the stored procedure here
 	@idm_sms int,
	@phone varchar(50),
	@table_name varchar(100) = 'SMS_MAIN'
AS
BEGIN

	SET NOCOUNT ON;

	declare @cmd nvarchar(4000)
	declare @textSms varchar(1024)
	declare @module varchar(150)
	declare @pushOnly int
	declare @smsOnly int

	set @cmd = '(select top(1) @textSms = text, @pushOnly = pushOnly, @smsOnly = smsOnly, @module = module from '+@table_name+' with(nolock)where id = '+cast(@idm_sms as varchar(50))+')'
	EXEC sp_executesql @cmd, N'@textSms NVARCHAR(1024) OUTPUT, @pushOnly int OUTPUT, @smsOnly int OUTPUT, @module NVARCHAR(150) OUTPUT', @textSms=@textSms OUTPUT, @pushOnly=@pushOnly OUTPUT,  @smsOnly=@smsOnly OUTPUT,  @module=@module OUTPUT

	-- 0. Если потверждение операции
	if (@textSms like '%Ваш код для подтверждения%') begin
	
		-- 0.1 Отправляем по смс в любом случае
		select 0 as result
		return

	end


	-- 1. Получение глобальных модификаторов для номера телефона
	declare @G_smsOnly int
	declare @G_push_only int
	declare @G_blacklisted int

	select @G_smsOnly = sms_only, @G_push_only = push_only, @G_blacklisted = blacklisted from SMS_PHONE_MESSAGE_RULES where phone = @phone

	if (@G_blacklisted = 1) begin
	
		-- 1.1 Номер телефона в черном списке, отменим отпавку смс
		set @cmd = 'update '+@table_name+' set status = 101 where id = '+cast(@idm_sms as varchar(50))
		EXEC sp_executesql @cmd 

		select 1 as result
		return

	end

	-- 1.2 Если в тексте сообщения ссылка - отправим по смс
	if ((@textSms like '%http://%') or (@textSms like '%https://%')) begin 
		select 0 as result
		return
	end

	-- 1.3 Если правило "только смс" для номера телефона - отправим по смс
	if (@G_smsOnly = 1) begin
		select 0 as result
		return
	end

	-- 2. Применяем правила PUSH для конкретного телефона на правила сообщения
	if (not @G_push_only is null) begin set @pushOnly = @G_push_only end

	-- 3. В крайний раз пробуем отправить через СМС в случае со свойством сообщения smsOnly = 1,
	--    учитывая тот факт, что правила отправки Push для номера важнее правил smsOnly для сообщения
	if ((@pushOnly = 0 or @pushOnly is null) and @smsOnly = 1) begin
		
		select 0 as result
		return

	end

	-- 4. Если мы попали сюда - отпрвляем PUSH...

	-- 4.1 Узнаем группу приложений по модулю смс
	declare @idm_group int
	declare @idm_device int
	declare @idm_app int
	set @idm_group = 0
	set @idm_device = 0
	set @idm_app = 0

	select top(1) @idm_group = idm_group from [PushMSG].[dbo].[APPS_GROUP_SMS_MODULES] where module = @module




	-- 4.2 Определимся с каналом отправки
	declare @sendSms int
	set @sendSms = 0

	if @idm_group>0 begin -- Если определена группа приложений, ищем в рамках этой группы девайс и приложение
			
		select top(1) @idm_device = id, @idm_app = idm_app
		from [PushMSG].[dbo].[DEVICES] with(nolock)
		where phone = @phone and idm_app in (select idm_app from [PushMSG].[dbo].[APPS_GROUP_ITEMS]  with(nolock) where idm_group = @idm_group)
		and disable = 0
		order by id desc

		if @idm_device>0 begin --Девайс найден и приложение тоже

			set @sendSms = 0
				
		end else begin
			
			if @pushOnly = 1 begin
				
				set @sendSms = 0

			end else begin
			
				set @sendSms = 1

			end
		end

	end else begin -- Неизвестная группа приложений, Считаем, что это Clinic23Staff

		select top(1) @idm_device = id, @idm_app = idm_app
		from [PushMSG].[dbo].[DEVICES] with(nolock)
		where phone = @phone and idm_app in (select idm_app from [PushMSG].[dbo].[APPS_GROUP_ITEMS]  with(nolock) where idm_group = 1)-- ищем в рамках Clinic23Staff
		and disable = 0
		order by id desc

		if (@idm_device>0) begin

			set @sendSms = 0
				
		end else begin

			if @pushOnly = 1 begin
				
				set @sendSms = 0

			end else begin
			
				set @sendSms = 1

			end

		end

	end

	if @sendSms = 1 begin

		select 0 as result
		return

	end else begin 

		insert into [PushMSG].[dbo].[MESSAGES]
					(idm_app, idm_device, body, category,  loc_key, loc_args, title, idm_sms, sms_table)				
					values
					(@idm_app, @idm_device, @textSms, 'SMS', 'SMS', '', 'Уведомление', @idm_sms, @table_name)

		set @cmd = 'update '+@table_name+' set status = 4 where id = '+cast(@idm_sms as varchar(50))
		EXEC sp_executesql @cmd
		select 1 as result
		return

	end
	

	/*

	SET NOCOUNT ON;
		declare @res int set @res = 0
	declare @deviceId int
	declare @idm_app int
	set @deviceId = 0
	set @idm_app = 0


	declare @cmd nvarchar(4000)
	declare @textSms varchar(1024)
	declare @pushOnly int
	declare @smsOnly int

	set @cmd = '(select top(1) @textSms = text, @pushOnly = pushOnly, @smsOnly = smsOnly from '+@table_name+' with(nolock)where id = '+cast(@idm_sms as varchar(50))+')'
	EXEC sp_executesql @cmd, N'@textSms NVARCHAR(1024) OUTPUT, @pushOnly int OUTPUT, @smsOnly int OUTPUT', @textSms=@textSms OUTPUT, @pushOnly=@pushOnly OUTPUT,  @smsOnly=@smsOnly OUTPUT
	
	if (@smsOnly = 1) begin
		
		select 0 as result
		return

	end


	declare @guid_user varchar(50)
	declare @sms_only int
	set @sms_only = null

	select top(1)@guid_user= guid_web, @sms_only = sms_only
	from KAD$EMPLOYEE with(nolock)
	where RIGHT( phone_mob,10)  = RIGHT( @phone,10)  and  (del = 0 or del is null) and (actual = 1 or actual is null) 

	if (@sms_only = 1 and ( @pushOnly = 0 or @pushOnly is null)) begin
	
		select 0 as result
		return

	end

	--and (sms_only = 0 or sms_only is null)


	select top(1) @deviceId = id, @idm_app = idm_app
	from 
	[PushMSG].[dbo].DEVICES with(nolock)
	where guid_user = @guid_user
	
	/* (
	select top(1) guid_web
	from KAD$EMPLOYEE with(nolock)
	where RIGHT( phone_mob,10)  = RIGHT( @phone,10)  and  (del = 0 or del is null) and (actual = 1 or actual is null) and (sms_only = 0 or sms_only is null)  
	)*/
	
	 and disable = 0
	order by id desc 



	if ((@deviceId>0 and @idm_app>0) or (@pushOnly = 1)) begin
		

			if ((@textSms like '%http://%') or (@textSms like '%https://%') or (@textSms like '%Ваш код для подтверждения%')) 
			begin

				select 0 as result

			end else begin		
		
					insert into [PushMSG].[dbo].[MESSAGES]
					(idm_app, idm_device, body, category,  loc_key, loc_args, title, idm_sms, sms_table)				
					values
					(@idm_app, @deviceId, @textSms, 'SMS', 'SMS', '', 'Уведомление', @idm_sms, @table_name)
			

				set @cmd = 'update '+@table_name+' set status = 4 where id = '+cast(@idm_sms as varchar(50))
				EXEC sp_executesql @cmd

				select 1 as result

			end
	end else begin
		
		select 0 as result

	end
	

	*/
	


END