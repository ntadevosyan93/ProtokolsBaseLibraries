

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAgreementDogovorStatusesForUser]
	-- Add the parameters for the stored procedure here
	@user_in varchar(50),
	@idm_dogovor int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	-- 0 - Нет в согласовании 1 - Есть в согласовании, статус не проставлен (на согласовании)
	-- 2 - Согласован любо отклонён
	
	set @user_in =ltrim(rtrim(@user_in))
	declare @idm_user int,
	@idm_isp int
	 
	select @idm_isp = idm_isp From DOGOVORS$REG where id = @idm_dogovor

	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)
	
	declare @agreement_status int
	
	select top(1) @agreement_status = idm_reason from DOGOVORS$AGREEMENT  with (nolock) where ( idm_empl = @idm_user ) and idm_dogovor = @idm_dogovor and DOGOVORS$AGREEMENT.del=0 
	order by DOGOVORS$AGREEMENT.id desc
	--if(@idm_isp = @idm_user)
	--select '2'
	--else
	if (@agreement_status is null) select '0' else
	if (@agreement_status=4)select '1' else select '2'
	
	
END