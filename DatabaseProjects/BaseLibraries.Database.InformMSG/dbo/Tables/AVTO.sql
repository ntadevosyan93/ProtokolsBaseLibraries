CREATE TABLE [dbo].[AVTO] (
    [id]        INT           NOT NULL,
    [text]      VARCHAR (250) NULL,
    [voditel]   VARCHAR (350) NULL,
    [phone]     VARCHAR (20)  NULL,
    [mesto]     VARCHAR (50)  NULL,
    [gos_nomer] VARCHAR (20)  NULL,
    [email]     VARCHAR (50)  NULL,
    [printer]   INT           NULL,
    [hide]      TINYINT       NULL
);


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AVTO] TO [Inform_User]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AVTO] TO [Inform_User]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AVTO] TO [Inform_User]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[AVTO] TO [Inform_User]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[AVTO] TO [Inform_User]
    AS [dbo];

