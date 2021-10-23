-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE MANUAL_SMP_BRIGADE_TIME
	-- Add the parameters for the stored procedure here
	 @id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   	declare @date_start datetime
	declare @date_stop datetime
	declare @idm_main varchar(50)
	declare @idm_main_int int
	
	set @idm_main_int = 0
	
	select @date_start = date_start, @date_stop = date_stop, @idm_main = RTRIM(LTRIM(vuzov_num))
	from SMP$MARSHRUT
	where id = @id
	
	SELECT @idm_main_int = (CASE WHEN ISNUMERIC(@idm_main) = 1 THEN CAST(@idm_main AS INT) ELSE 0 end)
	
	if @idm_main_int > 0 begin			
			update SSMP$MAIN set date_car_start = @date_start, date_car_stop = @date_stop where id = @idm_main_int
			
			if not (@date_stop is null) begin
				update SSMP$MAIN set date_car_diff = (select DATEADD(s, DATEDIFF(SECOND,@date_start,@date_stop), '20000101')) where id = @idm_main_int
			end
	end 
	
END