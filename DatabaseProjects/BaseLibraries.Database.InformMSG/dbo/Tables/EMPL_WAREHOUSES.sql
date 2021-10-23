CREATE TABLE [dbo].[EMPL_WAREHOUSES] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_EMPL_WAREHOUSES_date_in] DEFAULT (getdate()) NULL,
    [user_in]      VARCHAR (50) NULL,
    [idm_empl]     INT          NULL,
    [idm_1C_SC554] VARCHAR (10) NULL,
    [del]          INT          CONSTRAINT [DF_EMPL_WAREHOUSES_del] DEFAULT ((0)) NULL,
    [date_cur]     DATETIME     NULL,
    [user_cur]     VARCHAR (50) NULL,
    CONSTRAINT [PK_EMPL_WAREHOUSES] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_EMPL_WAREHOUSES_1]
    ON [dbo].[EMPL_WAREHOUSES]([idm_empl] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_EMPL_WAREHOUSES]
    ON [dbo].[EMPL_WAREHOUSES]([del] ASC, [idm_1C_SC554] ASC);

