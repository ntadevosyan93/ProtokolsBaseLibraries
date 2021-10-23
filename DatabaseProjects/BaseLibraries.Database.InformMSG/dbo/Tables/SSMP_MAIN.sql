CREATE TABLE [dbo].[SSMP$MAIN] (
    [id]                  INT            IDENTITY (1, 1) NOT NULL,
    [user_in]             VARCHAR (50)   NULL,
    [date_in]             DATETIME       CONSTRAINT [DF_SSMP$MAIN_date_in] DEFAULT (getdate()) NULL,
    [count]               TINYINT        NULL,
    [fam]                 VARCHAR (50)   NULL,
    [name]                VARCHAR (50)   NULL,
    [otch]                VARCHAR (50)   NULL,
    [date_b]              DATETIME       NULL,
    [address]             VARCHAR (250)  NULL,
    [address_dop]         VARCHAR (1024) NULL,
    [phone_1]             VARCHAR (50)   NULL,
    [phone_2]             VARCHAR (50)   NULL,
    [calling_fio]         VARCHAR (100)  NULL,
    [symptoms]            VARCHAR (512)  NULL,
    [comment]             VARCHAR (512)  NULL,
    [idm_team]            INT            NULL,
    [idm_reg_1c]          VARCHAR (50)   CONSTRAINT [DF_SSMP$MAIN_idm_reg_1c] DEFAULT ((0)) NULL,
    [status]              SMALLINT       NULL,
    [del]                 TINYINT        CONSTRAINT [DF_SSMP$MAIN_del] DEFAULT ((0)) NOT NULL,
    [year]                SMALLINT       NULL,
    [result_t]            VARCHAR (512)  NULL,
    [date_end]            DATETIME       NULL,
    [phone_sys]           VARCHAR (20)   NULL,
    [dt_call]             DATETIME       NULL,
    [dt_departure]        DATETIME       NULL,
    [dt_service_start]    DATETIME       NULL,
    [dt_service_stop]     DATETIME       NULL,
    [guid]                VARCHAR (50)   NULL,
    [date_cor]            DATETIME       CONSTRAINT [DF_SSMP$MAIN_date_cor] DEFAULT (getdate()) NULL,
    [paytype]             INT            NULL,
    [date_recive_team]    DATETIME       NULL,
    [control_time_out]    SMALLINT       NULL,
    [control_descr]       VARCHAR (1024) NULL,
    [user_cor]            VARCHAR (50)   NULL,
    [control_datetime]    DATETIME       NULL,
    [control_reaction]    DATETIME       NULL,
    [sms_sended]          INT            CONSTRAINT [DF_SSMP$MAIN_sms_sended] DEFAULT ((0)) NULL,
    [date_brigade_start]  DATETIME       NULL,
    [mkb10_id]            INT            NULL,
    [help]                VARCHAR (MAX)  NULL,
    [date_brigade_end]    DATETIME       NULL,
    [date_car_start]      DATETIME       NULL,
    [date_car_stop]       DATETIME       NULL,
    [date_car_diff]       DATETIME       NULL,
    [date_car_time_to_go] DATETIME       NULL,
    [brigade_full]        VARCHAR (500)  NULL,
    [brigade_doctor]      VARCHAR (100)  NULL,
    [idm_insurance]       INT            NULL,
    CONSTRAINT [PK_SSMP$MAIN] PRIMARY KEY CLUSTERED ([id] DESC)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_SSMP$MAIN_8_1399676034__K18_K19_K16_K1]
    ON [dbo].[SSMP$MAIN]([status] ASC, [del] ASC, [idm_team] ASC, [id] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SSMP$MAIN_1]
    ON [dbo].[SSMP$MAIN]([date_in] ASC, [status] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SSMP$MAIN]
    ON [dbo].[SSMP$MAIN]([status] ASC);


GO
CREATE STATISTICS [_dta_stat_1399676034_16_1_18_19]
    ON [dbo].[SSMP$MAIN]([idm_team], [id], [status], [del]);


GO
CREATE STATISTICS [_dta_stat_1399676034_19_1_16]
    ON [dbo].[SSMP$MAIN]([del], [id], [idm_team]);


GO
CREATE STATISTICS [_dta_stat_1399676034_16_18]
    ON [dbo].[SSMP$MAIN]([idm_team], [status]);


GO
CREATE STATISTICS [_dta_stat_1399676034_16_19]
    ON [dbo].[SSMP$MAIN]([idm_team], [del]);


GO
CREATE STATISTICS [_dta_stat_1399676034_18_1]
    ON [dbo].[SSMP$MAIN]([status], [id]);


GO
CREATE TRIGGER [dbo].[SSMP$MAIN_AfterUpdate]
   ON  [dbo].[SSMP$MAIN]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @id int
declare @idm int
declare @fam varchar(50)
declare @name varchar(50)
declare @otch varchar(50)
--declare @status_i int
--declare @status_o int
declare @dt datetime
select @idm=id,@fam=fam,@name=name,@otch=otch from inserted
insert into SSMP$MAIN_HISTORY select * from deleted 
update SSMP$MAIN set date_car_time_to_go =  (date_car_start - date_in) where id=@idm
update SSMP$MAIN set date_cor=getdate(),fam=ltrim(rtrim(@fam)), name=LTRIM(RTRIM(@name)), otch=LTRIM(RTRIM(@otch)) where id=@idm

--select @status_o=status from deleted


--if (@status_o<>@status_i)
	--update REQ set date_last_update=getdate() where id=@id

    -- Insert statements for trigger here

END