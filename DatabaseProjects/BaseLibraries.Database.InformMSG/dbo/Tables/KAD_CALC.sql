CREATE TABLE [dbo].[KAD$CALC] (
    [id]           INT             IDENTITY (1, 1) NOT NULL,
    [idm_doljn]    INT             NULL,
    [idm_place]    INT             NULL,
    [idm_empl]     INT             NULL,
    [w_time_start] TIME (7)        NULL,
    [w_time_stop]  TIME (7)        NULL,
    [type]         INT             NULL,
    [type_raschet] INT             NULL,
    [del]          TINYINT         CONSTRAINT [DF_KAD$CALC_del] DEFAULT ((0)) NULL,
    [cc]           NUMERIC (18, 2) NULL
);

