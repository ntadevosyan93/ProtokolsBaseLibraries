Create view View$Psy_load
as

select ent.id, ent.user_in, ent.date_in, ent.ip_in, isnull( ke.fam + ' ' + isnull(ke.name,'')  + ' ' + isnull( ke.otch,'') , ent.user_in) fio

From KAD$PSY_TEST_ENTER_HISTORY ent
 left join  KAD$EMPLOYEE ke  with (nolock) on ke.login_ad = ent.user_in