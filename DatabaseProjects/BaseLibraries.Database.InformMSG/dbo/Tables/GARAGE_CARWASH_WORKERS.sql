CREATE TABLE [dbo].[GARAGE$CARWASH_WORKERS] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [user_in]         VARCHAR (50) NULL,
    [ip_in]           VARCHAR (50) NULL,
    [datetime_create] DATETIME     CONSTRAINT [DF_GARAGE$CARWASH_WORKERS_datetime_create] DEFAULT (getdate()) NULL,
    [id_auto_list]    INT          NULL,
    [date_wash]       DATETIME     NULL,
    [tid]             INT          NULL,
    CONSTRAINT [PK_GARAGE$CARWASH_WORKERS] PRIMARY KEY CLUSTERED ([id] ASC)
);

