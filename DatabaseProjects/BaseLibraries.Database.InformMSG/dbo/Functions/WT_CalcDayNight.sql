




CREATE FUNCTION [dbo].[WT_CalcDayNight]
(	
	-- Add the parameters for the function here

 	@estimated_start as datetime,
	@estimated_stop as datetime
)
RETURNS @T table( night int, dy int)
AS																	 
BEGIN 
declare @step datetime
--select @start_date, @end_date
 set @step = @estimated_start

 ;with dates(st, en) as 
 (
 select  @step,
     case 
 when datepart(hour, @step) < 22 and datepart(hour,@step)> 6 then
 case when dateadd(Hour, 22, cast(cast(@step as date) as datetime)  ) >= @estimated_stop
 then @estimated_stop else
dateadd(Hour, 22, cast(cast(@step as date) as datetime)  )
end
when  datepart(hour,@step)< 6 then
dateadd(Hour, 6, cast(cast(@step as date) as datetime)  )

when  datepart(hour,@step)> 22 then
dateadd(day,1, dateadd(Hour, 6, cast(cast(@step as date) as datetime)  ) )
 else @estimated_stop end en

 union all 
 select en st,  
 case 

 when datepart(hour, en) < 22 and datepart(hour,en)> 6 then
 case when dateadd(Hour, 22, cast(cast(en as date) as datetime)  ) >= @estimated_stop
 then @estimated_stop else
dateadd(Hour, 22, cast(cast(@step as date) as datetime)  )
end

when  datepart(hour,en)< 6 then
dateadd(Hour, 6, cast(cast(en as date) as datetime)  )

when  datepart(hour,en)>= 22 then
case when @estimated_stop < dateadd(day,1, dateadd(Hour, 6, cast(cast(en as date) as smalldatetime)  ) )
then @estimated_stop else
dateadd(day,1, dateadd(Hour, 6, cast(cast(en as date) as smalldatetime)  ) )
end
 else @estimated_stop end en
 from dates 
 where en < @estimated_stop

 

 ), Hrs (st,en,tp,dif) as (

  select st,en,  
  case when datepart(hour,st) >= 6 and datepart(hour,st) <22   then 1 
  when datepart(hour,st) >= 22 or datepart(hour,st) < 6   then 0 
  else 1 end  [d]
  ,   datediff(mi,st,en)    dif
 
 From dates 
 --group by case when datepart(hour,st) = 6 or datepart(hour,en) =22  then 1 else 0 end
 )
 
 insert into @T 
 select isnull(sum(case when tp=0 then dif else 0 end),0) night, isnull(sum(case when tp=1 then dif else 0 end) ,0) dy

 From Hrs
	
 

 return
END