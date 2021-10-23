-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMSGByUser]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50) 
AS
BEGIN
	SET NOCOUNT ON;    
    
    set @user_name=ltrim(rtrim(@user_name))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)
	
	select * from MSG$MAIN  with (nolock) 
	where 
	module = 'workflow_msg'
	and
	(user_in = @user_name or to_user = @idm_user)
	
    
END