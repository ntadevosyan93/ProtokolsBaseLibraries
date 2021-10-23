CREATE TABLE [dbo].[RM$OS$BILLING_AGREEMENT_HISTORY] (
    [id]          INT           NOT NULL,
    [date_in]     DATETIME      CONSTRAINT [DF_RM$OS$BILLING_AGREEMENT_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [user_in]     VARCHAR (150) NULL,
    [IsHand]      INT           CONSTRAINT [DF_RM$OS$BILLING_AGREEMENT_HISTORY_IsHand] DEFAULT ((0)) NULL,
    [idm_empl]    INT           NULL,
    [idm_otdel]   INT           NULL,
    [text_reason] VARCHAR (MAX) NULL,
    [idm_reason]  SMALLINT      NULL,
    [idm_bill]    INT           NULL,
    [date_posted] DATETIME      NULL,
    [ip_reason]   VARCHAR (50)  NULL,
    [date_reason] DATETIME      NULL,
    [user_reason] VARCHAR (50)  NULL,
    [del]         INT           CONSTRAINT [DF_RM$OS$BILLING_AGREEMENT_HISTORY_del] DEFAULT ((0)) NULL
);

