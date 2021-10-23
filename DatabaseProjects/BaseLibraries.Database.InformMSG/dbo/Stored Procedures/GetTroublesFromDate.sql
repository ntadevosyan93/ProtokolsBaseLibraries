-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTroublesFromDate]
	-- Add the parameters for the stored procedure here
		@user_name varchar(50), @all int,
		@date_start datetime,
	 @date_end datetime
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;

	SELECT * from View$TT$MAIN with (nolock) 
		where 
		View$TT$MAIN.del=0 and not(status = @all) and
		(View$TT$MAIN.user_in=@user_name
		or View$TT$MAIN.idm_empl=@idm_user 
		or @idm_user in (	select TT$SPR_REGION_EMPL.idm_empl 
										from TT$SPR_REGION_EMPL  with (nolock) 
										where TT$SPR_REGION_EMPL.idm_region = View$TT$MAIN.idm_activity
									) 
									--TT$SPR_REGION_EMPL.idm_empl=@idm_user AND
		or @idm_user in (select idm_empl from LINK_EMPL with (nolock) ) 	
		or View$TT$MAIN.idm_control =@idm_user
		) 		
		and View$TT$MAIN.date_in between @date_start and @date_end
		order by date_in desc
END