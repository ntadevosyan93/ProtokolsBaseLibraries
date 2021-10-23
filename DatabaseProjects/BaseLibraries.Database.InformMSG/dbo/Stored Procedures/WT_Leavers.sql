-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$Leavers]
	-- Add the parameters for the stored procedure here
	@dt datetime, @dt1 datetime
AS
BEGIN
	SELECT KAD$WORK_TIME.id,DEPARTMENTS.text as department_t,KAD$WORK_TIME.date_in,
	DEPARTMENTS.id as department_id, 
	 (CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL THEN name ELSE '' END) + ' ' + (CASE WHEN otch IS NOT NULL 
                      THEN otch ELSE '' END) as fio,
                      KAD$EMPLOYEE.id as fio_id, 
                kad$employee.idm_doljn,      
                      	KAD$WORK_TIME.idm_violation,
KAD$WORK_TIME.idm_breakdown,
KAD$WORK_TIME.comment_it,
	KAD$WORK_TIME.estimated_start, 
	KAD$WORK_TIME.actual_start, 
	KAD$WORK_TIME.estimated_stop, 
	KAD$WORK_TIME.actual_stop, 
	(KAD$WORK_TIME.estimated_stop - KAD$WORK_TIME.estimated_start)as planed,
	KAD$WORK_TIME.curatorComment,
	 KAD$WORK_TIME.actual_stop-KAD$WORK_TIME.actual_start as factWork
,
DATEDIFF(mi,kad$work_time.estimated_start,KAD$WORK_TIME.actual_start) as lateness, 
	DATEDIFF(mi,kad$work_time.actual_stop,KAD$WORK_TIME.estimated_stop) as leave, 



 KAD$DOLJN.text as doljn, KAD$EMPLOYEE.guid,  KAD$WORK_TIME.comment
 ,(select View$KAD$EMPL$ACTUAL.fio_full + ', ' AS 'data()' 
from  KAD$WORK_TIME_CURATORS
left join View$KAD$EMPL$ACTUAL on View$KAD$EMPL$ACTUAL.id=idm_curator
 where idm_empl = [KAD$WORK_TIME].idm_empl  
FOR XML PATH('')) as curatorsText
  FROM [dbo].[KAD$WORK_TIME] with (nolock)
 left join kad$employee  with (nolock)on [KAD$WORK_TIME].idm_empl=kad$employee.id
 left join DEPARTMENTS  with (nolock)on KAD$WORK_TIME.idm_depart=DEPARTMENTS.id
 left join KAD$DOLJN  with (nolock)on KAD$DOLJN.id = KAD$EMPLOYEE.idm_doljn
where (KAD$WORK_TIME.estimated_start>=@dt and KAD$WORK_TIME.estimated_start<DATEADD(d,1,@dt1)) 
and KAD$WORK_TIME.del=0
and (KAD$WORK_TIME.idm_status=1 or KAD$WORK_TIME.idm_status=6)
and (KAD$EMPLOYEE.wt_hide=0 or KAD$EMPLOYEE.wt_hide is null)
and KAD$WORK_TIME.estimated_start<GETDATE()
and not (KAD$WORK_TIME.actual_stop is null)
and KAD$WORK_TIME.actual_stop < KAD$WORK_TIME.estimated_stop
and not (KAD$WORK_TIME.actual_stop = KAD$WORK_TIME.actual_start)
  order by KAD$WORK_TIME.estimated_stop asc
  
END