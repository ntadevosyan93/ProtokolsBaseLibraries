-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$BigBroCalculateSingleRecord3]
	@TimeVal datetime,
	@HozOrgan int,
	@DoorIndex int,
	@Numcom int 
AS
BEGIN
	SET NOCOUNT ON;

	/*
	Проверим на 303 кабинет, открыт или нет
	*/

	if (@DoorIndex = 194 and CAST( @TimeVal as date) = CAST( GETDATE() as date) ) begin

		if not exists (
		select id from SMS_MAIN with (nolock) where
phone_to in ('79180926732', '79183776001', '79282562660', '79384834089', '79182694663', '79604823400', '79182334555') 
and date_in > CAST( GETDATE() as date) and text like '303 открыт'
		 ) begin
		 insert into SMS_MAIN (phone_to, text, pushOnly, module, date_sending, status, priority)
 (	  select '79180926732', '303 открыт', 1, '303 Info', GETDATE(), 0, 15
union select '79183776001', '303 открыт', 1, '303 Info', GETDATE(), 0, 15
union select '79282562660', '303 открыт', 1, '303 Info', GETDATE(), 0, 15
union select '79384834089', '303 открыт', 1, '303 Info', GETDATE(), 0, 15
union select '79182694663', '303 открыт', 1, '303 Info', GETDATE(), 0, 15
union select '79182334555', '303 открыт', 1, '303 Info', GETDATE(), 0, 15
union select '79604823400', '303 открыт', 1, '303 Info', GETDATE(), 0, 15) 

		end

		return
	end
	
	
	declare @idm_empl int
	declare @idm_depart int
	
	select top(1) @idm_empl=id from KAD$EMPLOYEE with (NOLOCK) where idm_bolid = @HozOrgan 	and realId is null	and (del = 0 or del is null) 	and (actual = 1 or actual is null)
	select @idm_depart =idm_depart from KAD$WORK_TIME_DEPART_BOLID with (NOLOCK) where idm_bolid=@DoorIndex
	
	
	
/*
LEFT JOIN KAD$EMPLOYEE ON KAD$EMPLOYEE.idm_bolid=hozorgan
LEFT JOIN KAD$WORK_TIME_DEPART_BOLID ON KAD$WORK_TIME_DEPART_BOLID.idm_bolid = doorindex
*/
	
declare @up_id int
declare @up_Range int
declare @up_field varchar(50)
declare @up_time datetime
declare @dtw datetime

set @up_id=0

select top(1) @up_id=id, @up_field=field, @up_time=fact, @dtw=shedule, @up_Range=rangeD from(

(SELECT top(1) id, estimated_start as shedule, @TimeVal as fact, ABS(DATEDIFF(SECOND,@TimeVal, estimated_start)) as rangeD , 'actual_start' as field
FROM KAD$WORK_TIME WITH (NOLOCK)
WHERE  estimated_start BETWEEN cast(DATEADD(DAY,-1, @TimeVal)AS date) AND cast(DATEADD(DAY,0, @TimeVal) AS date) AND idm_empl=@idm_empl    AND (idm_status=1 or idm_status=6 or idm_status=13)   /*AND idm_depart=@idm_depart*/     AND del=0 order by rangeD)
union
(SELECT top(1) id, estimated_start as shedule, @TimeVal as fact, ABS(DATEDIFF(SECOND,@TimeVal, estimated_start)) as rangeD , 'actual_start' as field
FROM KAD$WORK_TIME WITH (NOLOCK)
WHERE   estimated_start BETWEEN cast(DATEADD(DAY,0, @TimeVal)AS date) AND cast(DATEADD(DAY,1, @TimeVal)AS date) AND idm_empl=@idm_empl   AND (idm_status=1 or idm_status=6 or idm_status=13)   /*AND idm_depart=@idm_depart*/     AND del=0 order by rangeD)
union
(SELECT top(1) id, estimated_start as shedule, @TimeVal as fact, ABS(DATEDIFF(SECOND,@TimeVal, estimated_start)) as rangeD , 'actual_start' as field
FROM KAD$WORK_TIME WITH (NOLOCK)
WHERE   estimated_start BETWEEN cast(DATEADD(DAY,1, @TimeVal)AS date) AND cast(DATEADD(DAY,2, @TimeVal)AS date) AND idm_empl=@idm_empl  AND (idm_status=1 or idm_status=6 or idm_status=13)    /*AND idm_depart=@idm_depart*/     AND del=0 order by rangeD)
union

(SELECT top(1) id, estimated_stop as shedule, @TimeVal as fact, ABS(DATEDIFF(SECOND,@TimeVal, estimated_stop)) as rangeD , 'actual_stop' as field
FROM KAD$WORK_TIME WITH (NOLOCK)
WHERE  estimated_stop BETWEEN cast(DATEADD(DAY,-1, @TimeVal)AS date) AND cast(DATEADD(DAY,0, @TimeVal) AS date) AND idm_empl=@idm_empl  AND (idm_status=1 or idm_status=6 or idm_status=13)    /*AND idm_depart=@idm_depart*/     AND del=0 order by rangeD)
union
(SELECT top(1) id, estimated_stop as shedule, @TimeVal as fact,ABS(DATEDIFF(SECOND,@TimeVal, estimated_stop)) as rangeD , 'actual_stop' as field
FROM KAD$WORK_TIME WITH (NOLOCK)
WHERE  estimated_stop BETWEEN cast(DATEADD(DAY,0, @TimeVal)AS date) AND cast(DATEADD(DAY,1, @TimeVal)AS date) AND idm_empl=@idm_empl   AND (idm_status=1 or idm_status=6 or idm_status=13)  /*AND idm_depart=@idm_depart*/     AND del=0 order by rangeD)
union
(SELECT top(1) id, estimated_stop as shedule, @TimeVal as fact, ABS(DATEDIFF(SECOND,@TimeVal, estimated_stop)) as rangeD , 'actual_stop' as field
FROM KAD$WORK_TIME WITH (NOLOCK)
WHERE  estimated_stop BETWEEN cast(DATEADD(DAY,1, @TimeVal)AS date) AND cast(DATEADD(DAY,2, @TimeVal)AS date) AND idm_empl=@idm_empl  AND (idm_status=1 or idm_status=6 or idm_status=13)   /*AND idm_depart=@idm_depart*/     AND del=0 order by rangeD)

) T
order by T.rangeD 


-- Проставим время первого прихода в любом случае
/*
if (@up_id>0) begin
	declare @firstCheckIn datetime
	select @firstCheckIn=first_checkIn from KAD$WORK_TIME where id = @up_id
	if (@firstCheckIn is null) begin
		update KAD$WORK_TIME set first_checkIn = @TimeVal where id = @up_id	
	end
end*/
declare @firstCheckID int
set @firstCheckID=0



select top(1) @firstCheckID = id from KAD$WORK_TIME
 where
 cast(estimated_start as date) = cast(@TimeVal as date)
 and idm_empl=@idm_empl  
 and first_checkIn is null
 
if (@firstCheckID>0) begin
update KAD$WORK_TIME set first_checkIn = @TimeVal where id = @firstCheckID	
end




if (@up_id>0 AND @up_Range<=14400) begin



if (@up_field='actual_start') begin

	update KAD$WORK_TIME set actual_start = @up_time where id = @up_id and 	
	(
		(actual_start is null) or
		(ABS(DATEDIFF(SECOND,estimated_start, actual_start))>ABS(DATEDIFF(SECOND,estimated_start, @up_time)))
	)
	
	update KAD$WORK_TIME set actual_stop = @dtw where actual_stop is null and estimated_stop = @dtw and idm_empl=@idm_empl and del=0
	
	INSERT INTO KAD$WORK_TIME_LOG
           (
           [rowId]
           ,[action]
           ,[TimeVal]
           ,[HozOrgan]
           ,[DoorIndex]
           ,[NumCom]
           ,idm_empl)
     VALUES
           (
           @up_id
           ,'actual_start'
           ,@TimeVal
           ,@HozOrgan
           ,@DoorIndex
           ,@Numcom
           ,@idm_empl)
           
       
	
	end else begin
	
	
		update KAD$WORK_TIME set actual_stop = @up_time where id = @up_id  and 	
	(
		(actual_stop is null) or
		(ABS(DATEDIFF(SECOND,estimated_stop, actual_stop))>ABS(DATEDIFF(SECOND,estimated_stop, @up_time)))
	)
		
		--update KAD$WORK_TIME set actual_start = @dtw where actual_start is null and estimated_start = @dtw and idm_empl=@idm_empl and del=0
		
		
declare @Estart datetime
declare @Estop datetime
declare @Astart datetime
declare @Astop datetime
select 
@estart=estimated_start, @astart= actual_start ,
@Estop=estimated_stop, @Astop= actual_stop 
from KAD$WORK_TIME where id = @up_id  


-- если отметились в конце 1ого периода
--if ((not @Astart is null) and( not @Astop is null)) begin
-- обновим время начала
-- update  KAD$WORK_TIME  set actual_start=@Estop where del=0 and idm_empl = @idm_empl and not id=@up_id and estimated_start = @Estop
 declare @count int;
select @count=count(id) from KAD$WORK_TIME where del=0 and idm_empl = @idm_empl and not id=@up_id and estimated_start = @Estop
if (@count>0) begin  
	update KAD$WORK_TIME set actual_start=@Estop where del=0 and idm_empl = @idm_empl and not id=@up_id and estimated_start = @Estop
    update KAD$WORK_TIME set actual_stop=@Estop where id=@up_id 
  end  
--end 
-- если отметились в конце 2ого периода
--if (@Astart is null and not @Astop is null) begin 
  select @count=count(id) from KAD$WORK_TIME where del=0 and idm_empl = @idm_empl and not id=@up_id and estimated_stop = @Estart
  if (@count>0) begin  
		-- обвновим верхнюю строчку 
		update KAD$WORK_TIME set actual_stop=@Estart where del=0 and idm_empl = @idm_empl and not id=@up_id and estimated_stop = @Estart
		-- обвновим текущую строчку 
		 update KAD$WORK_TIME set actual_start=@Estart where id=@up_id 
  end  
--end



		/* declare @cc int
		 declare @dttemp datetime
         select @dttemp=estimated_start from KAD$WORK_TIME where estimated_stop=@dtw and del=0 and idm_empl=@idm_empl
         select @cc=COUNT(*) from KAD$WORK_TIME where (estimated_stop=@dttemp or estimated_start=@dttemp) and del=0 and idm_empl=@idm_empl
		  if @cc=2
		  begin
				update KAD$WORK_TIME set actual_start=@dttemp where estimated_start=@dttemp and del=0 and idm_empl=@idm_empl
				update KAD$WORK_TIME set actual_stop=@dttemp where estimated_stop=@dttemp and del=0 and idm_empl=@idm_empl
		  end*/
		
			INSERT INTO KAD$WORK_TIME_LOG
           (
           [rowId]
           ,[action]
           ,[TimeVal]
           ,[HozOrgan]
           ,[DoorIndex]
           ,[NumCom]
           ,idm_empl)
     VALUES
           (
           @up_id
           ,'actual_stop'
           ,@TimeVal
           ,@HozOrgan
           ,@DoorIndex
           ,@Numcom
           ,@idm_empl)
           
           
		
	end




  update KAD$WORK_TIME_MISSED_NUMCOM set del=1 where numcom = @Numcom  
  
  
end else begin

  IF NOT EXISTS (SELECT numcom FROM KAD$WORK_TIME_MISSED_NUMCOM 
                   WHERE numcom = @Numcom )
   BEGIN
       INSERT INTO KAD$WORK_TIME_MISSED_NUMCOM (numcom,idm_empl_bolid,DeviceTime,idm_empl)
       VALUES (@Numcom,@HozOrgan,@TimeVal,@idm_empl)
   END 

end    

   
     
END