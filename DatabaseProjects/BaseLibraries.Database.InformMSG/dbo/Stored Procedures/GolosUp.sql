-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GolosUp
	-- Add the parameters for the stored procedure here
	@idm_golos int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @cc int
	set @cc=0
	select @cc=up from GOLOS$MAIN where id=@idm_golos
	set @cc=@cc+1
	update GOLOS$MAIN set up=@cc where  id=@idm_golos
    -- Insert statements for procedure here
	
END