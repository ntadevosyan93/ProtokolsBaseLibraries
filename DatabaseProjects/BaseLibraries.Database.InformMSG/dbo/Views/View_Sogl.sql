CREATE View [View$Sogl] as 
SELECT
rba.id
, idm_bill
,rba.idm_otdel
,[date_reason]
      ,[user_reason]
	  ,fio_short
,r.klass_value as res_reason
,text_reason,
k.klass_value as res_otdel
  FROM [RM$OS$BILLING_AGREEMENT] rba with (nolock)
left join KLASS r with (nolock)  on r.klass_id = idm_reason and r.klass_name='billing'
left join KLASS k with (nolock)  on k.klass_id = idm_otdel and k.klass_name='otdel_empl'
left join View$KAD$EMPLOYEE b  with (nolock) on b.id =idm_empl
where  rba.del=0 
--and RM$OS$BILLING_AGREEMENT.idm_otdel=1 
--and idm_bill=24648 