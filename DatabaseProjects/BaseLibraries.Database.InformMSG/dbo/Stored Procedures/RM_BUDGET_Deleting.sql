-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.RM$BUDGET_Deleting
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @c int, @cc int
	select @c= count(id) from RM$BUDGET where ParentID=@id
	if(@c>0)
	begin	
		select @c=ParentID  from dbo.RM$BUDGET where id=@id			
		select @cc=count(id) from dbo.RM$BUDGET where ParentID=@c
		if(@cc>0) begin
			delete from dbo.RM$BUDGET where ParentID=@cc
		end
		delete from dbo.RM$BUDGET where ParentID=@id
	end
delete from dbo.RM$BUDGET where id=@id
END