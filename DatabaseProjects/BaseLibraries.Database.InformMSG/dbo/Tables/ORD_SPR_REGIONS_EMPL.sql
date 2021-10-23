CREATE TABLE [dbo].[ORD$SPR_REGIONS_EMPL] (
    [id]         INT          IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME     CONSTRAINT [DF_ORD$SPR_REGIONS_EMPL_date_in] DEFAULT (getdate()) NULL,
    [user_in]    VARCHAR (50) NULL,
    [idm_region] INT          NULL,
    [idm_empl]   INT          NULL,
    CONSTRAINT [PK_ORD$SPR_REGIONS_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

