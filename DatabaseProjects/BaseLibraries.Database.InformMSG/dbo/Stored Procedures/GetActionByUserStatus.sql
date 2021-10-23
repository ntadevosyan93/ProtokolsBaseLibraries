CREATE procedure [dbo].[GetActionByUserStatus]
@user_name varchar(50), @type int
AS
BEGIN
	set @user_name=ltrim(rtrim(@user_name))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)
	SET NOCOUNT ON;
-- type = 0 - Куратор
-- type = 1 - На согласовании

		if @type=0
		begin
			select * from ACTION_  with (nolock) where idm_empl = @idm_user and del = 0
		end
		else
			if @type=1
				select * from ACTION_  with (nolock) where ACTION_.id in (select idm_action  from ACTION_AGREEMENT with (nolock)  where idm_empl = @idm_user  
					and 
						not ((select top(1) idm_reason from ACTION_AGREEMENT  with (nolock) where ACTION_AGREEMENT.idm_action = ACTION_.id and idm_empl = @idm_user order by id desc) = 1)
	
					AND
	
						not ((select top(1) idm_reason from ACTION_AGREEMENT  with (nolock) where ACTION_AGREEMENT.idm_action = ACTION_.id and idm_empl = @idm_user order by id desc) = 3)
				)
				order by ACTION_.id desc
END