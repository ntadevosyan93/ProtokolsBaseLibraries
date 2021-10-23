CREATE TABLE [dbo].[REQ$MAIN] (
    [id]           INT             IDENTITY (1, 1) NOT NULL,
    [guid]         VARCHAR (60)    NULL,
    [date_in]      DATETIME        CONSTRAINT [DF_REQ$MAIN_date_in] DEFAULT (getdate()) NULL,
    [user_in]      VARCHAR (50)    NULL,
    [idm_type]     INT             NULL,
    [idm_type_sub] INT             NULL,
    [idm_template] INT             NULL,
    [text]         VARCHAR (512)   NULL,
    [text_reason]  VARCHAR (512)   NOT NULL,
    [cost]         NUMERIC (18, 2) NULL,
    [count]        NUMERIC (18, 3) NULL,
    [sum]          NUMERIC (18, 3) NULL,
    [status]       SMALLINT        NULL,
    [del]          INT             CONSTRAINT [DF_REQ$MAIN_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_REQ$MAIN] PRIMARY KEY CLUSTERED ([id] ASC)
);

