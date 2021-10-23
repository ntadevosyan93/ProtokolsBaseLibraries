CREATE TABLE [dbo].[KAD$WORK_TIME_NORMA] (
    [id]         INT      IDENTITY (1, 1) NOT NULL,
    [date_mount] DATETIME NULL,
    [idm_empl]   INT      NULL,
    [hours]      INT      NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_NORMA] PRIMARY KEY CLUSTERED ([id] ASC)
);

