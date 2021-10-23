CREATE TABLE [dbo].[operations_history_users] (
    [id]        INT           IDENTITY (1, 1) NOT NULL,
    [fio]       VARCHAR (100) NOT NULL,
    [ulogin]    VARCHAR (50)  NOT NULL,
    [upassword] VARCHAR (50)  NOT NULL,
    [utype]     INT           NOT NULL,
    [their]     INT           CONSTRAINT [DF_operations_history_users_their] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([id] ASC)
);

