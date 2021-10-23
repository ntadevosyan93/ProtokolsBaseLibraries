CREATE TABLE [dbo].[MISSEDCALLS] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [date_in]   DATETIME     CONSTRAINT [DF_MISSEDCALLS_date_in] DEFAULT (getdate()) NULL,
    [fromPhone] VARCHAR (50) NULL,
    [toPhone]   VARCHAR (50) NULL,
    CONSTRAINT [PK_MISSEDCALLS] PRIMARY KEY CLUSTERED ([id] ASC)
);

