CREATE TABLE [dbo].[VECTOR_USERS] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [name]     VARCHAR (50)  NULL,
    [guid]     VARCHAR (50)  CONSTRAINT [DF_VECTOR_USERS_guid] DEFAULT (newid()) NULL,
    [password] VARCHAR (100) CONSTRAINT [DF_VECTOR_USERS_password] DEFAULT (newid()) NULL,
    [ip]       VARCHAR (50)  NULL,
    CONSTRAINT [PK_VECTOR_USERS] PRIMARY KEY CLUSTERED ([id] ASC)
);

