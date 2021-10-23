-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE VECTOR_ADD_LOG
	-- Add the parameters for the stored procedure here
	@ip varchar(max),
	@guid varchar(max),
	@password varchar(max),
	@tn varchar(max),
	@inc varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
INSERT INTO VECTOR_LOG
           ([ip]
           ,[guid]
           ,[password]
           ,[tn]
           ,[inc])
     VALUES
           (
           @ip
           ,@guid
           ,@password
           ,@tn
           ,@inc)
END