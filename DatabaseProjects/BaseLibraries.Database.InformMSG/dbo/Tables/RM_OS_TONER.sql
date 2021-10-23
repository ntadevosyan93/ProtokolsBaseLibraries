CREATE TABLE [dbo].[RM$OS$TONER] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [text]          VARCHAR (150) NULL,
    [_count]        INT           NULL,
    [count_blocked] INT           NULL,
    [user_in]       VARCHAR (50)  NULL,
    [date_in]       DATETIME      CONSTRAINT [DF_RM$OS$TONER_date_in] DEFAULT (getdate()) NULL,
    [del]           INT           CONSTRAINT [DF_RM$OS$TONER_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_RM$OS$TONER] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
Create trigger [dbo].[RM$OS$TONER_updated]
   ON  dbo.RM$OS$TONER
   
   AFTER UPDATE
   as
   BEGIN
   SET NOCOUNT ON;
   insert into  [RM$OS$TONER_HISTORY] select * from deleted 
   end;