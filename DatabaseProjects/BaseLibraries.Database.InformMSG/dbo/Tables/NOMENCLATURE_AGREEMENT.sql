CREATE TABLE [dbo].[NOMENCLATURE_AGREEMENT] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [date_in]          DATETIME      CONSTRAINT [DF_NOMENCLATURE_AGREEMENT_date_in] DEFAULT (getdate()) NULL,
    [user_in]          VARCHAR (150) NULL,
    [idm_empl]         INT           NULL,
    [text_reason]      VARCHAR (MAX) NULL,
    [idm_reason]       SMALLINT      NULL,
    [idm_nomenclature] INT           NULL,
    [date_getted]      DATETIME      NULL,
    [date_posted]      DATETIME      NULL,
    [date_reason]      DATETIME      NULL,
    CONSTRAINT [PK_NOMENCLATURE_AGREEMENT] PRIMARY KEY CLUSTERED ([id] ASC)
);

