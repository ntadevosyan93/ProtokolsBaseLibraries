-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTasksByUserFromDate]
	-- Add the parameters for the stored procedure here
	 @user_name varchar(50),
	 @all int,
	 @date_start datetime,
	 @date_end datetime
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
if @all=0
begin
	SELECT * from View$RD$TASK  with (nolock) 
		where 
		View$RD$TASK.del=0 
		and 
		
		
	--	((status<>3 and status<>6) or () )
	
		
		( (status<>3 and status<>6) 
		
		or
		
		((status=3 or status = 6) and 
		
				(select COUNT(RD$TASK_FIRST_VIEW.id) 
				from RD$TASK_FIRST_VIEW  with (nolock) 
				where RD$TASK_FIRST_VIEW.idm_empl=@idm_user and RD$TASK_FIRST_VIEW.idm_task=View$RD$TASK.id )=0	
				
				and
				
				View$RD$TASK.date_in>'18.01.2016 00:00'
				
		)	 
		
		)
		
		and 
		(View$RD$TASK.idm_author=@idm_user 
		or View$RD$TASK.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_isp in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_kontrol=@idm_user
		or View$RD$TASK.idm_isp=@idm_user
		or View$RD$TASK.user_in=@user_name
		or View$RD$TASK.id in (select RD$TASK_EML.idm_task from RD$TASK_EML  with (nolock) where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0)
		)
		and View$RD$TASK.date_in between @date_start and @date_end
		
		 order by date_in desc
end
else 
begin
SELECT * from View$RD$TASK  with (nolock) 
		where 
		View$RD$TASK.del=0 and
		(View$RD$TASK.idm_author=@idm_user 
		or View$RD$TASK.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_isp in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) 
		or View$RD$TASK.idm_kontrol=@idm_user
		or View$RD$TASK.idm_isp=@idm_user
		or View$RD$TASK.user_in=@user_name 
		or View$RD$TASK.id in (select RD$TASK_EML.idm_task from RD$TASK_EML  with (nolock) where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0)
		)
		and View$RD$TASK.date_in between @date_start and @date_end
		 order by date_in desc
end

END