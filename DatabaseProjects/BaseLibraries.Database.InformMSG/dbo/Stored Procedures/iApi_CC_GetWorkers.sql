-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE iApi_CC_GetWorkers
	
AS
BEGIN
	SET NOCOUNT ON;

  
  select (CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL THEN name ELSE '' END) + ' ' + (CASE WHEN otch IS NOT NULL THEN otch ELSE '' END) 
as fio, REPLACE(login_ad,'VIPCG\','') as login_ad
  from KAD$EMPLOYEE 
  where 
  (actual = 1 or actual is null)
  and
  (del=0 or del is null)
  and realId is null
  and call_center_worker = 1
  and not login_ad is null
 /* and ([idm_doljn] = 23)*/

  order by fam
END