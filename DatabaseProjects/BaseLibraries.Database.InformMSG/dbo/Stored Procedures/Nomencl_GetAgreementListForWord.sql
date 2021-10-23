CREATE PROCEDURE [dbo].[Nomencl_GetAgreementListForWord]

@idm_nomenclature int

AS
BEGIN

SET NOCOUNT ON;
	
SELECT k.text as dolgn,fio,text_reason,date_reason,idm_reason
FROM NOMENCLATURE_AGREEMENT
left join (select id, 
(CASE WHEN fam IS NULL THEN '' ELSE fam END )+' '+
(CASE WHEN name IS NULL THEN '' ELSE name END )+' '+
(CASE WHEN otch IS NULL THEN '' ELSE otch END ) as fio
from kad$employee) T on T.id = idm_empl 
left join KAD$DOLJN K on K.id = (select idm_doljn from KAD$EMPLOYEE where id = idm_empl)
WHERE (idm_nomenclature = @idm_nomenclature)
END