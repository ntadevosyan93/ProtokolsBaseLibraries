CREATE view View$psy_Download
as
 select distinct

 dh.id, dh.user_in, dh.date_in, dh.ip_in, isnull( ke.fam + ' ' + isnull(ke.name,'')  + ' ' + isnull( ke.otch,'') , dh.user_in) fio
 ,rtrim(s.fam) + ' ' + rtrim(s.name) + ' ' + s.otch cand 
 ,f.file_name
 ,dj.text [doljn]
 ,k.klass_value res
 From [dbo].[KAD$PSY_TEST_DOWNLOAD_HISTORY] dh with (nolock) 
 left join KAD$PSY_TEST b with (nolock)  on b.id = dh.idm_psy
 left join KAD$EMPLOYEE_CANDIDATS s  with (nolock) on s.id = b.idm_empl 
 left join  KAD$EMPLOYEE ke  with (nolock) on ke.login_ad = dh.user_in 
 left join FILE_STOR f  with (nolock) on f.guid = dh.file_guid
 left join KAD$DOLJN dj   with (nolock)  on dj.id = s.idm_doljn
 left join KLASS k on k.klass_name = 'psy_test_res' and k.klass_id =b.res
 --order by dh.date_in

 --select *
 --From KAD$PSY_TEST


 --select *
 --From KAD$PSY_TEST_Protocol_CAND