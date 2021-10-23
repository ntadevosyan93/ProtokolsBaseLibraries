-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAgreementByOtdel]
	-- Add the parameters for the stored procedure here
	@idm_otdel int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   select a.id from KAD$EMPLOYEE a with (nolock) 
  where a.id in(select idm_empl from[EMPL_TO_OTDEL]  with (nolock) where idm_otdel = @idm_otdel) and actual = 1

 --select 239 as id
END