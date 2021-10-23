CREATE TABLE [dbo].[HRM$REQ] (
    [id]                       INT              IDENTITY (1, 1) NOT NULL,
    [date_in]                  DATETIME         CONSTRAINT [DF_HRM$REQ_date_in] DEFAULT (getdate()) NULL,
    [user_in]                  VARCHAR (50)     NULL,
    [status]                   INT              NULL,
    [idm_doljn]                INT              NULL,
    [idm_departments]          INT              NULL,
    [idm_chief]                INT              NULL,
    [cause_type]               INT              NULL,
    [cause_idm_empl]           INT              NULL,
    [cause_text]               VARCHAR (2048)   NULL,
    [estimated_start_date]     DATETIME         NULL,
    [description_of_work]      VARCHAR (2048)   NULL,
    [terms]                    INT              NULL,
    [terms_temporarily_dstart] DATETIME         NULL,
    [terms_temporarily_dstop]  DATETIME         NULL,
    [schedule]                 INT              NULL,
    [schedule_description]     VARCHAR (1024)   NULL,
    [age_start]                TINYINT          NULL,
    [age_stop]                 TINYINT          NULL,
    [gender]                   TINYINT          NULL,
    [education]                INT              NULL,
    [education_description]    VARCHAR (1024)   NULL,
    [experience]               VARCHAR (2048)   NULL,
    [more_requirements]        VARCHAR (2048)   NULL,
    [wages]                    INT              NULL,
    [wages_salary]             INT              NULL,
    [wages_bonus]              INT              NULL,
    [idm_hr_manager]           INT              NULL,
    [date_end]                 DATETIME         NULL,
    [guid]                     UNIQUEIDENTIFIER NULL,
    [del]                      INT              CONSTRAINT [DF_HRM$REQ_del] DEFAULT ((0)) NULL,
    [drug]                     INT              CONSTRAINT [DF_HRM$REQ_drug] DEFAULT ((0)) NULL,
    [func]                     VARCHAR (500)    NULL,
    [tariffRate]               INT              NULL,
    [user_cur]                 VARCHAR (50)     NULL,
    [date_cur]                 DATETIME         NULL,
    [date_issue]               DATETIME         NULL,
    CONSTRAINT [PK_HRM$REQ] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO






CREATE TRIGGER [dbo].[trigger_ModifyREQ]
    ON [dbo].[HRM$REQ]    AFTER UPDATE
    AS 
BEGIN
--if(
--(select count(*) from (
--select  [status], [idm_doljn], [idm_departments], [idm_chief], [cause_type], [cause_idm_empl], [cause_text], [estimated_start_date], [description_of_work], [terms], [terms_temporarily_dstart], [terms_temporarily_dstop], [schedule], [schedule_description], [age_start], [age_stop], [gender], [education], [education_description], [experience], [more_requirements], [wages], [wages_salary], [wages_bonus], [idm_hr_manager], [date_end], [guid], [del], [drug]
--From deleted
--union 
--select  [status], [idm_doljn], [idm_departments], [idm_chief], [cause_type], [cause_idm_empl], [cause_text], [estimated_start_date], [description_of_work], [terms], [terms_temporarily_dstart], [terms_temporarily_dstop], [schedule], [schedule_description], [age_start], [age_stop], [gender], [education], [education_description], [experience], [more_requirements], [wages], [wages_salary], [wages_bonus], [idm_hr_manager], [date_end], [guid], [del], [drug]
--From inserted
--)D) > 1) 
--or not exists(select * From deleted)
--begin
insert into [dbo].[HRM$REQ_HISTORY]
select *
From deleted
--end
END
GO
GRANT SELECT
    ON OBJECT::[dbo].[HRM$REQ] TO PUBLIC
    AS [dbo];


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Дата оформления', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'HRM$REQ', @level2type = N'COLUMN', @level2name = N'date_issue';

