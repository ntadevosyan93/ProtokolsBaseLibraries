CREATE TABLE [dbo].[API$MODULE] (
    [id]        INT            IDENTITY (1, 1) NOT NULL,
    [guid]      CHAR (36)      CONSTRAINT [DF_API$MODULE_guid] DEFAULT (newid()) NULL,
    [StoreProc] VARCHAR (150)  NULL,
    [srv_addr]  VARCHAR (50)   NULL,
    [srv_login] VARCHAR (50)   NULL,
    [srv_pass]  VARCHAR (50)   NULL,
    [srv_bd]    VARCHAR (50)   NULL,
    [comments]  VARCHAR (1024) NULL,
    CONSTRAINT [PK_API$MODULE] PRIMARY KEY CLUSTERED ([id] ASC)
);

