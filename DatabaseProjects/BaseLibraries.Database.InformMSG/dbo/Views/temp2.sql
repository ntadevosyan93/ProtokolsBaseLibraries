create view temp2
as

SELECT  
							kwt.date_in
                            ,kwt.[id]
                            ,ke.fam
                            ,ke.name
                            ,ke.otch
                            ,ke.idm_doljn  
	                        ,rtrim(ltrim(d.text)) [doljn]
                            ,kwt.[idm_empl]
	                        ,cast(CAST(kwt.[estimated_start]  AS time) as varchar(5)) + ' - ' + cast(CAST(kwt.[estimated_stop]  AS time) as varchar(5)) [worktime]
                            ,[actual_start]
                            ,kwt.[actual_stop]
                            ,kwt.[del] 
							,case 
							when actual_start is null and actual_stop is not null then 'нет отметки о приходе' 
							when actual_start is not null and actual_stop is null then 'нет отметки о уходе'
							when actual_start is null and actual_stop is null then 'нет отметок'
							when actual_start is not null and actual_stop is not null then '' end [otmetka]
							  
                            --,case when DATEDIFF(mi,[estimated_start],[actual_start])>0 then DATEDIFF(mi,[estimated_start],[actual_start])  else 0 end  [input]
                            --,case when DATEDIFF(mi,[actual_stop],[estimated_stop]) >0 then DATEDIFF(mi,[actual_stop],[estimated_stop]) else 0 end  [output]
                            ,sb
                            ,prichina
	                        ,dp.text [dep]
	                        ,p.text [partner]
                            ,isnull(fixed,0) [fixed]
							,kwt.[guid]
                            FROM [InformMSG].[dbo].[KAD$WORK_TIME] kwt
                            join InformMSG.dbo.KAD$EMPLOYEE ke on ke.id = kwt.idm_empl
                            left join KAD$DOLJN d on ke.idm_doljn = d.id

	                        left join DEPARTMENTS dp  with (nolock) on dp.id = ke.idm_otdel 
	                        left join  PARTNER p  with (nolock) on p.id =ke.idm_org
							where kwt.date_in between DATEADD(M,-1, Getdate() ) and  cast(dateadd(day,-1,getdate() )as date) 
							and (actual_start is null or actual_stop is null )