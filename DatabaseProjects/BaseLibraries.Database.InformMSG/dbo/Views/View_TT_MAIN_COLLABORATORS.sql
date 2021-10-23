CREATE view View$TT$MAIN_COLLABORATORS
as
select  ttc.id, ttc.user_in, ttc.date_in, fam+ ' ' + name + ' ' + otch [fio], ttc.idm_empl [idm_isp_coll],ttc.idm_main, ttc.del
From  [dbo].TT$MAIN_COLLABORATORS ttc with(nolock)
join KAD$EMPLOYEE ke with(nolock) on ttc.idm_empl = ke.id