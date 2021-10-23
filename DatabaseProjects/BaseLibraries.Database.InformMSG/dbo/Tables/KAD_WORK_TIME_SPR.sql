CREATE TABLE [dbo].[KAD$WORK_TIME_SPR] (
    [id]         INT      IDENTITY (1, 1) NOT NULL,
    [idm_empl]   INT      NULL,
    [work_start] DATETIME NULL,
    [work_stop]  DATETIME NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_SPR] PRIMARY KEY CLUSTERED ([id] ASC)
);

