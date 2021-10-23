CREATE TABLE [dbo].[RM$OS$CARTRIDGE_MOVE_LINK] (
    [id]                 INT IDENTITY (1, 1) NOT NULL,
    [idm_cartridge_move] INT NULL,
    [idm_cartridge]      INT NULL,
    [type_oper]          INT NULL,
    CONSTRAINT [PK_RM$OS$CARTRIDGE_MOVE_LINK] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE TRIGGER [dbo].[RM$OS$CARTRIDGE_MOVE_LINK_AfterUpdate]
   ON  [dbo].[RM$OS$CARTRIDGE_MOVE_LINK]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
	--declare @id int
	--declare @idm int
	--declare @status_i int
	--declare @status_o int
	--declare @dt datetime
	--select @idm=id from inserted
insert into RM$OS$CARTRIDGE_MOVE_LINK_HYSTORY select * from deleted 
	--update SSMP$MAIN set date_cor=getdate() where id=@idm
	--select @status_o=status from deleted
	--if (@status_o<>@status_i)
	--update REQ set date_last_update=getdate() where id=@id
    -- Insert statements for trigger here

END