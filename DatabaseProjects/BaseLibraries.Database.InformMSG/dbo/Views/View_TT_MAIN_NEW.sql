
CREATE view [dbo].[View$TT$MAIN_NEW]
as
SELECT        tt.id, tt.user_in, tt.date_in, tt.idm_departments, d.[text] [department_str] , tt.text_problem, tt.date_start, 
               tt.date_stop, tt.text_solution, tt.idm_empl, ke.fam + ' '+ ke.name + ' ' + ke.otch [isp], tt.status, ks.klass_value [status_str] 
			   , tt.guid, tt.del, tt.idm_activity, 
               aa.[text], SUBSTRING(tt.text_solution, 1, 80) AS textsolution, SUBSTRING(tt.text_problem, 1, 80) AS textproblem, 
               tt.idm_place, tt.idm_object, tt.idm_os, tt.os_inv, tt.idm_control, tt.idm_patient, p.fio [patient_str], p.date_b db_patient,
			   cast(tt.text_solution as varchar(40))+ case when len(tt.text_solution)>40 then '...'else '' end short_text_solution
			   ,cast(tt.text_problem as varchar(100))+ case when len(tt.text_problem)>100 then '...'else '' end short_text_problem
			   , tmc.idm_empl idm_COLLABORATOR, ke_coll.fam + ' '+ ke_coll.name + ' ' + ke_coll.otch [isp_coll]

FROM            dbo.TT$MAIN tt  with (nolock)
LEFT JOIN dbo.ALGORITM$TYPE_ACTIVITY aa  with (nolock) ON tt .idm_activity = aa.id
left join TT$MAIN_COLLABORATORS tmc with (nolock) on tt.id = tmc.idm_main and tmc.del=0
left join KAD$EMPLOYEE ke_coll with(nolock) on ke_coll.id = tmc.idm_empl
left join dbo.KLASS ks with (nolock) on ks.klass_name = 'tt_trouble_status_pretensia' and ks.klass_id = tt.status
left join dbo.DEPARTMENTS d with (nolock) on tt.idm_departments = d.id
left join dbo.KAD$EMPLOYEE ke with (nolock) on tt.idm_empl = ke.id
left join iClinic.dbo.PATIENT p with (nolock) on   p.idm_1c = tt.idm_1c
where tt.del=0