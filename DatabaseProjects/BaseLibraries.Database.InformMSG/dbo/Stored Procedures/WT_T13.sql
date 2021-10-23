-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$T13]
	-- Add the parameters for the stored procedure here
	@estimated_start datetime,
	@estimated_stop datetime,
	@idm_empl int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select ABS(DATEDIFF(SECOND,actual_start, actual_stop))/3600 as hours_, idm_status, 
CASE break_time 
WHEN null THEN 	DATEDIFF(SECOND,estimated_start, estimated_stop)
ELSE DATEDIFF(SECOND,estimated_start, estimated_stop)-(break_time*60) 
END 
as normalrange,
	DATEDIFF(SECOND,estimated_start, actual_start) as startrange,
	DATEDIFF(SECOND,actual_stop, estimated_stop) as stoprange
	
	
	,
	* 
	from KAD$WORK_TIME 
	--left join KAD$EMPLOYEE on KAD$EMPLOYEE.id  = idm_empl
	--left join KAD$DOLJN on KAD$DOLJN.id = KAD$EMPLOYEE.idm_doljn
	where (not idm_status = 6)
	and (estimated_start>=@estimated_start and estimated_start<=@estimated_stop) and 
		(estimated_stop<=@estimated_stop)		
	and estimated_start<cast(GETDATE() as date)
	--and estimated_stop<cast(GETDATE() as date) 
	and (KAD$WORK_TIME.del=0)
	and (idm_empl = @idm_empl)
	--	and not(KAD$EMPLOYEE.idm_doljn = 87)
	order by estimated_start

END