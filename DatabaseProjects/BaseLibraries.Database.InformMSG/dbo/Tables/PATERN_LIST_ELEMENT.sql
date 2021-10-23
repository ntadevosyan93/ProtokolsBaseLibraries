CREATE TABLE [dbo].[PATERN$LIST_ELEMENT] (
    [id]                   INT          IDENTITY (1, 1) NOT NULL,
    [idm_patern]           INT          NULL,
    [idm_type]             INT          NULL,
    [idm_subtype]          INT          NULL,
    [element_name_sys]     VARCHAR (50) NULL,
    [element_name_visible] VARCHAR (50) NULL,
    [element_value]        VARCHAR (50) NULL,
    [element_value_type]   TINYINT      NULL,
    [sorting]              SMALLINT     NULL
);

