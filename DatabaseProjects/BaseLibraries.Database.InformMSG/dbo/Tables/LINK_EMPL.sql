CREATE TABLE [dbo].[LINK_EMPL] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [date_in]       DATETIME     CONSTRAINT [DF_LINK_EMPL_date_in] DEFAULT (getdate()) NULL,
    [user_in]       VARCHAR (50) NULL,
    [idm_empl]      INT          NULL,
    [idm_empl_link] INT          NULL,
    CONSTRAINT [PK_LINK_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

