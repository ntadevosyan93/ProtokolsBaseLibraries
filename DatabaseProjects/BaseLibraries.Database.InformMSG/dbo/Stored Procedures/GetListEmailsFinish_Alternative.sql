-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetListEmailsFinish_Alternative
	-- Add the parameters for the stored procedure here
	@List AS dbo.EmailListFrom1C_2 READONLY,
	@msg_guid varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
select email1c as email,  (select top(1) guid from spam_email_compare where email = email1c) as guid
from @List 
where 
email1c in (select email from spam_email_compare)
and 
email1c not in (select email from spam_black_list with (nolock)) 
and email1c not in (select email from spam_sended with (nolock) where msg_guid=@msg_guid)
 
 
END