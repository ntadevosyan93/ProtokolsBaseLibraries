CREATE TABLE [dbo].[TT$COMPLAINT_INFO] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [date_in]        DATETIME     CONSTRAINT [DF_TT$COMPLAINT_INFO_date_in] DEFAULT (getdate()) NULL,
    [user_in]        VARCHAR (50) NULL,
    [idm_ttMain]     INT          NULL,
    [idm_empl]       INT          NULL,
    [idm_department] INT          NULL,
    [result]         INT          NULL,
    [del]            INT          CONSTRAINT [DF_TT$COMPLAINT_INFO_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TT$COMPLAINT_INFO] PRIMARY KEY CLUSTERED ([id] ASC)
);

