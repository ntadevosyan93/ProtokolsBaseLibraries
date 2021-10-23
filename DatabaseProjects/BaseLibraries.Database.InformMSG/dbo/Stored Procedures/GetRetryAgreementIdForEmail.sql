
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRetryAgreementIdForEmail] 
	-- Add the parameters for the stored procedure here
	@idm_dogovor int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT id, idm_reason
		FROM DOGOVORS$AGREEMENT
		where idm_dogovor = @idm_dogovor and needRetryEmail = 1
		
	update DOGOVORS$AGREEMENT set needRetryEmail = NULL where idm_dogovor = @idm_dogovor and needRetryEmail = 1
END