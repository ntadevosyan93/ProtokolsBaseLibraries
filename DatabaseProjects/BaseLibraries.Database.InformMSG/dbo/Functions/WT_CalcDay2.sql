







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[WT_CalcDay2]
(	
	-- Add the parameters for the function here
	@estimated_start as datetime,
	@estimated_stop as datetime,
	@actual_start as datetime,
	@actual_stop as datetime,
	@status as int,
	@break_time as smallint,
	@idm_empl int,
	@first_checkIn as datetime
)
RETURNS @T table( workedHours float, WorkedMinutes int, day_weekend int ,day_work int, startrange int, stoprange int, break_time int)
AS																	 
BEGIN 
 

	 
	declare @hours int 
	declare @startrange int
	declare @stoprange int
	declare @normalrange int
	--declare @actual_start datetime
	--declare @actual_stop datetime
	--declare @first_checkIn datetime
	declare @wt_check_fact_only int
	declare @worked int 
	declare @day_weekend int
	declare @day_work int

	set @day_weekend = 0
	set @day_work = 0

	select   
	@hours=	ABS(DATEDIFF(SECOND,@actual_start, @actual_stop))/3600
 /*@normalrange = CASE break_time 
	WHEN null THEN 	DATEDIFF(SECOND,estimated_start, estimated_stop)
	ELSE DATEDIFF(SECOND,estimated_start, estimated_stop)-(break_time*60) 
	END ,	
@startrange =	DATEDIFF(SECOND,estimated_start, actual_start) ,
@stoprange =	DATEDIFF(SECOND,actual_stop, estimated_stop) ,*/

select
@normalrange = 
CASE 
 
 
	WHEN @break_time is null 
	THEN 	
	DATEDIFF(SECOND,convert(datetime,convert(varchar(10) ,@estimated_start,104)+' '+convert(varchar(5) ,@estimated_start,108)+':00'),
	  convert(datetime,convert(varchar(10) ,@estimated_stop,104)+' '+convert(varchar(5) ,@estimated_stop,108)+':00'))

	ELSE DATEDIFF(SECOND,convert(datetime,convert(varchar(10) ,@estimated_start,104)+' '+convert(varchar(5) ,@estimated_start,108)+':00'), @estimated_stop)-(@break_time*60) 
	END ,	
@startrange =	DATEDIFF(SECOND,convert(datetime,convert(varchar(10) ,@estimated_start,104)+' '+convert(varchar(5) ,@estimated_start,108)+':00'), @actual_start) ,
@stoprange =	DATEDIFF(SECOND,@actual_stop, convert(datetime,convert(varchar(10) ,@estimated_stop,104)+' '+convert(varchar(5) ,@estimated_stop,108)+':00')) 
 
----@first_checkIn = first_checkIn,
--@actual_start = @actual_start,
--@actual_stop = @actual_stop
 


	select @wt_check_fact_only = wt_check_fact_only from KAD$EMPLOYEE where id = @idm_empl

		set @worked = @normalrange

	if ( @hours is not null) begin		
		-- опоздание
		--если опоздал от 1 до 15 минут - время уменьшается на 15 минут
		if (@startrange > 60 and @startrange <= 15 * 60) begin
					set @worked-= 30 * 60
		end else  
		--если опоздал от 15 до 30 минут - время уменьшается на 30 минут
		if (@startrange >= 15 * 60 and @startrange <= 60 * 60) begin
					set @worked -= 60*60
		end else 
		--если больше часа - отнимается всё время 
		if (@startrange>60 * 60) begin
					set @worked -= @startrange
		end
		-- уход раньше
		if (@stoprange > 0 and @stoprange <= 15 * 60)
		begin
					set @worked -= 30 * 60;
		end
		else
		if (@stoprange >= 15 * 60 and @stoprange <= 60 * 60)
		begin
					set @worked -= 60 * 60;
		end
		else if (@stoprange > 60 * 60)
		begin
					set @worked -= @stoprange;
		end

	end else begin

		if (@wt_check_fact_only>0 and (not @actual_start is null or not @actual_stop is null or not @first_checkIn is null)) begin
			set @worked = @normalrange
		end else begin
			set @worked = 0
		end

	end

	if ( @status  = 1 ) begin
		set @day_work = 1
	end 
	if ( @status  = 6 ) begin
		set @day_weekend = 1
	end 

	
insert into @T 	select    
--потом сокращается до 30 минут в меньшую сторону
cast(case when @worked % 1800 = 0 then
@worked
else
 @worked - (@worked % 1800)
end as float) / 60 / 60 as workedHours,

cast(case when @worked % 1800 = 0 then
@worked
else
 @worked - (@worked % 30)
end as float) / 60  as WorkedMinutes
--dbo.wt_round_sec(@worked, 1800) / 60 / 60 as workedHours


, @day_weekend as day_weekend , @day_work as day_work
,@startrange
,@stoprange 
,@break_time

	return
END