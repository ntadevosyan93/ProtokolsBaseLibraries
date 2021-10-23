CREATE TABLE [dbo].[HRM$REQ_HISTORY] (
    [id]                       INT              IDENTITY (1, 1) NOT NULL,
    [id_OLD]                   INT              NOT NULL,
    [date_in]                  DATETIME         NULL,
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
    [del]                      INT              NULL,
    [drug]                     INT              NULL,
    [func]                     VARCHAR (500)    NULL,
    [tariffRate]               INT              NULL,
    [user_cur]                 VARCHAR (50)     NULL,
    [date_cur]                 DATETIME         NULL,
    [date_issue]               DATETIME         NULL,
    CONSTRAINT [PK_HRM$REQ_Hist] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[HRM$REQ_HISTORY] TO PUBLIC
    AS [dbo];

