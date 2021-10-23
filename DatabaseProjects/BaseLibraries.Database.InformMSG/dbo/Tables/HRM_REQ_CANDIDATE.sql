CREATE TABLE [dbo].[HRM$REQ_CANDIDATE] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [date_in]         DATETIME     CONSTRAINT [DF_HRM$REQ_CANDIDATE_date_in] DEFAULT (getdate()) NULL,
    [user_in]         VARCHAR (50) NULL,
    [idm_req]         INT          NULL,
    [idm_candidate]   INT          NULL,
    [status]          INT          NULL,
    [del]             INT          CONSTRAINT [DF_HRM$REQ_CANDIDATE_del] DEFAULT ((0)) NULL,
    [type_employment] INT          NULL,
    [user_cur]        VARCHAR (50) NULL,
    [date_cur]        DATETIME     NULL,
    CONSTRAINT [PK_HRM$REQ_CANDIDATE] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO

CREATE TRIGGER [dbo].[trigger_ModifyREQ_CANDIDATE]
    ON [dbo].[HRM$REQ_CANDIDATE]  AFTER UPDATE
    AS 
BEGIN
/*--if(
--(select count(*) from (
--select [id], [date_in], [user_in], [idm_req], [idm_candidate], [status], [del], [type_employment]
--From deleted
--union 
--select  [id], [date_in], [user_in], [idm_req], [idm_candidate], [status], [del], [type_employment]
--From inserted
--)D) > 1) or not exists(select * From deleted)
--begin
insert into [dbo].[HRM$REQ_CANDIDATE_HISTORY]( [id_OLD], [date_in], [user_in], [idm_req], [idm_candidate], [status], [del], [type_employment])
select [id], [date_in], [user_in], [idm_req], [idm_candidate], [status], [del], [type_employment]
From inserted
--end*/

insert into dbo.HRM$REQ_CANDIDATE_HISTORY select * from deleted
END
GO
GRANT SELECT
    ON OBJECT::[dbo].[HRM$REQ_CANDIDATE] TO PUBLIC
    AS [dbo];

