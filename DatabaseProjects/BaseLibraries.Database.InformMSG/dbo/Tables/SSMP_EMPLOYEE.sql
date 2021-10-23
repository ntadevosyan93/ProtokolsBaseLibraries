CREATE TABLE [dbo].[SSMP$EMPLOYEE] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [fio]     VARCHAR (100) NULL,
    [doljn]   VARCHAR (100) NULL,
    [phone]   VARCHAR (20)  NULL,
    [pediatr] TINYINT       CONSTRAINT [DF_SSMP$EMPLOYEE_pediatr] DEFAULT ((0)) NOT NULL,
    [idm_1c]  CHAR (9)      NULL,
    CONSTRAINT [PK_SSMP$EMPLOYEE] PRIMARY KEY CLUSTERED ([id] ASC)
);

