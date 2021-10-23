CREATE TABLE [dbo].[PLACES_TUBES_ERR_PHONE] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [idm_place] INT          NULL,
    [phone]     VARCHAR (50) NULL,
    CONSTRAINT [PK_PLACES_TUBES_ERR_PHONE] PRIMARY KEY CLUSTERED ([id] ASC)
);

