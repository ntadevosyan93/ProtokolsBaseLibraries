-- =============================================
-- SELECT * FROM [TT$MAIN] where user_in = @user_in and not(status = @status)
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetReqMain]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50), 
	@status int
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;

	SELECT * 
	from View$REQ$MAIN 
		where 
		View$REQ$MAIN.del=0 and View$REQ$MAIN.status = @status and		
		View$REQ$MAIN.user_in=@user_name
		order by date_in desc
END