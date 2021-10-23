









CREATE  view [dbo].[View$edit_Billing]
as 
select rb.id idm_billing, bill_guid, 

number,bill_dogovor, date_bill,  rb.status status_bill, IsNewStatus,IsNotDogovor,

rb.idm_owner, idm_department, idm_curator, rb.idm_isp, 

rb.AllowAgreeMarceting,

description, 

rb.idm_partner, idm_dogovor, dr.some_status [doc_status],

summ,summ_cy , summ_cy_type, cy_rate, percent_cy, 

date_pay, type_pay, date_pay_purpose, nom_paid, date_paid,

idm_budget,idm_budgetGroup, budget_depart, budget_month,

--, idm_month, idm_depart, idm_group,

rb.user_in, rb.date_in, user_cur, date_cur
,pay_oms
--, *
--,case when r_number is not null then 
--'(№ '+ r_number+') ' else '' end + case when subject is not null then SUBSTRING( subject,0,70) else '' end +'...'  as subject ,
--dr.[guid] doc_guid
From RM$OS$BILLING rb  with (nolock)
left  join [DOGOVORS$REG] dr  with (nolock) on rb.idm_dogovor = dr.id and  dr.del=0
where rb.del=0
--OUTER  apply (
--SELECT  top 1 idm_month, idm_depart, idm_group FROM [RM$OS$BILLING_BUDGET] with (nolock)  WHERE id=rb.idm_budget and del =0 order by id desc)B

--where bill_guid='01379c1f-c095-4d4a-ad29-845d6265df62'

--SELECT   *, idm_month, idm_depart, idm_group FROM [RM$OS$BILLING_BUDGET] with (nolock)  WHERE id=rb.idm_billing and del =0 order by id desc