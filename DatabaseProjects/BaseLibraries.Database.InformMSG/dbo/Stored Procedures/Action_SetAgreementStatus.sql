CREATE PROCEDURE [dbo].[Action_SetAgreementStatus]

@user_in varchar(50),
@idm_action int,
@status int,
@comment varchar(max)

AS
BEGIN

SET NOCOUNT ON;

set @user_in = ltrim(rtrim(@user_in))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)

declare @last_agree_id int

select top(1) @last_agree_id = id from ACTION_AGREEMENT  with (nolock) where idm_empl=@idm_user and idm_action=@idm_action order by id desc

UPDATE ACTION_AGREEMENT SET idm_reason = @status, text_reason = @comment, date_reason = GETDATE() where id = @last_agree_id

END