CREATE TABLE [dbo].[CHECKSIT$SETTINGS] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [masterpassword] VARCHAR (50) NULL,
    [suspectTmeSec]  INT          NULL,
    [besureTimeSec]  INT          NULL,
    CONSTRAINT [PK_CHECKSIT$SETTINGS] PRIMARY KEY CLUSTERED ([id] ASC)
);

