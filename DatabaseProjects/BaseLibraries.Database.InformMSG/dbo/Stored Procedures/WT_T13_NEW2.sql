





CREATE PROCEDURE [dbo].[WT$T13_NEW2]
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

	D.*,D2.*,
	idm_status, wt.id kwt_id,
	estimated_start, wt.break_time


	from KAD$WORK_TIME wt with(nolock) 
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	cross apply (
	select top(1) * from dbo.WT_CalcDay2(	
	-- Add the parameters for the function here
	estimated_start,
	estimated_stop  ,
	actual_start  ,
	actual_stop  ,
	idm_status  ,
	break_time  ,
	idm_empl ,
	first_checkIn 
	)) D
	 cross apply (
	select top 1 *
	From dbo.WT_CalcDayNight(
		case when actual_start is null then null else estimated_start end,
		case when actual_stop is null then null else estimated_stop end
	)
	)D2
	where

	estimated_start>=@estimated_start
	and cast(estimated_start as date) <= @estimated_stop
	and estimated_start<cast(GETDATE() as date)
	and (wt.del=0)
	and (idm_empl = @idm_empl)
	and (idm_depart = @idm_depart  or @idm_depart=0 or @idm_depart is null)
	and (wt.idm_doljn = @idm_doljn or @idm_doljn=0 or @idm_doljn is null)

	order by estimated_start

END