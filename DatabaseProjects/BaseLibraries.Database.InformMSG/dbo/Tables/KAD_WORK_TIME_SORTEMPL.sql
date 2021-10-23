CREATE TABLE [dbo].[KAD$WORK_TIME_SORTEMPL] (
    [id]          INT IDENTITY (1, 1) NOT NULL,
    [idm_curator] INT NULL,
    [idm_empl]    INT NULL,
    [number]      INT NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_SORTEMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

