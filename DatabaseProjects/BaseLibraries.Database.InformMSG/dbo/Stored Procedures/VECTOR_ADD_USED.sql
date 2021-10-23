-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VECTOR_ADD_USED]
	-- Add the parameters for the stored procedure here
	@ip varchar(max),
	@guid varchar(max),
	@tn varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @idm_user int
	select top(1) @idm_user = id from VECTOR_USERS where guid = @guid
	
INSERT INTO VECTOR_USED_TICKETS
           (ip
           ,idm_user
           ,ticketNumber
           )
     VALUES
           (
           @ip
           ,@idm_user
           ,@tn)
END