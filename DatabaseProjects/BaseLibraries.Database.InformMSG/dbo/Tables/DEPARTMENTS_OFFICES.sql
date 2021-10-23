CREATE TABLE [dbo].[DEPARTMENTS_OFFICES] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [text]           VARCHAR (50) NULL,
    [idm_department] INT          NULL,
    [del]            INT          CONSTRAINT [DF_DEPARTMENTS_OFFICES_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_DEPARTMENTS_OFFICES] PRIMARY KEY CLUSTERED ([id] ASC)
);

