CREATE TABLE [dbo].[GARAGE$CARWASH_COMPANY] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [user_in]         VARCHAR (50) NULL,
    [ip_in]           VARCHAR (50) NULL,
    [datetime_create] DATETIME     CONSTRAINT [DF_GARAGE$CARWASH_COMPANY_datetime_create] DEFAULT (getdate()) NULL,
    [id_auto_list]    INT          NULL,
    [date_wash]       DATETIME     NULL,
    [id_agent]        INT          NULL,
    CONSTRAINT [PK_GARAGE$CARWASH_COMPANY] PRIMARY KEY CLUSTERED ([id] ASC)
);

