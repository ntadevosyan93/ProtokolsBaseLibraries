CREATE TABLE [dbo].[CLINIC23STUFF_FEEDBACK_MAIL_LIST] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [date_in]        DATETIME     CONSTRAINT [DF_CLINIC23STUFF_FEEDBACK_MAIL_LIST_date_in] DEFAULT (getdate()) NULL,
    [user_in]        VARCHAR (50) NULL,
    [idm_categories] INT          NULL,
    [idm_empl]       INT          NULL,
    [email]          VARCHAR (50) NULL,
    [del]            INT          CONSTRAINT [DF_CLINIC23STUFF_FEEDBACK_MAIL_LIST_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_CLINIC23STUFF_FEEDBACK_MAIL_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);

