CREATE TABLE [dbo].[IT_NOTIFICATIONS_TABLE] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [text]          VARCHAR (150) NULL,
    [db_table_name] VARCHAR (150) NULL,
    CONSTRAINT [PK_IT_NOTIFICATIONS_TABLE] PRIMARY KEY CLUSTERED ([id] ASC)
);

