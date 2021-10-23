-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckLoginInfo]
	-- Add the parameters for the stored procedure here
	@login varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select top(1) id,  login_ad, 
	
	(CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL THEN name ELSE '' END) + ' ' + (CASE WHEN otch IS NOT NULL 
THEN otch ELSE '' END) AS fio_full, 

(CASE WHEN fam IS NOT NULL THEN fam ELSE '' END) + ' ' + (CASE WHEN name IS NOT NULL THEN LEFT(name, 1) ELSE ' ' END) 
+ '.' + (CASE WHEN otch IS NOT NULL THEN LEFT(otch, 1) ELSE '' END) + '.' AS fio_short

	from 
	KAD$EMPLOYEE  with (nolock) 
	where (del=0 or del is null) and (actual = 1) and realId is null
     and 
      UPPER(login_ad) = 'VIPCG\'+ UPPER(@login) OR UPPER(login_ad) = UPPER(@login)
END