CREATE PROCEDURE [dbo].[WT$T13_LIST_SORT]
	-- Add the parameters for the stored procedure here
	@login_ad varchar(50),
	@start_date datetime, 
	@end_date datetime	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select KAD$WORK_TIME.idm_empl, fio_short, KAD$DOLJN.text as doljn , number, KAD$WORK_TIME.idm_doljn 
	from KAD$WORK_TIME 
	left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
	left join KAD$DOLJN on KAD$WORK_TIME.idm_doljn = KAD$DOLJN.id
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	left join KAD$WORK_TIME_SORTEMPL on KAD$WORK_TIME_SORTEMPL.idm_curator = (select id from KAD$EMPLOYEE where login_ad=@login_ad) and 
KAD$WORK_TIME_SORTEMPL.idm_empl = KAD$WORK_TIME.idm_empl
	where 
	estimated_start>@start_date
	and cast(estimated_start as date) <= @end_date
	and KAD$WORK_TIME.del=0 
	and KAD$WORK_TIME.idm_empl in (select idm_empl from KAD$WORK_TIME_CURATORS where idm_curator  =  (select id from KAD$EMPLOYEE where login_ad=@login_ad)) 
	and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null)
	and (KAD$EMPLOYEE.actual = 1 or KAD$EMPLOYEE.actual is null)
	and (not KAD$EMPLOYEE.id is null)
	and (not KAD$DOLJN.id = 87)
	group by KAD$WORK_TIME.idm_empl, KAD$WORK_TIME.idm_doljn, fio_short, KAD$DOLJN.text,number, KAD$WORK_TIME.idm_doljn 
	order by number, fio_short
/*select KAD$WORK_TIME_CURATORS.idm_empl, fio_short, KAD$DOLJN.text as doljn, number
from KAD$WORK_TIME_CURATORS 
left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
left join KAD$DOLJN on View$KAD$EMPLOYEE.idm_doljn = KAD$DOLJN.id
left join KAD$WORK_TIME_SORTEMPL on KAD$WORK_TIME_SORTEMPL.idm_curator = KAD$WORK_TIME_CURATORS.idm_curator and 
KAD$WORK_TIME_SORTEMPL.idm_empl = KAD$WORK_TIME_CURATORS.idm_empl
where
KAD$WORK_TIME_CURATORS.idm_curator  =  (select id from KAD$EMPLOYEE where login_ad=@login_ad) 
and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null)
and (KAD$EMPLOYEE.actual = 1 or KAD$EMPLOYEE.actual is null)
and (not KAD$EMPLOYEE.id is null)
and (not KAD$DOLJN.id = 87)
order by number, fio_full*/

END