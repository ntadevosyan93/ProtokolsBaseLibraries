CREATE TABLE [dbo].[Resources] (
    [UniqueID]     INT            IDENTITY (1, 1) NOT NULL,
    [ResourceID]   INT            NOT NULL,
    [ResourceName] NVARCHAR (50)  NULL,
    [Color]        INT            NULL,
    [Image]        IMAGE          NULL,
    [CustomField1] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED ([UniqueID] ASC)
);

