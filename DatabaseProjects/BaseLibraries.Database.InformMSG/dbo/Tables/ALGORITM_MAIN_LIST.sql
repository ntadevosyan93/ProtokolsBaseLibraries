CREATE TABLE [dbo].[ALGORITM$MAIN_LIST] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [date_in]       DATETIME       CONSTRAINT [DF_ALGORITM$MAIN_LIST_date_in] DEFAULT (getdate()) NULL,
    [user_in]       VARCHAR (150)  NULL,
    [idm_main]      INT            NULL,
    [text]          VARCHAR (1500) NULL,
    [reg_num]       SMALLINT       NULL,
    [reg_num_full]  VARCHAR (50)   NULL,
    [idm_main_list] INT            NULL,
    [idm_doljn]     INT            NULL,
    [idm_otdel]     INT            NULL,
    [idm_employee]  INT            NULL,
    [idm_act]       INT            NULL,
    [idm_fb]        INT            NULL,
    [file_path]     VARCHAR (300)  NULL,
    [file_name_old] VARCHAR (300)  NULL,
    [file_guid]     VARCHAR (50)   NULL,
    [text_print]    VARCHAR (1500) NULL,
    CONSTRAINT [PK_ALGORITM$MAIN_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);

