CREATE TABLE [dbo].[SSMP$WORKPLACES_PHONES] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [guid]        VARCHAR (50) CONSTRAINT [DF_SSMP$WORKPLACES_PHONES_guid] DEFAULT (newid()) NULL,
    [phone]       VARCHAR (50) NULL,
    [phone2]      VARCHAR (50) NULL,
    [phone3]      VARCHAR (50) NULL,
    [phone4]      VARCHAR (50) NULL,
    [description] VARCHAR (50) NULL,
    CONSTRAINT [PK_SSMP$WORKPLACES_PHONES] PRIMARY KEY CLUSTERED ([id] ASC)
);

