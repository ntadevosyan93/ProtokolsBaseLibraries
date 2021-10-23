-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmplToEmplByDogovorAgreement]
	-- Add the parameters for the stored procedure here
	@idm_agree int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select idm_empl, idm_empl_link
	 from DOGOVORS$AGREEMENT a
with (nolock)
left join DOGOVOR_EMPLtoEMPL empl  with (nolock) on empl.idm_empl_parent=idm_empl 
where a.id =@idm_agree

END