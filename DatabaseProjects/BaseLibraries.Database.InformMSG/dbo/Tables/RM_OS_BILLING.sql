CREATE TABLE [dbo].[RM$OS$BILLING] (
    [id]                  INT             IDENTITY (1, 1) NOT NULL,
    [user_in]             VARCHAR (50)    NULL,
    [date_in]             DATETIME        CONSTRAINT [DF_RM$OS$BILLING_date_in] DEFAULT (getdate()) NULL,
    [date_bill]           DATETIME        NULL,
    [number]              VARCHAR (50)    NULL,
    [idm_partner]         INT             NULL,
    [idm_owner]           INT             NULL,
    [idm_isp]             INT             NULL,
    [idm_curator]         INT             NULL,
    [description]         VARCHAR (MAX)   NULL,
    [summ]                DECIMAL (18, 2) NULL,
    [summ_cy]             DECIMAL (18, 2) NULL,
    [summ_cy_type]        INT             NULL,
    [cy_rate]             FLOAT (53)      NULL,
    [percent_cy]          FLOAT (53)      NULL,
    [nds]                 DECIMAL (18, 2) NULL,
    [status]              INT             NULL,
    [idm_billing]         INT             NULL,
    [date_paid]           DATETIME        NULL,
    [nom_paid]            VARCHAR (50)    NULL,
    [send_assept]         INT             CONSTRAINT [DF_RM$OS$BILLING_send_assept] DEFAULT ((0)) NULL,
    [idm_department]      INT             NULL,
    [invoice_number]      VARCHAR (50)    NULL,
    [invoice_date]        DATETIME        NULL,
    [idm_dogovor]         INT             NULL,
    [bill_dogovor]        INT             NULL,
    [type_pay]            INT             NULL,
    [date_pay]            DATETIME        NULL,
    [date_pay_purpose]    DATETIME        NULL,
    [assept_number]       INT             NULL,
    [assept_date]         DATETIME        NULL,
    [assept_idm]          INT             NULL,
    [idm_budgetGroup]     INT             NULL,
    [idm_budget]          INT             NULL,
    [send_agree]          INT             CONSTRAINT [DF_RM$OS$BILLING_send_agree] DEFAULT ((0)) NULL,
    [idm_file_store]      INT             NULL,
    [user_cur]            VARCHAR (50)    NULL,
    [date_cur]            DATETIME        NULL,
    [del]                 INT             CONSTRAINT [DF_RM$OS$BILLING_del] DEFAULT ((0)) NULL,
    [bill_guid]           VARCHAR (50)    NULL,
    [AllowAgreeMarceting] INT             CONSTRAINT [DF_RM$OS$BILLING_AllowAgreeMarceting] DEFAULT ((0)) NULL,
    [budget_depart]       INT             NULL,
    [budget_month]        DATETIME        NULL,
    [pay_oms]             BIT             CONSTRAINT [DF_RM$OS$BILLING_pay_oms] DEFAULT ((0)) NULL,
    [IsNewStatus]         BIT             CONSTRAINT [DF_RM$OS$BILLING_IsNewStatus] DEFAULT ((1)) NULL,
    [IsNotDogovor]        BIT             NULL,
    CONSTRAINT [PK_RM$OS$BILLING] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_12]
    ON [dbo].[RM$OS$BILLING]([date_paid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_11]
    ON [dbo].[RM$OS$BILLING]([date_pay] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_10]
    ON [dbo].[RM$OS$BILLING]([date_in] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_9]
    ON [dbo].[RM$OS$BILLING]([date_bill] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_8]
    ON [dbo].[RM$OS$BILLING]([summ] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_7]
    ON [dbo].[RM$OS$BILLING]([type_pay] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_6]
    ON [dbo].[RM$OS$BILLING]([number] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_5]
    ON [dbo].[RM$OS$BILLING]([status] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_4]
    ON [dbo].[RM$OS$BILLING]([idm_partner] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_3]
    ON [dbo].[RM$OS$BILLING]([idm_owner] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_2]
    ON [dbo].[RM$OS$BILLING]([idm_isp] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_1]
    ON [dbo].[RM$OS$BILLING]([idm_department] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING]
    ON [dbo].[RM$OS$BILLING]([idm_curator] ASC);


GO
CREATE NONCLUSTERED INDEX [User]
    ON [dbo].[RM$OS$BILLING]([user_in] ASC);


GO
CREATE TRIGGER [dbo].[RM$OS$BILLING_AfterUpdate]
   ON  [dbo].[RM$OS$BILLING]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
insert into RM$OS$BILLING_HISTORY select * from inserted 	
END