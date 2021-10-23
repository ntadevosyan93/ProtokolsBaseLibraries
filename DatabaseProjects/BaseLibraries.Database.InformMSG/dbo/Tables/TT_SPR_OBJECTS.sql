CREATE TABLE [dbo].[TT$SPR_OBJECTS] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [idm_places] INT           NULL,
    [text]       VARCHAR (150) NULL,
    CONSTRAINT [PK_TT$SPR_OBJECTS] PRIMARY KEY CLUSTERED ([id] ASC)
);

