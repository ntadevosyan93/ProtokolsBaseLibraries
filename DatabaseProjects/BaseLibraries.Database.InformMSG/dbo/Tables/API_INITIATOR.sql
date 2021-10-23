﻿CREATE TABLE [dbo].[API$INITIATOR] (
    [id]      INT           IDENTITY (1, 1) NOT NULL,
    [date_in] DATETIME      CONSTRAINT [DF_API$INITIATOR_date_in] DEFAULT (getdate()) NULL,
    [guid]    VARCHAR (50)  CONSTRAINT [DF_API$INITIATOR_guid] DEFAULT (newid()) NULL,
    [descr]   VARCHAR (512) NULL,
    CONSTRAINT [PK_API$INITIATOR] PRIMARY KEY CLUSTERED ([id] ASC)
);

