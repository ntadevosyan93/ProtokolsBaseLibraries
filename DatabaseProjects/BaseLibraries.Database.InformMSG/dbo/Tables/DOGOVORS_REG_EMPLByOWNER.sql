﻿CREATE TABLE [dbo].[DOGOVORS$REG_EMPLByOWNER] (
    [id]        INT IDENTITY (1, 1) NOT NULL,
    [idm_empl]  INT NULL,
    [idm_owner] INT NULL,
    CONSTRAINT [PK_DOGOVORS$REG_EMPLByOWNER] PRIMARY KEY CLUSTERED ([id] ASC)
);

