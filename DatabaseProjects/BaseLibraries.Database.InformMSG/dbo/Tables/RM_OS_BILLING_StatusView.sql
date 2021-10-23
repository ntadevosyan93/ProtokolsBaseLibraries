CREATE TABLE [dbo].[RM$OS$BILLING_StatusView] (
    [id]               INT IDENTITY (1, 1) NOT NULL,
    [idm_empl]         INT NULL,
    [status_id]        INT CONSTRAINT [DF_RM$OS$BILLING_StatusView_status_id] DEFAULT ((0)) NULL,
    [idm_owner]        INT NULL,
    [idm_WithoutOwner] INT NULL,
    CONSTRAINT [PK_RM$OS$BILLING_StatusView] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_StatusView_3]
    ON [dbo].[RM$OS$BILLING_StatusView]([status_id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_StatusView_2]
    ON [dbo].[RM$OS$BILLING_StatusView]([idm_WithoutOwner] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_StatusView_1]
    ON [dbo].[RM$OS$BILLING_StatusView]([idm_owner] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_StatusView]
    ON [dbo].[RM$OS$BILLING_StatusView]([idm_empl] ASC);

