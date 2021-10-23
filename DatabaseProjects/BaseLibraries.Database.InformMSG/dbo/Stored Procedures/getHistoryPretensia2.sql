


--declare @id as int
 CREATE procedure [dbo].[getHistoryPretensia2] 
 	@guid varchar(50)
AS
BEGIN

--set @id = 12434
select D1.[pk], D1.[id], D1.[user_in], D1.[date_in], d.text departments, D1.[fio], D1.[phone], D1.[email], D1.[zakazNum], D1.[DateFull], D1.[DateB], 
k1.klass_value source, D1.[description], D1.[date_start], D1.[date_stop], D1.[text_solution],  ke.fam + ' ' + ke.name [empl], k2.klass_value [status_str] , 
D1.[guid], D1.[del], D1.[date_stop_plan], ke2.fam + ' ' + ke2.name [control], isnull(D1.[date_cur],D1.date_in) date_cur , isnull(D1.[user_cur], D1.[user_in]) user_cur, D1.[idm_patient], p.fio patient,
em.fio doctor
From (
select pk, [id], [user_in], [date_in], [idm_departments], [fio], [phone], [email], [zakazNum], [DateFull], [DateB], [idm_source], [description], [date_start], [date_stop], [text_solution], [idm_empl], [status], [guid], [del], [date_stop_plan], [idm_control], [date_cur], [user_cur], [idm_patient], [idm_1c], idm_doctor
From TT$Pretensions_history where guid = @guid  
union all
select 99999999, [id], [user_in], [date_in], [idm_departments], [fio], [phone], [email], [zakazNum], [DateFull], [DateB], [idm_source], [description], [date_start], [date_stop], [text_solution], [idm_empl], [status], [guid], [del], [date_stop_plan], [idm_control], [date_cur], [user_cur], [idm_patient], [idm_1c], idm_doctor
from TT$Pretensions  where guid = @guid
)D1

  left join DEPARTMENTS d on d.id = [idm_departments]
  left join Klass k1 on k1.klass_name = 'source_pretensia' and k1.klass_id= idm_source
  left join Klass k2 on k2.klass_name = 'tt_trouble_status_pretensia' and k2.klass_id= [status]
  left join KAD$EMPLOYEE ke on ke.id = D1.idm_empl
  left join KAD$EMPLOYEE ke2 on ke2.id = D1.idm_control
  left join iClinic.dbo.PATIENT p on p.idm_1c = D1.idm_1c
  left join iClinic.dbo.Employee em on em.id = D1.idm_doctor

order by pk

end