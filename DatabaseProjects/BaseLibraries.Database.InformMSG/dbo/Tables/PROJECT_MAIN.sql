CREATE TABLE [dbo].[PROJECT$MAIN] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [text]          VARCHAR (1500) NULL,
    [date_in]       DATETIME       CONSTRAINT [DF_PROJECT$MAIN_date_in] DEFAULT (getdate()) NULL,
    [user_in]       VARCHAR (50)   NULL,
    [idm_iniciator] INT            NULL,
    [cel]           VARCHAR (1500) NULL,
    [text_full]     VARCHAR (MAX)  NULL,
    [date_start]    DATETIME       NULL,
    [date_end]      DATETIME       NULL,
    [status]        INT            NULL,
    CONSTRAINT [PK_PROJECT$MAIN] PRIMARY KEY CLUSTERED ([id] ASC)
);

