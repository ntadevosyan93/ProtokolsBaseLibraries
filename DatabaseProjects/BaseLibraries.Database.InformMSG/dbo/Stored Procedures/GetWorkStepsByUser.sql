-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetWorkStepsByUser]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	set @user_name=ltrim(rtrim(@user_name))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)
	
	if (@idm_user = 4) begin
		SELECT * FROM WORKSTEPS  with (nolock) order by id desc
	end else begin
		SELECT * FROM WORKSTEPS  with (nolock) where user_in = @user_name  or idm_empl = @idm_user order by id desc
	end
	
END