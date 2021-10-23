CREATE TABLE [dbo].[PARTNERS_BACKUP] (
    [id]         INT           NOT NULL,
    [text]       VARCHAR (200) NULL,
    [type]       INT           NULL,
    [owner]      INT           CONSTRAINT [DF_PARTNERS_BACKUP_owner] DEFAULT ((0)) NULL,
    [u_adress]   VARCHAR (250) NULL,
    [f_adress]   VARCHAR (250) NULL,
    [inn]        VARCHAR (50)  NULL,
    [kpp]        VARCHAR (50)  NULL,
    [ogrn]       VARCHAR (50)  NULL,
    [okpo]       VARCHAR (50)  NULL,
    [head_doljn] VARCHAR (150) NULL,
    [head_fio]   VARCHAR (50)  NULL
);

