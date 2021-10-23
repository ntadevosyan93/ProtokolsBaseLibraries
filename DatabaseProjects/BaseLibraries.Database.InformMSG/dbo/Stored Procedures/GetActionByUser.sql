CREATE procedure [dbo].[GetActionByUser]
@user_name varchar(50)
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

SET NOCOUNT ON;

SElect * from ACTION_  with (nolock) where del = 0 and idm_empl = @idm_user and user_in = @user_name or ACTION_.id in 
(select idm_action from ACTION_AGREEMENT  with (nolock) where idm_empl = @idm_user) and del = 0
order by ACTION_.id desc

END