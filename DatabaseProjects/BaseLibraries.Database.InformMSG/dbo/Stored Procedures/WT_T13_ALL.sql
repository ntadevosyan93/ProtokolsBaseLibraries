CREATE PROCEDURE [dbo].[WT$T13_ALL]
	-- Add the parameters for the stored procedure here
	@estimated_start datetime,
	@estimated_stop datetime,
	@idm_empl int,
	@idm_doljn int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 

	
	select ABS(DATEDIFF(SECOND, actual_start, actual_stop))/3600 as hours_, idm_status, 
	
CASE break_time 
WHEN null THEN 	DATEDIFF(SECOND,estimated_start, estimated_stop)
ELSE DATEDIFF(SECOND,estimated_start, estimated_stop)-(break_time*60) 
END 
as normalrange,
	
	/*DATEDIFF(SECOND,estimated_start, actual_start) as startrange,
	DATEDIFF(SECOND,actual_stop, estimated_stop) as stoprange*/

	-- Обнуление секунд в запланированном времени
	DATEDIFF(SECOND, convert(datetime,convert(varchar(10) ,estimated_start,104)+' '+convert(varchar(5) ,estimated_start,108)+':00'), actual_start) as startrange,
	DATEDIFF(SECOND,actual_stop,  convert(datetime,convert(varchar(10) ,estimated_stop,104)+' '+convert(varchar(5) ,estimated_stop,108)+':00')) as stoprange,
	KAD$EMPLOYEE.wt_check_fact_only,
	KAD$WORK_TIME.* 
	from KAD$WORK_TIME 
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where
		estimated_start>=@estimated_start
	and cast(estimated_start as date) <= @estimated_stop
	
	
	and (KAD$WORK_TIME.idm_doljn = @idm_doljn or @idm_doljn=0)
	and estimated_start<cast(GETDATE() as date)
--	and estimated_stop<cast(GETDATE() as date)
	and (KAD$WORK_TIME.del=0)
	--and (freeDay=0 or freeDay is null)
	and (idm_empl = @idm_empl)
	order by estimated_start






END