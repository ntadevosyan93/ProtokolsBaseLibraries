CREATE TABLE [dbo].[DEPARTMENTS] (
    [id]                 INT           IDENTITY (1, 1) NOT NULL,
    [text]               VARCHAR (50)  NULL,
    [address]            VARCHAR (150) NULL,
    [idm_1c]             SMALLINT      NULL,
    [wt_date_lock]       DATETIME      NULL,
    [date_cor]           DATETIME      NULL,
    [idm_iclinic_places] INT           NULL,
    [dep_del]            INT           CONSTRAINT [DF_DEPARTMENTS_del] DEFAULT ((0)) NULL,
    [idm_1c_]            CHAR (9)      NULL,
    CONSTRAINT [PK_DEPARTMENTS] PRIMARY KEY CLUSTERED ([id] ASC)
);

