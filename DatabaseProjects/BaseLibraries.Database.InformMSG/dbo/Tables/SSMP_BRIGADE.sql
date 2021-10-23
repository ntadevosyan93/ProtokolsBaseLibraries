CREATE TABLE [dbo].[SSMP$BRIGADE] (
    [id]      INT          IDENTITY (1, 1) NOT NULL,
    [phone]   VARCHAR (50) NULL,
    [mesto]   VARCHAR (50) NULL,
    [printer] INT          NULL,
    CONSTRAINT [PK_SSMP$BRIGADE] PRIMARY KEY CLUSTERED ([id] ASC)
);

