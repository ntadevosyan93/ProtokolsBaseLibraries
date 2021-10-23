CREATE TABLE [dbo].[REQ$MAIN_LIST] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [user_in]      VARCHAR (50)  NULL,
    [date_in]      DATETIME      CONSTRAINT [DF_REQ$MAIN_LIST_date_in] DEFAULT (getdate()) NULL,
    [text]         VARCHAR (512) NULL,
    [reason]       VARCHAR (512) NULL,
    [status]       SMALLINT      CONSTRAINT [DF_REQ$MAIN_LIST_status] DEFAULT ((0)) NULL,
    [idm_req_main] INT           NULL,
    CONSTRAINT [PK_REQ$MAIN_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);

