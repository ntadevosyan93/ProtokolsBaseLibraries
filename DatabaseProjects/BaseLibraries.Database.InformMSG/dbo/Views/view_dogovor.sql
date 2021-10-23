


CREATE view [dbo].[view$dogovor]
 as
select case when r_number is not null then 
'(№ '+ r_number+') ' else '' end + case when subject is not null then SUBSTRING( subject,0,70) else '' end +'...'  as subject ,
dr.date_reg, 
r_date_deadline,
dr.r_number, subject [subject_txt] ,
dr.[guid] doc_guid, k.klass_value some_status, some_status idm_status,  dr.id doc_id
,idm_partner, idm_owner 
From [DOGOVORS$REG] dr 
left join KLASS k on k.klass_name = 'dogovor_some_status' and k.klass_id = some_status
where  dr.del = 0