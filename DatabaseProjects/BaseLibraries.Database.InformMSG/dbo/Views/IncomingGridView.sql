





CREATE View [dbo].[IncomingGridView]
as
SELECT   di.[id]
      ,di.[date_in]
      ,di.[user_in]
      ,[date_doc]
      ,[number]
      ,case when di.idm_partner is null then di.org_text else p.[text] end [partner]
	  ,di.idm_partner
      ,[idm_partner_text] [sotr]
       ,ke.fam + ' ' + ke.name + ' ' + ke.otch [empl]
	   ,di.idm_self
        ,k.klass_value [type_dispatch_text]
	   ,di.type_dispatch
      ,di.[text]
      ,[reg_number_blank]
      ,[notes]
	  
  FROM [InformMSG].[dbo].[DISPATCH$INCOMING] di with(nolock) 
  left join [PARTNER] p with(nolock) on di.idm_partner = p.id
  left join Kad$Employee ke with(nolock) on ke.id = di.idm_self
  left join [KLASS] k with (nolock) on (k.[klass_name] = 'dispatch') and k.klass_id = di.type_dispatch
  where  di.del=0