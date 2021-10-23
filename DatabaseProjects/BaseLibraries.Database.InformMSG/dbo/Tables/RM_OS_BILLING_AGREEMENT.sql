CREATE TABLE [dbo].[RM$OS$BILLING_AGREEMENT] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME      CONSTRAINT [DF_BILLING_AGREEMENT_date_in] DEFAULT (getdate()) NULL,
    [user_in]     VARCHAR (150) NULL,
    [IsHand]      INT           CONSTRAINT [DF_RM$OS$BILLING_AGREEMENT_IsHand] DEFAULT ((0)) NULL,
    [idm_empl]    INT           NULL,
    [idm_otdel]   INT           NULL,
    [text_reason] VARCHAR (MAX) NULL,
    [idm_reason]  SMALLINT      NULL,
    [idm_bill]    INT           NULL,
    [date_posted] DATETIME      NULL,
    [ip_reason]   VARCHAR (50)  NULL,
    [date_reason] DATETIME      NULL,
    [user_reason] VARCHAR (50)  NULL,
    [del]         INT           CONSTRAINT [DF_RM$OS$BILLING_AGREEMENT_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_BILLING_AGREEMENT] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_AGREEMENT_1]
    ON [dbo].[RM$OS$BILLING_AGREEMENT]([idm_empl] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_RM$OS$BILLING_AGREEMENT]
    ON [dbo].[RM$OS$BILLING_AGREEMENT]([idm_bill] ASC);


GO
CREATE TRIGGER [dbo].[RM$OS$BILLING_AGREEMENT_AfterUpdate]
   ON  dbo.RM$OS$BILLING_AGREEMENT
   AFTER UPDATE,INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
insert into RM$OS$BILLING_AGREEMENT_HISTORY select * from inserted 	
END