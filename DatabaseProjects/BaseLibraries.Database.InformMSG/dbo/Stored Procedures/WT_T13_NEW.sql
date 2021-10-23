CREATE PROCEDURE [dbo].[WT$T13_NEW]
	-- Add the parameters for the stored procedure here
	@estimated_start datetime,
	@estimated_stop datetime,
	@idm_empl int,
	@idm_depart   int  = NULL,
	@idm_doljn  int  = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



select 

	(select top(1) workedHours from dbo.WT_CalcDay(KAD$WORK_TIME.id)) as workedHours,
	(select top(1) day_weekend from dbo.WT_CalcDay(KAD$WORK_TIME.id)) as day_weekend,
	(select top(1) day_work from dbo.WT_CalcDay(KAD$WORK_TIME.id)) as day_work,
	idm_status,
	estimated_start


	from KAD$WORK_TIME 
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where

	estimated_start>=@estimated_start
	and cast(estimated_start as date) <= @estimated_stop
	and estimated_start<cast(GETDATE() as date)
	and (KAD$WORK_TIME.del=0)
	and (idm_empl = @idm_empl)
	and (idm_depart = @idm_depart  or @idm_depart=0 or @idm_depart is null)
	and (KAD$WORK_TIME.idm_doljn = @idm_doljn or @idm_doljn=0 or @idm_doljn is null)

	order by estimated_start


END