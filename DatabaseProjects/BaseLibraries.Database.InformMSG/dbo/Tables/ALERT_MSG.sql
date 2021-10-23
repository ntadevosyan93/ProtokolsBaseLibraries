CREATE TABLE [dbo].[ALERT$MSG] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [message]  VARCHAR (MAX) NULL,
    [user_in]  VARCHAR (150) NULL,
    [date_in]  DATETIME      CONSTRAINT [DF_Alert$MSG_date_in] DEFAULT (getdate()) NULL,
    [title]    VARCHAR (150) NULL,
    [status]   SMALLINT      NULL,
    [date_out] DATETIME      NULL,
    [del]      TINYINT       CONSTRAINT [DF_Alert$MSG_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Alert$MSG] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALERT$MSG] TO [Inform_User]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALERT$MSG] TO [Inform_User]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALERT$MSG] TO [Inform_User]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALERT$MSG] TO [Inform_User]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[ALERT$MSG] TO [Inform_User]
    AS [dbo];

