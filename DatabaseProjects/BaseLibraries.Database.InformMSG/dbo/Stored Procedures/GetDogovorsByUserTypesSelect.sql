CREATE PROCEDURE [dbo].[GetDogovorsByUserTypesSelect]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50), @type int
AS
BEGIN SET NOCOUNT ON;

set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

-- type = 0 - Куратор
-- type = 1 - На согласовании


if @type=0
begin
	select *, (PARTNER.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, PARTNER.text as partnertext
	from DOGOVORS$REG with (nolock) 
	left join PARTNER  with (nolock) on PARTNER.id = DOGOVORS$REG.idm_partner
	where del = 0 and idm_empl = @idm_user
	order by DOGOVORS$REG.id desc
end
else if @type=1
begin

	declare @last_agree_id int
	

	select *, (PARTNER.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, PARTNER.text as partnertext
	from DOGOVORS$REG with (nolock) 
	left join PARTNER  with (nolock) on PARTNER.id = DOGOVORS$REG.idm_partner
	where del = 0 and DOGOVORS$REG.id in 
	(	
		select idm_dogovor from DOGOVORS$AGREEMENT where idm_empl = @idm_user   and DOGOVORS$AGREEMENT.del=0	
		and 	
			not ((select top(1) idm_reason from DOGOVORS$AGREEMENT with (nolock)  where DOGOVORS$AGREEMENT.idm_dogovor = DOGOVORS$REG.id and idm_empl = @idm_user  and DOGOVORS$AGREEMENT.del=0 order by id desc) = 1)
	
		AND	
			not ((select top(1) idm_reason from DOGOVORS$AGREEMENT  with (nolock) where DOGOVORS$AGREEMENT.idm_dogovor = DOGOVORS$REG.id and idm_empl = @idm_user  and DOGOVORS$AGREEMENT.del=0 order by id desc) = 3)
	)
	
	order by DOGOVORS$REG.id desc
end

END