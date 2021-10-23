-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$MANING_TABLE_Insert]
	@idm_depart int,
	@idm_dolgn int,
	@user_in varchar(50),
	@countPersons int,
	@max_time float,
	@countByState int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @oldrow int;
	declare @date_now datetime;

	set @date_now = getdate();
	set @oldrow =0;

	select @oldrow=max(id) from [KAD$WORK_TIME_MANING_TABLE] where del=0 and idm_dolgn=@idm_dolgn and idm_depart =@idm_depart 
		  and date_by is null
   
	if @oldrow>0
	 begin
		update [KAD$WORK_TIME_MANING_TABLE] set date_by=@date_now, user_cur=@user_in, date_cur = @date_now where id=@oldrow
	 end

	 INSERT INTO [KAD$WORK_TIME_MANING_TABLE] 
				([user_in], [idm_depart], [idm_dolgn], [countPersons], [date_from], [countByState], [max_time])
			VALUES (@user_in, @idm_depart, @idm_dolgn, @countPersons, @date_now, @countByState, @max_time) 
END