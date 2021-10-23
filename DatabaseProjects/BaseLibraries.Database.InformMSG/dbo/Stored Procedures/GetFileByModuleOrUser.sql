CREATE PROCEDURE [dbo].[GetFileByModuleOrUser]
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
FROM FILE_STOR  with (nolock) 
WHERE
			( 
					FILE_STOR.module=@module AND 					
					FILE_STOR.db_table=@db_table AND 
					FILE_STOR.db_table_id=@db_table_id AND 
					FILE_STOR.del=0
			) AND (
			ltrim(rtrim(FILE_STOR.user_in))=@user_name 				
			)
	
END