-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Clinic23Staff_FeedBack_Insert] 
@guid varchar(50),
@title varchar(350),
@text varchar(2048),
@guid_title varchar(50) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO CLINIC23STUFF_FEEDBACK (title, text, guid_empl, idm_empl, guid_title, idm_title)
	VALUES
	(@title, @text, @guid, (SELECT TOP(1) id 
							FROM KAD$EMPLOYEE WITH (NOLOCK) WHERE guid_web = @guid), 
							@guid_title, 
							(select top(1) id 
							FROM CLINIC23STUFF_FEEDBACK_CATEGORIES WITH (NOLOCK) WHERE text = @title))

END