CREATE TABLE [dbo].[Screen_files] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [file_path]  VARCHAR (MAX) NULL,
    [status]     INT           NULL,
    [idm_action] INT           NULL,
    [idm_screen] INT           NULL,
    [text]       VARCHAR (MAX) NULL,
    [guid]       VARCHAR (50)  NULL,
    [resolution] VARCHAR (50)  NULL,
    CONSTRAINT [PK_Screen_files] PRIMARY KEY CLUSTERED ([id] ASC)
);

