-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Clinic23Staff_WT]
	@guid varchar(50)--,
	--@date_start varchar(50),
	--@date_stop varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   
	SELECT 
		CONVERT(varchar, CAST([estimated_start] as date), 104) as EStartDate,
		CONVERT(VARCHAR(10),[estimated_start], 104) + ' ' + CONVERT(VARCHAR(8), [estimated_start], 108) as [estimated_start],
		CONVERT(VARCHAR(10),[estimated_stop], 104) + ' ' + CONVERT(VARCHAR(8), [estimated_stop], 108) as [estimated_stop],
		CONVERT(VARCHAR(10),[actual_start], 104) + ' ' + CONVERT(VARCHAR(8), [actual_start], 108) as [actual_start],
		CONVERT(VARCHAR(10),[actual_stop], 104) + ' ' + CONVERT(VARCHAR(8), [actual_stop], 108) as [actual_stop], 
		klass_value as status, 
		klass_id as status_int,
		ABS(DATEDIFF(SECOND,actual_start, actual_stop))/3600 as hours_, 
		CASE break_time 
			WHEN null THEN 	DATEDIFF(SECOND, estimated_start, estimated_stop)
			ELSE DATEDIFF(SECOND, estimated_start, estimated_stop) - (break_time*60) 
			END as normalrange,
		DATEDIFF(SECOND, estimated_start, actual_start) as startrange,
		DATEDIFF(SECOND, actual_stop, estimated_stop) as stoprange,
		k.wt_check_fact_only,
		first_checkIn
	FROM [KAD$WORK_TIME] with (nolock)
		left join KLASS with (nolock) on klass_id = idm_status and klass_name='wt_status'
		left join KAD$EMPLOYEE k with (nolock) on k.id =  idm_empl
	where k.guid_web = @guid                  
		and ([estimated_start] >= GETDATE()-60 and [estimated_start]<=GETDATE()+60  ) 
		and (not estimated_start is null and not estimated_stop is null)
		and ([KAD$WORK_TIME].del=0 or [KAD$WORK_TIME].del is null)
	order by [KAD$WORK_TIME].[estimated_start]


END


-- Debug
/*
EXEC	[dbo].[Clinic23Staff_WT]
		N'2D86FE97-522E-40CC-8A26-94AF62818D1D'
*/