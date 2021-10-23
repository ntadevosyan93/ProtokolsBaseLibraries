CREATE PROCEDURE [dbo].[Nomencl_GetAgreementForEmail]

@nomenclature_guid varchar(50)

AS
BEGIN

SET NOCOUNT ON;

declare @id int

select @id=id from NOMENCLATURE where guid=@nomenclature_guid

SELECT KAD$EMPLOYEE.fam,KLASS.klass_value,text_reason
FROM NOMENCLATURE_AGREEMENT 
left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = NOMENCLATURE_AGREEMENT.idm_empl
left join KLASS on KLASS.klass_id = NOMENCLATURE_AGREEMENT.idm_reason
where KLASS.klass_name='nomenclature_agree' and idm_nomenclature = @id
END