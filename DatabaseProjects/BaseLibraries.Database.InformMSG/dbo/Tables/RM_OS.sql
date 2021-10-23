CREATE TABLE [dbo].[RM$OS] (
    [id]                  INT            IDENTITY (1, 1) NOT NULL,
    [date_in]             DATETIME       CONSTRAINT [DF_RM$OS_date_in] DEFAULT (getdate()) NULL,
    [user_in]             VARCHAR (50)   NULL,
    [idm_org]             INT            NULL,
    [idm_type]            INT            NULL,
    [idm_addr]            INT            NULL,
    [idm_mol]             INT            NULL,
    [place]               VARCHAR (50)   NULL,
    [text]                VARCHAR (2000) NULL,
    [date_start]          DATETIME       NULL,
    [serial_num]          VARCHAR (50)   NULL,
    [inv_num]             VARCHAR (50)   NULL,
    [doc_date_purchase]   DATETIME       NULL,
    [doc_num_purchase]    VARCHAR (50)   NULL,
    [cash_date]           DATETIME       NULL,
    [cash_number]         VARCHAR (50)   NULL,
    [receip_date]         DATETIME       NULL,
    [receip_number]       VARCHAR (50)   NULL,
    [idm_partner]         INT            NULL,
    [del]                 TINYINT        CONSTRAINT [DF_RM$OS_del] DEFAULT ((0)) NOT NULL,
    [idm_invoice]         INT            NULL,
    [status]              INT            NULL,
    [idm_partner_service] INT            NULL,
    [inv_num_extended]    VARCHAR (50)   NULL,
    [idm_head_org]        INT            NULL,
    [idm_otdel]           INT            NULL,
    [idm_responsible]     INT            NULL,
    [user_cor]            VARCHAR (50)   NULL,
    [date_cor]            DATETIME       NULL,
    [date_release]        SMALLINT       NULL,
    [date_expired]        DATE           NULL,
    [date_check]          DATE           NULL,
    [idm_priority]        INT            NULL,
    [idm_billing]         INT            NULL,
    [idm_depart_offices]  INT            NULL,
    [guid]                VARCHAR (50)   CONSTRAINT [DF_RM$OS_guid] DEFAULT (newid()) NULL,
    CONSTRAINT [PK_RM$OS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200803-130613]
    ON [dbo].[RM$OS]([inv_num] ASC, [del] ASC);


GO
CREATE NONCLUSTERED INDEX [DocNumber]
    ON [dbo].[RM$OS]([doc_num_purchase] ASC);


GO
CREATE NONCLUSTERED INDEX [docDate]
    ON [dbo].[RM$OS]([doc_date_purchase] ASC);


GO
CREATE NONCLUSTERED INDEX [IdmPartner]
    ON [dbo].[RM$OS]([idm_partner] ASC);


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[rm_os_histor]
   ON  [dbo].[RM$OS]
   AFTER DELETE,UPDATE, INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [RM$OS_HISTORY]
          
     SELECT * FROM inserted
    -- Insert statements for trigger here

END