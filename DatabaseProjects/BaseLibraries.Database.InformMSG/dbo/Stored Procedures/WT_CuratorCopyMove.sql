-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE WT_CuratorCopyMove
	-- Add the parameters for the stored procedure here
	@curator_from int,
	@curator_to int,
	@idm_empl int,
	@copy int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	   
    
    if (@curator_from>0) begin    
		IF (NOT EXISTS(SELECT idm_empl FROM KAD$WORK_TIME_CURATORS where idm_curator=@curator_to and idm_empl=@idm_empl) )
		BEGIN 
			INSERT INTO KAD$WORK_TIME_CURATORS(idm_curator, idm_empl) 
			VALUES(@curator_to, @idm_empl) 
		END  
		
		if (@copy=0) begin
    
			delete from KAD$WORK_TIME_CURATORS where idm_curator = @curator_from and idm_empl = @idm_empl
      
		end
    
	end
    
    

END