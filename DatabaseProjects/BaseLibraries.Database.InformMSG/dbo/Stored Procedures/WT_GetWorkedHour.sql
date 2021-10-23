-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.WT$GetWorkedHour
	-- Add the parameters for the stored procedure here
	@month int,
	@idm_empl int,
	@year int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  select idm_empl, fio_short, KAD$DOLJN.text as doljn, KAD$WORK_TIME.idm_doljn,
(select  count(id) from KAD$WORK_TIME b where b.idm_empl=@idm_empl 
			and Month(b.estimated_start)=@month and year(b.estimated_start) =@year
			and b.del=0 and b.idm_status in(1,6) and b.idm_doljn = KAD$WORK_TIME.idm_doljn 
		    and (b.actual_start is not null and actual_stop is not null)) as count_ws
	,(select 
	sum(dbo.f_GetWT_WorkedHour(
	(ABS(DATEDIFF(SECOND,actual_start, actual_stop))/3600),
CASE break_time 
WHEN null THEN 	DATEDIFF(SECOND,estimated_start, estimated_stop)
ELSE DATEDIFF(SECOND,estimated_start, estimated_stop)-(break_time*60) 
END,
	DATEDIFF(SECOND,estimated_start, actual_start),
	DATEDIFF(SECOND,actual_stop, estimated_stop),
	null,
	actual_start,
	actual_stop,
	first_checkIn,
	DATEDIFF(SECOND,estimated_stop,estimated_start))) from KAD$WORK_TIME c
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where  (c.idm_doljn = KAD$WORK_TIME.idm_doljn or c.idm_doljn=0)
	and c.estimated_start<cast(GETDATE() as date)
	and Month(estimated_start)=@month and year(estimated_start) =@year
	and (c.del=0)
	and (c.idm_empl = @idm_empl) and c.idm_status in(1,6)) as count_h
	from KAD$WORK_TIME 
	left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
	left join KAD$DOLJN on KAD$WORK_TIME.idm_doljn = KAD$DOLJN.id
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where 
	 Month(estimated_start)=@month and year(estimated_start) =@year
	and KAD$WORK_TIME.del=0 
	and idm_empl = @idm_empl
	and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null)
	and (KAD$EMPLOYEE.actual = 1 or KAD$EMPLOYEE.actual is null)
	and (not KAD$EMPLOYEE.id is null)
	and (not KAD$DOLJN.id = 87)
	group by idm_empl, KAD$WORK_TIME.idm_doljn, fio_short, KAD$DOLJN.text, KAD$WORK_TIME.idm_doljn,KAD$EMPLOYEE.wt_check_fact_only
	order by fio_short
END