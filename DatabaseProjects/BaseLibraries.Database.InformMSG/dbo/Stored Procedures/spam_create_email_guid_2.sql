-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spam_create_email_guid_2]
	-- Add the parameters for the stored procedure here
	@List AS dbo.EmailListFrom1C_2 READONLY
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 
 
 
 

insert into spam_email_compare (email)
SELECT email1c FROM @List where email1c not in (select email from spam_email_compare with (nolock) where email = email1c)


update spam_email_compare set idm_1c = (select top(1) idm_1c from @List where email1c = email) where idm_1c is null
--	declare @c int;
-- set @c = 0;
	
	--select @c=COUNT(id) from spam_email_compare where email = @email
	
	--if (@c=0) begin
	
--		insert into spam_email_compare (email) values (@email)
	
	--end

	--select guid from spam_email_compare where email = @email

END