CREATE TABLE [dbo].[_] (
    [id]                   INT            IDENTITY (1, 1) NOT NULL,
    [idm_employee]         INT            NOT NULL,
    [dolj]                 VARCHAR (500)  NULL,
    [idm_dolj]             INT            NULL,
    [skill_education]      VARCHAR (1000) NULL,
    [additional_education] VARCHAR (1000) NULL,
    [sert_spec]            INT            NULL,
    [sert_date]            DATETIME       NULL,
    [kategorie]            INT            NULL,
    [kategorie_date]       DATETIME       NULL,
    [standing]             INT            NULL,
    [class_education]      INT            NULL,
    [nagrady]              VARCHAR (500)  NULL,
    [user_in]              VARCHAR (50)   NULL,
    [date_in]              DATETIME       NULL,
    [del]                  BIT            CONSTRAINT [DF_Employee_Education_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_Employee_Education] PRIMARY KEY CLUSTERED ([id] ASC)
);

