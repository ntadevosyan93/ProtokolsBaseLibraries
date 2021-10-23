-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetStatusAgreemendBillings]
@user_in varchar(50),
@status int,
@comment varchar(1024),
@idm_bill int,
@ip_in varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	
    -- Insert statements for procedure here
	set @user_in =ltrim(rtrim(@user_in))
	declare @idm_user int

	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)
		
	declare @last_agree_id int
	declare @atty int, @upd int
	set @upd =0
	select @atty = count(id) from EMPL_TO_OTDEL where [idm_empl] =@idm_user and idm_otdel = 1
	if(@atty >0)
	begin
		--проверим есть ли согласование на пользователя(если он юрист)
		select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT where idm_bill = @idm_bill and idm_empl = @idm_user and del=0 
		if(@last_agree_id IS NOT NULL)
		begin
		set @upd=1 
		--select 'юрист,есть такой пользователь',@idm_user,@user_in,@last_agree_id;
			UPDATE RM$OS$BILLING_AGREEMENT SET idm_reason = @status, ip_reason=@ip_in, text_reason = @comment, date_reason = GETDATE(), user_reason=@user_in where id = @last_agree_id
		end
		else
		begin
			--получим любую запись к согласованию, где пользователи из юр.отдела
			select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT where idm_bill = @idm_bill
			 and idm_empl in(select idm_empl from EMPL_TO_OTDEL where  idm_otdel = 1) and del=0  order by id 
			if(@last_agree_id IS NOT NULL)
			begin
			set @upd=1 
		--	select 'юрист, любой',@idm_user,@user_in,@last_agree_id;
			UPDATE RM$OS$BILLING_AGREEMENT SET idm_reason = @status, ip_reason=@ip_in, text_reason = @comment, date_reason = GETDATE() where id = @last_agree_id
			end
			else 
			begin
			set @upd=1 
			--select 'юрист, новая запись',@idm_user,@user_in,@last_agree_id;
			INSERT INTO [RM$OS$BILLING_AGREEMENT] ([user_in], [idm_bill], [date_posted],idm_reason,text_reason,date_reason,idm_empl,user_reason,ip_reason)
				VALUES (@user_in,  @idm_bill,  getdate(),@status,@comment, getdate(),@idm_user,@user_in,@ip_in) 
			end
		end
	end
	else
	begin
	--select 'не юрист, своя запись',@idm_user,@user_in,@last_agree_id;
		--если это не юрист, то согласуем по строке пользователя
		select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT where idm_bill = @idm_bill and idm_empl = @idm_user and del=0   order by id desc
		if(@last_agree_id IS NOT NULL)
			begin
		set @upd=1 
		UPDATE RM$OS$BILLING_AGREEMENT SET idm_reason = @status, ip_reason=@ip_in, text_reason = @comment, date_reason = GETDATE(), user_reason=@user_in where id = @last_agree_id
	end
	else 
			begin
			set @upd=1 
			--select 'юрист, новая запись',@idm_user,@user_in,@last_agree_id;
			INSERT INTO [RM$OS$BILLING_AGREEMENT] ([user_in], [idm_bill], [date_posted],idm_reason,text_reason,date_reason,idm_empl,user_reason,ip_reason)
				VALUES (@user_in,  @idm_bill,  getdate(),@status,@comment, getdate(),@idm_user,@user_in,@ip_in) 
			end
	end
	 select @upd
END