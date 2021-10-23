CREATE TABLE [dbo].[SMS_SMPP] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [description]    VARCHAR (50)  NULL,
    [SystemID]       VARCHAR (50)  NULL,
    [Password]       VARCHAR (50)  NULL,
    [Host]           VARCHAR (50)  NULL,
    [Port]           INT           NULL,
    [SourceAddress]  VARCHAR (50)  NULL,
    [ViewWhere]      VARCHAR (MAX) NULL,
    [UserDataHeader] INT           CONSTRAINT [DF_SMS_SMPP_UserDataHeader] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_SMS_SMPP] PRIMARY KEY CLUSTERED ([id] ASC)
);

