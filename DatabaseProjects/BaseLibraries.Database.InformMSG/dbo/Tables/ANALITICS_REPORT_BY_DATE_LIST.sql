CREATE TABLE [dbo].[ANALITICS$REPORT_BY_DATE_LIST] (
    [id]       INT            IDENTITY (1, 1) NOT NULL,
    [idm_rbd]  INT            NULL,
    [sql_text] VARCHAR (1024) NULL,
    [step]     SMALLINT       NULL,
    [text]     VARCHAR (512)  NULL,
    CONSTRAINT [PK_ANALITICS$REPORT_BY_DATE_LIST] PRIMARY KEY CLUSTERED ([id] ASC)
);

