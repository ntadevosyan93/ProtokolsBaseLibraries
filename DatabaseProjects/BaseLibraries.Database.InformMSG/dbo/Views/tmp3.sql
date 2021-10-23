--Следующие сотрудники по состоянию на {0} у сотрудников отсутствует отметка об уходе\приходе:

--* такой то 
--* другой 
--* третий 
create view tmp3 as
--Укажите причину.
--declare @dat as date

--select @dat = '2019-11-01'
--select @dat


select kwt.[guid],
 ke.id [employeer_id],  ke.fam + ' ' + ke.name + ' ' + ke.otch [employeer_name]
 ,cur.id [curator_id],  cur.fam + ' ' + cur.name + ' ' + cur.otch [curator_name]
,cur.email							,case 
							when actual_start is null and actual_stop is not null then 'нет отметки о приходе' 
							when actual_start is not null and actual_stop is null then 'нет отметки о уходе'
							when actual_start is null and actual_stop is null then 'нет отметок'
							when actual_start is not null and actual_stop is not null then '' end [otmetka]
From  [InformMSG].[dbo].[KAD$WORK_TIME] kwt with (nolock) 
join KAD$EMPLOYEE ke  with (nolock) on kwt.idm_empl = ke.id
join KAD$WORK_TIME_CURATORS wtc with (nolock) on wtc.idm_empl = kwt.idm_empl
join InformMSG.dbo.KAD$EMPLOYEE cur  with (nolock) on cur.id = wtc.idm_curator
 
where ( cast( kwt.estimated_start as date) = '2019-11-01' )
and  (actual_start is null or actual_stop is null )