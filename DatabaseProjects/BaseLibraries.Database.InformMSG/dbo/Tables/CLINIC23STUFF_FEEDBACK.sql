CREATE TABLE [dbo].[CLINIC23STUFF_FEEDBACK] (
    [id]         INT            IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME       CONSTRAINT [DF_CLINIC23STUFF_FEEDBACK_date_in] DEFAULT (getdate()) NULL,
    [idm_empl]   INT            NULL,
    [idm_title]  INT            NULL,
    [guid_title] VARCHAR (50)   NULL,
    [guid_empl]  VARCHAR (50)   NULL,
    [title]      VARCHAR (250)  NULL,
    [text]       VARCHAR (2048) NULL,
    [guid]       VARCHAR (50)   CONSTRAINT [DF_CLINIC23STUFF_FEEDBACK_guid] DEFAULT (newid()) NULL,
    CONSTRAINT [PK_CLINIC23STUFF_FEEDBACK] PRIMARY KEY CLUSTERED ([id] ASC)
);

