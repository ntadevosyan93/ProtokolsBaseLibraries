CREATE TABLE [dbo].[RM$OS$BILLING_BUDGET] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [user_in]         VARCHAR (50) NULL,
    [date_in]         DATETIME     CONSTRAINT [DF_RM$OS$BILLING_BUDGET_date_in] DEFAULT (getdate()) NULL,
    [idm_billing]     INT          NULL,
    [idm_budget]      INT          NULL,
    [idm_budgetGroup] INT          NULL,
    [idm_group]       INT          NULL,
    [idm_month]       INT          NULL,
    [idm_depart]      INT          NULL,
    [del]             INT          CONSTRAINT [DF_RM$OS$BILLING_BUDGET_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_RM$OS$BILLING_BUDGET] PRIMARY KEY CLUSTERED ([id] ASC)
);

