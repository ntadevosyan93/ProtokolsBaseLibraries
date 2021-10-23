CREATE TABLE [dbo].[DOGOVORS$REG] (
    [id]               INT           IDENTITY (1, 1) NOT NULL,
    [date_in]          DATETIME      CONSTRAINT [DF_DOGOVORS$REG_date_in] DEFAULT (getdate()) NULL,
    [guid]             VARCHAR (50)  CONSTRAINT [DF_DOGOVORS$REG_guid] DEFAULT (newid()) NULL,
    [user_in]          VARCHAR (50)  NULL,
    [number_storage]   VARCHAR (MAX) NULL,
    [date_reg]         DATETIME      NULL,
    [set_numb_automat] INT           CONSTRAINT [DF_DOGOVORS$REG_set_numb_hand] DEFAULT ((0)) NULL,
    [r_number]         VARCHAR (MAX) NULL,
    [r_date]           DATETIME      NULL,
    [idm_partner]      INT           NULL,
    [idm_dog_type]     INT           NULL,
    [subject]          VARCHAR (MAX) NULL,
    [cost_no_nds]      VARCHAR (50)  NULL,
    [cost_nds_value]   VARCHAR (50)  NULL,
    [cost_summ]        VARCHAR (50)  NULL,
    [r_date_deadline]  DATETIME      NULL,
    [idm_empl]         INT           NULL,
    [notes_conflicts]  VARCHAR (MAX) NULL,
    [notes_agreement]  VARCHAR (MAX) NULL,
    [notes]            VARCHAR (MAX) NULL,
    [idm_owner]        INT           NULL,
    [status]           INT           CONSTRAINT [DF_DOGOVORS$REG_status] DEFAULT ((1)) NULL,
    [idm_template]     INT           NULL,
    [pay_rules]        VARCHAR (MAX) NULL,
    [date_deadline]    DATETIME      NULL,
    [some_status]      INT           NULL,
    [curator_sended]   INT           CONSTRAINT [DF_DOGOVORS$REG_curator_sended] DEFAULT ((0)) NULL,
    [idm_isp]          INT           NULL,
    [isp_sended]       INT           NULL,
    [old_dogovor]      INT           CONSTRAINT [DF_DOGOVORS$REG_old_dogovor] DEFAULT ((0)) NULL,
    [idm_parent]       INT           NULL,
    [del]              TINYINT       CONSTRAINT [DF_DOGOVORS$REG_del] DEFAULT ((0)) NULL,
    [user_del]         VARCHAR (50)  NULL,
    [date_del]         DATETIME      NULL,
    [comment_clearNum] VARCHAR (MAX) NULL,
    [user_clear]       VARCHAR (50)  NULL,
    [date_clear]       DATETIME      NULL,
    [parent_dog]       INT           NULL,
    CONSTRAINT [PK_DOGOVORS$REG] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
create trigger dogovor_delete
on dbo.DOGOVORS$REG
instead of delete
as
declare @id int
select @id=id from deleted
update dbo.dogovors$reg set del=1 where id=@id
GO
CREATE TRIGGER [dbo].[DOGOVORS$REG_AfterUpdate]
   ON  dbo.DOGOVORS$REG
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
SET NOCOUNT ON;
	--declare @id int
	--declare @idm int
	--declare @status_i int
	--declare @status_o int
	--declare @dt datetime
	--select @idm=id from inserted
insert into DOGOVORS$REG_HISTORY select * from deleted 
	--update SSMP$MAIN set date_cor=getdate() where id=@idm
	--select @status_o=status from deleted
	--if (@status_o<>@status_i)
	--update REQ set date_last_update=getdate() where id=@id
    -- Insert statements for trigger here

END
GO


CREATE TRIGGER [dbo].[DOGOVORS$REG_change_status]
   ON  [dbo].[DOGOVORS$REG]
   AFTER UPDATE
AS 
BEGIN
declare @status_new int
declare @status_old int
declare @idm_dog int

select @status_new = some_status, @idm_dog = id
From inserted

select @status_old = some_status
From deleted

if @status_new != @status_old and @status_new in (4,6)  and @idm_dog is not null
begin
	update RM$OS$BILLING
	set status = 3
	where idm_dogovor = @idm_dog and status =1 and  (IsNewStatus is null or  IsNewStatus=0 )


 
end


SET NOCOUNT ON;
 
END