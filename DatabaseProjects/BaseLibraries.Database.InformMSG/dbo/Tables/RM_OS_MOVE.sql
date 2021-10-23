CREATE TABLE [dbo].[RM$OS$MOVE] (
    [id]                 INT           IDENTITY (1, 1) NOT NULL,
    [date_in]            DATETIME      CONSTRAINT [DF_RM$OS$MOVE_date_in] DEFAULT (getdate()) NULL,
    [user_in]            VARCHAR (50)  NULL,
    [idm_rm_os]          INT           NULL,
    [idm_departments]    INT           NULL,
    [idm_responsible]    INT           NULL,
    [del]                TINYINT       CONSTRAINT [DF_RM$OS$MOVE_del] DEFAULT ((0)) NOT NULL,
    [date_fact]          DATETIME      NULL,
    [descript]           VARCHAR (512) NULL,
    [room]               VARCHAR (100) NULL,
    [idm_depart_offices] INT           NULL,
    [user_cur]           VARCHAR (50)  NULL,
    CONSTRAINT [PK_RM$OS$MOVE] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[rm_os_move_updated]
   ON  [dbo].[RM$OS$MOVE]
   AFTER UPDATE, INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	
	DECLARE @idm_rm_os INT
	DECLARE @idm_departments INT
	DECLARE @idm_responsible INT
	DECLARE @idm_depart_offices INT

    SELECT @idm_departments = D.idm_departments, @idm_responsible = D.idm_responsible, @idm_rm_os = D.idm_rm_os,@idm_depart_offices=idm_depart_offices
    FROM inserted D
    
    UPDATE RM$OS set idm_otdel = @idm_departments, idm_responsible=@idm_responsible, idm_depart_offices=@idm_depart_offices where id = @idm_rm_os

	SET NOCOUNT ON;
	    
	-- Insert statements for trigger here

END