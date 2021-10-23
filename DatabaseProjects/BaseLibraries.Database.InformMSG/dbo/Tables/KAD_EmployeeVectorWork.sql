CREATE TABLE [dbo].[KAD$EmployeeVectorWork] (
    [id]           INT          IDENTITY (1, 1) NOT NULL,
    [idm_employee] INT          NULL,
    [text]         VARCHAR (50) NULL,
    [del]          BIT          CONSTRAINT [DF_KAD$EmployeeVectorWork_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_KAD$EmployeeVectorWork] PRIMARY KEY CLUSTERED ([id] ASC)
);

