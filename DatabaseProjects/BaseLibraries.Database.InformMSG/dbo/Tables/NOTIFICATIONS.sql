CREATE TABLE [dbo].[NOTIFICATIONS] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [user_in] VARCHAR (50)  NULL,
    [date_in] DATETIME      CONSTRAINT [DF_NOTIFICATIONS_date_in] DEFAULT (getdate()) NULL,
    [title]   VARCHAR (500) NULL,
    [message] VARCHAR (MAX) NULL,
    [guid]    VARCHAR (64)  CONSTRAINT [DF_NOTIFICATIONS_guid] DEFAULT (newid()) NULL,
    CONSTRAINT [PK_NOTIFICATIONS] PRIMARY KEY CLUSTERED ([id] ASC)
);

