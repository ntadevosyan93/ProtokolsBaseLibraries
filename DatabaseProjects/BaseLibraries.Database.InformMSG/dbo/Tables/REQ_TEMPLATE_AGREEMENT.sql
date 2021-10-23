CREATE TABLE [dbo].[REQ$TEMPLATE_AGREEMENT] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [text]       VARCHAR (150) NULL,
    [idm_empl]   INT           NULL,
    [sequence]   INT           NULL,
    [parent]     INT           NULL,
    [guid]       VARCHAR (60)  NULL,
    [idm_module] INT           NULL,
    CONSTRAINT [PK_REQ$TEMPLATE_AGREEMENT] PRIMARY KEY CLUSTERED ([id] ASC)
);

