CREATE PROCEDURE [dbo].[Action_AUTOCuratorInsert]
@user_in varchar(50),
@action_guid varchar(50)
AS
BEGIN

SET NOCOUNT ON;

set @user_in=ltrim(rtrim(@user_in))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)

declare @idm_action int
select @idm_action=id from ACTION_  with (nolock) where guid = @action_guid

declare @c int;

select @c=COUNT(id) from ACTION_AGREEMENT with (nolock)  where idm_action = @idm_action and idm_empl = @idm_user

if(@c = 0) begin
	insert into ACTION_AGREEMENT(idm_reason, text_reason,date_reason,idm_action,idm_empl)
	values( 1,'СОГЛАСОВАНО АВТОМАТИЧЕСКИ',GETDATE(),@idm_action,@idm_user)
	
	insert into ACTION_AGREEMENT (idm_reason,text_reason,date_reason,idm_action,idm_empl)		
		(select 4, '', GETDATE(), @idm_action, idm_empl 
		
		from ACTION_AUTOAGREEMENT
		where idm_empl not in (select idm_empl from ACTION_AGREEMENT where idm_action = @idm_action ))
	end

END