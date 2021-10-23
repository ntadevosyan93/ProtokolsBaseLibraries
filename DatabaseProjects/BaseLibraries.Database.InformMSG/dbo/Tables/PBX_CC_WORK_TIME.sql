CREATE TABLE [dbo].[PBX$CC$WORK_TIME] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME     CONSTRAINT [DF_PBX$CC$WORK_TIME_date_in] DEFAULT (getdate()) NOT NULL,
    [user_in]      VARCHAR (50) NULL,
    [phone]        INT          NULL,
    [work_date]    DATETIME     NULL,
    [work_start]   DATETIME     NULL,
    [work_stop]    DATETIME     NULL,
    [idm_employee] INT          NULL,
    [del]          TINYINT      CONSTRAINT [DF_PBX$CC$WORK_TIME_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_PBX$CC$WORK_TIME] PRIMARY KEY CLUSTERED ([id] ASC)
);

