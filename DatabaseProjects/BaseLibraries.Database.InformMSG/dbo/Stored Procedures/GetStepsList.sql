-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetStepsList]
	-- Add the parameters for the stored procedure here
	--@idm_alg int,
	@idm_otdel int,
	@idm_doljn int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id, (reg_num_full+' '+ text) as text  from ALGORITM$MAIN_LIST where 
	--idm_otdel = @idm_otdel AND 
	
	id in (
	SELECT[id_main_list]  FROM [InformMSG].[dbo].[ALGORITM$DOLGN] where [idm_doljn] = @idm_doljn)
END