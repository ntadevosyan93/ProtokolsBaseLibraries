
CREATE view [dbo].[view$rmos_grid]
as
select r.[id] id_rm
, r.[text]
, serial_num
,inv_num
, ph.text idm_head_org
, d.text idm_otdel
, p.text idm_partner
, doc_num_purchase
, doc_date_purchase
, cash_number
, cash_date
, receip_number
, receip_date
,idm_billing
From RM$OS r with(NOLOCK) 
left join [PARTNER] ph with(NOLOCK)  on ph.id = r.idm_head_org
left join [PARTNER] p with(NOLOCK)  on p.id = r.idm_partner
left join DEPARTMENTS d with(NOLOCK)  on d.id = r.idm_otdel