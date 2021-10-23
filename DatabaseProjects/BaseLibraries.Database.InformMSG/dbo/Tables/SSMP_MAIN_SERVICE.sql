CREATE TABLE [dbo].[SSMP$MAIN_SERVICE] (
    [id]           INT             IDENTITY (1, 1) NOT NULL,
    [idm_1c_code]  VARCHAR (10)    NULL,
    [idm_1c_text]  VARCHAR (300)   NULL,
    [idm_1c_count] NUMERIC (18, 2) NULL,
    [idm_1c_price] NUMERIC (18, 2) NULL,
    [idm_1c_summ]  NUMERIC (18, 2) NULL,
    [idm_main]     INT             NULL,
    [date_in]      DATETIME        CONSTRAINT [DF_SSMP$MAIN_SERVICE_date_in] DEFAULT (getdate()) NULL,
    [user_in]      VARCHAR (50)    NULL,
    [del]          TINYINT         CONSTRAINT [DF_SSMP$MAIN_SERVICE_del] DEFAULT ((0)) NULL
);

