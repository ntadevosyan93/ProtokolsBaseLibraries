CREATE TABLE [dbo].[KLASS] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [klass_id]         INT           NULL,
    [klass_name]       VARCHAR (50)  NULL,
    [klass_name_short] VARCHAR (10)  NULL,
    [klass_value]      VARCHAR (150) NULL,
    [klass_value_int]  INT           NULL,
    CONSTRAINT [PK_KLASS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[KLASS] TO [Inform_User]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[KLASS] TO [Inform_User]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[KLASS] TO [Inform_User]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[KLASS] TO [Inform_User]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[KLASS] TO [Inform_User]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[KLASS] TO PUBLIC
    AS [dbo];

