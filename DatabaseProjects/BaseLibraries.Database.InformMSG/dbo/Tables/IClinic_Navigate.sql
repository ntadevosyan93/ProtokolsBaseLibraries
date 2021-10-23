CREATE TABLE [dbo].[IClinic_Navigate] (
    [id]         INT            IDENTITY (1, 1) NOT NULL,
    [user_in]    VARCHAR (50)   NULL,
    [date_in]    DATETIME       CONSTRAINT [DF_IClinic_Navigate_date_in] DEFAULT (getdate()) NULL,
    [text]       VARCHAR (150)  NULL,
    [SecondText] VARCHAR (50)   NULL,
    [Descr]      VARCHAR (1024) NULL,
    [htmlText]   VARCHAR (MAX)  NULL,
    [parent_id]  INT            NULL,
    [IsVisible]  INT            CONSTRAINT [DF_IClinic_Navigate_IsVisible] DEFAULT ((1)) NULL,
    [user_cur]   VARCHAR (50)   NULL,
    [date_cur]   DATETIME       NULL,
    [del]        INT            CONSTRAINT [DF_IClinic_Navigate_del] DEFAULT ((0)) NULL,
    [guid]       VARCHAR (50)   NULL,
    CONSTRAINT [PK_IClinic_Navigate] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_IClinic_Navigate_2]
    ON [dbo].[IClinic_Navigate]([text] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IClinic_Navigate_1]
    ON [dbo].[IClinic_Navigate]([del] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_IClinic_Navigate]
    ON [dbo].[IClinic_Navigate]([guid] ASC);

