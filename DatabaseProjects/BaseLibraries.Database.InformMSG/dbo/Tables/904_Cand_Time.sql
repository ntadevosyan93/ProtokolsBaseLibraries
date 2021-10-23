CREATE TABLE [dbo].[904_Cand_Time] (
    [id]          INT          IDENTITY (1, 1) NOT NULL,
    [work_time]   DATETIME     NULL,
    [day]         VARCHAR (50) NULL,
    [del_time]    NCHAR (50)   NULL,
    [idm_empl]    INT          NULL,
    [dayOfWeek]   INT          NULL,
    [TimeFromDay] DATETIME     NULL,
    [del]         INT          CONSTRAINT [DF_904_Cand_Time_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_904_Cand_Time] PRIMARY KEY CLUSTERED ([id] ASC)
);

