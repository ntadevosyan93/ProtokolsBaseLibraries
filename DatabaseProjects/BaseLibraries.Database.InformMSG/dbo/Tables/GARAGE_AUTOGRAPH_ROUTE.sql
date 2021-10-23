CREATE TABLE [dbo].[GARAGE$AUTOGRAPH_ROUTE] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [idm_autograph] INT           NULL,
    [start_lat]     FLOAT (53)    CONSTRAINT [DF_GARAGE$AUTOGRAPH_ROUTE_start_lat] DEFAULT ((0)) NULL,
    [start_long]    FLOAT (53)    CONSTRAINT [DF_GARAGE$AUTOGRAPH_ROUTE_start_long] DEFAULT ((0)) NULL,
    [stop_lat]      FLOAT (53)    CONSTRAINT [DF_GARAGE$AUTOGRAPH_ROUTE_stop_lat] DEFAULT ((0)) NULL,
    [stop_long]     FLOAT (53)    CONSTRAINT [DF_GARAGE$AUTOGRAPH_ROUTE_stop_long] DEFAULT ((0)) NULL,
    [start_time]    DATETIME      NULL,
    [stop_time]     DATETIME      NULL,
    [start_addr]    VARCHAR (200) NULL,
    [stop_addr]     VARCHAR (200) NULL,
    CONSTRAINT [PK_GARAGE$AUTOGRAPH_ROUTE] PRIMARY KEY CLUSTERED ([id] ASC)
);

