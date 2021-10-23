Create view GetEmployeesByFilter as 
SELECT a.*, b.fio_full, c.text as dolj, d.text as otdel_text, p.text as org_text  FROM [KAD$EMPLOYEE] a with (nolock)
                left join View$KAD$EMPLOYEE b  with (nolock) on b.id=a.id
		        left join KAD$DOLJN c  with (nolock) on c.id = a.idm_doljn
		        left join DEPARTMENTS d  with (nolock) on d.id = a.idm_otdel 
		        left join  PARTNER p  with (nolock) on p.id =a.idm_org
		        left join View$KAD$EMPLOYEE curat  with (nolock) on curat.id = a.idm_controller   
                where a.del=0  and  a.fam like '[а-я]%' --order by fio_full