



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetStatusAgreemendBillings_ByOtdel]
@user_in varchar(50),
@status int,
@comment varchar(1024),
@idm_bill int,
@ip_in varchar(50),
@idm_otdel int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;	
    -- Insert statements for procedure here
	set @user_in =ltrim(rtrim(@user_in))
	declare @idm_user int
	declare @IsAgree int 
	declare @idm_curator int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)
		
	declare @last_agree_id int,@atty int, @upd int,@AllowAgreeMarceting int
	declare @summ float
	set @upd =0
	select @atty = count(id) from EMPL_TO_OTDEL where [idm_empl] =@idm_user and idm_otdel =@idm_otdel
	if(@idm_user =239) begin  set @idm_otdel=1  set @atty=1 end
	if(@atty >0)
	begin
		--проверим есть ли согласование на пользователя(если он юрист)
		--select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT where idm_bill = @idm_bill and idm_empl = @idm_user and del=0  and idm_otdel =@idm_otdel
		--if(@last_agree_id IS NOT NULL) begin
		--	set @upd=1 
		--	--select 'юрист,есть такой пользователь',@idm_user,@user_in,@last_agree_id;
		--	UPDATE RM$OS$BILLING_AGREEMENT SET idm_reason = @status, ip_reason=@ip_in, text_reason = @comment, date_reason = GETDATE(),
		--	 user_reason=@user_in,idm_otdel=@idm_otdel,idm_empl=@idm_user where id = @last_agree_id


		--end
		--else begin
		--закомментировал по задаче 16806	
			--получим любую запись к согласованию, где пользователи из юр.отдела
		--	select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT where idm_bill = @idm_bill
		--	 and idm_empl in(select idm_empl from EMPL_TO_OTDEL where  idm_otdel = @idm_otdel)and idm_otdel=@idm_otdel and del=0  order by id 
		--	if(@last_agree_id IS NOT NULL) begin
		--		set @upd=1 
		----		select 'юрист, любой',@idm_user,@user_in,@last_agree_id;
		--		UPDATE RM$OS$BILLING_AGREEMENT SET idm_reason = @status, ip_reason=@ip_in, text_reason = @comment, date_reason = GETDATE(),
		--		idm_otdel=@idm_otdel,idm_empl=@idm_user where id = @last_agree_id
		--	end
		--	else begin
		--		set @upd=1 
				--select 'юрист, новая запись',@idm_user,@user_in,@last_agree_id;
				INSERT INTO [RM$OS$BILLING_AGREEMENT] ([user_in], [idm_bill], [date_posted],idm_reason,text_reason,date_reason,idm_empl,user_reason,ip_reason,idm_otdel)
				VALUES (@user_in,  @idm_bill,  getdate(),@status,@comment, getdate(),@idm_user,@user_in,@ip_in,@idm_otdel) 
			--end
		--end

		select @summ=summ,@AllowAgreeMarceting=AllowAgreeMarceting, @idm_curator = idm_curator from RM$OS$BILLING where id=@idm_bill

		if(@summ>=50000 and @idm_curator !=2233) begin
			select @IsAgree= count(id) from RM$OS$BILLING_AGREEMENT
		where idm_bill=@idm_bill and del=0 and idm_reason=@status and idm_otdel in(1,3)
		end
		else begin 
			if(@AllowAgreeMarceting=1) begin				
				select @IsAgree= count(id) from RM$OS$BILLING_AGREEMENT
				where idm_bill=@idm_bill and del=0 and idm_reason=@status and idm_otdel in(1,3)
			end
			else
			set @IsAgree =2
		end
	end
	else
	begin
	--select 'не юрист, своя запись',@idm_user,@user_in,@last_agree_id;
		--если это не юрист, то согласуем по строке пользователя
		--select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT where idm_bill = @idm_bill and idm_empl = @idm_user and del=0   order by id desc
		--if(@last_agree_id IS NOT NULL) begin
		--	set @upd=1 
		--	UPDATE RM$OS$BILLING_AGREEMENT SET idm_reason = @status, ip_reason=@ip_in, text_reason = @comment, idm_empl = @idm_user, date_reason = GETDATE(), user_reason=@user_in where id = @last_agree_id
		--end
		--else begin
		--	set @upd=1 
			--select 'юрист, новая запись',@idm_user,@user_in,@last_agree_id;
			INSERT INTO [RM$OS$BILLING_AGREEMENT] ([user_in], [idm_bill], [date_posted],idm_reason,text_reason,date_reason,idm_empl,user_reason,ip_reason)
				VALUES (@user_in,  @idm_bill,  getdate(),@status,@comment, getdate(),@idm_user,@user_in,@ip_in) 
		--end
	end
	
	select @upd as [status],@IsAgree as IsAgree
	
END