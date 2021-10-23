-- =============================================
-- Author:		Гайдай В.В.
-- Create date: 19.08.2019
-- Description:	Разноска на первичный/повторный в записи на прием, там где нет ручной отметки
-- =============================================
CREATE PROCEDURE ICLINIC_APPOINTMENT_FirstSecondVisit
		
AS
BEGIN

-- =============================================
-- Author:		Гайдай В.В.
-- Create date: 19.08.2019
-- Description:	Разноска на первичный/повторный в записи на прием, там где нет ручной отметки
-- =============================================

update [ICLINIC_APPOINTMENT] set type_visit=2 where id in (
SELECT TOP (55000) [id]
  FROM [iClinic].[dbo].[ICLINIC_APPOINTMENT] ia with(nolock)
  where ia.type_visit=0 and ia.idm_patient>0
  and datediff(day,(select top(1) t.date_in from tasks t with(nolock) where t.idm_patient=ia.idm_patient and t.idm_employee=ia.idm_employee ),ia.date_start)>0
  and datediff(day,(select top(1) t.date_in from tasks t with(nolock) where t.idm_patient=ia.idm_patient and t.idm_employee=ia.idm_employee ),ia.date_start)<31
  order by id desc)

update [ICLINIC_APPOINTMENT] set type_visit=1 where id in (
SELECT TOP (55000) [id]
  FROM [iClinic].[dbo].[ICLINIC_APPOINTMENT] ia with(nolock)
  where ia.type_visit=0 and ia.idm_patient=0 )

update [ICLINIC_APPOINTMENT] set type_visit=1 where id in (
  SELECT TOP (55000) [id]
  FROM [iClinic].[dbo].[ICLINIC_APPOINTMENT] ia with(nolock)
  where ia.type_visit=0 and ia.idm_patient>0
  and datediff(day,(select top(1) t.date_in from tasks t with(nolock) where t.idm_patient=ia.idm_patient and t.idm_employee=ia.idm_employee ),ia.date_start)>30
  order by id desc
)  
update [ICLINIC_APPOINTMENT] set type_visit=1 where id in (
sELECT TOP (55000) id
  FROM [iClinic].[dbo].[ICLINIC_APPOINTMENT] ia with(nolock)
  where ia.type_visit=0 and ia.del=0 )

END