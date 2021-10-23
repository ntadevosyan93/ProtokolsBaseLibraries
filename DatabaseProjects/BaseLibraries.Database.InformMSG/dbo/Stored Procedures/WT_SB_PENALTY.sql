-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$SB_PENALTY]
	-- Add the parameters for the stored procedure here
		@dt datetime, @dt1 datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   SELECT KAD$WORK_TIME.id,DEPARTMENTS.text as department_t,KAD$WORK_TIME.date_in,
	DEPARTMENTS.id as department_id, 
	 (CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL THEN name ELSE '' END) + ' ' + (CASE WHEN otch IS NOT NULL 
                      THEN otch ELSE '' END) as fio,
                      KAD$EMPLOYEE.id as fio_id, 
                      	KAD$WORK_TIME.idm_doljn,
                      	KAD$WORK_TIME.idm_violation,
KAD$WORK_TIME.idm_breakdown,
KAD$WORK_TIME.comment_it,
	KAD$WORK_TIME.estimated_start, 
	KAD$WORK_TIME.actual_start, 
	KAD$WORK_TIME.estimated_stop, 
	KAD$WORK_TIME.actual_stop, 
	(KAD$WORK_TIME.estimated_stop - KAD$WORK_TIME.estimated_start)as planed,
	KAD$WORK_TIME.curatorComment,
	 KAD$WORK_TIME.actual_stop-KAD$WORK_TIME.actual_start as factWork,
DATEDIFF(mi,kad$work_time.estimated_start,KAD$WORK_TIME.actual_start) as lateness, 
	DATEDIFF(mi,kad$work_time.actual_stop,KAD$WORK_TIME.estimated_stop) as leave, 
 KAD$DOLJN.text as doljn, KAD$EMPLOYEE.guid,  KAD$WORK_TIME.comment
 ,(select View$KAD$EMPLOYEE.fio_full + ', ' AS 'data()' 
from  KAD$WORK_TIME_CURATORS
left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id=idm_curator
 where idm_empl = [KAD$WORK_TIME].idm_empl  
FOR XML PATH('')) as curatorsText,
(case handmark when 1 then 'Да' else 'Нет' end) as handmark
  FROM [InformMSG].[dbo].[KAD$WORK_TIME]
 left join kad$employee on [KAD$WORK_TIME].idm_empl=kad$employee.id
 left join DEPARTMENTS on KAD$WORK_TIME.idm_depart=DEPARTMENTS.id
 left join KAD$DOLJN on KAD$DOLJN.id = KAD$WORK_TIME.idm_doljn
where 
(KAD$WORK_TIME.estimated_start>=@dt and KAD$WORK_TIME.estimated_start<DATEADD(d,1,@dt1)) 
and KAD$WORK_TIME.del=0
and KAD$WORK_TIME.sb_ok=0
and (KAD$WORK_TIME.idm_status=1 or KAD$WORK_TIME.idm_status=6)
and (KAD$EMPLOYEE.wt_hide=0 or KAD$EMPLOYEE.wt_hide is null)
and not (KAD$DOLJN.id = 87 )
--

and 
(
--Не пришел
(KAD$WORK_TIME.actual_start is null and KAD$WORK_TIME.estimated_start<GETDATE())
--Опоздал
OR
(not KAD$WORK_TIME.actual_start is null and KAD$WORK_TIME.estimated_start<KAD$WORK_TIME.actual_start)
--Ушел раньше
OR
(not KAD$WORK_TIME.actual_stop is null and KAD$WORK_TIME.actual_stop<KAD$WORK_TIME.estimated_stop)
--Нет отметки ухода
OR
(KAD$WORK_TIME.actual_stop is null and KAD$WORK_TIME.estimated_stop<GETDATE())
)
--and KAD$WORK_TIME.estimated_start<GETDATE()

/*and not (KAD$WORK_TIME.actual_stop is null)
and KAD$WORK_TIME.actual_stop < KAD$WORK_TIME.estimated_stop
and not (KAD$WORK_TIME.actual_stop = KAD$WORK_TIME.actual_start)*/
  order by KAD$WORK_TIME.estimated_stop asc
  
END