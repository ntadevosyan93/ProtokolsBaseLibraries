CREATE PROCEDURE [dbo].[Nomencl_GetFirstEmailAgreement]
@user_in varchar(50),
@nomenclature_guid varchar(50)
AS
BEGIN

SET NOCOUNT ON;

set @user_in = ltrim(rtrim(@user_in))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)

declare @idm_nomenclature int
select @idm_nomenclature=id from NOMENCLATURE where guid = @nomenclature_guid

select(select top(1) id from NOMENCLATURE_AGREEMENT where idm_empl=ss.idm_empl and idm_nomenclature=ss.idm_nomenclature) as idm_empl
from NOMENCLATURE_AGREEMENT ss
where idm_nomenclature = @idm_nomenclature
group by idm_empl,idm_nomenclature

END