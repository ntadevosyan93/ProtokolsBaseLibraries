CREATE TABLE [dbo].[SMP$MAIN] (
    [id]                  INT             IDENTITY (1, 1) NOT NULL,
    [user_in]             VARCHAR (150)   NULL,
    [date_in]             DATETIME        CONSTRAINT [DF_smp$main_date_in] DEFAULT (getdate()) NULL,
    [type]                SMALLINT        NULL,
    [p_fio]               VARCHAR (250)   NULL,
    [p_data]              DATE            NULL,
    [idm_p]               INT             NULL,
    [idm_p_1c]            VARCHAR (50)    NULL,
    [p_adres_punkt]       VARCHAR (250)   NOT NULL,
    [p_adres_rayon]       VARCHAR (250)   NULL,
    [p_adres_ulica]       VARCHAR (250)   NULL,
    [p_adres_dom]         VARCHAR (50)    NULL,
    [p_adres_kv]          VARCHAR (50)    NULL,
    [p_adres_kod_domofon] VARCHAR (50)    NULL,
    [p_adres_podezd]      VARCHAR (50)    NULL,
    [p_adres_etazh]       VARCHAR (50)    NULL,
    [p_phone]             VARCHAR (50)    NULL,
    [p_zhalobu]           VARCHAR (2000)  NULL,
    [res]                 VARCHAR (2000)  NULL,
    [idm_res]             NCHAR (10)      NULL,
    [date_start]          DATETIME        NULL,
    [date_stop]           DATETIME        NULL,
    [idm_brigada]         INT             NULL,
    [idm_avto]            INT             NULL,
    [a_adres_from]        VARCHAR (2000)  NULL,
    [probeg]              NUMERIC (18, 2) NULL,
    CONSTRAINT [PK_smp$main] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[SMP$MAIN] TO [Inform_User]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SMP$MAIN] TO [Inform_User]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[SMP$MAIN] TO [Inform_User]
    AS [dbo];


GO
GRANT ALTER
    ON OBJECT::[dbo].[SMP$MAIN] TO [Inform_User]
    AS [dbo];

