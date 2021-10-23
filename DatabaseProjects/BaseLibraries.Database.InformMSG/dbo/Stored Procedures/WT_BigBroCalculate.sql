-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE WT$BigBroCalculate
	@tab fromBolid readonly
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;




SELECT T.timeval, T.idm_empl, T.idm_depart, T.fam, T.name, /*
cast(DATEADD( day,-1, [TimeVal])as date) as DATE_MINUS,
cast(DATEADD( day, 0, [TimeVal])as date) as DATE_ZERO,
cast(DATEADD( day, 1, [TimeVal])as date) as DATE_PLUS,*/

--/////////////////////////////////////////////////////////////////////////////
  (SELECT top(1) estimated_start
   FROM KAD$WORK_TIME with (NOLOCK)
   WHERE estimated_start BETWEEN cast(DATEADD(DAY,-1, [TimeVal])AS date) AND cast(DATEADD(DAY,0, [TimeVal])AS date)
     AND idm_empl=T.idm_empl
     AND idm_depart=T.idm_depart
     AND del=0 ) AS estimated_start_last,

  (SELECT top(1) estimated_start
   FROM KAD$WORK_TIME with (NOLOCK)
   WHERE estimated_start BETWEEN cast(DATEADD(DAY,0, [TimeVal])AS date) AND cast(DATEADD(DAY,1, [TimeVal])AS date)
     AND idm_empl=T.idm_empl
     AND idm_depart=T.idm_depart
     AND del=0 ) AS estimated_start_current,

  (SELECT top(1) estimated_start
   FROM KAD$WORK_TIME with (NOLOCK)
   WHERE estimated_start BETWEEN cast(DATEADD(DAY,1, [TimeVal])AS date) AND cast(DATEADD(DAY,2, [TimeVal])AS date)
     AND idm_empl=T.idm_empl
     AND idm_depart=T.idm_depart
     AND del=0 )AS estimated_start_future,

  (SELECT top(1) estimated_stop
   FROM KAD$WORK_TIME with (NOLOCK)
   WHERE estimated_stop BETWEEN cast(DATEADD(DAY,-1, [TimeVal])AS date) AND cast(DATEADD(DAY,0, [TimeVal])AS date)
     AND idm_empl=T.idm_empl
     AND idm_depart=T.idm_depart
     AND del=0 ) AS estimated_stop_last,

  (SELECT top(1) estimated_stop
   FROM KAD$WORK_TIME with (NOLOCK)
   WHERE estimated_stop BETWEEN cast(DATEADD(DAY,0, [TimeVal])AS date) AND cast(DATEADD(DAY,1, [TimeVal])AS date)
     AND idm_empl=T.idm_empl
     AND idm_depart=T.idm_depart
     AND del=0 ) AS estimated_stop_current,

  (SELECT top(1) estimated_stop
   FROM KAD$WORK_TIME with (NOLOCK)
   WHERE estimated_stop BETWEEN cast(DATEADD(DAY,1, [TimeVal])AS date) AND cast(DATEADD(DAY,2, [TimeVal])AS date)
     AND idm_empl=T.idm_empl
     AND idm_depart=T.idm_depart
     AND del=0 )AS estimated_stop_future
     
     
     
FROM
  (SELECT T.doorindex,
          T.hozorgan,
          T.timeval,
          KAD$WORK_TIME_DEPART_BOLID.idm_depart,
          KAD$EMPLOYEE.id as idm_empl,
          KAD$EMPLOYEE.fam,
          KAD$EMPLOYEE.name
   FROM @tab   AS T 
   LEFT JOIN KAD$EMPLOYEE ON KAD$EMPLOYEE.idm_bolid=hozorgan
   LEFT JOIN KAD$WORK_TIME_DEPART_BOLID ON KAD$WORK_TIME_DEPART_BOLID.idm_bolid = doorindex
   WHERE NOT KAD$EMPLOYEE.id IS NULL
     AND KAD$EMPLOYEE.realId IS NULL
     AND KAD$EMPLOYEE.del=0
     AND KAD$EMPLOYEE.actual=1 
     -- AND KAD$EMPLOYEE.id=37 
     ) AS T
ORDER BY T.timeval-- desc
     
END