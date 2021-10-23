CREATE TABLE [dbo].[KAD$WORK_TIME_COPY_HISTORY] (
    [id]       INT          IDENTITY (1, 1) NOT NULL,
    [date_in]  DATETIME     CONSTRAINT [DF_KAD$WORK_TIME_COPY_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [user_in]  VARCHAR (50) NULL,
    [idm_wt]   INT          NULL,
    [date_new] DATETIME     NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_COPY_HISTORY] PRIMARY KEY CLUSTERED ([id] ASC)
);

