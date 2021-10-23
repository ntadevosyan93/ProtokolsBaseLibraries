CREATE TABLE [dbo].[CALLFAILS] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [user_in]    VARCHAR (50)  NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_CALLFAILS_date_in] DEFAULT (getdate()) NULL,
    [idm_empl]   INT           NULL,
    [date_event] DATETIME      NULL,
    [text]       VARCHAR (MAX) NULL,
    [idm_type]   INT           NULL,
    [del]        INT           CONSTRAINT [DF_CALLFAILS_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_CALLFAILS] PRIMARY KEY CLUSTERED ([id] ASC)
);

