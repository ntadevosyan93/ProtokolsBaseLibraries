-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE AndroidImagesList
	-- Add the parameters for the stored procedure here
	@resolution varchar(50), 
	@deviceId varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select guid from Screen_files where status = 1 and resolution = @resolution
END