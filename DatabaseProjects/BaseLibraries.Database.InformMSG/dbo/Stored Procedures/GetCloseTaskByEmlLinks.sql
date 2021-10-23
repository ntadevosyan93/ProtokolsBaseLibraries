-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCloseTaskByEmlLinks]
	-- Add the parameters for the stored procedure here
	@idm_task int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @idm_empl_count int;
	SELECT @idm_empl_count = COUNT(idm_empl) FROM [RD$TASK_EML] with (nolock)   WHERE (([idm_task] = @idm_task) AND ([del] = 0))
	if (@idm_empl_count>0) begin
		
		declare @status_summ int;
		SELECT
		@status_summ = sum(CAST(
             CASE 
                  WHEN [status] = 3 or [status] = 7 or [status] = 6 
                     THEN 1 
                  ELSE 0 
             END AS int))
		FROM [RD$TASK_EML]   with (nolock) 
		WHERE (([idm_task] = @idm_task) AND ([del] = 0))
		-- 3
		-- 7
		if (@idm_empl_count = @status_summ) begin
				select 1;
			end else begin
				select 0;
			end;
	end else begin
		select 1;
	end;
END