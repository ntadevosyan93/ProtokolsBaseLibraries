-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$T13_VD]
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
	
		DATEDIFF(SECOND,estimated_start, estimated_stop) as normalrange,
	DATEDIFF(SECOND,estimated_start, actual_start) as startrange,
	DATEDIFF(SECOND,actual_stop, estimated_stop) as stoprange
	
	
	,
	* 
	from KAD$WORK_TIME 
	where
	(estimated_start>=@estimated_start and estimated_start<=@estimated_stop) and 
		(estimated_stop<=@estimated_stop)
	
	
	and (not idm_status = 1)
	and estimated_start<cast(GETDATE() as date)
	and estimated_stop<cast(GETDATE() as date)
	and (del=0)
	and (idm_empl = @idm_empl)
	order by estimated_start



END