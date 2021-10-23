-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SMS_WEB_INSERT]
	-- Add the parameters for the stored procedure here
	@phone varchar(50), 
	@text varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [InformMSG].[dbo].[SMS_MAIN]  (phone_to, text, module, status, date_sending, date_expired, priority)
	VALUES (@phone, @text, 'smsweb', 0, GETDATE(), DATEADD (HOUR , 5 , GETDATE() )  , 2);
	SELECT SCOPE_IDENTITY() ;	
				
END