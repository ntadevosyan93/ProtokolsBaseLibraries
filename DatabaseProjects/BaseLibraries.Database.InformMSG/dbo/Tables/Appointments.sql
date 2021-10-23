CREATE TABLE [dbo].[Appointments] (
    [UniqueID]       INT            IDENTITY (1, 1) NOT NULL,
    [Type]           INT            NULL,
    [StartDate]      SMALLDATETIME  NULL,
    [EndDate]        SMALLDATETIME  NULL,
    [AllDay]         BIT            NULL,
    [Subject]        NVARCHAR (50)  NULL,
    [Location]       NVARCHAR (50)  NULL,
    [Description]    NVARCHAR (MAX) NULL,
    [Status]         INT            NULL,
    [Label]          INT            NULL,
    [ResourceID]     INT            NULL,
    [ResourceIDs]    NVARCHAR (MAX) NULL,
    [ReminderInfo]   NVARCHAR (MAX) NULL,
    [RecurrenceInfo] NVARCHAR (MAX) NULL,
    [CustomField1]   NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED ([UniqueID] ASC)
);

