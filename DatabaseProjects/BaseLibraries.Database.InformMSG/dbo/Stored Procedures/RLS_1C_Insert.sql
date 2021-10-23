-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE RLS$1C$Insert
	-- Add the parameters for the stored procedure here
	@fileName varchar(50),
	@name varchar(350),
	@raw varchar(max),
	@html varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @exist int;
	select @exist = COUNT(id) from RLS$1C where fileName = @fileName;
	
	if (@exist=0) begin
		insert into RLS$1C (raw, name, html, fileName) values (@raw, @name, @html, @fileName)
	end else begin
	
		update RLS$1C set raw=@raw, name=@name, html=@html  where  fileName = @fileName;
	
	end
 
END