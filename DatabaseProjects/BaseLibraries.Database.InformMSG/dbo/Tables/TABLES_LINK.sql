CREATE TABLE [dbo].[TABLES_LINK] (
    [id]                     INT           IDENTITY (1, 1) NOT NULL,
    [table_left_name]        VARCHAR (100) NULL,
    [table_left_id]          INT           NULL,
    [table_left_id_varchar]  VARCHAR (50)  NULL,
    [table_right_name]       VARCHAR (100) NULL,
    [table_right_id]         INT           NULL,
    [table_right_id_varchar] VARCHAR (50)  NULL,
    CONSTRAINT [PK_TABLES_LINK] PRIMARY KEY CLUSTERED ([id] ASC)
);

