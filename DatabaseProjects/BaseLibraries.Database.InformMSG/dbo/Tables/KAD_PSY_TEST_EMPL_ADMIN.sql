CREATE TABLE [dbo].[KAD$PSY_TEST_EMPL$ADMIN] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_KAD$PSY_TEST_EMPL$ADMIN_date_in] DEFAULT (getdate()) NULL,
    [user_in]      VARCHAR (50) NULL,
    [idm_psy_test] INT          NULL,
    [idm_empl]     INT          NULL,
    [IsSend]       INT          CONSTRAINT [DF_KAD$PSY_TEST_EMPL$ADMIN_IsSend] DEFAULT ((0)) NULL,
    [date_cur]     DATETIME     NULL,
    [user_cur]     VARCHAR (50) NULL,
    [del]          INT          CONSTRAINT [DF_KAD$PSY_TEST_EMPL$ADMIN_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_KAD$PSY_TEST_EMPL$ADMIN] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$PSY_TEST_EMPL$ADMIN]
    ON [dbo].[KAD$PSY_TEST_EMPL$ADMIN]([idm_psy_test] ASC, [del] ASC);

