-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE SMS_ECO_INSERT
	-- Add the parameters for the stored procedure here
	@phone varchar(50),
	@date_sending datetime,
	@text varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [InformMSG].[dbo].[SMS_MAIN]  (phone_to, text, module, status, date_sending, date_expired, priority)
	VALUES (@phone, @text, 'smseco', 0, @date_sending, DATEADD (HOUR , 1 , @date_sending )  , 30);
	SELECT SCOPE_IDENTITY() ;	
				
END