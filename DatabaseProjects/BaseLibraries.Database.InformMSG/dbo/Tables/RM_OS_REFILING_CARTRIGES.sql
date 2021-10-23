CREATE TABLE [dbo].[RM$OS$REFILING_CARTRIGES] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [idm_cartridges] INT          NULL,
    [date_in]        DATETIME     CONSTRAINT [DF_RM$OS$REFILING_CARTRIGES_date_in] DEFAULT (getdate()) NULL,
    [user_in]        VARCHAR (50) NULL,
    [count_toner]    INT          NULL,
    [idm_services]   INT          NULL,
    [del]            INT          CONSTRAINT [DF_RM$OS$REFILING_CARTRIGES_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_RM$OS$REFILING_CARTRIGES] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE trigger  [dbo].[RM$OS$REFILING_CARTRIGES_deleted]
   ON  [dbo].[RM$OS$REFILING_CARTRIGES]
   after delete
   as
    declare @new_val int, @old_val int,@idm_toner int
   begin
     SET NOCOUNT ON;
	select @old_val = count_toner, @idm_toner=c.idm_toner from deleted a
	 left join RM$OS$CARTRIDGES c on c.id= a.idm_cartridges
	
	update  [RM$OS$TONER] set _count=_count+@old_val where id = @idm_toner
	
	END;
GO
CREATE TRIGGER [dbo].[RM$OS$REFILING_CARTRIGES_inserted]
   ON  [dbo].[RM$OS$REFILING_CARTRIGES]
   
   AFTER INSERT
   AS 
   declare @new_val int, @old_val int,@idm_toner int
BEGIN    
    SET NOCOUNT ON;
	
	insert into [RM$OS$REFILING_CARTRIGES_HISTORY] select * from inserted 
	
	select  @new_val=count_toner, @idm_toner=c.idm_toner from inserted a
	 left join RM$OS$CARTRIDGES c on c.id= a.idm_cartridges

	update  [RM$OS$TONER] set  _count=_count-@new_val where id = @idm_toner
	END;
GO
CREATE TRIGGER [dbo].[RM$OS$REFILING_CARTRIGES_updated]
   ON  [dbo].[RM$OS$REFILING_CARTRIGES]
   
   AFTER update
   AS 
   BEGIN
   declare @new_val int, @old_val int,@idm_toner int
	
   insert into [RM$OS$REFILING_CARTRIGES_HISTORY] select * from deleted 
	
	select @old_val = count_toner, @idm_toner=c.idm_toner from deleted a
	 left join RM$OS$CARTRIDGES c on c.id= a.idm_cartridges
	 select  @new_val = count_toner from inserted 

	 if(@old_val != @new_val)
	begin
	update  [RM$OS$TONER] set _count=_count+@old_val-@new_val where id = @idm_toner
	end
--	insert into Test_book (old_val, new_val,idm_toner)values(@old_val,@new_val,@idm_toner)
	
	END;