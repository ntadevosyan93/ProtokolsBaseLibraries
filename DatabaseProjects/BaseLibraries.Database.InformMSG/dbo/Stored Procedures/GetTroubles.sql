
-- =============================================
-- SELECT * FROM [TT$MAIN] where user_in = @user_in and not(status = @status)
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTroubles]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50), @all int
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;

	SELECT * from View$TT$MAIN tt with (nolock)  
		where 
		tt.del=0 and not(status = @all) and
		(tt.user_in=@user_name
		or tt.idm_empl=@idm_user 
		or @idm_user  in (	select TT$SPR_REGION_EMPL.idm_empl 
										from TT$SPR_REGION_EMPL  with (nolock) 
										where TT$SPR_REGION_EMPL.idm_region = tt.idm_activity
									) 
		or @idm_user  in (select idm_empl_link from LINK_EMPL with (nolock) where idm_empl=tt.idm_control) 	
		or tt.idm_control =@idm_user
		) 
		--and tt.idm_activity!=2
		order by date_in desc
END