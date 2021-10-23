CREATE TABLE [dbo].[TT$Pretensions] (
    [id]              INT           IDENTITY (1, 1) NOT NULL,
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
    [idm_doctor]      INT           NULL,
    CONSTRAINT [PK_TT$Pretensions] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[TT$Pretensions_HIST] 
   ON  [dbo].[TT$Pretensions]
   AFTER UPDATE
AS 
BEGIN

	SET NOCOUNT ON;


if(
(select count(*) from (
select  [idm_departments], [fio], [phone], [email], [zakazNum], [DateFull], [DateB], [idm_source], [description], [date_start], [date_stop], [text_solution], [idm_empl], [status], [guid], [del], [date_stop_plan], [idm_control], [idm_patient], [idm_1c],idm_doctor
from inserted 
union
select  [idm_departments], [fio], [phone], [email], [zakazNum], [DateFull], [DateB], [idm_source], [description], [date_start], [date_stop], [text_solution], [idm_empl], [status], [guid], [del], [date_stop_plan], [idm_control], [idm_patient], [idm_1c],idm_doctor
from deleted) D) >1
)
begin

	insert into [dbo].[TT$Pretensions_history]( 
	[id], [user_in], [date_in], [idm_departments], [fio], [phone], [email], [zakazNum], [DateFull], [DateB], [idm_source], [description], [date_start], [date_stop], [text_solution], [idm_empl], [status], [guid], [del], [date_stop_plan], [idm_control], [date_cur], [user_cur], [idm_patient], [idm_1c],idm_doctor)
	select 
	[id], [user_in], [date_in], [idm_departments], [fio], [phone], [email], [zakazNum], [DateFull], [DateB], [idm_source], [description], [date_start], [date_stop], [text_solution], [idm_empl], [status], [guid], [del], [date_stop_plan], [idm_control], [date_cur], [user_cur], [idm_patient], [idm_1c],idm_doctor
	from deleted 
	end

END
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Пациент', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'idm_1c';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Контроль', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'idm_control';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Дата окончания (планируемая)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'date_stop_plan';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Статус |  tt_trouble_status_pretensia', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'status';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Исполнитель', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'idm_empl';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Решение', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'text_solution';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Дата окончания (фактическая)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'date_stop';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Дата начала', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'date_start';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Претензия', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Источник | source_pretensia', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'idm_source';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Заказ| летит с сайта', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'zakazNum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'email | летит с сайта', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'email';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Телефон | Летит с сайта', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'phone';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ФИО | летит с сайта', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'fio';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Подразделение | DEPARTMENTS', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'TT$Pretensions', @level2type = N'COLUMN', @level2name = N'idm_departments';

