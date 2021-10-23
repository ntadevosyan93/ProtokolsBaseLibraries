-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDogovorsByUserByPartner]
	-- Add the parameters for the stored procedure here
	@user_name varchar(50), @all int, @searchtext varchar(50),@type int
AS
BEGIN SET NOCOUNT ON; 
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

declare @filter int;
select @filter=count(id) from DOGOVORS$REG_EMPLByOWNER  with (nolock) where idm_empl=@idm_user

if @all=0
begin
	if(@filter>0) 
		select *, (b.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, b.text as partnertext
		from DOGOVORS$REG with (nolock) 
		left join PARTNER b  with (nolock) on b.id = DOGOVORS$REG.idm_partner
		where del = 0 
		and (user_in = @user_name or idm_isp = @idm_user or idm_empl = @idm_user
		or DOGOVORS$REG.id in (select idm_dogovor from DOGOVORS$AGREEMENT with (nolock)  where idm_empl = @idm_user  and DOGOVORS$AGREEMENT.del=0)
		or  idm_owner in(select idm_owner from DOGOVORS$REG_EMPLByOWNER with (nolock)  where idm_empl=@idm_user)
		--пересечение договоров
		or idm_isp in (SELECT [idm_empl_parent] FROM [dbo].[DOGOVOR_EMPLtoEMPL] with (nolock) where idm_empl_link=@idm_user)
		or idm_empl in (SELECT [idm_empl_parent] FROM [dbo].[DOGOVOR_EMPLtoEMPL] with (nolock) where idm_empl_link=@idm_user)
		or DOGOVORS$REG.id in (select idm_dogovor from DOGOVORS$AGREEMENT with (nolock)	where idm_empl in (SELECT [idm_empl_parent] FROM [dbo].[DOGOVOR_EMPLtoEMPL] with (nolock) 
		where idm_empl_link=@idm_user)))
 		and ((b.text LIKE '%'+@searchtext+'%') or (b.inn like '%'+@searchtext+'%')) 		
		order by DOGOVORS$REG.id desc
	else
		select *, (b.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, b.text as partnertext
		from DOGOVORS$REG with (nolock) 
		left join PARTNER b  with (nolock) on b.id = DOGOVORS$REG.idm_partner
		where del = 0 
		and (user_in = @user_name or idm_isp = @idm_user or idm_empl = @idm_user or 
		DOGOVORS$REG.id in (select idm_dogovor from DOGOVORS$AGREEMENT  with (nolock) where idm_empl = @idm_user  and DOGOVORS$AGREEMENT.del=0)
		--пересечение договоров
		or idm_isp in (SELECT [idm_empl_parent] FROM [dbo].[DOGOVOR_EMPLtoEMPL] with (nolock) where idm_empl_link=@idm_user)
		or idm_empl in (SELECT [idm_empl_parent] FROM [dbo].[DOGOVOR_EMPLtoEMPL] with (nolock) where idm_empl_link=@idm_user)
		or DOGOVORS$REG.id in (select idm_dogovor from DOGOVORS$AGREEMENT with (nolock)	where idm_empl in (SELECT [idm_empl_parent] FROM [dbo].[DOGOVOR_EMPLtoEMPL] with (nolock) 
		where idm_empl_link=@idm_user)))
 		and ((b.text LIKE '%'+@searchtext+'%') or (b.inn like '%'+@searchtext+'%'))
		order by DOGOVORS$REG.id desc	
end
else begin
	if(@filter>0) 
		select *,(b.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, b.text as partnertext
		from DOGOVORS$REG with (nolock) 
		left join PARTNER b  with (nolock) on b.id = DOGOVORS$REG.idm_partner
		where del = 0 and ((b.text LIKE '%'+@searchtext+'%') or (b.inn like '%'+@searchtext+'%'))		
		and idm_owner in(select idm_owner from DOGOVORS$REG_EMPLByOWNER  with (nolock) where idm_empl=@idm_user)
		order by DOGOVORS$REG.id desc
	else
		select *,(b.text + char(10)+char(13) + DOGOVORS$REG.subject) as parsub, b.text as partnertext
		from DOGOVORS$REG with (nolock) 
		left join PARTNER b  with (nolock) on b.id = DOGOVORS$REG.idm_partner
		where del = 0 and ((b.text LIKE '%'+@searchtext+'%') or (b.inn like '%'+@searchtext+'%')) 
		order by DOGOVORS$REG.id desc	
end

END