CREATE TABLE [dbo].[ALGORITM$MAIN] (
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [date_in]       DATETIME       CONSTRAINT [DF_ALGORITM$MAIN_date_in] DEFAULT (getdate()) NULL,
    [user_in]       VARCHAR (150)  NULL,
    [text]          VARCHAR (1500) NULL,
    [reg_num]       SMALLINT       NULL,
    [reg_num_full]  VARCHAR (50)   NULL,
    [idm_main]      INT            NULL,
    [file_path]     VARCHAR (300)  NULL,
    [file_name_old] VARCHAR (300)  NULL,
    [file_guid]     VARCHAR (50)   NULL,
    CONSTRAINT [PK_ALGORITM$MAIN] PRIMARY KEY CLUSTERED ([id] ASC)
);

