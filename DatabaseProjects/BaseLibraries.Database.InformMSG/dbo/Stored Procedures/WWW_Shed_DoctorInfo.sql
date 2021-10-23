
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	процедура возвращает данные о докторах в siteApi
-- =============================================
CREATE PROCEDURE [dbo].[WWW_Shed_DoctorInfo]
	@guid_iclinic varchar(50),
	@guid_1c varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select @guid_1c as guid, 
	dj.text as doljn,
isnull(ee.skill_education,'') skill_education,
isnull(ee.additional_education,'') additional_education,
ks.text as spec,
--Employee_Education.sert_date,
kc.text as cat_text,
--Employee_Education.kategorie_date as cat_date,
(select top(1) standing from KAD$EMPLOYEE with(nolock) where guid_iclinic = @guid_iclinic and actual = 1 and del = 0) as standing,
kec.text as edu_class,
 isnull(ee.nagrady,'') nagrady,
 ke.actual
from KAD$EMPLOYEE ke with(nolock) 
left join Employee_Education ee with(nolock) on ke.id = ee.idm_employee and ee.del=0 
left join KAD$DOLJN dj with(nolock) on dj.id = idm_dolj
left join (SELECT klass_id as id, klass_value as text FROM [KLASS] with (nolock)  where klass_name ='educat_sert') ks on ks.id = ee.sert_spec
left join (SELECT klass_id as id, klass_value as text FROM [KLASS] with (nolock)  where klass_name ='educat_categorye') kc on kc.id = ee.kategorie
left join (SELECT klass_id as id, klass_value as text FROM [KLASS] with (nolock)  where klass_name ='educat_class') kec on kec.id = ee.class_education
where  ke.del=0 -- and idm_employee = (select top(1) id from KAD$EMPLOYEE with(nolock) where guid_iclinic = @guid_iclinic and actual = 1 and del = 0)
and  ke.guid_iclinic = @guid_iclinic

END