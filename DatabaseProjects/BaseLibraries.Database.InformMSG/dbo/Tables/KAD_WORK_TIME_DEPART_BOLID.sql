CREATE TABLE [dbo].[KAD$WORK_TIME_DEPART_BOLID] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [idm_depart] INT           NULL,
    [idm_bolid]  INT           NULL,
    [URLTrassir] VARCHAR (250) NULL,
    [corTime]    INT           NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_DEPART+BOLID] PRIMARY KEY CLUSTERED ([id] ASC)
);

