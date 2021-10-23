CREATE TABLE [dbo].[CHECKSIT$PLACESIT] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [user_in]         VARCHAR (50) NULL,
    [ip_in]           VARCHAR (50) NULL,
    [datetime_create] DATETIME     CONSTRAINT [DF_CHECKSIT$PLACESIT_datetime_create] DEFAULT (getdate()) NULL,
    [datetime_sit]    DATETIME     NULL,
    [id_phone]        INT          NULL,
    [id_empl_smena_1] INT          NULL,
    [id_empl_smena_2] INT          NULL,
    [id_empl_smena_3] INT          NULL,
    CONSTRAINT [PK_CHECKSIT$PLACESIT] PRIMARY KEY CLUSTERED ([id] ASC)
);

