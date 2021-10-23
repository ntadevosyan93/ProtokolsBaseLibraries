-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Clinic23Staff_Feedback_MailingList
	-- Add the parameters for the stored procedure here
	@idm_feedback int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @idm_categories int
	select  @idm_categories=idm_title from CLINIC23STUFF_FEEDBACK where id=@idm_feedback

	--получим емейлы по сотрудникам
	select k.email from KAD$EMPLOYEE k with (nolock) 
	inner join CLINIC23STUFF_FEEDBACK_MAIL_LIST m on m.idm_empl=k.id
	where m.idm_categories=@idm_categories
	union 
	--и абсолютные емейлы
	select email from CLINIC23STUFF_FEEDBACK_MAIL_LIST with (nolock)  
	where idm_categories=@idm_categories

END