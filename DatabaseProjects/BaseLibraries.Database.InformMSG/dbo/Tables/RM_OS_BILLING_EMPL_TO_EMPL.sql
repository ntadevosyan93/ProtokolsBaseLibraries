CREATE TABLE [dbo].[RM$OS$BILLING_EMPL_TO_EMPL] (
    [id]               INT          IDENTITY (1, 1) NOT NULL,
    [user_in]          VARCHAR (50) NULL,
    [date_in]          DATETIME     CONSTRAINT [DF_RM$BILLING_EMPL_to_EMPL_date_in] DEFAULT (getdate()) NULL,
    [idm_curator_empl] INT          NULL,
    [idm_link_empl]    INT          NULL,
    [del]              INT          CONSTRAINT [DF_RM$BILLING_EMPL_to_EMPL_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_RM$BILLING_EMPL_to_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_EMPL_TO_EMPL_2]
    ON [dbo].[RM$OS$BILLING_EMPL_TO_EMPL]([del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_EMPL_TO_EMPL_1]
    ON [dbo].[RM$OS$BILLING_EMPL_TO_EMPL]([idm_link_empl] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_EMPL_TO_EMPL]
    ON [dbo].[RM$OS$BILLING_EMPL_TO_EMPL]([idm_curator_empl] ASC);

