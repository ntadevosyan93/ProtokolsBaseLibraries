CREATE TABLE [dbo].[CHECKSIT$ACTIVITY_LIST] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [ip_in]           VARCHAR (50) NULL,
    [user_in]         VARCHAR (50) NULL,
    [comp_name]       VARCHAR (50) NULL,
    [datetime_create] DATETIME     CONSTRAINT [DF_CHECKSIT$ACTIVITY_LIST_datetime_create] DEFAULT (getdate()) NULL,
    [status]          INT          NULL,
    [id_empl]         INT          NULL,
    CONSTRAINT [PK_CHECKSIT$ACTIVITY_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);

