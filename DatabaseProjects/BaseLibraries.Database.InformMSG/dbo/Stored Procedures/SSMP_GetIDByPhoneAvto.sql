-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SSMP$GetIDByPhoneAvto
	-- Add the parameters for the stored procedure here
	@phone varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT   top(1)  dbo.SSMP$MAIN.id
FROM         dbo.SSMP$MAIN RIGHT OUTER JOIN
                      dbo.SSMP$TEAM ON dbo.SSMP$MAIN.idm_team = dbo.SSMP$TEAM.id RIGHT OUTER JOIN
                      dbo.AVTO ON dbo.SSMP$TEAM.idm_avto = dbo.AVTO.id
where avto.phone=@phone
and dbo.SSMP$TEAM.date_stop is null 
and SSMP$MAIN.date_end is null
order by SSMP$MAIN.date_in

END