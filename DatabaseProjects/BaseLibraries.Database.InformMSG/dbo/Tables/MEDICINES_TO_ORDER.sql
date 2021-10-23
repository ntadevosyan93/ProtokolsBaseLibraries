CREATE TABLE [dbo].[MEDICINES_TO_ORDER] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [date_in]        DATETIME      CONSTRAINT [DF_MEDICINES_TO_ORDER_date_in] DEFAULT (getdate()) NULL,
    [user_in]        VARCHAR (50)  NULL,
    [idm_1C]         VARCHAR (50)  NULL,
    [text]           VARCHAR (520) NULL,
    [idm_ED]         INT           NULL,
    [defect]         INT           CONSTRAINT [DF_MEDICINES_TO_ORDER_defect] DEFAULT ((0)) NULL,
    [articul]        VARCHAR (50)  NULL,
    [idm_parent]     INT           NULL,
    [IsMatch]        INT           CONSTRAINT [DF_MEDICINES_TO_ORDER_IsMatch] DEFAULT ((0)) NULL,
    [DESCR_1C]       VARCHAR (200) NULL,
    [GlobalParentID] INT           NULL,
    [IsNew]          INT           CONSTRAINT [DF_MEDICINES_TO_ORDER_IsNew] DEFAULT ((0)) NULL,
    [del]            INT           CONSTRAINT [DF_MEDICINES_TO_ORDER_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_MEDICINES_TO_ORDER] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_MEDICINES_TO_ORDER_2]
    ON [dbo].[MEDICINES_TO_ORDER]([user_in] ASC, [IsNew] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MEDICINES_TO_ORDER]
    ON [dbo].[MEDICINES_TO_ORDER]([GlobalParentID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_MEDICINES_TO_ORDER_1]
    ON [dbo].[MEDICINES_TO_ORDER]([del] ASC, [idm_parent] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'0-не сопоставл; 1- сопост.однозначно;2-треб.проверка', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'MEDICINES_TO_ORDER', @level2type = N'COLUMN', @level2name = N'IsMatch';

