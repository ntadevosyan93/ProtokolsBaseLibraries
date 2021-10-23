-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAgreementListForWord]
	-- Add the parameters for the stored procedure here
	@idm_dogovor int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT K.text as dolgn, fio, text_reason, date_reason, idm_reason
FROM DOGOVORS$AGREEMENT  with (nolock) 
left join (select id,
(CASE WHEN fam IS NULL THEN '' ELSE fam END )+' '+
(CASE WHEN name IS NULL THEN '' ELSE name END )+' '+
(CASE WHEN otch IS NULL THEN '' ELSE otch END ) as fio
from kad$employee) T  on T.id = idm_empl
left join KAD$DOLJN K  with (nolock) on K.id = (select idm_doljn from KAD$EMPLOYEE where id = idm_empl)
WHERE (idm_dogovor = @idm_dogovor) and del=0
END