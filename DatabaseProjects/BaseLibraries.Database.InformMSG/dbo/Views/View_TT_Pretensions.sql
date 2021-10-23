



--USE [InformMSG]
--GO

--/****** Object:  View [dbo].[View$TT$Pretensions]    Script Date: 23.07.2020 10:31:07 ******/
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO








CREATE view [dbo].[View$TT$Pretensions]
as
SELECT   cast(ROW_NUMBER() over(order by tt.id, tmc.id) as int) row_num, 
tt.id, tt.user_in, tt.date_in, tt.idm_departments, d.[text] [department_str] , case when rtrim(isnull(tt.[description],''))='' then '<текст отсутствует>' else tt.[description] end  [description] , tt.date_start, 
 tt.date_stop, date_stop_plan, tt.text_solution, tt.idm_empl, ke.fam + ' '+ ke.name + ' ' + ke.otch [isp], tt.status, ks.klass_value [status_str] 
 , tt.guid, tt.del,  
   SUBSTRING(tt.text_solution, 1, 80) AS textsolution, SUBSTRING(tt.description, 1, 80) AS textproblem, 
       tt.idm_control, tt.idm_patient, isnull( p.fio, tt.fio) [patient_str], p.date_b db_patient,
 cast(tt.text_solution as varchar(40))+ case when len(tt.text_solution)>40 then '...'else '' end short_text_solution
 ,cast(tt.description as varchar(100))+ case when len(tt.description)>100 then '...'else '' end short_text_problem
 , tmc.idm_empl idm_COLLABORATOR, ke_coll.fam + ' '+ ke_coll.name + ' ' + ke_coll.otch [isp_coll]
 , kss.klass_value source_str,tt.idm_source,tt.idm_doctor, doc.fio doctor
FROM  dbo.TT$Pretensions tt  with (nolock)
left join TT$MAIN_COLLABORATORS tmc with (nolock) on tt.id = tmc.idm_main and tmc.del=0
left join KAD$EMPLOYEE ke_coll with(nolock) on ke_coll.id = tmc.idm_empl
left join dbo.KLASS ks with (nolock) on ks.klass_name = 'tt_trouble_status_pretensia' and ks.klass_id = tt.status
left join dbo.KLASS kss with (nolock) on kss.klass_name = 'source_pretensia' and kss.klass_id = tt.idm_source
--source_pretensia
left join dbo.DEPARTMENTS d with (nolock) on tt.idm_departments = d.id
left join dbo.KAD$EMPLOYEE ke with (nolock) on tt.idm_empl = ke.id
left join iClinic.dbo.PATIENT p with (nolock) on   p.idm_1c = tt.idm_1c
left join iClinic.dbo.EMPLOYEE doc  with (nolock) on   doc.id = tt.idm_doctor
where tt.del=0
--GO