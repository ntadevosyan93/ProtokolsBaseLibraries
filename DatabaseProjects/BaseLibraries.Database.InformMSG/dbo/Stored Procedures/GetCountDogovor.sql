CREATE procedure [dbo].[GetCountDogovor]
@user_name varchar(50), @all int
AS
Begin
SET NOCOUNT ON;

set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)

declare  @countdog int

SELECt [DOGOVORS$AGREEMENT].* FROM [dbo].[DOGOVORS$AGREEMENT] with (nolock) 
inner join  DOGOVORS$REG b  with (nolock) on b.id=[DOGOVORS$AGREEMENT].idm_dogovor
  where [DOGOVORS$AGREEMENT].idm_empl = @idm_user  and [DOGOVORS$AGREEMENT].del=0
  and b.del=0 and b.id in 
		(select idm_dogovor from DOGOVORS$AGREEMENT  with (nolock) where idm_empl = @idm_user 	 and DOGOVORS$AGREEMENT.del=0
			and 	
				not ((select top(1) idm_reason from DOGOVORS$AGREEMENT  with (nolock) where DOGOVORS$AGREEMENT.idm_dogovor = b.id and idm_empl = @idm_user
				  and DOGOVORS$AGREEMENT.del=0 order by id desc) = 1)
			AND	
				not ((select top(1) idm_reason from DOGOVORS$AGREEMENT with (nolock)  where DOGOVORS$AGREEMENT.idm_dogovor = b.id and idm_empl = @idm_user
				  and DOGOVORS$AGREEMENT.del=0 order by id desc) = 3)
				  group by idm_dogovor
		)

--SELECt * FROM [dbo].[DOGOVORS$AGREEMENT]  where idm_empl = @idm_user and idm_reason = @all and del=0
end