-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Clinic23Staff_NewsGet] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



    SELECT top(100)
		guid, 
		date_in, 
		date_news,
		tema,
		NEWS.text, 
		Left(NEWS.text,50) as shorttext, 
		DEPARTMENTS.text as department,
		(select top(1) fam+' '+name+' '+otch 
			from KAD$EMPLOYEE with (nolock) 
			where login_ad = [NEWS].user_in) as [user]
		FROM [InformMSG].[dbo].[NEWS] with (nolock)
		left join DEPARTMENTS with (nolock) on DEPARTMENTS.id = idm_org
	WHERE del = 0 
	ORDER BY date_in DESC


END