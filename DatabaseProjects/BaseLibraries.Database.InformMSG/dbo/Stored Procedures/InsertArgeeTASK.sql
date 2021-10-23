-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.InsertArgeeTASK
	-- Add the parameters for the stored procedure here
	@idm_task int, @idm_empl int, @inAuthor int, @inControl int, @inIsp int,
	@user_in varchar(50), @guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @newID int,
	@idm_controller int,
	@newId_controll int

	select @idm_task = id from RD$TASK where guid =@guid

	INSERT INTO [RD$TASK_EML] ([user_in], [idm_task], [idm_empl], [del], status) 
    VALUES (@user_in, @idm_task, @idm_empl, 0, 1); set @newID= Scope_Identity()

	if(@newID >0)
	begin
		SELECT top(1) @idm_controller= idm_controller
		FROM [KAD$EMPLOYEE]
		where id = @idm_empl 
		and idm_controller not in (select idm_empl from RD$TASK_EML a left join RD$TASK b on b.id =a.idm_task 
								where a.idm_task = @idm_task and a.del=0 and idm_empl!=b.idm_author 
								and idm_empl!=b.idm_isp and idm_empl!=b.idm_kontrol)
		if @idm_controller >0
		begin
		 if (@idm_controller != @inAuthor and @idm_controller != @inControl and @idm_controller != @inIsp)
			begin
				INSERT INTO [RD$TASK_EML] ([user_in], [idm_task], [idm_empl], [del], status) 
                    VALUES (@user_in, @idm_task, @idm_controller, 0,  1) set @newId_controll= SCOPE_IDENTITY()
			end
		end

		select tema,a.text,  convert(varchar(10),a.date_stop,104) as inDateStopPlan,DbKontrol.fio_full as inKontrol,
			DbAutor.fio_full as inAutor,
			DbIspolnit.fio_full as inIspolnit 
			,v.klass_value as vazhnost
			,stat.klass_value as status
			,(case when @newId_controll>0 
				then (SELECT top(1) idm_empl from RD$TASK_EML where del=0 and id =@newId_controll) 
				else NULL end) as soisp_Kurator
	   from RD$TASK a 
	   left join View$KAD$EMPLOYEE DbKontrol on DbKontrol.id = idm_kontrol
		left join View$KAD$EMPLOYEE DbIspolnit on DbIspolnit.id = idm_isp
		left join View$KAD$EMPLOYEE DbAutor on DbAutor.id = idm_author
		left join KLASS v on klass_name='rd_task_vazhnost' and klass_id = a.vazhnost
		left join KLASS stat on stat.klass_name='rd_task_status' and stat.klass_id = a.status
		where a.id =@idm_task
	end
END