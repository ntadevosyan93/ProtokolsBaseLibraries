CREATE PROCEDURE [dbo].[WT$T13_LIST]
	-- Add the parameters for the stored procedure here
	@login_ad varchar(50),
	@start_date datetime, 
	@end_date datetime	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select idm_empl, fio_short, KAD$DOLJN.text as doljn, KAD$WORK_TIME.idm_doljn 
	from KAD$WORK_TIME 
	left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
	left join KAD$DOLJN on KAD$WORK_TIME.idm_doljn = KAD$DOLJN.id
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where 
	estimated_start>@start_date
	and cast(estimated_start as date) <= @end_date
	and KAD$WORK_TIME.del=0 
	and idm_empl in (select idm_empl from KAD$WORK_TIME_CURATORS where idm_curator  =  (select id from KAD$EMPLOYEE where login_ad=@login_ad)) 
	and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null)
	--and (KAD$EMPLOYEE.actual = 1 or KAD$EMPLOYEE.actual is null)
	and (not KAD$EMPLOYEE.id is null)
	and (not KAD$DOLJN.id = 87)
	group by idm_empl, KAD$WORK_TIME.idm_doljn, fio_short, KAD$DOLJN.text, KAD$WORK_TIME.idm_doljn 
	order by fio_short
	--(select id from KAD$EMPLOYEE where login_ad=@login_ad)
/*
select idm_empl, fio_short, KAD$DOLJN.text as doljn
from KAD$WORK_TIME_CURATORS 
left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
left join KAD$DOLJN on View$KAD$EMPLOYEE.idm_doljn = KAD$DOLJN.id
where
idm_curator  =  (select id from KAD$EMPLOYEE where login_ad=@login_ad) 
and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null)
and (KAD$EMPLOYEE.actual = 1 or KAD$EMPLOYEE.actual is null)
and (not KAD$EMPLOYEE.id is null)
and (not KAD$DOLJN.id = 87)
order by fio_full*/

END