CREATE TABLE [dbo].[KAD$WORK_TIME_CURATORS_NOT_SEND] (
    [pk]       INT          IDENTITY (1, 1) NOT NULL,
    [idm_empl] INT          NOT NULL,
    [date_in]  DATETIME     NULL,
    [user_in]  VARCHAR (50) NULL,
    [del]      BIT          NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_CURATORS_NOT_SEND] PRIMARY KEY CLUSTERED ([pk] ASC)
);

