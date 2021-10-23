CREATE TABLE [dbo].[RM$BUDGET] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [date_in]          DATETIME      CONSTRAINT [DF_RM$BUDGET_date_in] DEFAULT (getdate()) NULL,
    [user_in]          VARCHAR (50)  NULL,
    [idm_Parent_group] INT           NULL,
    [idm_Child_group]  INT           NULL,
    [description]      VARCHAR (450) NULL,
    [month]            INT           NULL,
    [summ]             FLOAT (53)    CONSTRAINT [DF_RM$BUDGET_summ] DEFAULT ((0)) NULL,
    [idm_curator]      INT           NULL,
    [idm_department]   INT           NULL,
    [del]              INT           CONSTRAINT [DF_RM$BUDGET_del] DEFAULT ((0)) NULL,
    [ParentID]         INT           NULL,
    CONSTRAINT [PK_RM$BUDGET] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RM$BUDGET_2]
    ON [dbo].[RM$BUDGET]([idm_department] ASC, [idm_Parent_group] ASC, [idm_Child_group] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$BUDGET_1]
    ON [dbo].[RM$BUDGET]([idm_department] ASC, [idm_Parent_group] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$BUDGET]
    ON [dbo].[RM$BUDGET]([idm_department] ASC);


GO
CREATE trigger  [dbo].[RM$BUDGET_AfterInserted]
   ON  [dbo].[RM$BUDGET]
   AFTER  Insert
   as
    declare @new_val int, @old_val int, @idm_parent int, @idm_GrandParent int
   begin
     SET NOCOUNT ON;

	insert into [RM$BUDGET_HISTORY] select * from deleted 
	select @idm_parent=[ParentID],  @new_val = summ from inserted 

	if(@idm_parent is not null)
	begin
	update  [RM$BUDGET] set summ=summ+@new_val where id = @idm_parent	
    select @idm_parent=[ParentID] from [RM$BUDGET] where id = @idm_parent 
	end
	
	
	END;
GO
CREATE trigger  [dbo].[RM$BUDGET_AfterDelete]
   ON  [dbo].[RM$BUDGET]
   AFTER  Delete
   as
    declare @new_val int, @old_val int, @idm_parent int, @idm_GrandParent int
   begin
     SET NOCOUNT ON;

	select @old_val = summ,@idm_parent=[ParentID] from deleted 
	select @idm_GrandParent=[ParentID] from [RM$BUDGET] where id = @idm_parent 
	
	update  [RM$BUDGET] set summ=summ-@old_val where id = @idm_parent

	update  [RM$BUDGET] set summ=summ-@old_val where id = @idm_GrandParent
	END;
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER dbo.RM$BUDGET_AfterUpdate
   ON  dbo.RM$BUDGET
   AFTER  UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	 declare @new_val float, @old_val float, @idm_parent int, @idm_GrandParent int
	
    insert into [RM$BUDGET_HISTORY] select * from deleted 
	
	select @old_val = summ from deleted 
	select @idm_parent=[ParentID],  @new_val = summ from inserted 
	select @idm_GrandParent=[ParentID] from [RM$BUDGET] where id = @idm_parent 
	 if(@old_val != @new_val)
	begin
	update  [RM$BUDGET] set summ=summ-@old_val+@new_val where id = @idm_parent

	update  [RM$BUDGET] set summ=summ-@old_val+@new_val where id = @idm_GrandParent
	end
END