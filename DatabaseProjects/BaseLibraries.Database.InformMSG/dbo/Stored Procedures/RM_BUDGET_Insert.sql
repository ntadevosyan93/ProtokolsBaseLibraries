-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[RM$BUDGET_Insert]
	-- Add the parameters for the stored procedure here
	@idm_department int,
	@idm_Child_group int,
	@description varchar(450),
	@month int,
	@summ float,
	@idm_curator int
,@user_in varchar(50)
,@ParentID int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--if(@ParentID is null)
--begin
	declare @c int,@ParentID_ int
	--проверим есть ли в этом месяце записи такого отдела
	select @c=id from dbo.RM$BUDGET where idm_department=@idm_department and month=@month and ParentID is null and del=0
	if(@c is not null)
		begin
			--Да: запомним Id родителя
			select @ParentID_=id from dbo.RM$BUDGET where ParentID=@c and idm_Child_group =@idm_Child_group and del=0
	   -- проверим есть ли запись в этом месяце с таким родителем и группой	
			if (@ParentID_ is null)
			--Нет: создадим запись
				begin --здесь запись только по  группе
				insert into dbo.RM$BUDGET (user_in,[description],[month],idm_department,ParentID,idm_Child_group)
				 (select @user_in,[text],@month,@idm_department,@c,@idm_Child_group from dbo.[RM$BUDGET$GROUPINGS] where id= @idm_Child_group)
				set @ParentID_ =SCOPE_IDENTITY()
				end			
		end
	 else
		begin
	--Нет: создадим запись и запомним id 
	--здесь запись по подразделению и еще одна по группе
	insert into dbo.RM$BUDGET (user_in,[description],[month],idm_department,ParentID)
				 (select @user_in,[text],@month,@idm_department,NULL from dbo.[DEPARTMENTS] where id=@idm_department)
				set @c =SCOPE_IDENTITY()

	insert into dbo.RM$BUDGET (user_in,[description],[month],idm_department,ParentID,idm_Child_group)
				 (select @user_in,[text],@month,@idm_department,@c,@idm_Child_group from dbo.[RM$BUDGET$GROUPINGS] where id= @idm_Child_group)
				set @ParentID_ =SCOPE_IDENTITY()
		end
 set @ParentID=@ParentID_
--end
	-- создадим запись исходя из Id родителя
	insert into dbo.RM$BUDGET (user_in,[description],[month],idm_department,ParentID,summ,idm_Child_group,idm_curator)
				 values( @user_in,@description,@month,@idm_department,@ParentID ,@summ,@idm_Child_group,@idm_curator)

END