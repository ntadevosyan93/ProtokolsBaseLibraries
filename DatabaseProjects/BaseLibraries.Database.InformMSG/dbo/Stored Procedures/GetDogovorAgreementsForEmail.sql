-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetDogovorAgreementsForEmail]
	-- Add the parameters for the stored procedure here
	@dogovor_guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    declare @id int	
	select @id = id from DOGOVORS$REG  with (nolock) where guid = @dogovor_guid
		
	SELECT KAD$EMPLOYEE.fam,KLASS.klass_value,text_reason
FROM DOGOVORS$AGREEMENT with (nolock)  
left join KAD$EMPLOYEE  with (nolock) on KAD$EMPLOYEE.id = DOGOVORS$AGREEMENT.idm_empl
left join KLASS  with (nolock) on KLASS.klass_id = DOGOVORS$AGREEMENT.idm_reason
where KLASS.klass_name='dogovor_agree' and  idm_dogovor = @id and DOGOVORS$AGREEMENT.del=0
	
END