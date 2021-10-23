-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Clinic23Staff_Auth_CheckPhone]
	@phone varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @count int
	set @count = 0

	select COUNT(id) from KAD$EMPLOYEE with (NOLOCK) where RIGHT(phone_mob,10) =  RIGHT(@phone,10) and (del = 0 or del is null) and (actual = 1 or actual is null)
END