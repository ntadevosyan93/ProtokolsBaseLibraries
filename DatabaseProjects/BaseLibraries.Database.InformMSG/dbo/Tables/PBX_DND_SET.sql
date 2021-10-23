CREATE TABLE [dbo].[PBX$DND_SET] (
    [id]              INT      IDENTITY (1, 1) NOT NULL,
    [phone]           SMALLINT NULL,
    [dnd_activated]   DATETIME CONSTRAINT [DF_PBX$DND_SET_dnd_activated] DEFAULT (getdate()) NULL,
    [dnd_deactivated] DATETIME NULL,
    [idm_empl_act]    INT      NULL,
    [idm_empl_deact]  INT      NULL,
    [out_time]        DATETIME NULL,
    CONSTRAINT [PK_PBX$DND_SET] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_PBX$DND_SET]
    ON [dbo].[PBX$DND_SET]([phone] ASC);

