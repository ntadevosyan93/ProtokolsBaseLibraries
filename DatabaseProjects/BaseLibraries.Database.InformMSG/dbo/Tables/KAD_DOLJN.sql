CREATE TABLE [dbo].[KAD$DOLJN] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [text]     VARCHAR (150) NULL,
    [date_in]  DATETIME      CONSTRAINT [DF_KAD$DOLJN_date_in] DEFAULT (getdate()) NULL,
    [IsDND]    INT           CONSTRAINT [DF_KAD$DOLJN_IsDND] DEFAULT ((0)) NULL,
    [user_cur] VARCHAR (150) NULL,
    [date_cur] DATETIME      NULL,
    [IsDel]    INT           CONSTRAINT [DF_KAD$DOLJN_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_KAD$DOLJN] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$DOLJN]
    ON [dbo].[KAD$DOLJN]([IsDel] ASC);


GO
GRANT SELECT
    ON OBJECT::[dbo].[KAD$DOLJN] TO PUBLIC
    AS [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Должности Call-центра', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'KAD$DOLJN', @level2type = N'COLUMN', @level2name = N'IsDND';

