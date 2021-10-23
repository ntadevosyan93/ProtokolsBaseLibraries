CREATE TABLE [dbo].[TEST_PEOPLES] (
    [id]      INT          IDENTITY (1, 1) NOT NULL,
    [date_in] DATETIME     CONSTRAINT [DF_TEST_PEOPLES_date_in] DEFAULT (getdate()) NULL,
    [fio]     VARCHAR (50) NULL,
    [date_b]  DATETIME     NULL,
    CONSTRAINT [PK_TEST_PEOPLES] PRIMARY KEY CLUSTERED ([id] ASC)
);

