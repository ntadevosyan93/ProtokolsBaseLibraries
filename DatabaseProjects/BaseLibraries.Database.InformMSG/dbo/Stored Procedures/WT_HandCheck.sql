-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[WT$HandCheck] 
	-- Add the parameters for the stored procedure here
	@type int,
	@idm_empl int,
	@idm_depart int,
	@user_in varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 declare @exist int
 
 select top(1) @exist=id from KAD$WORK_TIME where  
 idm_depart = @idm_depart and 
 idm_empl = @idm_empl and 
 del=0 and 
 CAST(estimated_start as date) = CAST(GETDATE() as date) 
 
 if @exist>0 begin 
 
	if (@type=0) begin
	
		update KAD$WORK_TIME set actual_start=GETDATE(), handmark=1, user_cor=@user_in, date_cor=getdate() where id = @exist
	
	end else begin
	
		update KAD$WORK_TIME set actual_stop=GETDATE(), handmark=1, user_cor=@user_in, date_cor=getdate() where id = @exist
	
	end
	 
 end else begin

	if (@type=0) begin
	
		 insert into KAD$WORK_TIME ([user_in],[idm_empl],[estimated_start],[actual_start], [estimated_stop] ,[del]
      ,[idm_status]
      ,[idm_depart]
      ,[freeDay]
      ,[handmark])
      values (@user_in, @idm_empl, GETDATE(),GETDATE(),GETDATE(),0,1,@idm_depart,0,1)
	
	end else begin
	
		  insert into KAD$WORK_TIME ([user_in],[idm_empl],[estimated_start], [actual_start],[estimated_stop],[actual_stop],[del]
      ,[idm_status]
      ,[idm_depart]
      ,[freeDay]
      ,[handmark])
      values (@user_in, @idm_empl,GETDATE(), GETDATE(), GETDATE(),GETDATE(),0,1,@idm_depart,0,1)
	
	end
 
 end
 
 
END