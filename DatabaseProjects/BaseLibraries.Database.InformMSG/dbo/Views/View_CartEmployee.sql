create view View$CartEmployee
as
SELECT a.id,a.phone_mob, a.phone_gor, a.phone_vn, a.login_ad,a.email,a.login_1c_t, a.view_only_otdel, a.view_only_self,
a.actual, a.curator_dog, b.fio_full, c.text, d.text as otdel_text, p.text as org_text,a.call_center_worker,a.guid_iclinic 
, curat.fio_full as controller_fio, a.wt_check_fact_only,a.IsLaborant,a.sms_only,a.NotSendApplication
,a.date_in,a.user_in, a.sertificate_date_expir,a.date_dismissal, 
k_ecp.klass_value  as ecp_status ,ecp_date_expir, 
(select cast ((select fio_full + ', ' AS 'data()' from KAD$WORK_TIME_CURATORS  with (nolock) 
inner join View$KAD$EMPL$ACTUAL  with (nolock) on View$KAD$EMPL$ACTUAL.id = idm_curator
 where idm_empl =a.id FOR XML PATH(''))  AS VARCHAR(MAX)) ) as curator_wt, a.date_start_work, a.data_b, case when F.id is not null then 1 else 0 end isFileExists
FROM [KAD$EMPLOYEE] a with (nolock)
left join View$KAD$EMPLOYEE b  with (nolock) on b.id = a.id
left join KAD$DOLJN c  with (nolock) on c.id = a.idm_doljn
left join DEPARTMENTS d  with (nolock) on d.id = a.idm_otdel
left join  PARTNER p  with (nolock) on p.id = a.idm_org
left join View$KAD$EMPLOYEE curat with (nolock)  on curat.id = a.idm_controller
left join KLASS k_ecp  with (nolock) on k_ecp.klass_id=ecp_status and k_ecp.klass_name ='ecp_status'
outer apply (select top 1 id  FROM [FILE_STOR]  with (nolock)  WHERE ([del] = 0) AND ([db_table] = 'docScan') and [db_table_id] = a.id ) F  

--where a.id = 1923