CREATE PROCEDURE [dbo].[Action_GetAgreementStatusesForUser]

@user_in varchar(50),
@idm_action int

AS
BEGIN

SET NOCOUNT ON;
	-- 0 - Нет в согласовании 1 - Есть в согласовании, статус не проставлен (на согласовании)
	-- 2 - Согласован любо отклонён
	
set @user_in=ltrim(rtrim(@user_in))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)

declare @agreement_status int

select @agreement_status = idm_reason from ACTION_AGREEMENT with (nolock)  where idm_empl = @idm_user and idm_action = @idm_action

if(@agreement_status is null) select '0' else
if (@agreement_status = 4) select '1' else select '2'

END