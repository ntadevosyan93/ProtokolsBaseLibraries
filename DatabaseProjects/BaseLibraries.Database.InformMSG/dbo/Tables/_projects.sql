CREATE TABLE [dbo].[_projects] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [name]     VARCHAR (500) NULL,
    [name_dev] VARCHAR (500) NULL,
    [path]     VARCHAR (500) NULL,
    [type]     TINYINT       NULL,
    [gr]       INT           NULL,
    [usage]    VARCHAR (MAX) NULL,
    [idm_empl] INT           NULL,
    CONSTRAINT [PK__projects] PRIMARY KEY CLUSTERED ([id] ASC)
);

