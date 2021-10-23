CREATE TABLE [dbo].[RM$OS$BILLING_INVOICE] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [date_in]        DATETIME     CONSTRAINT [DF_RM$OS$BILLING_INVOICE_date_in] DEFAULT (getdate()) NULL,
    [user_in]        VARCHAR (50) NULL,
    [idm_billing]    INT          NULL,
    [invoice_number] VARCHAR (50) NULL,
    [invoice_date]   DATETIME     NULL,
    [user_cur]       VARCHAR (50) NULL,
    [idm_partner]    INT          NULL,
    [idm_type]       INT          NULL,
    [del]            INT          CONSTRAINT [DF_RM$OS$BILLING_INVOICE_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_RM$OS$BILLING_INVOICE] PRIMARY KEY CLUSTERED ([id] ASC)
);

