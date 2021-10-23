CREATE TABLE [dbo].[HRM$CANDIDATE_History] (
    [id]              INT              IDENTITY (1, 1) NOT NULL,
    [id_old]          INT              NOT NULL,
    [date_in]         DATETIME         NULL,
    [user_in]         VARCHAR (50)     NULL,
    [name_f]          VARCHAR (50)     NULL,
    [name_i]          VARCHAR (50)     NULL,
    [name_o]          VARCHAR (50)     NULL,
    [phone1]          VARCHAR (15)     NULL,
    [phone2]          VARCHAR (15)     NULL,
    [email1]          VARCHAR (50)     NULL,
    [email2]          VARCHAR (50)     NULL,
    [date_birth]      DATETIME         NULL,
    [education]       INT              NULL,
    [specialization]  INT              NULL,
    [profession]      INT              NULL,
    [status]          INT              NULL,
    [employment_date] DATETIME         NULL,
    [city]            INT              NULL,
    [description]     VARCHAR (2048)   NULL,
    [guid]            UNIQUEIDENTIFIER NULL,
    [fio]             VARCHAR (200)    NOT NULL,
    [user_cur]        VARCHAR (50)     NULL,
    [date_cur]        DATETIME         NULL,
    [del]             INT              NULL,
    [drug]            INT              NULL,
    CONSTRAINT [PK_HRM$CANDIDATE_HISTORY] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[HRM$CANDIDATE_History] TO PUBLIC
    AS [dbo];

