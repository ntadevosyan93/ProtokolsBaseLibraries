CREATE TABLE [dbo].[REQ$MAIN_AGREEMENT] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME      CONSTRAINT [DF_REQ$MAIN_AGREEMENNT_date_in] DEFAULT (getdate()) NULL,
    [user_in]      VARCHAR (50)  NULL,
    [idm_empl]     INT           NULL,
    [text_reason]  VARCHAR (256) NULL,
    [idm_reason]   SMALLINT      NULL,
    [sequence]     INT           NULL,
    [idm_req_main] INT           NULL,
    CONSTRAINT [PK_REQ$MAIN_AGREEMENNT] PRIMARY KEY CLUSTERED ([id] ASC)
);

