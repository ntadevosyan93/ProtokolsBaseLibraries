CREATE TABLE [dbo].[ACTION_] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [user_in]        VARCHAR (150) NULL,
    [date_in]        DATETIME      CONSTRAINT [DF_ACTION_date_in] DEFAULT (getdate()) NULL,
    [date_start]     DATETIME      NULL,
    [date_by]        DATETIME      NULL,
    [action_text]    VARCHAR (MAX) NULL,
    [inform_message] VARCHAR (MAX) NULL,
    [placing]        INT           NULL,
    [del]            INT           CONSTRAINT [DF_ACTION_del] DEFAULT ((0)) NULL,
    [guid]           VARCHAR (50)  CONSTRAINT [DF_ACTION_guid] DEFAULT (newid()) NULL,
    [idm_empl]       INT           NULL,
    [curator_sended] INT           NULL,
    CONSTRAINT [PK_ACTION] PRIMARY KEY CLUSTERED ([id] ASC)
);

