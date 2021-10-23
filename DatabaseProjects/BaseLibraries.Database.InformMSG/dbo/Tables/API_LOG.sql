CREATE TABLE [dbo].[API$LOG] (
    [date_in] DATETIME      CONSTRAINT [DF_API$LOG_date_in] DEFAULT (getdate()) NOT NULL,
    [ip]      VARCHAR (20)  NULL,
    [i_guid]  VARCHAR (50)  NOT NULL,
    [m_guid]  VARCHAR (50)  NOT NULL,
    [param]   VARCHAR (MAX) NULL,
    CONSTRAINT [PK_API$LOG] PRIMARY KEY CLUSTERED ([date_in] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_API$LOG_1]
    ON [dbo].[API$LOG]([m_guid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_API$LOG]
    ON [dbo].[API$LOG]([i_guid] ASC);

