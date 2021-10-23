-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[_GetProjects]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
   select _projects.*, _projects_groups.text as area, _projects_types.text as language
   from _projects  with (nolock) 
   left join _projects_groups  with (nolock) on _projects_groups.id = _projects.gr
   left join _projects_types with (nolock)  on _projects_types.id = _projects.type
   
END