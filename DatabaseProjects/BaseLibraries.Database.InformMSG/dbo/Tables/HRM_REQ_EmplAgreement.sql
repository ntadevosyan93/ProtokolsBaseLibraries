CREATE TABLE [dbo].[HRM$REQ_EmplAgreement] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [user_in]       VARCHAR (50)  NULL,
    [date_in]       DATETIME      CONSTRAINT [DF_HRM$REQ_Agreement_date_in] DEFAULT (getdate()) NULL,
    [idm_agreement] INT           NULL,
    [idm_req]       INT           NULL,
    [idm_empl]      INT           NULL,
    [idm_res]       INT           NULL,
    [date_res]      DATETIME      NULL,
    [comment]       VARCHAR (540) NULL,
    [del]           INT           CONSTRAINT [DF_HRM$REQ_Agreement_del] DEFAULT ((0)) NULL,
    [user_cur]      VARCHAR (50)  NULL,
    [date_cur]      DATETIME      NULL,
    CONSTRAINT [PK_HRM$REQ_Agreement] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_HRM$REQ_Agreement_2]
    ON [dbo].[HRM$REQ_EmplAgreement]([del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_HRM$REQ_Agreement_1]
    ON [dbo].[HRM$REQ_EmplAgreement]([idm_req] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_HRM$REQ_Agreement]
    ON [dbo].[HRM$REQ_EmplAgreement]([idm_empl] ASC);

