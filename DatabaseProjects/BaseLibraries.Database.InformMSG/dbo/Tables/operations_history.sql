CREATE TABLE [dbo].[operations_history] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [addedby]     INT           NOT NULL,
    [date_create] DATETIME      NOT NULL,
    [fio_doctor]  VARCHAR (100) NOT NULL,
    [fio_pacient] VARCHAR (100) NOT NULL,
    [date_start]  DATETIME      NOT NULL,
    [date_end]    DATETIME      NOT NULL,
    [link_1]      VARCHAR (260) NOT NULL,
    [link_2]      VARCHAR (260) NOT NULL,
    [ipaddr]      VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_operations_history] PRIMARY KEY CLUSTERED ([id] ASC)
);

