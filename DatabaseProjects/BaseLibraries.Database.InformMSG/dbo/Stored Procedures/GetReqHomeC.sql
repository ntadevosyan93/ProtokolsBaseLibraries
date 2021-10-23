-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetReqHomeC]

@user_name varchar(50), 
	@module varchar(50), 
	--@db_name varchar(50), 
	@db_table varchar(50), 
	@db_table_id int
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)
SET NOCOUNT ON;

SELECT * 
FROM View$MSG 
WHERE
			( 
					View$MSG.module=@module AND 
					--View$MSG.db_name=@db_name AND 
					View$MSG.db_table=@db_table AND 
					View$MSG.db_table_id=@db_table_id AND 
					View$MSG.del=0
			)
ORDER BY date_in desc
	
END