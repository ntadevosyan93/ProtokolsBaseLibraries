CREATE TABLE [dbo].[POLLS$TEMPLATE_LIST] (
    [id]           INT            IDENTITY (1, 1) NOT NULL,
    [idm_template] INT            NULL,
    [row_num]      SMALLINT       NULL,
    [question]     VARCHAR (50)   NULL,
    [options]      VARCHAR (2048) NULL
);

