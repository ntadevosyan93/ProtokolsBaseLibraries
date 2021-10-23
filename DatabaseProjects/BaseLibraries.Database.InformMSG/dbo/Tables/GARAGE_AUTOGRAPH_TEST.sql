CREATE TABLE [dbo].[GARAGE$AUTOGRAPH_TEST] (
    [id]           INT           IDENTITY (1, 1) NOT NULL,
    [CarDevice]    INT           NULL,
    [CarModel]     VARCHAR (200) NULL,
    [CarNumber]    VARCHAR (200) NULL,
    [CarAlias]     VARCHAR (200) NULL,
    [CarTelNum]    VARCHAR (200) NULL,
    [CarLatitude]  FLOAT (53)    NULL,
    [CarLongitude] FLOAT (53)    NULL,
    [CarCourse]    FLOAT (53)    NULL,
    [CarSpeed]     FLOAT (53)    NULL,
    [CarParkTime]  VARCHAR (200) NULL,
    [CarLastTime]  VARCHAR (200) NULL,
    [CarLastATime] VARCHAR (200) NULL,
    [hide]         INT           CONSTRAINT [DF_GARAGE$AUTOGRAPH_TEST_hide] DEFAULT ((0)) NULL,
    [idAuto]       INT           NULL,
    [androidGUID]  VARCHAR (50)  NULL,
    CONSTRAINT [PK_GARAGE$AUTOGRAPH_TEST] PRIMARY KEY CLUSTERED ([id] ASC)
);

