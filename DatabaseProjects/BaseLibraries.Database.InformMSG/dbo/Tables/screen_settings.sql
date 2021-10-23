CREATE TABLE [dbo].[screen_settings] (
    [id]               INT IDENTITY (1, 1) NOT NULL,
    [checkUpdateTime]  INT NULL,
    [refreshImageTime] INT NULL,
    CONSTRAINT [PK_screen_settings] PRIMARY KEY CLUSTERED ([id] ASC)
);

