-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetFirstEmailAgreement]
	-- Add the parameters for the stored procedure here
	@user_in varchar(50),
	@dogovor_guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    set @user_in =ltrim(rtrim(@user_in))
	declare @idm_user int
	select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_in)
	
	declare @idm_dogovor int
	select @idm_dogovor=id from DOGOVORS$REG  with (nolock) where guid = @dogovor_guid	
	
--	select id as idm_empl from DOGOVORS$AGREEMENT where  idm_dogovor = @idm_dogovor 

select (select top(1) id from DOGOVORS$AGREEMENT  with (nolock) where idm_empl=ss.idm_empl and idm_dogovor=ss.idm_dogovor) as idm_empl
from DOGOVORS$AGREEMENT ss with (nolock) 
where  idm_dogovor = @idm_dogovor  
group by idm_empl,idm_dogovor

	-- id as idm_empl передаем ID строки 
	
	
	--UPDATE DOGOVORS$AGREEMENT SET idm_reason = @status, text_reason = @comment, date_reason = GETDATE() where idm_dogovor = @idm_dogovor and idm_empl = @idm_user
	
END