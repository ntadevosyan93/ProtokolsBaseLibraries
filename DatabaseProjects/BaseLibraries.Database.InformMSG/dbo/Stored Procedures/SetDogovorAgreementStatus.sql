-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetDogovorAgreementStatus]
	-- Add the parameters for the stored procedure here
	@user_in varchar(50),
	@idm_dogovor int,
	@status int,
	@comment varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    set @user_in =ltrim(rtrim(@user_in))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)
	
	declare @last_agree_id int
	select top(1) @last_agree_id = id from DOGOVORS$AGREEMENT where idm_dogovor = @idm_dogovor and idm_empl = @idm_user and DOGOVORS$AGREEMENT.del=0 order by id desc
	
	UPDATE DOGOVORS$AGREEMENT SET idm_reason = @status, text_reason = @comment, date_reason = GETDATE() where id = @last_agree_id
	
END