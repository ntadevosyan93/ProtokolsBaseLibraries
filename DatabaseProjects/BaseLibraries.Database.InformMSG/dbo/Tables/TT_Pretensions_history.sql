CREATE TABLE [dbo].[TT$Pretensions_history] (
    [pk]              INT           IDENTITY (1, 1) NOT NULL,
    [id]              INT           NULL,
    [user_in]         VARCHAR (50)  NULL,
    [date_in]         DATETIME      NULL,
    [idm_departments] INT           NULL,
    [fio]             VARCHAR (250) NULL,
    [phone]           VARCHAR (50)  NULL,
    [email]           VARCHAR (50)  NULL,
    [zakazNum]        VARCHAR (50)  NULL,
    [DateFull]        DATETIME      NULL,
    [DateB]           DATETIME      NULL,
    [idm_source]      INT           NULL,
    [description]     VARCHAR (MAX) NULL,
    [date_start]      DATETIME      NULL,
    [date_stop]       DATETIME      NULL,
    [text_solution]   VARCHAR (MAX) NULL,
    [idm_empl]        INT           NULL,
    [status]          INT           NULL,
    [guid]            VARCHAR (80)  NULL,
    [del]             INT           NULL,
    [date_stop_plan]  DATETIME      NULL,
    [idm_control]     INT           NULL,
    [date_cur]        DATETIME      NULL,
    [user_cur]        VARCHAR (50)  NULL,
    [idm_patient]     INT           NULL,
    [idm_1c]          CHAR (9)      NULL,
    [param]           VARCHAR (MAX) NULL,
    [idm_doctor]      INT           NULL,
    CONSTRAINT [PK_TT$Pretensions_history] PRIMARY KEY CLUSTERED ([pk] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Статус', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Исполнитель', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'idm_empl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Решение', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'text_solution';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Дата окончания (фактическая)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'date_stop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Дата начала', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'date_start';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Претензия', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Источник', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'idm_source';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'№ Заказа', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'zakazNum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'email', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'email';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Телефон', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'phone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ФИО', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions_history', @level2type = N'COLUMN', @level2name = N'fio';

