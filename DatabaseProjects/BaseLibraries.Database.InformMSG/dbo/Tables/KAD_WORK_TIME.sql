CREATE TABLE [dbo].[KAD$WORK_TIME] (
    [id]              INT            IDENTITY (1, 1) NOT NULL,
    [date_in]         DATETIME       CONSTRAINT [DF_KAD$WORK_TIME_date_in] DEFAULT (getdate()) NULL,
    [user_in]         VARCHAR (50)   NULL,
    [idm_empl]        INT            NULL,
    [estimated_start] DATETIME       NULL,
    [estimated_stop]  DATETIME       NULL,
    [actual_start]    DATETIME       NULL,
    [actual_stop]     DATETIME       NULL,
    [del]             TINYINT        CONSTRAINT [DF_KAD$WORK_TIME_del] DEFAULT ((0)) NULL,
    [break_start]     DATETIME       NULL,
    [break_stop]      DATETIME       NULL,
    [break_time]      SMALLINT       NULL,
    [idm_status]      INT            NULL,
    [idm_depart]      INT            NULL,
    [freeDay]         INT            NULL,
    [comment]         VARCHAR (2048) NULL,
    [handmark]        INT            CONSTRAINT [DF_KAD$WORK_TIME_handmark] DEFAULT ((0)) NULL,
    [from_1c]         TINYINT        CONSTRAINT [DF_KAD$WORK_TIME_from_1c] DEFAULT ((0)) NULL,
    [curatorComment]  VARCHAR (2048) NULL,
    [actual_start_2]  DATETIME       NULL,
    [actual_stop_2]   DATETIME       NULL,
    [freeDay_2]       INT            NULL,
    [sb_ok]           INT            CONSTRAINT [DF_KAD$WORK_TIME_sb_ok] DEFAULT ((0)) NULL,
    [user_cor]        VARCHAR (50)   NULL,
    [date_cor]        DATETIME       NULL,
    [idm_violation]   INT            NULL,
    [idm_breakdown]   INT            CONSTRAINT [DF_KAD$WORK_TIME_idm_breakdown] DEFAULT ((1)) NULL,
    [comment_it]      VARCHAR (2048) NULL,
    [idm_doljn]       INT            NULL,
    [first_checkIn]   DATETIME       NULL,
    [is_lock]         TINYINT        CONSTRAINT [DF_KAD$WORK_TIME_is_lock] DEFAULT ((0)) NULL,
    [fast_control]    TINYINT        NULL,
    [sb]              BIT            NULL,
    [prichina]        VARCHAR (5000) NULL,
    [fixed]           BIT            NULL,
    [guid]            VARCHAR (50)   CONSTRAINT [DF_KAD$WORK_TIME_guid] DEFAULT (CONVERT([varchar](50),newid(),0)) NULL,
    CONSTRAINT [PK_KAD$WORK_TIME] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$WORK_TIME_guid]
    ON [dbo].[KAD$WORK_TIME]([guid] ASC);


GO
CREATE NONCLUSTERED INDEX [_dta_index_KAD$WORK_TIME_8_1538820544__K4_K5_K1_K31]
    ON [dbo].[KAD$WORK_TIME]([idm_empl] ASC, [estimated_start] ASC, [id] ASC, [first_checkIn] ASC);


GO
CREATE NONCLUSTERED INDEX [WT_CALCULATE_STOP]
    ON [dbo].[KAD$WORK_TIME]([del] ASC, [idm_depart] ASC, [idm_empl] ASC, [estimated_stop] DESC);


GO
CREATE NONCLUSTERED INDEX [WT_CALCULATE_START]
    ON [dbo].[KAD$WORK_TIME]([del] ASC, [idm_depart] ASC, [idm_empl] ASC, [estimated_start] DESC);


GO
CREATE NONCLUSTERED INDEX [BigBro_2]
    ON [dbo].[KAD$WORK_TIME]([estimated_stop] DESC, [idm_empl] ASC, [del] ASC, [idm_depart] ASC);


GO
CREATE NONCLUSTERED INDEX [BigBro_start]
    ON [dbo].[KAD$WORK_TIME]([estimated_start] DESC, [idm_empl] ASC, [del] ASC, [idm_depart] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$WORK_TIME_2]
    ON [dbo].[KAD$WORK_TIME]([idm_empl] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$WORK_TIME_1]
    ON [dbo].[KAD$WORK_TIME]([estimated_stop] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$WORK_TIME]
    ON [dbo].[KAD$WORK_TIME]([estimated_start] ASC);


GO
CREATE NONCLUSTERED INDEX [del]
    ON [dbo].[KAD$WORK_TIME]([del] ASC);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[breakTime] 
   ON  dbo.KAD$WORK_TIME
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
   
   --update KAD$WORK_TIME set 
 --  break_time = (select DATEPART ( MINUTE, [break_stop] - break_start) from inserted where id = (select id from inserted))where id = (select id from inserted)
    -- Insert statements for trigger here

END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER block_update_all_timees
   ON   dbo.KAD$WORK_TIME
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
/*	declare @user_cur varchar(50) set @user_cur = (select user_cor from inserted)
 
		insert into KAD$WORK_TIME_CHANGE_TEST (idm_wt, result, user_cor)
		values((select top(1) id from inserted), 1, @user_cur)
	
	if (not(@user_cur is null) 
and not(@user_cur='')
and not (@user_cur='VIPCG\s.roginya')) begin
		
		--if ( (@user_cur='VIPCG\o.teba')) begin
		
		declare @esta datetime
		declare @esto datetime
		declare @asta datetime
		declare @asto datetime
		
		select @esta = estimated_start, @esto = estimated_stop, @asta = actual_start, @asto = actual_stop from deleted
		
		if 
		(
		not (@esta is null)and
		not (@esto is null)and
		not (@asta is null)and
		not (@asto is null)
		) 
		
		begin
		
				update KAD$WORK_TIME set
				idm_empl = (select idm_empl from deleted),
				estimated_start = (select estimated_start from deleted),
				estimated_stop = (select estimated_stop from deleted),
				actual_start = (select actual_start from deleted),
				actual_stop = (select actual_stop from deleted),
				del = (select del from deleted),
				break_start = (select break_start from deleted),
				break_stop = (select break_stop from deleted),		
				break_time = (select break_time from deleted),		
				idm_status = (select idm_status from deleted),
				idm_depart = (select idm_depart from deleted),
				freeDay = (select freeDay from deleted),
				comment = (select comment from deleted),
				handmark = (select handmark from deleted),
				from_1c = (select from_1c from deleted),
				curatorComment = (select curatorComment from deleted),
				actual_start_2 = (select actual_start_2 from deleted),
				actual_stop_2 = (select actual_stop_2 from deleted),
				freeDay_2 = (select freeDay_2 from deleted),
				sb_ok = (select sb_ok from inserted),
				user_cor = (select user_cor from inserted),
				date_cor = (select date_cor from inserted),
				idm_violation = (select idm_violation from inserted),
				idm_breakdown = (select idm_breakdown from inserted),
				comment_it = (select comment_it from inserted)
				where id = (select id from deleted)
			
			
			
 				--RAISERROR('Запись заблокирована для изменения',16,1)
		
		end
		
		
 
	
	
	end
*/
    -- Insert statements for trigger here

END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[hystory]
   ON  [dbo].[KAD$WORK_TIME]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	insert into KAD$WORK_TIME_HISTORY 
	select [id], [date_in], [user_in], [idm_empl], [estimated_start], [estimated_stop], [actual_start], [actual_stop], [del], [break_start], [break_stop], [break_time], [idm_status], [idm_depart], [freeDay], [comment], [handmark], [from_1c], [curatorComment], [actual_start_2], [actual_stop_2], [freeDay_2], [sb_ok], [user_cor],GetDate(), [idm_violation], [idm_breakdown], [comment_it], [idm_doljn], [first_checkIn], [is_lock], [fast_control], [sb], [prichina], [fixed], [guid] from inserted
    -- Insert statements for trigger here

END
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Ставит Рогиня', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'KAD$WORK_TIME', @level2type = N'COLUMN', @level2name = N'fixed';

