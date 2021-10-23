-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetRepTasks]
	-- Add the parameters for the stored procedure here
	@idm_empl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   select id,date_in,tema,date_stop,status_t,autor,ispoln,
(case 
when (idm_isp=@idm_empl and idm_author!=@idm_empl and idm_kontrol!=@idm_empl) then 'Исполнитель'  
when (idm_isp!=@idm_empl and idm_author=@idm_empl and idm_kontrol!=@idm_empl) then 'Автор'  
when (idm_isp!=@idm_empl and idm_author!=@idm_empl and idm_kontrol=@idm_empl) then 'Контроль'  
when (idm_isp=@idm_empl and idm_author=@idm_empl and idm_kontrol!=@idm_empl) then 'Исполнитель+автор'  
when (idm_isp=@idm_empl and idm_author=@idm_empl and idm_kontrol=@idm_empl) then 'Исполнитель+автор+контроль'  
when (idm_isp=@idm_empl and idm_author!=@idm_empl and idm_kontrol=@idm_empl) then 'Исполнитель+контроль'  
when (idm_isp!=@idm_empl and idm_author=@idm_empl and idm_kontrol=@idm_empl) then 'Автор+контроль' 
end) as type
from View$RD$TASK with (nolock)  where (idm_isp=@idm_empl or idm_author=@idm_empl or idm_kontrol=@idm_empl) and del=0  
and ([status]!=3 and  [status]!=6)
union 
select a.id,a.date_in,tema,date_stop,status_t,autor,ispoln,'Соисполнитель ('+klass_value+')'
 from View$RD$TASK a with (nolock) 
 left join RD$TASK_EML  with (nolock) on RD$TASK_EML.idm_empl=@idm_empl and RD$TASK_EML.idm_task=a.id
 left join KLASS  with (nolock) on KLASS.klass_id = RD$TASK_EML.status and klass_name='rd_task_status'
where a.id in
 (select RD$TASK_EML.idm_task from RD$TASK_EML  with (nolock) where RD$TASK_EML.idm_empl=@idm_empl and RD$TASK_EML.del=0)	
 and (a.[status]!=3 and  a.[status]!=6)

order by date_stop 
END