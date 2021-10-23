-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetHRMAgreementStatus]
	-- Add the parameters for the stored procedure here
	@user_in varchar(50),
	@idm_agreement int,
	@idm_result int,
	@comment varchar(max) = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    set @user_in =ltrim(rtrim(@user_in))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)
	
	declare @last_agree_id int
	select top(1) @last_agree_id = id from HRM$REQ_EmplAgreement where idm_agreement = @idm_agreement and idm_empl = @idm_user and del=0 order by id desc
	
	UPDATE HRM$REQ_EmplAgreement SET idm_res = @idm_result, comment = @comment, date_res = GETDATE(), user_cur=@user_in,date_cur=getdate()
	 where id = @last_agree_id
	
END