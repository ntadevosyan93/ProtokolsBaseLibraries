CREATE TABLE [dbo].[RD$TASK] (
    [id]                INT             IDENTITY (1, 1) NOT NULL,
    [date_in]           DATETIME        CONSTRAINT [DF_RD$TASK_date_in] DEFAULT (getdate()) NULL,
    [user_in]           VARCHAR (50)    NULL,
    [tema]              VARCHAR (250)   NULL,
    [text]              VARCHAR (MAX)   NULL,
    [status]            INT             NULL,
    [date_start]        DATETIME        NULL,
    [date_stop]         DATETIME        NULL,
    [day_stop]          SMALLINT        NULL,
    [date_fact_stop]    DATETIME        NULL,
    [vazhnost]          TINYINT         CONSTRAINT [DF_RD$TASK_vazhnost] DEFAULT ((2)) NULL,
    [del]               TINYINT         CONSTRAINT [DF_RD$TASK_del] DEFAULT ((0)) NOT NULL,
    [idm_isp]           INT             NULL,
    [idm_kontrol]       INT             NULL,
    [idm_project]       INT             NULL,
    [idm_task]          INT             NULL,
    [cost]              NUMERIC (18, 2) NULL,
    [cost_fact]         NUMERIC (18, 2) NULL,
    [idm_author]        INT             NULL,
    [guid]              VARCHAR (50)    CONSTRAINT [DF_RD$TASK_guid] DEFAULT (newid()) NULL,
    [idm_departments]   INT             NULL,
    [idm_otdel]         INT             NULL,
    [user_cor]          VARCHAR (50)    NULL,
    [date_cor]          DATETIME        NULL,
    [idm_algoritm_step] INT             NULL,
    [idm_task_init]     INT             NULL,
    [inform_send]       INT             CONSTRAINT [DF_RD$TASK_inform_send] DEFAULT ((0)) NULL,
    [arhive]            INT             CONSTRAINT [DF_RD$TASK_arhive] DEFAULT ((0)) NULL,
    [importantly]       INT             NULL,
    CONSTRAINT [PK_RD$TASK] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RD$TASK_2]
    ON [dbo].[RD$TASK]([date_in] DESC);


GO
CREATE NONCLUSTERED INDEX [IX_RD$TASK_1]
    ON [dbo].[RD$TASK]([idm_isp] ASC, [idm_author] ASC, [idm_kontrol] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_RD$TASK]
    ON [dbo].[RD$TASK]([guid] ASC);


GO
CREATE TRIGGER [dbo].[RD$TASK_AfterUpdate]
   ON  [dbo].[RD$TASK]
   AFTER UPDATE,insert
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
insert into RD$TASK_HISTORY select * from inserted 
	--update SSMP$MAIN set date_cor=getdate() where id=@idm
	--select @status_o=status from deleted
	--if (@status_o<>@status_i)
	--update REQ set date_last_update=getdate() where id=@id
    -- Insert statements for trigger here

END