



CREATE PROCEDURE [dbo].[ModifyPsyProtocol]

@start as datetime,
@end as datetime

AS
BEGIN
DECLARE @tmp_hist TABLE(
id						int,
fam						varchar(250) null,
user_in					varchar(250) null,
date_in					datetime null,
date_cur					datetime null,
doljn					varchar(250) null,
feature_text			varchar(max) null,
relative_empl			varchar(250) null,
result					varchar(250) null,
idm_psytest				int null ,
education				varchar(250) null,
date_start_editing		datetime null
);
	DECLARE @tmp_hist2 TABLE(
	pk int,
id						int,
fam						varchar(250) null,
user_in					varchar(250) null,
date_in					datetime null,
date_cur					datetime null,
doljn					varchar(250) null,
feature_text			varchar(max) null,
relative_empl			varchar(250) null,
result					varchar(250) null,
idm_psytest				int null ,
education				varchar(250) null,
date_start_editing		datetime null
);		

	DECLARE @tmp_hist3 TABLE(
	num int,
	pk int,

id						int,
fam						varchar(250) null,
user_in					varchar(250) null,
date_in					datetime null,
date_cur					datetime null,
doljn					varchar(250) null,
feature_text			varchar(max) null,
relative_empl			varchar(250) null,
result					varchar(250) null,
idm_psytest				int null ,
education				varchar(250) null,
date_start_editing		datetime null
);		



 insert into @tmp_hist
SELECT 
a.id  
,rtrim(s.fam) + ' ' + rtrim(s.name) + ' ' + s.otch fam 
,a.user_in
,a.date_in 
, a.date_cur
,kd.text [doljn]
,[feature_text] 
,[relative_empl] 

,k.klass_value result
,idm_psytest
,education
,date_start_editing

FROM [dbo].[KAD$PSY_TEST_Protocol_CAND]  a  with (nolock) 
left join KAD$PSY_TEST b with (nolock)  on b.id = a.idm_psytest
inner join KAD$EMPLOYEE_CANDIDATS s  with (nolock) on s.id = b.idm_empl 
left join KLASS k on k.klass_name = 'psy_test_res' and k.klass_id = (case when [idm_result] is not null then idm_result else b.res end) 
left join KAD$DOLJN kd on kd.id = a.idm_dolgn
where b.del=0
 and  ( a.date_cur between @start and dateadd(day,1,@end ) or  a.date_in between @start and dateadd(day,1,@end ) )

and a.date_cur is not null

insert into @tmp_hist2
SELECT 
a.pk,
a.id  
,rtrim(s.fam) + ' ' + rtrim(s.name) + ' ' + s.otch fam 
,a.user_in
,a.date_in 
,a.date_cur
,kd.text [doljn]
,[feature_text] 
,[relative_empl] 
,k.klass_value result
,idm_psytest
,education
,date_start_editing

FROM [dbo].[KAD$PSY_TEST_Protocol_CAND_HISTORY]  a  with (nolock) 
left join KAD$PSY_TEST b with (nolock)  on b.id = a.idm_psytest
inner join KAD$EMPLOYEE_CANDIDATS s  with (nolock) on s.id = b.idm_empl 
left join KLASS k on k.klass_name = 'psy_test_res' and k.klass_id = (case when [idm_result] is not null then idm_result else b.res end) 
left join KAD$DOLJN kd on kd.id = a.idm_dolgn
where a.id in (select id from @tmp_hist)  

insert into @tmp_hist3
select  row_number() over (partition by id order by pk desc ) num,  pk, id , fam , user_in , date_in , date_cur, doljn , feature_text , relative_empl , result , idm_psytest , education , date_start_editing
From (
select  pk, id , fam , user_in , date_in , date_cur, doljn , feature_text , relative_empl , result , idm_psytest , education , date_start_editing
From @tmp_hist2 h2
where feature_text is not null and 
(select count(*) From (
select  fam ,   doljn , LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(feature_text, CHAR(10), CHAR(32)),CHAR(13), CHAR(32)),CHAR(160), CHAR(32)),CHAR(9),CHAR(32)))) feature_text , relative_empl , result , idm_psytest , education 
From @tmp_hist h1
where h1.id = h2.id
union 
select  h2.fam ,  h2.doljn , LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(feature_text, CHAR(10), CHAR(32)),CHAR(13), CHAR(32)),CHAR(160), CHAR(32)),CHAR(9),CHAR(32)))) feature_text , h2.relative_empl , h2.result , h2.idm_psytest , h2.education
)D
) =2

)D 

select 
--2147483647 - row_number() over (order by h1.id),
h1.id , h1.fam , h1.user_in , h1.date_in , h1.date_cur, h1.doljn , h1.feature_text , h1.relative_empl , h1.result , h1.idm_psytest , h1.education , h1.date_start_editing
,D.h_pk,  [old_fam],  [old_date_cur],old_user_in,  old_doljn,  old_feature_text,  old_relative_empl,  old_result,  old_education
From @tmp_hist h1 
cross apply (
select  top 1 pk [h_pk], isnull(fam ,'') [old_fam], date_cur [old_date_cur],  user_in  [old_user_in], isnull(doljn,'') old_doljn, isnull(feature_text,'') old_feature_text, isnull(relative_empl,'') old_relative_empl, isnull(result,'') old_result, isnull(education,'') old_education
From @tmp_hist3 h3
where  h3.id = h1.id
order by pk desc
)D
 order by h1.date_cur desc
END