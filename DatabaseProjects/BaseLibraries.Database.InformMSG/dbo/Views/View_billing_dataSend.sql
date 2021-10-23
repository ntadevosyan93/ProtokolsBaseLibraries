


CREATE view [dbo].[View$billing$dataSend] as
select a.id, number, date_bill, description, text as partner,summ,idm_curator,bill_guid, lower(klass_value) as status, a.status idm_status, a.idm_isp
 from RM$OS$BILLING a with (nolock)
 left join PARTNER p with (nolock)  on p.id = idm_partner
 left join KLASS k with (nolock) on klass_id = status and klass_name='billing'