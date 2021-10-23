-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertSMS_TUBES_ERROR]
@idm_place int,
@barcode varchar(50),
@descript varchar(50)
AS
BEGIN


	SET NOCOUNT ON;
INSERT INTO SMS_MAIN (phone_to, text, module, status, date_sending, priority)
select 

 phone,
'Нет информации о пробирке: '+@barcode+'. '+@descript+'.', 'TubeAddmission', 0, GETDATE(), 20
 from PLACES_TUBES_ERR_PHONE
 where idm_place = @idm_place



END