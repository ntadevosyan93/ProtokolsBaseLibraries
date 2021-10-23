CREATE TABLE [dbo].[SSMP$PATIENTS_AUTOINFO] (
    [id]       INT           IDENTITY (1, 1) NOT NULL,
    [phone]    VARCHAR (50)  NULL,
    [inyear]   INT           NULL,
    [addr]     VARCHAR (350) NULL,
    [addr_dop] VARCHAR (350) NULL,
    [fam]      VARCHAR (50)  NULL,
    [name]     VARCHAR (50)  NULL,
    [otch]     VARCHAR (50)  NULL,
    [info]     VARCHAR (50)  NULL,
    CONSTRAINT [PK_SSMP$PATIENTS_AUTOINFO] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SSMP$PATIENTS_AUTOINFO]
    ON [dbo].[SSMP$PATIENTS_AUTOINFO]([phone] ASC);

