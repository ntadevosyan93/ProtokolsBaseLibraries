CREATE TABLE [dbo].[KAD$PSY_TEST] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [user_in]     VARCHAR (50) NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_KAD$PSY_TEST_date_in] DEFAULT (getdate()) NULL,
    [module]      VARCHAR (50) NULL,
    [idm_empl]    INT          NULL,
    [res]         TINYINT      NULL,
    [date_test]   DATETIME     NULL,
    [user_cor]    VARCHAR (50) NULL,
    [date_cor]    DATETIME     NULL,
    [del]         INT          CONSTRAINT [DF_KAD$PSY_TEST_del] DEFAULT ((0)) NULL,
    [idm_isp]     INT          NULL,
    [idm_doctor]  INT          NULL,
    [number_room] INT          NULL,
    CONSTRAINT [PK_KAD$PSY_TEST] PRIMARY KEY CLUSTERED ([id] ASC)
);

