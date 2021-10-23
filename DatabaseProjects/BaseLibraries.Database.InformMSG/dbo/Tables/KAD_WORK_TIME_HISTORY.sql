CREATE TABLE [dbo].[KAD$WORK_TIME_HISTORY] (
    [id]              INT            NOT NULL,
    [date_in]         DATETIME       CONSTRAINT [DF_KAD$WORK_TIME_HISTORY_date_in] DEFAULT (getdate()) NULL,
    [user_in]         VARCHAR (50)   NULL,
    [idm_empl]        INT            NULL,
    [estimated_start] DATETIME       NULL,
    [estimated_stop]  DATETIME       NULL,
    [actual_start]    DATETIME       NULL,
    [actual_stop]     DATETIME       NULL,
    [del]             TINYINT        CONSTRAINT [DF_KAD$WORK_TIME_HISTORY_del] DEFAULT ((0)) NULL,
    [break_start]     DATETIME       NULL,
    [break_stop]      DATETIME       NULL,
    [break_time]      SMALLINT       NULL,
    [idm_status]      INT            NULL,
    [idm_depart]      INT            NULL,
    [freeDay]         INT            NULL,
    [comment]         VARCHAR (2048) NULL,
    [handmark]        INT            CONSTRAINT [DF_KAD$WORK_TIME_HISTORY_handmark] DEFAULT ((0)) NULL,
    [from_1c]         TINYINT        CONSTRAINT [DF_KAD$WORK_TIME_HISTORY_from_1c] DEFAULT ((0)) NULL,
    [curatorComment]  VARCHAR (2048) NULL,
    [actual_start_2]  DATETIME       NULL,
    [actual_stop_2]   DATETIME       NULL,
    [freeDay_2]       INT            NULL,
    [sb_ok]           INT            CONSTRAINT [DF_KAD$WORK_TIME_HISTORY_sb_ok] DEFAULT ((0)) NULL,
    [user_cor]        VARCHAR (50)   NULL,
    [date_cor]        DATETIME       NULL,
    [idm_violation]   INT            NULL,
    [idm_breakdown]   INT            NULL,
    [comment_it]      VARCHAR (2048) NULL,
    [idm_doljn]       INT            NULL,
    [first_checkIn]   DATETIME       NULL,
    [is_lock]         TINYINT        CONSTRAINT [DF_KAD$WORK_TIME_HISTORY_is_lock] DEFAULT ((0)) NULL,
    [fast_control]    TINYINT        NULL,
    [sb]              BIT            NULL,
    [prichina]        VARCHAR (5000) NULL,
    [fixed]           BIT            NULL,
    [guid]            VARCHAR (50)   NULL
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20191128-150904]
    ON [dbo].[KAD$WORK_TIME_HISTORY]([id] ASC);

