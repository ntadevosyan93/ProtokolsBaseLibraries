-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[GetIsGroupMedicine_Order]
	-- Add the parameters for the stored procedure here
	@idm int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @cc int
	select @cc=count(id) from MEDICINES_TO_ORDER with (nolock) where idm_parent is null and id=@idm and del=0
	if(@cc!=0) select '1'
	else
		begin
			select @cc =count(id) from MEDICINES_TO_ORDER with (nolock) where idm_parent =@idm and del=0 
			if(@cc>=1) select '2'
			else select '0'
		end
	
END