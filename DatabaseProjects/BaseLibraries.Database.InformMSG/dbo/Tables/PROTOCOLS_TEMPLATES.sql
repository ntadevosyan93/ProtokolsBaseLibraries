CREATE TABLE [dbo].[PROTOCOLS$TEMPLATES] (
    [id]        INT             IDENTITY (1, 1) NOT NULL,
    [text]      VARCHAR (250)   NULL,
    [blob_file] VARCHAR (MAX)   NULL,
    [blob]      VARBINARY (MAX) NULL,
    CONSTRAINT [PK_PROTOCOLS$TEMPLATES] PRIMARY KEY CLUSTERED ([id] ASC)
);

