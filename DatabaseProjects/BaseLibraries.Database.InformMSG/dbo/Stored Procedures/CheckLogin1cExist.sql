-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckLogin1cExist]
	-- Add the parameters for the stored procedure here
	@login varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 select COUNT(*)
	 from KAD$EMPLOYEE  with (nolock) 
	where (del=0 or del is null) and (actual = 1) and realId is null
     and 
      UPPER(login_1c_t) = UPPER(@login)
END