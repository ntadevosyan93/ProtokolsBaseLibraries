-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetCancelAgreeBill]
	-- Add the parameters for the stored procedure here
	@idm_bill int,
	@user_in varchar(50),	
@ip_in varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    set @user_in =ltrim(rtrim(@user_in))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)		
	declare @last_agree_id int
	declare @atty int, @upd int
	set @upd =0
	
	select @atty = count(id) from EMPL_TO_OTDEL where [idm_empl] =@idm_user and idm_otdel = 1
	if(@atty >0)
	begin
	 select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT with (nolock) where idm_bill = @idm_bill and idm_empl = @idm_user and del=0 
	 if(@last_agree_id IS NOT NULL)
		begin
		--select 'юрист,есть такой пользователь',@idm_user,@user_in,@last_agree_id;
			 UPDATE RM$OS$BILLING_AGREEMENT SET ip_reason=@ip_in, date_reason = GETDATE(), user_reason=@user_in, del=1 where id = @last_agree_id
			 set @upd=1
		end
		else
		begin
			--получим любую запись к согласованию, где пользователи из юр.отдела
			select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT with (nolock) where idm_bill = @idm_bill
			 and idm_empl in(select idm_empl from EMPL_TO_OTDEL with (nolock) where  idm_otdel = 1) and del=0  order by id 
			if(@last_agree_id IS NOT NULL)
			begin			
			 UPDATE RM$OS$BILLING_AGREEMENT SET ip_reason=@ip_in, date_reason = GETDATE(), user_reason=@user_in, del=1 where id = @last_agree_id
			  set @upd=1
			end
		end	
	end
	else
	begin
	select top(1) @last_agree_id = id from RM$OS$BILLING_AGREEMENT with (nolock) where idm_bill = @idm_bill and idm_empl = @idm_user and del=0  order by id desc
		UPDATE RM$OS$BILLING_AGREEMENT SET ip_reason=@ip_in, date_reason = GETDATE(), user_reason=@user_in, del=1 where id = @last_agree_id	
		 set @upd=1
	end
	if(@upd>0)
	update RM$OS$BILLING set [status] =3,user_cur=@user_in, date_cur=getdate() where id=@idm_bill
END