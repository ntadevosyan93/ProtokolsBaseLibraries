CREATE TABLE [dbo].[SSMP$PRINTERS_SPR] (
    [id]     INT           IDENTITY (1, 1) NOT NULL,
    [text]   VARCHAR (150) NULL,
    [device] INT           NULL,
    CONSTRAINT [PK_SSMP$PRINTERS_SPR] PRIMARY KEY CLUSTERED ([id] ASC)
);

