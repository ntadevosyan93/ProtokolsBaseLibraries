CREATE TABLE [dbo].[STAC$OPER_LIST] (
    [id]              INT            IDENTITY (1, 1) NOT NULL,
    [user_in]         VARCHAR (150)  NULL,
    [date_in]         DATETIME       CONSTRAINT [DF_STAC$OPER_LIST_date_in] DEFAULT (getdate()) NULL,
    [p_fio]           VARCHAR (150)  NULL,
    [p_date_b]        DATETIME       NULL,
    [oper_date_start] DATETIME       NULL,
    [oper_date_stop]  DATETIME       NULL,
    [status]          SMALLINT       CONSTRAINT [DF_STAC$OPER_LIST_status] DEFAULT ((0)) NULL,
    [del]             TINYINT        CONSTRAINT [DF_STAC$OPER_LIST_del] DEFAULT ((0)) NULL,
    [diag]            VARCHAR (2000) NULL,
    [descr]           VARCHAR (2000) NULL,
    [video_1_guid]    VARCHAR (150)  NULL,
    [video_2_guid]    VARCHAR (150)  NULL,
    CONSTRAINT [PK_STAC$OPER_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);

