-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RetryDogovorAgreement]
	-- Add the parameters for the stored procedure here
	@idm_dogovor int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into DOGOVORS$AGREEMENT (idm_reason,text_reason,date_reason,idm_dogovor,idm_empl, needRetryEmail)
    (
		SELECT 4,'', GETDATE(),@idm_dogovor,idm_empl, 1
		FROM DOGOVORS$AGREEMENT with (nolock) 
		where idm_dogovor = @idm_dogovor and (idm_reason = 2 or idm_reason = 3) and DOGOVORS$AGREEMENT.del=0
		group by idm_empl
	)
END