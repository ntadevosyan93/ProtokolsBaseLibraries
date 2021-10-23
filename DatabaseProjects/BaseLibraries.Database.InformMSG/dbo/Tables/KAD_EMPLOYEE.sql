CREATE TABLE [dbo].[KAD$EMPLOYEE] (
    [id]                     INT           IDENTITY (1, 1) NOT NULL,
    [date_in]                DATETIME      CONSTRAINT [DF_KAD$EMPLOYEE_date_in] DEFAULT (getdate()) NULL,
    [user_in]                VARCHAR (50)  NULL,
    [fam]                    VARCHAR (150) NULL,
    [name]                   VARCHAR (150) NULL,
    [otch]                   VARCHAR (150) NULL,
    [data_b]                 DATETIME      NULL,
    [idm_doljn]              INT           NULL,
    [idm_otdel]              INT           NULL,
    [idm_org]                INT           NULL,
    [status]                 INT           NULL,
    [phone_mob]              VARCHAR (50)  NULL,
    [phone_vn]               VARCHAR (50)  NULL,
    [phone_gor]              VARCHAR (50)  NULL,
    [login_ad]               VARCHAR (50)  NULL,
    [login_1c_t]             VARCHAR (50)  NULL,
    [login_1c_id]            VARCHAR (50)  NULL,
    [bolid_card_num]         VARCHAR (50)  NULL,
    [bolid_card_id]          INT           NULL,
    [email]                  VARCHAR (50)  NULL,
    [login_web]              VARCHAR (50)  NULL,
    [web_pass_sha256]        VARCHAR (70)  NULL,
    [idm_partner]            INT           NULL,
    [view_only_otdel]        INT           CONSTRAINT [DF_KAD$EMPLOYEE_view_only_otdel] DEFAULT ((0)) NULL,
    [view_only_self]         INT           CONSTRAINT [DF_KAD$EMPLOYEE_view_only_self] DEFAULT ((0)) NULL,
    [candidate]              TINYINT       CONSTRAINT [DF_KAD$EMPLOYEE_candidate] DEFAULT ((0)) NULL,
    [idm_controller]         INT           NULL,
    [actual]                 INT           CONSTRAINT [DF_KAD$EMPLOYEE_actual] DEFAULT ((1)) NULL,
    [idm_bolid]              INT           NULL,
    [photo_path]             VARCHAR (250) NULL,
    [noFilial]               INT           CONSTRAINT [DF_KAD$EMPLOYEE_noFilial] DEFAULT ((0)) NULL,
    [realId]                 INT           NULL,
    [wt_self_depart]         INT           CONSTRAINT [DF_KAD$EMPLOYEE_wt_self_depart] DEFAULT ((0)) NULL,
    [wt_hide]                INT           NULL,
    [wt_check_fact_only]     INT           CONSTRAINT [DF_KAD$EMPLOYEE_wt_check_fact_only] DEFAULT ((0)) NULL,
    [curator_dog]            INT           CONSTRAINT [DF_KAD$EMPLOYEE_curator_dog] DEFAULT ((0)) NULL,
    [call_center_worker]     INT           CONSTRAINT [DF_KAD$EMPLOYEE_call_center_worker] DEFAULT ((0)) NULL,
    [IsLaborant]             INT           CONSTRAINT [DF_KAD$EMPLOYEE_IsLaborant] DEFAULT ((0)) NULL,
    [date_cur]               DATETIME      NULL,
    [user_cur]               VARCHAR (50)  NULL,
    [del]                    TINYINT       CONSTRAINT [DF_KAD$EMPLOYEE_del] DEFAULT ((0)) NULL,
    [guid]                   VARCHAR (50)  CONSTRAINT [DF_KAD$EMPLOYEE_guid] DEFAULT (newid()) NULL,
    [guid_web]               VARCHAR (50)  CONSTRAINT [DF_KAD$EMPLOYEE_guid_web] DEFAULT (newid()) NULL,
    [PinCode]                VARCHAR (10)  NULL,
    [auth_mobile_last_date]  DATETIME      NULL,
    [guid_iclinic]           VARCHAR (50)  NULL,
    [password_email]         VARCHAR (50)  NULL,
    [sms_only]               INT           CONSTRAINT [DF_KAD$EMPLOYEE_sms_only] DEFAULT ((0)) NULL,
    [date_dismissal]         DATETIME      NULL,
    [NotSendApplication]     TINYINT       CONSTRAINT [DF_KAD$EMPLOYEE_NotSendApplication] DEFAULT ((0)) NULL,
    [sertificate_date_expir] DATETIME      NULL,
    [ecp_status]             TINYINT       NULL,
    [ecp_date_expir]         DATETIME      NULL,
    [date_start_work]        DATETIME      NULL,
    [isKKB]                  BIT           CONSTRAINT [DF_KAD$EMPLOYEE_isKKB] DEFAULT ((0)) NULL,
    [wt_notsend]             BIT           CONSTRAINT [DF_KAD$EMPLOYEE_wt_notsend] DEFAULT ((0)) NULL,
    [standing]               INT           NULL,
    [idm_sert]               INT           NULL,
    CONSTRAINT [PK_KAD$EMPLOYEE] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$EMPLOYEE_2]
    ON [dbo].[KAD$EMPLOYEE]([guid] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$EMPLOYEE_1]
    ON [dbo].[KAD$EMPLOYEE]([idm_controller] ASC);


GO
CREATE NONCLUSTERED INDEX [CuratorDogov]
    ON [dbo].[KAD$EMPLOYEE]([del] ASC, [curator_dog] ASC, [actual] ASC);


GO
CREATE NONCLUSTERED INDEX [BigBro_1]
    ON [dbo].[KAD$EMPLOYEE]([id] ASC, [del] ASC, [actual] ASC, [realId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_KAD$EMPLOYEE]
    ON [dbo].[KAD$EMPLOYEE]([login_ad] ASC);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[KAD$EMPLOYEE_hystory]
   ON  [dbo].[KAD$EMPLOYEE]
   AFTER INSERT, UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @oldSum int,  @newSum int
	select @oldSum = CHECKSUM([fam]
      ,[name]
      ,[otch]
      ,[data_b]
      ,[idm_doljn]
      ,[idm_otdel]
      ,[idm_org]
      ,[status]
      ,[phone_mob]
      ,[phone_vn]
      ,[phone_gor]
      ,[login_ad]
      ,[login_1c_t]
      ,[login_1c_id]
      ,[bolid_card_num]
      ,[bolid_card_id]
      ,[email]
      ,[login_web]
      ,[web_pass_sha256]
      ,[idm_partner]
      ,[view_only_otdel]
      ,[view_only_self]
      ,[candidate]
      ,[idm_controller]
      ,[actual]
      ,[idm_bolid]
      ,[photo_path]
      ,[noFilial]
      ,[realId]
      ,[wt_self_depart]
      ,[wt_hide]
      ,[wt_check_fact_only]
      ,[curator_dog]
      ,[call_center_worker]
      ,[IsLaborant]
	  ,date_cur
      ,[user_cur]
      ,[del]
      ,[PinCode]
      ,[guid_iclinic]
      ,[password_email]
      ,[sms_only]
      ,[date_dismissal]
      ,[NotSendApplication]
      ,[sertificate_date_expir]
      ,[ecp_status]
      ,[ecp_date_expir]) from deleted
	select @newSum = CHECKSUM([fam]
      ,[name]
      ,[otch]
      ,[data_b]
      ,[idm_doljn]
      ,[idm_otdel]
      ,[idm_org]
      ,[status]
      ,[phone_mob]
      ,[phone_vn]
      ,[phone_gor]
      ,[login_ad]
      ,[login_1c_t]
      ,[login_1c_id]
      ,[bolid_card_num]
      ,[bolid_card_id]
      ,[email]
      ,[login_web]
      ,[web_pass_sha256]
      ,[idm_partner]
      ,[view_only_otdel]
      ,[view_only_self]
      ,[candidate]
      ,[idm_controller]
      ,[actual]
      ,[idm_bolid]
      ,[photo_path]
      ,[noFilial]
      ,[realId]
      ,[wt_self_depart]
      ,[wt_hide]
      ,[wt_check_fact_only]
      ,[curator_dog]
      ,[call_center_worker]
      ,[IsLaborant]
	  ,date_cur
      ,[user_cur]
      ,[del]
      ,[PinCode]
      ,[guid_iclinic]
      ,[password_email]
      ,[sms_only]
      ,[date_dismissal]
      ,[NotSendApplication]
      ,[sertificate_date_expir]
      ,[ecp_status]
      ,[ecp_date_expir]) from inserted

	if(@oldSum!=@newSum)
	insert into KAD$EMPLOYEE_HISTORY select * from inserted
    -- Insert statements for trigger here

END
GO
GRANT SELECT
    ON OBJECT::[dbo].[KAD$EMPLOYEE] TO PUBLIC
    AS [dbo];

