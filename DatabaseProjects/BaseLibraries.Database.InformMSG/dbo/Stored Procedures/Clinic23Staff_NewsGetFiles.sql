-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Clinic23Staff_NewsGetFiles] 
@guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



	SELECT 'https://lk.clinic23.ru:50511/clinic23staffapi/FileDownload.aspx?guid='+ guid as link, file_name,

	 

(CASE RIGHT(FILE_NAME,4)   
    WHEN 'docx' THEN 1
	WHEN 'xlsx' THEN 1
	WHEN '.doc' THEN 1
	WHEN '.xls' THEN 1
	WHEN '.rtf' THEN 1
	WHEN '.odt' THEN 1
	WHEN '.pdf' THEN 1
    ELSE 0
END   ) as pdf

	FROM FILE_STOR with(nolock)
	where module = 'workflow_news' and db_table_id = (select id from NEWS with(nolock) where guid = @guid)
	ORDER BY id 


END