
create View [dbo].[View$ExportEmployee1C]
as
select kd.text [doljn], ke.id, ke.fam, ke.name, ke.otch, ke.data_b, e.fio, e.guid empl_guid
From KAD$EMPLOYEE ke 
join KAD$DOLJN kd on kd.id = ke.idm_doljn

left join iclinic.dbo.EMPLOYEE e 
on (e.phone = ke.phone_mob ) or (e.fio = rtrim(ltrim(isnull(ke.fam,''))) + ' ' + rtrim(ltrim(isnull(ke.name,''))) + ' ' + rtrim(ltrim(isnull(ke.otch,'')))   )

where kd.text like '%врач%' and ke.guid_iclinic is null
and  ke.actual = 1 and ke.del=0
--order by  ke.fam, ke.name, ke.otch