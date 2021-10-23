CREATE TABLE [dbo].[MEDICINES_BUY] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
    [user_in]         VARCHAR (50)  NULL,
    [date_in]         DATETIME      CONSTRAINT [DF_MEDICINES_BUY_date_in] DEFAULT (getdate()) NULL,
    [idm_depart]      INT           NULL,
    [idm_buy_form]    INT           NULL,
    [date_order]      DATETIME      NULL,
    [month_order]     INT           NULL,
    [year_order]      INT           NULL,
    [idm_med_ToOrder] INT           NULL,
    [count]           INT           NULL,
    [idm_status]      INT           CONSTRAINT [DF_MEDICINES_BUY_status] DEFAULT ((1)) NULL,
    [comment]         VARCHAR (250) NULL,
    [user_cur]        VARCHAR (50)  NULL,
    [date_cur]        DATETIME      NULL,
    [del]             INT           CONSTRAINT [DF_MEDICINES_BUY_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MEDICINES_BUY] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_MEDICINES_BUY_3]
    ON [dbo].[MEDICINES_BUY]([idm_buy_form] ASC, [del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MEDICINES_BUY_2]
    ON [dbo].[MEDICINES_BUY]([month_order] ASC, [year_order] ASC, [del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MEDICINES_BUY_1]
    ON [dbo].[MEDICINES_BUY]([date_order] ASC, [idm_depart] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MEDICINES_BUY]
    ON [dbo].[MEDICINES_BUY]([del] ASC, [user_in] ASC);


GO
CREATE TRIGGER [dbo].[MEDICINES_BUY_AfterUpdate]
   ON  [dbo].[MEDICINES_BUY]
   AFTER UPDATE,INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
insert into MEDICINES_BUY_HISTORY select * from inserted 
END