CREATE TABLE [dbo].[TT$MAIN_LNK_EMPL] (
    [id]       INT          IDENTITY (1, 1) NOT NULL,
    [date_in]  DATETIME     CONSTRAINT [DF_TT$MAIN_LNK_EMPL_date_in] DEFAULT (getdate()) NULL,
    [user_in]  VARCHAR (20) NULL,
    [idm_tt]   INT          NULL,
    [idm_empl] INT          NULL,
    CONSTRAINT [PK_TT$MAIN_LNK_EMPL] PRIMARY KEY CLUSTERED ([id] ASC)
);

