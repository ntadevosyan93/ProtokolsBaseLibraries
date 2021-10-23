
















-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$BigBroCalculateSingleRecord]
	@TimeVal datetime,
	@HozOrgan int,
	@DoorIndex int,--не используется
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
			phone_to in (   '79384834089', '79182694663', '79604823400', '79182334555') 
			and date_in > CAST( GETDATE() as date) and text like '303 открыт'
					 ) begin

					 insert into SMS_MAIN (phone_to, text, pushOnly, module, date_sending, status, priority)
					 (	   
					      select '79384834089', '303 открыт', 1, '303 Info', GETDATE(), 0, 15 --денис
					union select '79182694663', '303 открыт', 1, '303 Info', GETDATE(), 0, 15  --яна
					union select '79182334555', '303 открыт', 1, '303 Info', GETDATE(), 0, 15  --дмитрий
					union select '79604823400', '303 открыт', 1, '303 Info', GETDATE(), 0, 15  --николай
					)

					end

					return
				end
	
	
				declare @idm_empl int
				declare @idm_depart int
	
				select top(1) @idm_empl=id from KAD$EMPLOYEE with (NOLOCK) where idm_bolid = @HozOrgan 	and realId is null	and (del = 0 or del is null) 	and (actual = 1 or actual is null)
				select @idm_depart =idm_depart from KAD$WORK_TIME_DEPART_BOLID with (NOLOCK) where idm_bolid=@DoorIndex
	
	

			declare 
			@cur_type as varchar(15)
			,@from_type as varchar(15)
			,@cur_abs as int
			,@cur_estimated as datetime
			,@cur_id as int
			,@from_id as int
			,@cur_actual as datetime
			--,@Numcom int 
			--,@TimeVal as datetime 
			--,@idm_empl as int 
			,@first_start as datetime --2020-03-11 07:30:00.000
			,@first_estimat as datetime 
			,@from_estimated as datetime
			,@last_estimat as datetime
			,@abs as int
			--,@HozOrgan as int
			--,@DoorIndex as int
			--set @idm_empl = 1604
			--set @TimeVal = '2020-12-03 19:35:52.000'
			--set @TimeVal = '2020-12-03 07:31:00.000'
			--set @Numcom  = NULL

			--init
			DECLARE @tmp_resp table(id INT  , estimated_start datetime null, estimated_stop datetime null, actual_start datetime null, actual_stop datetime null, ABS_start int null,ABS_stop int null);

			DECLARE @tmp_all_record TABLE(id INT  , estimated datetime null, actual datetime null, [abs] int null,tp varchar(15));
			--id, estimated_start [estimated], actual_start [actual], ABS_start [abs],'actual_start' tp

			--id, estimated_start, estimated_stop, actual_start, actual_stop
			declare @temp_rez_rasp Table(id int, estimated_start datetime null, estimated_stop datetime null, actual_start datetime null, actual_stop datetime null)

			 --id, estimated_start [estimated], actual_start [actual],'actual_start' tp
			 DECLARE @tmp_all_record_z TABLE (id INT  , estimated datetime null, actual datetime null,  tp varchar(15) );

			--берём все дни, по @TimeVal от позавчера до завтра, помещаем в @tmp_resp-- можно и побольше дней, но таких смен не бывает
			insert into @tmp_resp
			select id, estimated_start, estimated_stop, actual_start, actual_stop, 
			ABS(DATEDIFF(SECOND,@TimeVal, estimated_start)) as ABS_start,
			ABS(DATEDIFF(SECOND,@TimeVal, estimated_stop)) as ABS_stop
			
			From KAD$WORK_TIME kwt WITH (NOLOCK)
			where estimated_start  BETWEEN cast(DATEADD(DAY,-2, @TimeVal)AS date) AND cast(DATEADD(DAY,2, @TimeVal) AS date)
			 AND idm_empl=@idm_empl    AND (idm_status=1 or idm_status=6 or idm_status=13)   /*AND idm_depart=@idm_depart*/     AND del=0 
			and estimated_start != estimated_stop


			--помещаем записи по действиям и дате в @tmp_all_record
			insert into @tmp_all_record
			select *
			 From (
			 select id, estimated_start [estimated], actual_start [actual], ABS_start [abs],'actual_start' tp
			 From @tmp_resp
			 union
			  select id, estimated_stop, actual_stop, ABS_stop , 'actual_stop' tp
			 From @tmp_resp
			) D

			--ближайшая запись.
			 select top 1  @cur_id = id, @cur_estimated = [estimated], @cur_type = tp, @abs = [abs], @cur_actual = actual
			 From @tmp_all_record
			order by [abs]    ,tp
			
			--если запись далеко - ничего не обновляем
			if @cur_id>0 AND @abs<=14400
			begin
				--select top 1 *
				--From @tmp_all_record
				--order by abs ,tp

				---- начиная ОТ какой даты обновлять 
				--select top 1 @from_type = tp, @from_id = id, @from_estimated=[estimated]
				--From @tmp_all_record
				--where actual is not null
				--order by estimated, actual

				--select *
				--From @tmp_all_record
				--order by estimated, actual
				
				--если это конец смены -  проапдейтить все, где эстимейтед_что-нибудь от первого проставленного актуала до нашего стопа
				if @cur_type = 'actual_stop' and ( @cur_actual <@TimeVal or @cur_actual is null)
				begin
				print   @cur_id --, @cur_estimated, @cur_type, @abs, @cur_actual

						INSERT INTO KAD$WORK_TIME_LOG (  [rowId]  ,[action] ,[TimeVal]   ,[HozOrgan] ,[DoorIndex] ,[NumCom],idm_empl)
						VALUES  ( @cur_id   ,'actual_stop',@TimeVal ,@HozOrgan,@DoorIndex ,@Numcom,@idm_empl)

						--обновляем тмп, ставим последнюю запись
						update @tmp_resp
						set actual_stop = @TimeVal
						where id = @cur_id

						--змейкой идём по записям, достигая самой начальной, засовываем результат в #temp_rez_rasp
						--классическая змейка в рекурсии ЦТЕ (estimated_start = estimated_stop, estimated_stop = estimated_start ) исключает лишние записи, которые есть в наборе @tmp_resp
						--Сколько бы смен не было - они все будут в нашей змейке, вплоть до самой первой записи, на старт которой не ссылается ни на какой estimated_stop
						;with cte as (
						select  id, estimated_start, estimated_stop, actual_start, actual_stop
						from @tmp_resp where id = @cur_id
						--@cur_id [id],null [estimated_start], @cur_estimated [estimated_stop]
						union all 
						select t.id, t.estimated_start, t.estimated_stop, t.actual_start, t.actual_stop
						From cte
						  join @tmp_resp t on cte.estimated_start between t.estimated_stop and dateadd(mi,60,t.estimated_stop )
						)

						--вставим нашу змейку в темп тейбл
						insert into @temp_rez_rasp
						select *
						--into #temp_rez_rasp
						From cte


--распрямляем змейку, чтобы @from_estimated был первой записью в змейке, чтобы без лишних было
				
			insert into @tmp_all_record_z
			select *
			--into @tmp_all_record_z
			 From (
			 select id, estimated_start [estimated], actual_start [actual],'actual_start' tp
			 From @temp_rez_rasp
			 union
			  select id, estimated_stop, actual_stop,  'actual_stop' tp
			 From @temp_rez_rasp
			) D
	-- начиная ОТ какой даты обновлять 
				select top 1 @from_type = tp, @from_id = id, @from_estimated=[estimated]
				From @tmp_all_record_z
				where actual is not null
				order by estimated, actual		
							


						--если в змейке есть хоть какие записи сджойним их к КВТ и хитро обновим поля
						if(exists( select 91 	
						From @temp_rez_rasp t
						where t.estimated_start >=@from_estimated  ) )
						begin

							if(@from_estimated is not null)
							begin
							--select 'more record'

								--select t.*
								update  kwt
								--если обновляемая запись пустая - заменить её estimated_start. Если заполнена - оставить актуал_старт
								set actual_start = case when t.actual_start is null then  t.estimated_start  else t.actual_start end
								From @temp_rez_rasp t
								join KAD$WORK_TIME kwt on kwt.id = t.id
								where t.estimated_start >=@from_estimated  


								--актуал стоп обновим так, что если первая запись экшуал страт - то экшэл_стоп, который ему равен не обновлять. 
								--select t.*
								update  kwt
								set actual_stop = case when t.actual_stop is null then
								--t.estimated_stop

								 case when t.estimated_stop = @from_estimated and @from_type = 'actual_start' then null else t.estimated_stop  end

								  else t.actual_stop end
								From @temp_rez_rasp t
								join KAD$WORK_TIME kwt on kwt.id = t.id
								where t.estimated_stop >=@from_estimated  

							end
						end--if(exists( select 91 	
						else
						begin
						--если нет ни одной записи просто обновим стоп
							--select 'one_record'
								update KAD$WORK_TIME
								set actual_stop = @TimeVal
								where id = @cur_id and del = 0
						end
						
				end--	if @cur_type = 'actual_stop'
				else
				begin
				--select @cur_actual
						if @cur_actual is null
						begin
												INSERT INTO KAD$WORK_TIME_LOG (  [rowId]  ,[action] ,[TimeVal]   ,[HozOrgan] ,[DoorIndex] ,[NumCom],idm_empl)
												VALUES  ( @cur_id   ,'actual_start',@TimeVal ,@HozOrgan,@DoorIndex ,@Numcom,@idm_empl)
						--если первая запись старт - просто обновим старт
							update KAD$WORK_TIME
							set actual_start = @TimeVal
							where id = @cur_id and del=0
						end
				end
			end--if (@cur_id>0 AND @abs<=14400) 
			else
			begin
			--если человек пикнулся далеко от стопа или старта или нет расписания добавляем в какую-то таблицу
			  IF NOT EXISTS (SELECT numcom FROM KAD$WORK_TIME_MISSED_NUMCOM 
							   WHERE numcom = @Numcom )
			   BEGIN
				   INSERT INTO KAD$WORK_TIME_MISSED_NUMCOM (numcom,idm_empl_bolid,DeviceTime,idm_empl, [detalies])
				   VALUES (@Numcom,@HozOrgan,@TimeVal,@idm_empl , 
				   'dtl @cur_id :'+ isnull(str(@cur_id),'')+ ' ---  @abs :' + 
				   isnull(str(@abs),'') + ' --- @cur_estimated : ' + 
				   isnull(convert(varchar(50),@cur_estimated ,120 ) ,'') + ' --- count @tmp_resp : ' + 
				   str (isnull ( (  select count(*) From @tmp_resp ) , '') )
				   )
			   END 
			end
			

end