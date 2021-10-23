-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMsgByModuleOrUser]
	@user_name varchar(50), 
	@module varchar(50), 
	--@db_name varchar(50), 
	@db_table varchar(50), 
	@db_table_id int
AS
BEGIN
set @user_name=ltrim(rtrim(@user_name))
declare @idm_user int
select @idm_user=KAD$EMPLOYEE.id from KAD$EMPLOYEE  with (nolock) where UPPER(KAD$EMPLOYEE.login_ad)=UPPER(@user_name)
SET NOCOUNT ON;

SELECT * 
FROM View$MSG  with (nolock) 
WHERE
			( 
					View$MSG.module=@module AND 
					--View$MSG.db_name=@db_name AND 
					View$MSG.db_table=@db_table AND 
					View$MSG.db_table_id=@db_table_id AND 
					View$MSG.del=0
			) AND (
			ltrim(rtrim(View$MSG.user_in))=@user_name OR
			View$MSG.to_user=@idm_user OR
			View$MSG.to_user is null		
			)
	 order by date_in desc
END