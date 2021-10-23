-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE pbxPhoneVipSync
	-- Add the parameters for the stored procedure here
	@phone varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @c int;
	
	select @c = COUNT(id) from PBX$PHONE_VIP where phone = @phone
	
	if (@c=0) begin
	
	insert into PBX$PHONE_VIP (phone) VALUES (@phone)
	end
END