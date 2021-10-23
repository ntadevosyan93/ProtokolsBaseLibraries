-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$InsertWT_Admin]
	@idm_doljn int,
	@estimated_start datetime,
	@idm_depart int,
	@idm_empl int,
	@user_in varchar(50),
	@estimated_stop datetime,
	@idm_status int,
	@break_time int,
	@FreeDay int
AS
BEGIN
	SET NOCOUNT ON;	
	declare @count int, @countMAin int,@cc int,@dt datetime , @IsLock int
	
	select @dt=wt_date_lock from [DEPARTMENTS] with (nolock) where id=@idm_depart

	if(@estimated_start <= @dt) 
		set @IsLock=1;
	else 
		set @IsLock=0;

		select @cc=count(id) from KAD$WORK_TIME with (nolock) where idm_empl=@idm_empl and estimated_start=@estimated_start 
			and estimated_stop=@estimated_stop and idm_status=@idm_status and idm_depart=@idm_depart and del=0

		if(@cc<1) BEGIN
			declare @klass_int int;
			if(@idm_status=1 or @idm_status=6)begin
				SELECT top(1) @countMAin= countPersons from [KAD$WORK_TIME_MANING_TABLE] with (nolock) where [idm_dolgn]=@idm_doljn and idm_depart=@idm_depart and del=0
							order by id desc --получаем максимальное количество сотрудников
				SELECT @count= count(id) from KAD$WORK_TIME with (nolock) where idm_doljn=@idm_doljn and idm_depart=@idm_depart 
					and cast(estimated_start as date) = cast(@estimated_start as date) and idm_status in(select klass_id from KLASS 
					where klass_name = 'wt_status' and klass_value_int =1) and del=0 --получаем актуальное количество сотрудников

				if(@countMAin is not null)
				begin
					if(@count+1 <= @countMAin) begin
						set @cc= 1;
						INSERT INTO KAD$WORK_TIME (user_in, idm_empl, estimated_start, estimated_stop, idm_status, idm_depart, freeDay, break_time, user_cor, date_cor, idm_doljn,is_lock) 
						VALUES (@user_in, @idm_empl, @estimated_start, @estimated_stop, @idm_status, @idm_depart, @FreeDay, @break_time, @user_in, GETDATE(),@idm_doljn,@IsLock)						
					end
					else 
						set @cc=13;
				end
				else begin
					set @cc= 0;
				end
			end
		else begin
			set @cc= 1;
			INSERT INTO KAD$WORK_TIME (user_in, idm_empl, estimated_start, estimated_stop, idm_status, idm_depart, freeDay, break_time, user_cor, date_cor, idm_doljn,is_lock) 
			VALUES (@user_in, @idm_empl, @estimated_start, @estimated_stop, @idm_status, @idm_depart, @FreeDay, @break_time, @user_in, GETDATE(),@idm_doljn,@IsLock)
		end
		END
		else set @cc= 0;

	select  @cc;
END