-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSmpReportMoney]
	-- Add the parameters for the stored procedure here
	@date_start datetime,
	@idm_avto int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT *
	FROM View$SSMP$ReportMoney
	WHERE idm_team = @idm_avto AND  cast(floor(cast(@date_start as float)) as datetime) = cast(floor(cast(dstart as float)) as datetime) AND (paytype is null or paytype=1)

	
END