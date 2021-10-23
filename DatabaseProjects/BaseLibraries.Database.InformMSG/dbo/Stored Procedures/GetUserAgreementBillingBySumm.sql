CREATE PROCEDURE [dbo].[GetUserAgreementBillingBySumm]
	-- Add the parameters for the stored procedure here
	@idm_bill int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @summ float, @AllowMarcAgree int
	select @summ = summ,@AllowMarcAgree=AllowAgreeMarceting from RM$OS$BILLING  with (nolock) where id=@idm_bill
	if(@summ>=50000 or @AllowMarcAgree=1)
		select a.id from KAD$EMPLOYEE a with (nolock) 
		where a.id in(select idm_empl from[EMPL_TO_OTDEL] with (nolock)  where idm_otdel in (1,3) and del=0) and actual = 1
	else 
		select a.id from KAD$EMPLOYEE a with (nolock) 
		where a.id in(select idm_empl from[EMPL_TO_OTDEL]  with (nolock) where idm_otdel =1 and del=0) and actual = 1
 --select 239 as id
END