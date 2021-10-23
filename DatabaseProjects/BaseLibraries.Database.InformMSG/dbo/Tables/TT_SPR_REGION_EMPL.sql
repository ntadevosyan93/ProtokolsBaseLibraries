CREATE TABLE [dbo].[TT$SPR_REGION_EMPL] (
    [id]         INT IDENTITY (1, 1) NOT NULL,
    [idm_region] INT NULL,
    [idm_empl]   INT NULL,
    CONSTRAINT [PK_TT$SPR_REGION_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

