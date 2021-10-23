-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLastSentSMS]
	-- Add the parameters for the stored procedure here
 @phone varchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from

	set @phone=right(@phone,10)

	select top(30) id,phone_to,date_in,date_sending,status,text,module from SMS_MAIN with (nolock, index(IX_SMS_MAIN_4))
	where phone_to = '7'+@phone or phone_to = '8'+@phone or phone_to = '+7'+@phone 
	order by id desc

END