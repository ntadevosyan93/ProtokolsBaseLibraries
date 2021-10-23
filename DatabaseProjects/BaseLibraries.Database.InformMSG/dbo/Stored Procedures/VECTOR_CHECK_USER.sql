-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VECTOR_CHECK_USER]
	-- Add the parameters for the stored procedure here
	@guid varchar(max),
	@password varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @c int;
	set @c=0;
	select @c=COUNT(id) from VECTOR_USERS where guid = @guid and password = @password
	
	select @c

END