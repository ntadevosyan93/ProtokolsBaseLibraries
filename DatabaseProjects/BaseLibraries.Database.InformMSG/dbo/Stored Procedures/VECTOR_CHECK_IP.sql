-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VECTOR_CHECK_IP]
	-- Add the parameters for the stored procedure here
	@ip varchar(max),
	@guid varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @exist int
	set @exist = 0
	select top(1) @exist = count(id) from VECTOR_USERS where guid = @guid and (ip = @ip or ip is null)
	
	if (@exist = 0) begin

	select 0

	end else begin
	select 1
	end

END