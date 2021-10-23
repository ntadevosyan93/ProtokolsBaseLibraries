CREATE TABLE [dbo].[KAD$WORK_TIME_CHANGE_TEST] (
    [id]       INT          IDENTITY (1, 1) NOT NULL,
    [date_in]  DATETIME     CONSTRAINT [DF_KAD$WORK_TIME_CHANGE_TEST_date_in] DEFAULT (getdate()) NULL,
    [idm_wt]   INT          NULL,
    [result]   INT          NULL,
    [user_cor] VARCHAR (50) NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_CHANGE_TEST] PRIMARY KEY CLUSTERED ([id] ASC)
);

