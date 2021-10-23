CREATE TABLE [dbo].[PBX$CC$SPR$TIME] (
    [id]         INT      IDENTITY (1, 1) NOT NULL,
    [work_start] DATETIME NULL,
    [work_stop]  DATETIME NULL,
    CONSTRAINT [PK_PBX$CC$SPR$TIME] PRIMARY KEY CLUSTERED ([id] ASC)
);

