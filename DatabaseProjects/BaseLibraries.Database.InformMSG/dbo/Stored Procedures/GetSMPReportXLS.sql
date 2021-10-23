-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSMPReportXLS]
	-- Add the parameters for the stored procedure here
	 @datein datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
	SSMP$MAIN.id as _1, 
	convert(varchar, SSMP$MAIN.date_in , 104)as _2 ,
	
	convert(varchar, SSMP$MAIN.date_in , 8) as _3 ,
	convert(varchar, SSMP$MAIN.date_brigade_start , 8) as _4,
	SSMP$MAIN.fam + ' '+SSMP$MAIN.name+ ' '+SSMP$MAIN.otch as _5,
	YEAR(GETDATE()) - SSMP$MAIN.year as _6, 
	SSMP$MAIN.address as _7, 
		 CAST(
             CASE 
                  WHEN SSMP$MAIN.calling_fio is null or SSMP$MAIN.calling_fio = ''
                     THEN SSMP$MAIN.fam + ' '+SSMP$MAIN.name+ ' '+SSMP$MAIN.otch +' ('+SSMP$MAIN.phone_1+' )' 
                  ELSE SSMP$MAIN.calling_fio +' ('+SSMP$MAIN.phone_1+' )' 
             END AS varchar(200)) as _9, 
	SSMP$MAIN.symptoms as _8, 
	MKB10.text as _10,
	SSMP$MAIN.help as _11,
	SSMP$EMPLOYEE.fio as _12,
	 ('Врач: '+ DOCTOR.fio + '. Фельдшер: ' + FELDSHER.fio + '. Водитель: ' + DRIVER.fio) as _13,
	 convert(varchar, SSMP$MAIN.date_car_start , 8) as _14,
  convert(varchar, SSMP$MAIN.date_brigade_end , 8) as _15,
	 convert(varchar, ( SSMP$MAIN.date_brigade_end - SSMP$MAIN.date_in) , 8)as _16, 
	 convert(varchar, SSMP$MAIN.date_car_diff , 8) as _17,
	 convert(varchar, SSMP$MAIN.date_car_time_to_go , 8)  as _18 
	FROM SSMP$EMPLOYEE 
	RIGHT OUTER JOIN SSMP$TEAM ON SSMP$EMPLOYEE.id = SSMP$TEAM.idm_doctor 
	LEFT OUTER JOIN AVTO ON SSMP$TEAM.idm_avto = AVTO.id 
	RIGHT OUTER JOIN SSMP$MAIN ON SSMP$TEAM.id = SSMP$MAIN.idm_team 
	left join MKB10 on SSMP$MAIN.mkb10_id = MKB10.id
	left join SSMP$EMPLOYEE as DOCTOR on DOCTOR.id = SSMP$TEAM.idm_doctor
	left join SSMP$EMPLOYEE as FELDSHER on FELDSHER.id = SSMP$TEAM.idm_paramedic
	left join SSMP$EMPLOYEE as DRIVER on DRIVER.id = SSMP$TEAM.idm_driver

	WHERE (SSMP$MAIN.del <> 1) and cast (SSMP$MAIN.date_in as date) =  CAST(@datein as date)

	ORDER BY SSMP$MAIN.id 


END