CREATE TABLE [dbo].[RM$BUDGET$GROUPINGS] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [text]       VARCHAR (150) NULL,
    [ParentID]   INT           CONSTRAINT [DF_GROUPINGS_idm_p] DEFAULT ((0)) NULL,
    [idm_depart] INT           NULL,
    [idm_group]  INT           NULL,
    [del]        BIT           CONSTRAINT [DF_RM$BUDGET$GROUPINGS_del] DEFAULT ((0)) NULL,
    [actual]     BIT           CONSTRAINT [DF_RM$BUDGET$GROUPINGS_actual] DEFAULT ((1)) NOT NULL,
    [type_group] SMALLINT      NULL,
    CONSTRAINT [PK_GROUPINGS] PRIMARY KEY CLUSTERED ([id] ASC)
);

