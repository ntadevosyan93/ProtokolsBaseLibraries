CREATE TABLE [dbo].[VECTOR_LOG_CLINIC23] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_VECTOR_LOG_CLINIC23_date_in] DEFAULT (getdate()) NULL,
    [user_in]    VARCHAR (150) NULL,
    [ip]         VARCHAR (150) NULL,
    [tn]         VARCHAR (150) NULL,
    [incMinutes] VARCHAR (150) NULL,
    CONSTRAINT [PK_VECTOR_LOG_CLINIC23] PRIMARY KEY CLUSTERED ([id] ASC)
);

