-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$All_SB]
	-- Add the parameters for the stored procedure here
	@dt datetime, @dt1 datetime
AS
BEGIN
	SELECT KAD$WORK_TIME.id,KAD$WORK_TIME.date_in,
	DEPARTMENTS.text as department_t,
	DEPARTMENTS.id as department_id, 
	 (CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL THEN name ELSE '' END) + ' ' + (CASE WHEN otch IS NOT NULL 
                      THEN otch ELSE '' END) as fio, 
	KAD$EMPLOYEE.id as fio_id, 
	KAD$WORK_TIME.idm_doljn,
	
	KAD$WORK_TIME.idm_violation,
KAD$WORK_TIME.idm_breakdown,
KAD$WORK_TIME.comment_it,
	
	KAD$WORK_TIME.estimated_start, 
	KAD$WORK_TIME.estimated_stop,
	(KAD$WORK_TIME.estimated_stop - KAD$WORK_TIME.estimated_start)as planed, 
	KAD$WORK_TIME.actual_start,
	KAD$WORK_TIME.actual_stop,
	KAD$WORK_TIME.curatorComment,
DATEDIFF(mi,kad$work_time.estimated_start,KAD$WORK_TIME.actual_start) as lateness, 
	DATEDIFF(mi,kad$work_time.actual_stop,KAD$WORK_TIME.estimated_stop) as leave, 
KAD$DOLJN.text as doljn, KAD$EMPLOYEE.guid,  KAD$WORK_TIME.comment
 ,
 KAD$WORK_TIME.actual_stop-KAD$WORK_TIME.actual_start as factWork
 ,
 (select View$KAD$EMPLOYEE.fio_full + ', ' AS 'data()'
from  KAD$WORK_TIME_CURATORS
left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id=idm_curator
 where idm_empl = [KAD$WORK_TIME].idm_empl  
FOR XML PATH('')) as curatorsText,
(case handmark when 1 then 'Да' else 'Нет' end) as handmark
  FROM [InformMSG].[dbo].[KAD$WORK_TIME]
 left join kad$employee on [KAD$WORK_TIME].idm_empl=kad$employee.id
 left join DEPARTMENTS on KAD$WORK_TIME.idm_depart=DEPARTMENTS.id
 left join KAD$DOLJN on KAD$DOLJN.id = KAD$WORK_TIME.idm_doljn
where (KAD$WORK_TIME.estimated_start>=@dt and KAD$WORK_TIME.estimated_start<DATEADD(d,1,@dt1)) 
and KAD$WORK_TIME.del=0
and (KAD$EMPLOYEE.wt_hide=0 or KAD$EMPLOYEE.wt_hide is null)
and (KAD$WORK_TIME.idm_status=1 or KAD$WORK_TIME.idm_status=6)
and KAD$WORK_TIME.estimated_start<GETDATE()
and not (KAD$DOLJN.id = 87 )
  order by KAD$WORK_TIME.estimated_start asc
  
END