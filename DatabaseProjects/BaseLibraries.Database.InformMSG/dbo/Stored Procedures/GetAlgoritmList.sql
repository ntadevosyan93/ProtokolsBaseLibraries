-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAlgoritmList]
	-- Add the parameters for the stored procedure here
	@function_main int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @act_type int;

select @act_type=ALGORITM$FUNCTIONS_MAIN.idm_type_act from ALGORITM$FUNCTIONS_MAIN  with (nolock) where ALGORITM$FUNCTIONS_MAIN.id=@function_main;
    -- Insert statements for procedure here
	  SELECT id, reg_num_full + ' ' + SUBSTRING(text, 1, 50) AS textF FROM [ALGORITM$MAIN] with (nolock)  ORDER BY reg_num	

END