
CREATE view  [dbo].[View$RM$OS$BILLING2]
as
--declare @date_in as datetime, @date_to as datetime

--set @date_in='2019-30-07 17:30:09'
--set @date_to='2019-17-09 17:30:09'
--        --dbo.GetAllowAgreeFromBilling(rmBill.id, 1) AS reas_ur, dbo.GetAllowAgreeFromBilling(rmBill.id, 3) AS reas_m, 
--;
with sogl(txt, otdel,  id , ra_id) as (
	SELECT  r.klass_value +'. ' +fio_short+', '+ convert(varchar(10),[date_reason],104) +' '+ convert(varchar(5),[date_reason],108) +
	(case when text_reason !='' and not text_reason is null then '. Комментарии: '+text_reason else '' end) , ra.idm_otdel, idm_bill,ra.id
	FROM [RM$OS$BILLING_AGREEMENT] ra with (nolock)
	left join KLASS r  WITH (nolock) on r.klass_id = idm_reason and r.klass_name='billing'
	left join KLASS k  WITH (nolock) on k.klass_id = idm_otdel and k.klass_name='otdel_empl'
	left join View$KAD$EMPLOYEE b  WITH (nolock) on b.id =idm_empl
    where  ra.del=0 
),
  IsSogl(res_otdel,idm_bill, idm_otdel) as 
  (
  	select   klass_value_int as res_otdel,idm_bill, idm_otdel
	from RM$OS$BILLING_AGREEMENT  ra
	left join KLASS on klass_id=idm_reason and klass_name='billing'
	where ra.del=0 --idm_bill=@idm_bill and and idm_otdel=@idm_otdel
  )
 

select
 dbo.GetAllowAgreeFromBilling2(rmBill.status, rmBill.summ, Allow_ur.res_otdel, 1) AS reas_ur,
 dbo.GetAllowAgreeFromBilling2(rmBill.status, rmBill.summ, Allow_m.res_otdel, 3) AS reas_m,

 --dbo.GetAllowAgreeFromBilling(rmBill.id, 1) AS reas_ur,
 -- dbo.GetAllowAgreeFromBilling(rmBill.id, 3) AS reas_m,
rmBill.id, rmBill.user_in, rmBill.date_in, rmBill.date_bill, rmBill.number, post.text AS partner, 
                         owner.text AS owner, k.fio_short AS curator, rmBill.description, rmBill.summ, rmBill.summ_cy, rmBill.summ_cy_type, rmBill.cy_rate, rmBill.percent_cy, rmBill.nds, rmBill.status, a.klass_value [status_str] , rmBill.date_paid, 
                         rmBill.nom_paid, rmBill.send_assept, dep.text AS department, rmBill.invoice_number, rmBill.invoice_date, rmBill.bill_dogovor, rmBill.type_pay, rmBill.date_pay, rmBill.date_pay_purpose, rmBill.assept_number, 
                         rmBill.assept_idm, rmBill.idm_budget, rmBill.send_agree, rmBill.idm_file_store, rmBill.user_cur, rmBill.date_cur, rmBill.del, rmBill.bill_guid, a.klass_value,
						 S_ur.txt  AS comment_ur, S_m.txt AS comment_m, 
						 -- dbo.f_GetResultAgreementBillingByOtdel(rmBill.id, 1)  AS comment_ur,
                         --dbo.f_GetResultAgreementBillingByOtdel(rmBill.id, 3) AS comment_m, 
						 (CASE rmBill.[status] WHEN 7 THEN 0 WHEN 4 THEN 1 ELSE - 1 END) AS AllowPurpose, rmBill.idm_partner, 
                         rmBill.idm_owner, rmBill.idm_isp, rmBill.idm_curator, rmBill.idm_department, rmBill.idm_dogovor, rmBill.idm_budgetGroup, rmBill.assept_date, rmBill.AllowAgreeMarceting
FROM            dbo.RM$OS$BILLING AS rmBill WITH (nolock) LEFT OUTER JOIN
                         dbo.KLASS AS a WITH (nolock) ON a.klass_id = rmBill.status AND a.klass_name = 'billing' LEFT OUTER JOIN
                         dbo.View$KAD$EMPLOYEE$ALL AS k ON k.id = rmBill.idm_curator LEFT OUTER JOIN
                         dbo.PARTNER AS post WITH (nolock) ON post.id = rmBill.idm_partner LEFT OUTER JOIN
                         dbo.PARTNER AS owner WITH (nolock) ON owner.id = rmBill.idm_owner LEFT OUTER JOIN
                         dbo.DEPARTMENTS AS dep WITH (nolock) ON dep.id = rmBill.idm_department
						 outer apply (select top 1 * From sogl s where s.id= rmBill.id and otdel=1 order by s.ra_id ) S_m
						 outer apply (select top 1 * From sogl s where s.id= rmBill.id and otdel=3 order by s.ra_id ) S_ur
						 outer apply (select top 1 * From IsSogl s where s.idm_bill = rmBill.id and s.idm_otdel = 3) Allow_m
						 outer apply (select top 1 * From IsSogl s where s.idm_bill = rmBill.id and s.idm_otdel = 1) Allow_ur
 --where 
 --date_bill  between cast(@date_in as date) and cast(@date_to as date)
 --and rmBill.id = 15945
 --select dbo.f_GetResultAgreementBillingByOtdel(15945, 3) 