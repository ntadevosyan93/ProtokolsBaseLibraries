-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetProjectsMainEmpl]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50)
AS
BEGIN

	set @user_name=ltrim(rtrim(@user_name))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	SET NOCOUNT ON;
		
	SELECT * 
	FROM PROJECT$MAIN
	WHERE user_in = @user_name 
	OR @idm_user in (SELECT idm_empl from PROJECT$MAIN_EMPL where idm_project = PROJECT$MAIN.id)
		
END