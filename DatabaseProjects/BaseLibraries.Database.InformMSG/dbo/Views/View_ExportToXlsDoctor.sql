
CREATE View [dbo].[View$ExportToXlsDoctor]
as
--https://docs.microsoft.com/ru-ru/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15
--http://translit-online.ru/

SELECT ke.id,
ke.fam [Familiya]
,ke.name [Imya]
,ke.otch [Otchestvo]
,case when (c.text is NULL or ee.idm_dolj=187) then kd.text else c.text end [Dolzhnost]
,case when ee.skill_education is NULL then '' else ee.skill_education end [OsnovnoveObrazovanie]
,case when ee.additional_education is NULL then '' else ee.additional_education end [DopolnitelnoeObrazovanie]
,case when srt.klass_value is NULL then '' else srt.klass_value end [SertifikatSpecialnost]
,case when ee.sert_date = '1900-01-01 00:00:00.000'or ee.sert_date is null   then '' else convert(varchar(12), ee.sert_date,104) end [SertifikatDejstvuet]
,case when edcat.klass_value is NULL then '' else edcat.klass_value end [Kategoriya]
,case when ee.kategorie_date = '1900-01-01 00:00:00.000'or ee.kategorie_date is null   then '' else convert(varchar(12), ee.kategorie_date,104) end [KategoriyaDejstvuet]
 
,case when ke.standing >100 then (year(getdate()) -ke.standing) else '' end [Stazh]
 
,case when edcl.klass_value is NULL then '' else edcl.klass_value end [UchenayaStepen]
,case when ee.nagrady is NULL then '' else ee.nagrady end [Nagrady]

FROM [InformMSG].[dbo].[KAD$EMPLOYEE] ke
left join [InformMSG].[dbo].[KAD$DOLJN] kd on ke.idm_doljn=kd.id
left join [InformMSG].[dbo].[Employee_Education] ee on ee.idm_employee=ke.id and ee.del=0
left join [InformMSG].[dbo].[KAD$DOLJN] c on ee.idm_dolj=c.id
left join [InformMSG].[dbo].[KLASS] srt on srt.klass_id=ee.sert_spec and srt.klass_name='educat_sert'
left join [InformMSG].[dbo].[KLASS] edcl on edcl.klass_id=ee.class_education and edcl.klass_name='educat_class'
left join [InformMSG].[dbo].[KLASS] edcat on edcat.klass_id=ee.kategorie and edcat.klass_name='educat_categorye'
where ke.actual=1 and ke.del=0 and  ke.fam   like '[а-Я]%'