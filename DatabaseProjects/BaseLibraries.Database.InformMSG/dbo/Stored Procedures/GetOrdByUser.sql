-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOrdByUser]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50)
AS
BEGIN

set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

SET NOCOUNT ON;

SELECT * from View$ORD$MAIN with (nolock)
where View$ORD$MAIN.user_in = @user_name
or View$ORD$MAIN.idm_isp = @idm_user 
or @idm_user in (select idm_empl from ORD$SPR_REGIONS_EMPL where idm_region = View$ORD$MAIN.type)
or @idm_user in (select idm_empl from ORD$EMPL where idm_ord = View$ORD$MAIN.id and ORD$EMPL.del=0) 
order by date_in desc
END