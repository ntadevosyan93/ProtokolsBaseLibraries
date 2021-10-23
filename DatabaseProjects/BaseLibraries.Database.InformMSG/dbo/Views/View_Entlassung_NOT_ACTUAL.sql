



CREATE view [dbo].[View$Entlassung_NOT_ACTUAL]
as
 select ke.*, kee.id [idm_ent]
 From KAD$EMPLOYEE ke with(nolock)
 left join [dbo].[KAD$ENTLASSUNG_EMPLOYEE] kee  with(nolock) on ke.id = kee.idm_employee
 where ke.actual=0