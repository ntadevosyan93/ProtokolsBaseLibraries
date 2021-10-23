CREATE TABLE [dbo].[TEST_BOOK] (
    [id]          INT              IDENTITY (1, 1) NOT NULL,
    [date_in]     DATETIME         CONSTRAINT [DF_TEST_BOOK_date_in] DEFAULT (getdate()) NULL,
    [book_Naimen] VARCHAR (50)     NULL,
    [book_count]  INT              NULL,
    [book_autor]  INT              NULL,
    [old_val]     VARCHAR (50)     NULL,
    [new_val]     VARCHAR (50)     NULL,
    [idm_cartrid] INT              NULL,
    [date_start]  DATETIME         NULL,
    [date_end]    DATETIME         NULL,
    [idm_ton]     INT              NULL,
    [work_time]   DATETIME         NULL,
    [idm_empl]    INT              NULL,
    [dayOfWeek]   INT              NULL,
    [TimeFromDay] DATETIME         NULL,
    [del]         INT              CONSTRAINT [DF_TEST_BOOK_del] DEFAULT ((0)) NULL,
    [guid]        UNIQUEIDENTIFIER CONSTRAINT [DF_TEST_BOOK_guid] DEFAULT (newid()) NULL,
    CONSTRAINT [PK_TEST_BOOK] PRIMARY KEY CLUSTERED ([id] ASC)
);

