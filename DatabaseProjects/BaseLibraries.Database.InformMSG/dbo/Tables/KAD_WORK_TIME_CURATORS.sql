CREATE TABLE [dbo].[KAD$WORK_TIME_CURATORS] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME     CONSTRAINT [DF_KAD$WORK_TIME_CURATORS_date_in] DEFAULT (getdate()) NULL,
    [user_in]     VARCHAR (50) NULL,
    [idm_curator] INT          NULL,
    [idm_empl]    INT          NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_CURATORS] PRIMARY KEY CLUSTERED ([id] ASC)
);

