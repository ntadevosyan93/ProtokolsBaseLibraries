CREATE TABLE [dbo].[VECTOR_USED_TICKETS] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [date_in]      DATETIME      CONSTRAINT [DF_VECTOR_USED_TICKETS_date_in] DEFAULT (getdate()) NULL,
    [ip]           VARCHAR (50)  NULL,
    [idm_user]     INT           NULL,
    [ticketNumber] VARCHAR (150) NULL,
    CONSTRAINT [PK_VECTOR_USED_TICKETS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_VECTOR_USED_TICKETS]
    ON [dbo].[VECTOR_USED_TICKETS]([ticketNumber] DESC);

