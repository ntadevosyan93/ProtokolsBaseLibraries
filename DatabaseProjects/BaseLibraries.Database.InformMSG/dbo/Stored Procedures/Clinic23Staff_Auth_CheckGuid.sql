-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Clinic23Staff_Auth_CheckGuid]
	@guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @count int

	select @count = COUNT(id) from KAD$EMPLOYEE with (NOLOCK) where guid_web = @guid and (del = 0 or del is null) and (actual = 1 or actual is null)

	if (not @count is null) begin

	
		update KAD$EMPLOYEE set auth_mobile_last_date = GETDATE() where guid_web = @guid

	end

	select @count

END