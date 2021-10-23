CREATE PROCEDURE [dbo].[Nomencl_SetAgreementStatus]

@user_in varchar(50),
@idm_nomenclature int,
@status int,
@comment varchar(max)

AS
BEGIN

SET NOCOUNT ON;

set @user_in = ltrim(rtrim(@user_in))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)

declare @last_agree_id int

select top(1) @last_agree_id = id from NOMENCLATURE_AGREEMENT where idm_empl=@idm_user and idm_nomenclature=@idm_nomenclature order by id desc

UPDATE NOMENCLATURE_AGREEMENT SET idm_reason = @status, text_reason = @comment, date_reason = GETDATE() where id = @last_agree_id

END