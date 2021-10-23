CREATE TABLE [dbo].[GARAGE$ANDROID_ROUTE] (
    [id]          INT           IDENTITY (1, 1) NOT NULL,
    [device_guid] VARCHAR (100) NULL,
    [route_guid]  VARCHAR (100) NULL,
    [inrun]       INT           NULL,
    [reason]      INT           NULL,
    [start_lat]   FLOAT (53)    CONSTRAINT [DF_GARAGE$ANDROID_ROUTE_start_lat] DEFAULT ((0)) NULL,
    [start_long]  FLOAT (53)    CONSTRAINT [DF_GARAGE$ANDROID_ROUTE_start_long] DEFAULT ((0)) NULL,
    [stop_lat]    FLOAT (53)    CONSTRAINT [DF_GARAGE$ANDROID_ROUTE_stop_lat] DEFAULT ((0)) NULL,
    [stop_long]   FLOAT (53)    CONSTRAINT [DF_GARAGE$ANDROID_ROUTE_stop_long] DEFAULT ((0)) NULL,
    [start_time]  DATETIME      NULL,
    [stop_time]   DATETIME      NULL,
    [distance]    FLOAT (53)    NULL,
    [start_addr]  VARCHAR (200) NULL,
    [stop_addr]   VARCHAR (200) NULL,
    CONSTRAINT [PK_GARAGE$ANDROID_ROUTE] PRIMARY KEY CLUSTERED ([id] ASC)
);

