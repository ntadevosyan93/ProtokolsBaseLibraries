-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SetFilialLock]
	-- Add the parameters for the stored procedure here
	@idm_depart int,
	@wt_date_lock datetime,
	@user_in varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- обновим запись depart
	update  DEPARTMENTS set wt_date_lock=@wt_date_lock,date_cor=getdate()  where id=@idm_depart
	--обновим записи в  wt
	 DECLARE @Error nvarchar(MAX);
	 begin try
	declare @cc int
	select @cc = count(id) from KAD$WORK_TIME where cast(estimated_start as date) <= cast(@wt_date_lock as date) 
	and idm_depart=@idm_depart and (is_lock=0 or is_lock is null) and del=0

	if(@cc>0)
	update KAD$WORK_TIME set is_lock=1,user_cor=@user_in,date_cor=getdate() 
	where cast(estimated_start as date) <= cast(@wt_date_lock as date) 
	and idm_depart=@idm_depart and (is_lock=0 or is_lock is null) and del=0

	-- запишем действия в log
	insert into dbo.[LOG] (user_in,[table_name],[idm_table],[type]) values (@user_in,'DEPARTMENTS',@idm_depart,'IS_LOCK') 

	select @cc
	end try
	begin catch 
		SET @Error = 'Error Number: ' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + '; ' +
        'Error Severity: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10)) + '; ' +
        'Error State: ' + CAST(ERROR_STATE() AS VARCHAR(10)) + '; ' +
        'Error Line: ' + CAST(ERROR_LINE() AS VARCHAR(10)) + '; ' +
        'Error Message: ' + ERROR_MESSAGE()
     select  @Error
	end catch
END