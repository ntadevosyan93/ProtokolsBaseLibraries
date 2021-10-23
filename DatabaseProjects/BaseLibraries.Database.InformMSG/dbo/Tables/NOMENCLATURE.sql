CREATE TABLE [dbo].[NOMENCLATURE] (
    [id]             INT             IDENTITY (1, 1) NOT NULL,
    [type]           INT             NULL,
    [name]           VARCHAR (MAX)   NULL,
    [code]           INT             NULL,
    [price_new]      NUMERIC (18, 2) NULL,
    [price]          NUMERIC (18, 2) NULL,
    [material_cost]  NUMERIC (18, 2) NULL,
    [salary]         NUMERIC (18, 2) NULL,
    [direction]      NUMERIC (18, 2) NULL,
    [comment]        VARCHAR (MAX)   NULL,
    [state]          INT             NULL,
    [user_in]        VARCHAR (50)    NULL,
    [date_in]        DATETIME        CONSTRAINT [DF_NOMENCKATURE_date_in] DEFAULT (getdate()) NULL,
    [del]            INT             CONSTRAINT [DF_NOMENCKATURE_del] DEFAULT ((0)) NULL,
    [guid]           VARCHAR (50)    CONSTRAINT [DF_NOMENCLATURE_guid] DEFAULT (newid()) NULL,
    [idm_empl]       INT             NULL,
    [curator_sended] INT             NULL,
    CONSTRAINT [PK_NOMENCKATURE] PRIMARY KEY CLUSTERED ([id] ASC)
);

