-- =============================================
-- SELECT * FROM [TT$MAIN] where user_in = @user_in and not(status = @status)
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetReqMainEmpl]
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

	SELECT * , KAD$EMPLOYEE.fam+' '+KAD$EMPLOYEE.name+' '+KAD$EMPLOYEE.otch as fio
	from View$REQ$MAIN 
	Left join KAD$EMPLOYEE on UPPER(KAD$EMPLOYEE.login_ad)=UPPER(View$REQ$MAIN.user_in)
		where 
		View$REQ$MAIN.del=0 and 
		View$REQ$MAIN.id in (   SELECT idm_req_main 
								from REQ$MAIN_AGREEMENT 
								where idm_empl = @idm_user and idm_reason=@status)
	
	order by View$REQ$MAIN.date_in desc
END