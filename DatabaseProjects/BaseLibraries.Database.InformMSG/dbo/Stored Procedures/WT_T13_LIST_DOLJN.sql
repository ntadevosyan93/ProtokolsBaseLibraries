
CREATE PROCEDURE [dbo].[WT$T13_LIST_DOLJN]
	-- Add the parameters for the stored procedure here
	@idm_doljn int,
	@idm_partner int,
	@start_date datetime, 
	@end_date datetime	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

if (@idm_doljn>0) begin

IF ( @idm_partner = 0 ) 
  BEGIN 

   select idm_empl, fio_short, KAD$DOLJN.text as doljn, KAD$WORK_TIME.idm_doljn 
	from KAD$WORK_TIME 
	left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
	left join KAD$DOLJN on KAD$WORK_TIME.idm_doljn = KAD$DOLJN.id
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where 

	estimated_start>@start_date
	and cast(estimated_start as date) <= @end_date

	and KAD$WORK_TIME.del=0 
	and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null) 
	and (not KAD$EMPLOYEE.id is null)
	AND ( KAD$WORK_TIME.idm_doljn = @idm_doljn ) 
	and (not KAD$DOLJN.id = 87)
	group by idm_empl, KAD$WORK_TIME.idm_doljn, fio_short, KAD$DOLJN.text, KAD$WORK_TIME.idm_doljn 
	order by fio_short


  /*
      SELECT kad$employee.id as idm_empl, 
             fio_short, 
             kad$doljn.text AS doljn
      FROM   kad$employee            
             LEFT JOIN view$kad$employee  ON view$kad$employee.id = kad$employee.id 
             LEFT JOIN kad$doljn ON view$kad$employee.idm_doljn = kad$doljn.id 
      WHERE  ( kad$employee.del = 0 
                OR kad$employee.del IS NULL ) 
             AND ( NOT kad$employee.id IS NULL ) 
             AND ( kad$doljn.id = @idm_doljn ) 
      ORDER  BY fio_full 
*/

  END 
ELSE 
  BEGIN 

     select idm_empl, fio_short, KAD$DOLJN.text as doljn, KAD$WORK_TIME.idm_doljn 
	from KAD$WORK_TIME 
	left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
	left join KAD$DOLJN on KAD$WORK_TIME.idm_doljn = KAD$DOLJN.id
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where 

	estimated_start>@start_date
	and cast(estimated_start as date) <= @end_date

	and KAD$WORK_TIME.del=0 
	and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null) 
	and (not KAD$EMPLOYEE.id is null)
	AND ( KAD$WORK_TIME.idm_doljn = @idm_doljn ) 
	 AND ( KAD$EMPLOYEE.idm_org = @idm_partner ) 
	group by idm_empl, KAD$WORK_TIME.idm_doljn, fio_short, KAD$DOLJN.text, KAD$WORK_TIME.idm_doljn 
	order by fio_short
    /*        SELECT kad$employee.id as idm_empl, 
             fio_short, 
             kad$doljn.text AS doljn
      FROM   kad$employee            
             LEFT JOIN view$kad$employee  ON view$kad$employee.id = kad$employee.id 
             LEFT JOIN kad$doljn ON view$kad$employee.idm_doljn = kad$doljn.id 
      WHERE  ( kad$employee.del = 0 
                OR kad$employee.del IS NULL ) 
             AND ( NOT kad$employee.id IS NULL ) 
             AND ( kad$doljn.id = @idm_doljn ) 
             AND ( KAD$EMPLOYEE.idm_org = @idm_partner ) 
      ORDER  BY fio_full */
  END 
  
end else begin

IF ( @idm_partner = 0 ) 
  BEGIN 
     select idm_empl, fio_short, KAD$DOLJN.text as doljn, KAD$WORK_TIME.idm_doljn 
	from KAD$WORK_TIME 
	left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
	left join KAD$DOLJN on KAD$WORK_TIME.idm_doljn = KAD$DOLJN.id
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where 

	estimated_start>@start_date
	and cast(estimated_start as date) <= @end_date

	and KAD$WORK_TIME.del=0 
	and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null) 
	and (not KAD$EMPLOYEE.id is null)
		and (not KAD$DOLJN.id = 87)
	group by idm_empl, KAD$WORK_TIME.idm_doljn, fio_short, KAD$DOLJN.text, KAD$WORK_TIME.idm_doljn 
	order by fio_short
  END 
ELSE 
  BEGIN 
    select idm_empl, fio_short, KAD$DOLJN.text as doljn, KAD$WORK_TIME.idm_doljn 
	from KAD$WORK_TIME 
	left join View$KAD$EMPLOYEE on View$KAD$EMPLOYEE.id = idm_empl 
	left join KAD$DOLJN on KAD$WORK_TIME.idm_doljn = KAD$DOLJN.id
	left join KAD$EMPLOYEE on KAD$EMPLOYEE.id = idm_empl
	where 

	estimated_start>@start_date
	and cast(estimated_start as date) <= @end_date

	and KAD$WORK_TIME.del=0 
	and (KAD$EMPLOYEE.del = 0 or KAD$EMPLOYEE.del is null) 
	and (not KAD$EMPLOYEE.id is null) 
	AND ( KAD$EMPLOYEE.idm_org = @idm_partner ) 
		and (not KAD$DOLJN.id = 87)
	group by idm_empl, KAD$WORK_TIME.idm_doljn, fio_short, KAD$DOLJN.text, KAD$WORK_TIME.idm_doljn 
	order by fio_short
             
 
  END 

end




END