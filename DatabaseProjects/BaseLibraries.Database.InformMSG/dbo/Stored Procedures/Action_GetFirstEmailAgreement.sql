CREATE PROCEDURE [dbo].[Action_GetFirstEmailAgreement]
@user_in varchar(50),
@action_guid varchar(50)
AS
BEGIN

SET NOCOUNT ON;

set @user_in = ltrim(rtrim(@user_in))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)

declare @idm_action int
select @idm_action=id from ACTION_  with (nolock) where guid = @action_guid

select(select top(1) id from ACTION_AGREEMENT  with (nolock) where idm_empl=ss.idm_empl and idm_action=ss.idm_action) as idm_empl
from ACTION_AGREEMENT ss with (nolock) 
where idm_action = @idm_action
group by idm_empl,idm_action

END