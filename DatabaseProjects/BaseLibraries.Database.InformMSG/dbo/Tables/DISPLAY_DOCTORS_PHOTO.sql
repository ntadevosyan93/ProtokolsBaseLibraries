﻿CREATE TABLE [dbo].[DISPLAY_DOCTORS_PHOTO] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [doctor_guid] VARCHAR (50)   NULL,
    [filepath]    VARCHAR (2050) NULL,
    CONSTRAINT [PK_DISPLAY_DOCTORS_PHOTO] PRIMARY KEY CLUSTERED ([id] ASC)
);

