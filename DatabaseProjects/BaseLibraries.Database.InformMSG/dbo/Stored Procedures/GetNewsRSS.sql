-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetNewsRSS
	-- Add the parameters for the stored procedure here
	@phone varchar(10),
	@pincode varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from news with (nolock) order by id desc
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GetNewsRSS] TO [NewsRSS]
    AS [dbo];

