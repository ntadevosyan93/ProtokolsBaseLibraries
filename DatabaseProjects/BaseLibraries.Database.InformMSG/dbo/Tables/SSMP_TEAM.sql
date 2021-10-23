CREATE TABLE [dbo].[SSMP$TEAM] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [user_in]       VARCHAR (50) NULL,
    [date_in]       DATETIME     CONSTRAINT [DF_SSMP$TEAM_date_in] DEFAULT (getdate()) NULL,
    [date_start]    DATETIME     NULL,
    [date_stop]     DATETIME     NULL,
    [idm_avto]      INT          NULL,
    [idm_driver]    INT          NULL,
    [idm_paramedic] INT          NULL,
    [idm_doctor]    INT          NULL,
    [del]           TINYINT      CONSTRAINT [DF_SSMP$TEAM_del] DEFAULT ((0)) NOT NULL,
    [idm_brigade]   INT          NULL,
    CONSTRAINT [PK_SSMP$TEAM] PRIMARY KEY CLUSTERED ([id] DESC)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_SSMP$TEAM_8_738101670__K10_K5_K1_K6_K9]
    ON [dbo].[SSMP$TEAM]([del] ASC, [date_stop] ASC, [id] ASC, [idm_avto] ASC, [idm_doctor] ASC);


GO
CREATE STATISTICS [_dta_stat_738101670_1_10_5_6_9]
    ON [dbo].[SSMP$TEAM]([id], [del], [date_stop], [idm_avto], [idm_doctor]);


GO
CREATE STATISTICS [_dta_stat_738101670_10_5_9_1]
    ON [dbo].[SSMP$TEAM]([del], [date_stop], [idm_doctor], [id]);


GO
CREATE STATISTICS [_dta_stat_738101670_1_6_9_10]
    ON [dbo].[SSMP$TEAM]([id], [idm_avto], [idm_doctor], [del]);


GO
CREATE STATISTICS [_dta_stat_738101670_5_1_6]
    ON [dbo].[SSMP$TEAM]([date_stop], [id], [idm_avto]);


GO
CREATE STATISTICS [_dta_stat_738101670_10_5_6]
    ON [dbo].[SSMP$TEAM]([del], [date_stop], [idm_avto]);


GO
CREATE STATISTICS [_dta_stat_738101670_6_10]
    ON [dbo].[SSMP$TEAM]([idm_avto], [del]);


GO
CREATE STATISTICS [_dta_stat_738101670_9_10]
    ON [dbo].[SSMP$TEAM]([idm_doctor], [del]);


GO
CREATE TRIGGER [dbo].[SSMP$TEAM_AfterInsert]
   ON  [dbo].[SSMP$TEAM]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @id int
declare @idm int
--declare @status_i int
--declare @status_o int
declare @dt datetime
select @idm=id, @id=idm_avto,@dt=date_start from inserted
update SSMP$TEAM set date_stop=@dt where idm_avto=@id and date_stop is null and del=0 and id<>@idm

--select @status_o=status from deleted

--if (@status_o<>@status_i)
	--update REQ set date_last_update=getdate() where id=@id

    -- Insert statements for trigger here

END
GO
CREATE TRIGGER [dbo].[SSMP$TEAM_AfterUpdate]
   ON  [dbo].[SSMP$TEAM]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @id int
declare @idm int
--declare @status_i int
--declare @status_o int
declare @dt datetime
select @idm=id, @id=idm_avto,@dt=date_start from inserted
insert into SSMP$TEAM_HISTORY select * from deleted 
update SSMP$TEAM set date_in=getdate() where id=@idm
--select @status_o=status from deleted

--if (@status_o<>@status_i)
	--update REQ set date_last_update=getdate() where id=@id

    -- Insert statements for trigger here

END