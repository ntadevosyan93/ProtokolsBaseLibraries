



















CREATE PROCEDURE [dbo].[WT$T13_NEW3]
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
 
	case when  (actual_start is not null and actual_stop is not null ) or idm_status = 16 then D.workedHours else 0 end workedHours, 
	  D.WorkedMinutes, 
	  D.day_weekend,
	   D.day_work,    D.startrange,  D.stoprange,   D.break_time,
	case when (actual_start is null or actual_stop is  null ) and idm_status != 16  then null else D2.night end night,
	case when (actual_start is null or actual_stop is  null ) and idm_status != 16 then null else
	

	case when D2.night=0 then D.WorkedMinutes else D2.dy end
	
	
	end dy, 
	case when idm_status=16 then 1 else idm_status end idm_status,
	
	 wt.id kwt_id,
	estimated_start, wt.break_time, idm_depart


	from KAD$WORK_TIME wt with(nolock) 
	left join KAD$EMPLOYEE ke on ke.id = idm_empl
	cross apply (
	select top(1) * from dbo.WT_CalcDay3(	
	-- Add the parameters for the function here
	estimated_start,
	estimated_stop  ,
	case when wt.idm_status=16 then estimated_start else actual_start end  ,
	case when wt.idm_status=16 then estimated_stop else actual_stop end  ,
	case when idm_status=16 then 1 else idm_status end  ,  
	break_time  ,
	idm_empl ,
	first_checkIn 
	)) D
	 cross apply (
	select top 1 night, dy
	From dbo.WT_CalcDayNight(
	case when actual_start is null  then 
		case when idm_status=16 then estimated_start else null end
		 else case when estimated_start > actual_start then estimated_start else actual_start end end,


		case when actual_stop is null  then 
		case when idm_status=16 then estimated_stop else null end
		 else case when estimated_stop < actual_stop then estimated_stop else actual_stop end end
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
	--and actual_start is not null and actual_stop is not null
	order by estimated_start

END