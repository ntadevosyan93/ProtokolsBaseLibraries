CREATE TABLE [dbo].[KAD$WORK_TIME_LOG] (
    [id]        INT          IDENTITY (1, 1) NOT NULL,
    [date_in]   DATETIME     CONSTRAINT [DF_KAD$WORK_TIME_LOG_date_in] DEFAULT (getdate()) NULL,
    [rowId]     INT          NULL,
    [action]    VARCHAR (50) NULL,
    [idm_empl]  INT          NULL,
    [TimeVal]   DATETIME     NULL,
    [HozOrgan]  INT          NULL,
    [DoorIndex] INT          NULL,
    [NumCom]    INT          NULL,
    CONSTRAINT [PK_KAD$WORK_TIME_LOG] PRIMARY KEY CLUSTERED ([id] ASC)
);

