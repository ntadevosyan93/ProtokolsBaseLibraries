-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEmplMailALL_ForXML]
	-- Add the parameters for the stored procedure here
	@idm_owner int,
	@idm_klass int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	declare @AllEmpl varchar(max)
	select @AllEmpl = cast ((select cast(idm_empl as varchar) + ',' AS 'data()' 
	from [EMPL_MAILING_ALL]  with (nolock) where  idm_klass=@idm_klass and del=0 
			and (idm_owner =@idm_owner or idm_owner is null) FOR XML PATH(''))  AS VARCHAR(MAX)) 
	select LTRIM(RTRIM(@AllEmpl))
END