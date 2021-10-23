CREATE TABLE [dbo].[LOG] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [user_in]    VARCHAR (50)  NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_LOG_date_in_1] DEFAULT (getdate()) NULL,
    [table_name] VARCHAR (50)  NULL,
    [idm_table]  INT           NULL,
    [type]       VARCHAR (50)  NULL,
    [message]    VARCHAR (MAX) NULL,
    CONSTRAINT [PK_LOG] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_LOG_3]
    ON [dbo].[LOG]([table_name] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LOG_2]
    ON [dbo].[LOG]([idm_table] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LOG_1]
    ON [dbo].[LOG]([date_in] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_LOG]
    ON [dbo].[LOG]([type] ASC);

