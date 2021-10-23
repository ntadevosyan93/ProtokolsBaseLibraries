CREATE TABLE [dbo].[PARTNER] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [text]       VARCHAR (250) NULL,
    [type]       INT           NULL,
    [owner]      INT           CONSTRAINT [DF_PARTNER_owner] DEFAULT ((0)) NULL,
    [u_adress]   VARCHAR (250) NULL,
    [f_adress]   VARCHAR (250) NULL,
    [inn]        VARCHAR (50)  NULL,
    [kpp]        VARCHAR (50)  NULL,
    [ogrn]       VARCHAR (50)  NULL,
    [okpo]       VARCHAR (50)  NULL,
    [head_doljn] VARCHAR (150) NULL,
    [head_fio]   VARCHAR (50)  NULL,
    [date_in]    DATETIME      CONSTRAINT [DF_PARTNER_date_in] DEFAULT (getdate()) NULL,
    [type_in]    VARCHAR (50)  NULL,
    [arc]        BIT           NULL,
    [idm_buh]    INT           NULL,
    CONSTRAINT [PK_PARTNER] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_PARTNER_2]
    ON [dbo].[PARTNER]([type] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PARTNER_1]
    ON [dbo].[PARTNER]([text] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_PARTNER]
    ON [dbo].[PARTNER]([inn] ASC);

