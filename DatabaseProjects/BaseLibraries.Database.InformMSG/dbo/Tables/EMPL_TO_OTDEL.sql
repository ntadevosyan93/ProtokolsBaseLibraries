CREATE TABLE [dbo].[EMPL_TO_OTDEL] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [idm_empl]  INT          NULL,
    [otdel]     VARCHAR (50) NULL,
    [idm_otdel] INT          NULL,
    [sogl]      BIT          NULL,
    CONSTRAINT [PK_EMPL_TO_OTDEL] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_EMPL_TO_OTDEL_1]
    ON [dbo].[EMPL_TO_OTDEL]([idm_empl] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EMPL_TO_OTDEL]
    ON [dbo].[EMPL_TO_OTDEL]([idm_empl] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[EMPL_TO_OTDEL] TO PUBLIC
    AS [dbo];

