CREATE TABLE [dbo].[GOLOS$OBJECT] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [idm_golos] INT           NULL,
    [descr]     VARCHAR (500) NULL,
    [file_1]    VARCHAR (100) NULL,
    [up]        INT           NULL,
    [down]      INT           NULL,
    [del]       TINYINT       CONSTRAINT [DF_GOLOS$OBJECT_del] DEFAULT ((0)) NOT NULL,
    [status]    SMALLINT      NULL,
    [date_in]   DATETIME      CONSTRAINT [DF_GOLOS$OBJECT_date_in] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_GOLOS$OBJECT] PRIMARY KEY CLUSTERED ([id] ASC)
);

