CREATE TABLE [dbo].[NEWS] (
    [id]          INT            IDENTITY (1, 1) NOT NULL,
    [user_in]     VARCHAR (50)   NULL,
    [date_in]     DATETIME       CONSTRAINT [DF_Table_1_dateInd] DEFAULT (getdate()) NULL,
    [date_news]   DATETIME       NULL,
    [tema]        VARCHAR (250)  NULL,
    [text]        VARCHAR (4000) NULL,
    [idm_org]     INT            NULL,
    [idm_section] INT            NULL,
    [guid]        VARCHAR (50)   CONSTRAINT [DF_NEWS_guid] DEFAULT (newid()) NULL,
    [user_cur]    VARCHAR (50)   NULL,
    [date_cur]    DATETIME       NULL,
    [del]         TINYINT        CONSTRAINT [DF_NEWS_del] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_NEWS] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_NEWS_2]
    ON [dbo].[NEWS]([tema] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NEWS_1]
    ON [dbo].[NEWS]([date_news] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_NEWS]
    ON [dbo].[NEWS]([del] ASC);


GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[PushMSG]
   ON  [dbo].[NEWS]
   AFTER INSERT,UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	declare @body varchar(350)
	declare @guid varchar(350)
	declare @date_cor datetime
	declare @date_in datetime
	declare @idm_city int
		select @body=tema, @guid=guid, @date_cor=date_cur, @date_in = date_in,@idm_city = case when idm_org =36 then 1 when idm_org =0 then 2  else 0 end from inserted
	if (not @date_cor is null) begin

		if (DATEADD (MINUTE , 10 , @date_in ) > @date_cor  ) return

	end
	/*
	  	insert into [PushMSG].[dbo].[MESSAGES]
		(idm_app, idm_device, body, category,  loc_key, loc_args)		
		select 1, D.id, @body, 'NEWS', 'NEWS', @guid
from KAD$EMPLOYEE ke with (NOLOCK) 
inner join [PushMSG].[dbo].DEVICES D with (NOLOCK)  on D.guid_user = guid_web
where (del = 0 or del is null) and (actual = 1 or actual is null) and D.idm_app = 1  and D.disable = 0
and  ( case when ke.idm_otdel  =36 then 1  else 0 end  = @idm_city or @idm_city=2)

	  	insert into [PushMSG].[dbo].[MESSAGES]
		(idm_app, idm_device, body, category,  loc_key, loc_args, title)		
		select 3, D.id, @body, 'NEWS', 'NEWS', @guid, 'Новость'
from KAD$EMPLOYEE ke with (NOLOCK) 
inner join [PushMSG].[dbo].DEVICES D with (NOLOCK)  on D.guid_user = guid_web
where (del = 0 or del is null) and (actual = 1 or actual is null) and D.idm_app = 3  and D.disable = 0
and  ( case when ke.idm_otdel  =36 then 1  else 0 end  = @idm_city or @idm_city=2)
*/
	  	insert into [PushMSG].[dbo].[MESSAGES]
		(idm_app, idm_device, body, category,  loc_key, loc_args, title)		
		select D.idm_app, D.id, @body, 'NEWS', 'NEWS', @guid, 'Новость'
from KAD$EMPLOYEE ke with (NOLOCK) 
inner join [PushMSG].[dbo].DEVICES D with (NOLOCK)  on D.guid_user = guid_web
where (del = 0 or del is null) and (actual = 1 or actual is null) and D.idm_app in(1,3, 7)  and D.disable = 0
and  ( case when ke.idm_otdel  =36 then 1  else 0 end  = @idm_city or @idm_city=2)


END
GO
GRANT SELECT
    ON OBJECT::[dbo].[NEWS] TO [NewsRSS]
    AS [dbo];

