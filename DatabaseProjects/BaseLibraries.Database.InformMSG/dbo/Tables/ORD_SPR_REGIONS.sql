CREATE TABLE [dbo].[ORD$SPR_REGIONS] (
    [id]      INT          IDENTITY (1, 1) NOT NULL,
    [user_in] VARCHAR (50) NULL,
    [date_in] DATETIME     CONSTRAINT [DF_ORD$SPR_REGIONS_date_in] DEFAULT (getdate()) NULL,
    [text]    VARCHAR (50) NULL,
    CONSTRAINT [PK_ORD$SPR_REGIONS] PRIMARY KEY CLUSTERED ([id] ASC)
);

