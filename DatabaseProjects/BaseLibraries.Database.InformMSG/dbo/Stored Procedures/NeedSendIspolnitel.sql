-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NeedSendIspolnitel]
	-- Add the parameters for the stored procedure here
	@dogovor_guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @id int
	declare @curator_sended int
	declare @curator_id int
	
	
	select @id=id, @curator_sended=isp_sended, @curator_id = idm_isp from DOGOVORS$REG  with (nolock) where guid = @dogovor_guid
	
	declare @result_send int
    select @result_send=(CASE WHEN COUNT(id) = SUM(idm_reason) THEN 1 ELSE 0 END )from DOGOVORS$AGREEMENT  with (nolock) where idm_dogovor = @id and DOGOVORS$AGREEMENT.del=0
   
	if (@result_send=1) AND (@curator_sended=0) AND not(@curator_id is null) begin
		update DOGOVORS$REG set isp_sended = @result_send where id = @id
		select @curator_id	
	end else begin
		update DOGOVORS$REG set isp_sended = @result_send where id = @id
		select 'error'	
	end
   

    
END