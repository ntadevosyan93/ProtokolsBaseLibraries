CREATE TABLE [dbo].[SMS_SERVICES_VIEWS] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [idm_services] INT           NULL,
    [text]         VARCHAR (150) NULL,
    [disable]      TINYINT       CONSTRAINT [DF_SMS_SERVICES_VIEWS_disable] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_SMS_SERVICES_VIEWS] PRIMARY KEY CLUSTERED ([id] ASC)
);

