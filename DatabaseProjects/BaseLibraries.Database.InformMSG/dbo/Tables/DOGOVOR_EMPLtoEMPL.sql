CREATE TABLE [dbo].[DOGOVOR_EMPLtoEMPL] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [idm_empl_parent] INT          NULL,
    [idm_empl_link]   INT          NULL,
    [type]            VARCHAR (50) NULL,
    [IsReplace]       INT          CONSTRAINT [DF_DOGOVOR_EMPLtoEMPL_IsReplace] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_DOGOVOR_EMPLtoEMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

