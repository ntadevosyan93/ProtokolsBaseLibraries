-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[f_GetWT_WorkedHour]
(
	-- @estimated_stop datetime,
	 --@estimated_start datetime,
	 @hours_ int,
	 @normalrange int,
	 @startrange int,
	 @stoprange int,
	 @wt_check_fact_only int,
	 @actual_start datetime,
	 @actual_stop datetime,
	 @first_checkIn datetime,
	 @seconds_ int
	-- @idm_status int
)
RETURNS  float
AS
BEGIN
	-- Declare the return variable here
	declare @workedHour_H float
	declare @workedHour float
	declare @countHourTemp float 
	                                        
	if(@wt_check_fact_only>0 
			and (@actual_start is not null or @actual_stop is not null or @first_checkIn is not null)) begin
		set @stoprange = 0;
		set @startrange = 0;
		set @normalrange=@seconds_
	end
		
	set @workedHour = @normalrange;

	if(@hours_ !='') begin
		--ОПОЗДАНИЕ
		if ((@startrange > 60) and @startrange <= (15 * 60))
			set @workedHour = @workedHour - (30 * 60);
         else
			if (@startrange >= (15 * 60)  and @startrange <= (60 * 60))
				set @workedHour = @workedHour -(60 * 60);
			else if (@startrange > 60 * 60)
					set @workedHour =  @workedHour - @startrange;
			
		--УХОД РАНЬШЕ
		if (@stoprange > 0 and @stoprange <= 15 * 60) 
		    set @workedHour =   @workedHour -(30 * 60);
        else
			 if (@stoprange >= 15 * 60 and @stoprange <= 60 * 60)
                 set @workedHour =  @workedHour -(60 * 60);
			 else if (@stoprange > 60 * 60)
				 set @workedHour =  @workedHour -@stoprange;

		--set @countHourTemp += @workedHour;
	end
	else begin
		if(@wt_check_fact_only<=0 and (@actual_start is null or @actual_stop is null or @first_checkIn is null))
			set @workedHour = 0;
	end

	/* if (@idm_status = 1) begin 
		set @countWorkDayNormal+=1
		set @countHourNormal += @countHourTemp;
	 end
	 else if (@idm_status = 6) begin 
				set @offsetV = 2;
				set @countWorkDayWeekend+=1
                set @countHourWeekend += @countHourTemp;
	 end */
	 declare @RoundSec float ;


	/* if((cast(@hours_ as int) %1800)=0) 
		set @RoundSec = @hours_;
	else 
		set @RoundSec = @hours_-(cast(@hours_ as int)%1800)

	  set @workedHour_H = @RoundSec/60/60;

	   if((cast(@normalrange as int) %1800)=0) 
		set @RoundSec = @normalrange;
	else 
		set @RoundSec = @normalrange-(cast(@normalrange as int)%1800)

	  set @normalrange = @RoundSec/60/60; */

	   if((cast(@workedHour as int) % 1800)=0) 
		set @RoundSec = @workedHour;
	else 
		set @RoundSec = @workedHour-(cast(@workedHour as int)%1800)

	  set @workedHour_H = @RoundSec/60/60;
	 
	-- Return the result of the function
	--if(cast(@workedHour_H as float) > cast(@normalrange as float)) 
	--	set @workedHour_H = @normalrange

	RETURN @workedHour_H

END