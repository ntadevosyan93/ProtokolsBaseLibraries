




CREATE view [dbo].[OutcomingGridView]
as
SELECT 
	   do.[id]
	   ,[number]
      ,do.[date_in]
      ,do.[user_in]
      ,case when do.idm_partner is null then do.org_text else p.[text] end [partner]
	  ,[idm_partner_text]
	  ,[idm_partner_doc_number]
      ,[idm_partner_doc_date]
      ,[date_doc]
      ,do.[idm_partner]
      ,do.[text]
      ,[resolution]
      ,[idm_empl]
	  ,ke.fam + ' ' + ke.name + ' ' + ke.otch [empl]
      ,[idm_empl_date_accept]
      ,[date_deadline]
      ,[notes] , idm_depart
	  ,d.text depart
  FROM [InformMSG].[dbo].[DISPATCH$OUTCOMING] do with(nolock)
   left join [PARTNER] p with(nolock) on do.idm_partner = p.id
   left join Kad$employee ke with(nolock) on ke.id = do.idm_empl
   left join DEPARTMENTS d with(nolock) on d.id = isnull(do.idm_depart,1)
   where  do.del=0