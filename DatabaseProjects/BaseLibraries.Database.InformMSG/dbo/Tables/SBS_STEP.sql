CREATE TABLE [dbo].[SBS$STEP] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [text]         VARCHAR (1024) NULL,
    [idm_algoritm] INT            NULL,
    [type]         TINYINT        NULL,
    [sequence]     SMALLINT       NULL,
    CONSTRAINT [PK_SBS$STEP] PRIMARY KEY CLUSTERED ([id] ASC)
);

