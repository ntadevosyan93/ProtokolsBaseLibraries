-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.GetAuthKADSEMPLOYEEbyGuid	
	@guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT top 1 email,[password_email] FROM [dbo].[KAD$EMPLOYEE] with (nolock) where guid_iclinic=@guid
END