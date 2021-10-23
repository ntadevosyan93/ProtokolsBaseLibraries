-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$AddRecordFrom1C]
	-- Add the parameters for the stored procedure here
@1c_time_start time, 
@1c_time_stop time, 
@1c_date datetime, 
@1c_idm_bolid int, 
@1c_idm_depart int
AS
BEGIN
	/****** Сценарий для команды SelectTopNRows среды SSMS  ******/
/*
set @1c_time_start='10:00'
set @1c_time_stop='19:00'
set @1c_date='26.07.2017'
set @1c_idm_bolid=194
set @1c_idm_depart=6
*/

declare @idm_empl int
declare @e_start datetime
declare @e_stop datetime
declare @dt datetime
declare @idm_depart int

select top(1) @idm_empl=id from KAD$EMPLOYEE where idm_bolid=@1c_idm_bolid order by id

if @idm_empl>0
begin
	select @idm_depart=id from DEPARTMENTS where idm_1c=@1c_idm_depart
	set @e_start=@1c_date+@1c_time_start
	set @e_stop=@1c_date+@1c_time_stop
	print @e_start
	print @1c_date 
	print @1c_time_start
	

	declare @cc int
	select @cc=COUNT(*) from KAD$WORK_TIME 
	where (KAD$WORK_TIME.estimated_start>=@1c_date and KAD$WORK_TIME.estimated_start<DATEADD(d,1,@1c_date)) 
		and KAD$WORK_TIME.idm_empl=@idm_empl and del=0
		print @cc
	if @cc=0
		insert into KAD$WORK_TIME(idm_empl,estimated_start,estimated_stop,idm_depart,idm_status,from_1c) values (@idm_empl,@e_start,@e_stop,@idm_depart,1,1)
	else 	
		update KAD$WORK_TIME set estimated_start=@e_start, estimated_stop=@e_stop, idm_depart=@idm_depart where (KAD$WORK_TIME.estimated_start>=@1c_date and KAD$WORK_TIME.estimated_start<DATEADD(d,1,@1c_date)) and idm_empl=@idm_empl and idm_depart=@idm_depart
end


END