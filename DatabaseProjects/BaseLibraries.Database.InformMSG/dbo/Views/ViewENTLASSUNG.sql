
CREATE View  [dbo].[ViewENTLASSUNG] 
as
select kee.*, ke.fam + ' ' + ke.name + ' ' + ke.otch [fio], p.text [org], d.text [dolj], dp.text [otdel]
From [dbo].[KAD$ENTLASSUNG_EMPLOYEE] kee with(nolock)
left join KAD$EMPLOYEE ke  with(nolock) on ke.id = kee.idm_employee
left join PARTNER p with(nolock) on kee.idm_org = p.id
left join KAD$DOLJN d with (nolock) on kee.idm_dolj = d.id
left join DEPARTMENTS dp with(nolock) on kee.idm_otdel = dp.id