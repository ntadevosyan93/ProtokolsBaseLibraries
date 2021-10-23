CREATE TABLE [dbo].[PERSONAL] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [link_1c] CHAR (9)      NULL,
    [fio]     VARCHAR (500) NULL,
    [status]  SMALLINT      CONSTRAINT [DF_PERSONAL_status] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_PERSONAL] PRIMARY KEY CLUSTERED ([id] ASC)
);

