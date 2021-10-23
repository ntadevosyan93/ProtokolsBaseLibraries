CREATE TABLE [dbo].[GOLOS$MAIN] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_GOLOS$MAIN_date_in] DEFAULT (getdate()) NULL,
    [descr]      VARCHAR (350) NULL,
    [date_start] DATETIME      NULL,
    [date_stop]  DATETIME      NULL,
    [status]     SMALLINT      NULL,
    [del]        TINYINT       CONSTRAINT [DF_GOLOS$MAIN_del] DEFAULT ((0)) NOT NULL,
    [file_1]     VARCHAR (100) NULL,
    [up]         INT           CONSTRAINT [DF_GOLOS$MAIN_up] DEFAULT ((0)) NULL,
    [down]       INT           CONSTRAINT [DF_GOLOS$MAIN_down] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_GOLOS$MAIN] PRIMARY KEY CLUSTERED ([id] ASC)
);

