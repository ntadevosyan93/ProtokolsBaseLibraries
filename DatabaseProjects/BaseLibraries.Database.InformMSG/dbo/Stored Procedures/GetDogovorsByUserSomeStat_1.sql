﻿-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDogovorsByUserSomeStat_1]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50), @all int
AS
BEGIN SET NOCOUNT ON;
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

if @all=0
begin
	if(@idm_user=1202) 
		select *, (PARTNER.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, (PARTNER.text +char(13)+char(10)+subject) as partnertext
		from DOGOVORS$REG with (nolock) 
		left join PARTNER  with (nolock) on PARTNER.id = DOGOVORS$REG.idm_partner
		where del = 0 
		and (user_in = @user_name or idm_isp = @idm_user or idm_empl = @idm_user or DOGOVORS$REG.id in (select idm_dogovor from DOGOVORS$AGREEMENT  with (nolock) where idm_empl = @idm_user  and DOGOVORS$AGREEMENT.del=0))
		and some_status =1 and idm_owner in(597,51)
		order by DOGOVORS$REG.id desc
	else
		select *, (PARTNER.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, (PARTNER.text +char(13)+char(10)+subject) as partnertext
		from DOGOVORS$REG with (nolock) 
		left join PARTNER  with (nolock) on PARTNER.id = DOGOVORS$REG.idm_partner
		where del = 0 
		and (user_in = @user_name or idm_isp = @idm_user or idm_empl = @idm_user or DOGOVORS$REG.id in (select idm_dogovor from DOGOVORS$AGREEMENT  with (nolock) where idm_empl = @idm_user  and DOGOVORS$AGREEMENT.del=0))
		and some_status =1
		order by DOGOVORS$REG.id desc
end
else begin
	if(@idm_user=1202) 
		select *,(PARTNER.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, (PARTNER.text +char(13)+char(10)+subject) as partnertext
		from DOGOVORS$REG with (nolock) 
		left join PARTNER  with (nolock) on PARTNER.id = DOGOVORS$REG.idm_partner
		where del = 0  and some_status = 1 and idm_owner in(597,51)
		order by DOGOVORS$REG.id desc
	else
		select *,(PARTNER.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, (PARTNER.text +char(13)+char(10)+subject) as partnertext
		from DOGOVORS$REG with (nolock) 
		left join PARTNER  with (nolock) on PARTNER.id = DOGOVORS$REG.idm_partner
		where del = 0  and some_status = 1 
		order by DOGOVORS$REG.id desc
end

END