

CREATE PROCEDURE [dbo].[NomenclatureAUTOCuratorInsert]
@user_in varchar(50),
@nomenclature_guid varchar(50)
AS
BEGIN

SET NOCOUNT ON;

set @user_in=ltrim(rtrim(@user_in))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)

declare @idm_nomenclature int
select @idm_nomenclature=id from NOMENCLATURE where guid = @nomenclature_guid

declare @c int;

select @c=COUNT(id) from NOMENCLATURE_AGREEMENT where idm_nomenclature = @idm_nomenclature and idm_empl = @idm_user

if(@c = 0) begin
	insert into NOMENCLATURE_AGREEMENT(idm_reason, text_reason,date_reason,idm_nomenclature,idm_empl)
	values( 1,'СОГЛАСОВАНО АВТОМАТИЧЕСКИ',GETDATE(),@idm_nomenclature,@idm_user)
	
	insert into NOMENCLATURE_AGREEMENT (idm_reason,text_reason,date_reason,idm_nomenclature,idm_empl)		
		(select 4, '', GETDATE(), @idm_nomenclature, idm_empl 
		
		from NOMENCLATURE_AGREEMENT_AUTO_INSERT
		where idm_empl not in (select idm_empl from NOMENCLATURE_AGREEMENT where idm_nomenclature = @idm_nomenclature ))
	end

END