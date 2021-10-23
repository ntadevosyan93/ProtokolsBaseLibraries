


CREATE PROCEDURE [dbo].[GetPreHistory]
	-- Add the parameters for the stored procedure here
	@pre_id as int
AS
BEGIN

declare @pre_guid as varchar(50)
 

--set @pre_guid = 'd4b100d8-ef6b-443f-8b4f-e8974c5c166e'
--set @pre_id =12434
select @pre_guid = [guid] from TT$Pretensions where id = @pre_id



 select *
From (
 select  ul.id, 'Просмотр инцидента  ' capt,  ul.user_in, ul.date_in  
 From UserLink ul
 where ul.controller = 'PRETENSIA' and ul.Action = 'FORM' and query = '[{"Name":"id","Value":"'+rtrim(ltrim(str(@pre_id)))+'"}]' 
 union
  select  ul.id, 'просмотр истории  ' capt,  ul.user_in, ul.date_in
 From UserLink ul
 where ul.controller = 'PRETENSIA' and ul.Action = 'HISTORY' and query = 'guid=' +@pre_guid
 union
 select ul.id, 'Скачивание файла : ' + fs.[file_name],  ul.user_in, ul.date_in 
 From UserLink ul
 join  FILE_STOR fs on  fs.module = 'workflow_tasks' and db_table = 'TT$Pretensions' and '[{"Name":"guid","Value":"'+ fs.guid+'"},{"Name":"server","Value":"1"}]' = ul.query
  where controller = 'File' and action = 'Download'
 and fs.db_table_id = @pre_id
 union
 select   ul.id, 'Удаление файла : ' + fs.[file_name],  ul.user_in, ul.date_in 
 From FILE_STOR fs 
   join UserLink ul on ul.query like '_{"Name":"guid","Value":"\"'+fs.guid+'%' and ul.controller='File' and action = 'GVFILESPARTIALDELETE'
 where    fs.db_table_id = @pre_id and  fs.module = 'workflow_troubles' and db_table = 'TT$Pretensions' 
 union
  select  ul.id, 'добавление сообщения ' capt,  ul.user_in, ul.date_in
 From UserLink ul
 where ul.query like '_{"Name":"item","Value":null},{"Name":"db_table","Value":"TT$Pretensions"},{"Name":"id","Value":"'+rtrim(ltrim(str(@pre_id)))+'%' 
  and ul.controller='Message' and action = 'GVMESSAGEPARTIALADDNEW'
  union
 select ul.id, 'удаление сообщения:" ' + 
 case when Len(ms.text) >10 then substring(ms.text,0,10) + '... ' else ms.text end
 + '"' capt,  ul.user_in, ul.date_in
 From MSG$MAIN ms
 join UserLink ul on ul.query like '_{"Name":"guid","Value":"\"'+ms.guid+'%' 
 and ul.controller='Message' and action = 'gvMessagePartialDelete'
 where ms.db_table = 'TT$Pretensions' and ms.db_table_id=@pre_id
 union
  select D.id, ' добавлен соисполнитель: '+ ke.fam + ' ' + ke.name + ' ' + ke.otch, D.user_in, D.date_in
 From (
 select 
 ul.id,   ul.user_in, ul.date_in,  
 cast(
 substring(query,Charindex('idm_isp_coll',query)+15, 
 ((charindex (',',query,Charindex('idm_isp_coll',query)) ) -( Charindex('idm_isp_coll',query)+15) )
 ) as int) empl
--, *
 From UserLink ul
 where controller = 'PretensiaCollaborators' and [Action] = 'GVCOLLABORATESPARTIALADDNEW'
 and query like '_{"Name":"idm_main","Value":"'+rtrim(ltrim(str(@pre_id)))+'%'

)D
join KAD$EMPLOYEE ke on ke.id = D.empl
union
 select  D.id, ' Удалён соисполнитель: '+ ke.fam + ' ' + ke.name + ' ' + ke.otch, D.user_in, D.date_in
 From (
 select 
 ul.id,   ul.user_in, ul.date_in,  
 reverse( substring(reverse(query),6,  charindex('eulaV', reverse(query) )-11) )   idm
 
 From UserLink ul 
 where ul.controller = 'PretensiaCollaborators' and Action = 'GVCOLLABORATESPARTIALDELETE'
   and query like '_{"Name":"idm_main","Value":"'+rtrim(ltrim(str(@pre_id)))+'%'
   )D
   join [dbo].[TT$MAIN_COLLABORATORS] tmc on tmc.id = D.idm
   join KAD$EMPLOYEE ke on ke.id = tmc.idm_empl

  )D 
 order by date_in desc
 end