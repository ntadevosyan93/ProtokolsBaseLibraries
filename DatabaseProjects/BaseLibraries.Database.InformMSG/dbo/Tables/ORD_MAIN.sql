CREATE TABLE [dbo].[ORD$MAIN] (
    [id]      INT            IDENTITY (1, 1) NOT NULL,
    [date_in] DATETIME       CONSTRAINT [DF_ORD$MAIN_date_in] DEFAULT (getdate()) NULL,
    [user_in] VARCHAR (50)   NULL,
    [type]    INT            NULL,
    [status]  INT            NULL,
    [idm_isp] INT            NULL,
    [text]    VARCHAR (2048) NULL,
    [guid]    VARCHAR (50)   NULL,
    CONSTRAINT [PK_ORD$MAIN] PRIMARY KEY CLUSTERED ([id] ASC)
);

