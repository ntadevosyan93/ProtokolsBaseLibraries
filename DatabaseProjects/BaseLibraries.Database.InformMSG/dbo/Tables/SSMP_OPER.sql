CREATE TABLE [dbo].[SSMP$OPER] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [guid]    VARCHAR (50)  NOT NULL,
    [user_in] VARCHAR (50)  NULL,
    [date_in] DATETIME      CONSTRAINT [DF_SSMP$OPER_date_in] DEFAULT (getdate()) NOT NULL,
    [address] VARCHAR (150) NULL,
    CONSTRAINT [PK_SSMP$OPER] PRIMARY KEY CLUSTERED ([id] ASC, [guid] ASC)
);

