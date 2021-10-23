CREATE TABLE [dbo].[VECTOR_LOG] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [date_in]  DATETIME      CONSTRAINT [DF_VECTOR_LOG_date_in] DEFAULT (getdate()) NULL,
    [ip]       VARCHAR (150) NULL,
    [guid]     VARCHAR (MAX) NULL,
    [password] VARCHAR (MAX) NULL,
    [tn]       VARCHAR (MAX) NULL,
    [inc]      VARCHAR (MAX) NULL,
    CONSTRAINT [PK_VECTOR_LOG] PRIMARY KEY CLUSTERED ([id] ASC)
);

