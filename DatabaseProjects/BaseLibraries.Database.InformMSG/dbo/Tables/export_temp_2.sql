CREATE TABLE [dbo].[export_temp_2] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [name]          VARCHAR (300) NULL,
    [inv_number]    VARCHAR (50)  NULL,
    [serial_number] VARCHAR (50)  NULL,
    CONSTRAINT [PK_export_temp_2] PRIMARY KEY CLUSTERED ([id] ASC)
);

