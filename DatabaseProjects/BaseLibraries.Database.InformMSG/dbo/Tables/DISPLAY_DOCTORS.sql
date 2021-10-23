CREATE TABLE [dbo].[DISPLAY_DOCTORS] (
    [id]                  INT          IDENTITY (1, 1) NOT NULL,
    [guid]                VARCHAR (50) CONSTRAINT [DF_DISPLAY_DOCTORS_guid] DEFAULT (newid()) NULL,
    [idm_1c_room_number]  VARCHAR (50) NULL,
    [display_room_number] VARCHAR (50) NULL,
    [device_room_number]  VARCHAR (50) NULL,
    [device_server_ip]    VARCHAR (50) NULL,
    [device_port]         VARCHAR (50) NULL,
    CONSTRAINT [PK_DISPLAY_DOCTORS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_GUID_DISPLAY_DOCTORS]
    ON [dbo].[DISPLAY_DOCTORS]([guid] ASC);

