-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCountBillAgreement]
	-- Add the parameters for the stored procedure here
@user_name varchar(50),
@status int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @idm_user int
	declare @idm_otdel int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)
	select @idm_otdel=idm_otdel from EMPL_TO_OTDEL  with (nolock) where idm_empl=@idm_user
	if(@idm_otdel=1)
		select id from RM$OS$BILLING with (nolock)  where [status]=@status and del=0
    else 
		if(@idm_otdel=3)	
			select id from RM$OS$BILLING with (nolock)  where [status]=@status and del=0 and (summ>=50000 or AllowAgreeMarceting=1)
		else 		
		select id from RM$OS$BILLING with (nolock)  where [status]=@status and del=0
END