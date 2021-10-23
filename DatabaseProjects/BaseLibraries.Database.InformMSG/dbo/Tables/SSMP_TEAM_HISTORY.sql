CREATE TABLE [dbo].[SSMP$TEAM_HISTORY] (
    [id]            INT          NOT NULL,
    [user_in]       VARCHAR (50) NULL,
    [date_in]       DATETIME     CONSTRAINT [DF_SSMP$TEAM_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [date_start]    DATETIME     NULL,
    [date_stop]     DATETIME     NULL,
    [idm_avto]      INT          NULL,
    [idm_driver]    INT          NULL,
    [idm_paramedic] INT          NULL,
    [idm_doctor]    INT          NULL,
    [del]           TINYINT      NOT NULL,
    [idm_brigade]   INT          NULL
);

