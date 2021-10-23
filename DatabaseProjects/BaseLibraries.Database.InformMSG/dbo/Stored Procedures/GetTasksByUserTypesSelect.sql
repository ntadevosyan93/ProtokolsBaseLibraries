CREATE PROCEDURE [dbo].[GetTasksByUserTypesSelect]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50), @type int
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
if @type=0
begin
	SELECT * from View$RD$TASK  with (nolock) 
		where View$RD$TASK.del=0 and status<>3 and status<>6 
		and
		( View$RD$TASK.idm_author=@idm_user 
		or View$RD$TASK.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL with (nolock)  where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) )
		order by date_in desc
end
else if @type=1
begin
	SELECT * from View$RD$TASK  with (nolock) 
		where View$RD$TASK.del=0 and status<>3 and status<>6 
		and
		( View$RD$TASK.idm_kontrol=@idm_user 
		or View$RD$TASK.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) )
		order by date_in desc
end else if @type=2
begin
	SELECT * from View$RD$TASK  with (nolock) 
		where View$RD$TASK.del=0 and status<>3 and status<>6 
		and
		(
		 View$RD$TASK.idm_isp=@idm_user 
		or View$RD$TASK.idm_isp in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.id in (select RD$TASK_EML.idm_task from RD$TASK_EML  with (nolock) where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0)		
		)
		order by date_in desc
end 

END