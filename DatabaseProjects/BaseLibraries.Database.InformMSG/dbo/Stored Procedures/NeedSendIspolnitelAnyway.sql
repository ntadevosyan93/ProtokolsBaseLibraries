-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NeedSendIspolnitelAnyway]
	-- Add the parameters for the stored procedure here
	@dogovor_guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	

	declare @curator_id int	
	select @curator_id = idm_isp from DOGOVORS$REG  with (nolock) where guid = @dogovor_guid	
	if  not(@curator_id is null) begin
		select @curator_id
	end else begin
		select 'error'
	end   

    
END