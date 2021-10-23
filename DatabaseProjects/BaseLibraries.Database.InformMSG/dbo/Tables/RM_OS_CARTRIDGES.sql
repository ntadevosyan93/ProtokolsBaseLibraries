CREATE TABLE [dbo].[RM$OS$CARTRIDGES] (
    [id]             INT           IDENTITY (1, 1) NOT NULL,
    [text]           VARCHAR (250) NULL,
    [barcode]        VARCHAR (250) NULL,
    [type]           VARCHAR (250) NULL,
    [idm_owner]      INT           NULL,
    [idm_cur_place]  INT           NULL,
    [idm_toner]      INT           NULL,
    [idm_department] INT           NULL,
    [date_in]        DATETIME      CONSTRAINT [DF_RM$OS$CARTRIDGES_date_in] DEFAULT (getdate()) NULL,
    [user_in]        VARCHAR (50)  NULL,
    CONSTRAINT [PK_RM$OS$CARTRIDGES] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_CARTRIDGES_TONERS] FOREIGN KEY ([idm_toner]) REFERENCES [dbo].[RM$OS$TONER] ([id])
);

