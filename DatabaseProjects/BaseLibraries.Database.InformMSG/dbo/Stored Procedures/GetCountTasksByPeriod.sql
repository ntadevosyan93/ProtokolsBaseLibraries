-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.GetCountTasksByPeriod
	-- Add the parameters for the stored procedure here
	@idm_user int,
 @d_start datetime, @d_end datetime 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select convert(varchar(10),@d_start,104) as 'С', convert(varchar(10),@d_end,104) as 'По',
 (SELECT  count (id)   from View$RD$TASK  with (nolock) 
		where View$RD$TASK.del=0 --and status<>3 and status<>6 
		and
		( View$RD$TASK.idm_author=@idm_user 
		or View$RD$TASK.idm_author in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL with (nolock)  where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user) )
	and date_in between cast(@d_start as date) and cast( dateadd(dd,1,@d_end) as date))as  'Автор'
	,(SELECT  count (id)   from View$RD$TASK  with (nolock) 
		where View$RD$TASK.del=0 
		and
		(View$RD$TASK.idm_kontrol=@idm_user 
		or View$RD$TASK.idm_kontrol in (select RD$TASK_EMPL_TO_EMPL.idm_empl_link from RD$TASK_EMPL_TO_EMPL  with (nolock) where RD$TASK_EMPL_TO_EMPL.idm_empl=@idm_user))
	and date_in between cast(@d_start as date) and cast( dateadd(dd,1,@d_end) as date)) as 'Контроль'
	 ,(SELECT  count (id)   from View$RD$TASK  with (nolock) 
		where View$RD$TASK.del=0 
		and
		(View$RD$TASK.idm_isp=@idm_user 		
		or View$RD$TASK.id in (select RD$TASK_EML.idm_task from RD$TASK_EML  with (nolock) where RD$TASK_EML.idm_empl=@idm_user and RD$TASK_EML.del=0))
		and date_in between cast(@d_start as date) and cast( dateadd(dd,1,@d_end) as date)) as 'Соисполнитель/исполнитель'
END