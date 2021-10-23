CREATE TABLE [dbo].[RM$INVOICE] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_RM$INVOICE_date_in] DEFAULT (getdate()) NULL,
    [user_in]      VARCHAR (50) NULL,
    [idm_partner]  INT          NULL,
    [doc_date]     DATETIME     NULL,
    [doc_number]   VARCHAR (50) NULL,
    [del]          TINYINT      CONSTRAINT [DF_RM$INVOICE_del] DEFAULT ((0)) NULL,
    [type_many]    TINYINT      CONSTRAINT [DF_RM$INVOICE_type_many] DEFAULT ((1)) NULL,
    [idm_task]     INT          NULL,
    [idm_contract] INT          NULL,
    CONSTRAINT [PK_RM$INVOICE] PRIMARY KEY CLUSTERED ([id] ASC)
);

