-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Clinic23Staff_Get1CID] 
@guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT idm_1c
	FROM [iClinic].[dbo].EMPLOYEE with (nolock) WHERE guid = 
		(SELECT top(1) guid_iclinic
		 FROM KAD$EMPLOYEE with (nolock) 
		 WHERE guid_web = @guid)


END