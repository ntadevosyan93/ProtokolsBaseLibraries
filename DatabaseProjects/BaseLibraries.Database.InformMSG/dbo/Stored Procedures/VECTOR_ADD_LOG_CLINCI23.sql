-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VECTOR_ADD_LOG_CLINCI23]
	-- Add the parameters for the stored procedure here
	@ip varchar(150), 
	@user_in varchar(150),
	@tn varchar(150),
	@incMinutes varchar(150)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
INSERT INTO VECTOR_LOG_CLINIC23
           (user_in
           ,ip 
           ,[tn]
           ,[incMinutes])
     VALUES
           (
           @user_in
           ,@ip
           ,@tn
           ,@incMinutes)
           
           /*
           
           user_in	varchar(50)	Checked
ip	varchar(50)	Checked
tn	varchar(150)	Checked
incMinutes	int	Checked
           
           */
END