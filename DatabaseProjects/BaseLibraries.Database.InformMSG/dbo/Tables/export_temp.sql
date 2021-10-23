CREATE TABLE [dbo].[export_temp] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [nomenkl]  VARCHAR (250) NULL,
    [mol]      VARCHAR (250) NULL,
    [mol_name] VARCHAR (50)  NULL,
    [mol_fam]  VARCHAR (50)  NULL,
    [mol_otch] VARCHAR (50)  NULL,
    [number]   VARCHAR (250) NULL,
    [getDate]  DATETIME      NULL,
    [count]    VARCHAR (250) NULL,
    [idm_empl] INT           NULL,
    CONSTRAINT [PK_export_temp] PRIMARY KEY CLUSTERED ([id] ASC)
);

