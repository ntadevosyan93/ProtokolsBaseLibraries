CREATE TABLE [dbo].[HRM$REQ_Agreement] (
    [id]                   INT            IDENTITY (1, 1) NOT NULL,
    [user_in]              VARCHAR (50)   NULL,
    [date_in]              DATETIME       CONSTRAINT [DF_HRM$REQ_Agreement_date_in_1] DEFAULT (getdate()) NULL,
    [idm_req_cand]         INT            NULL,
    [idm_candidate]        INT            NULL,
    [idm_status]           INT            NULL,
    [comment]              VARCHAR (1024) NULL,
    [idm_depart]           INT            NULL,
    [idm_doljn]            INT            NULL,
    [idm_type_employment]  INT            NULL,
    [estimated_start_date] DATETIME       NULL,
    [shedule]              INT            NULL,
    [shedule_description]  VARCHAR (250)  NULL,
    [drug]                 INT            NULL,
    [guid]                 VARCHAR (50)   CONSTRAINT [DF_HRM$REQ_Agreement_guid] DEFAULT (newid()) NULL,
    [user_cur]             VARCHAR (50)   NULL,
    [date_cur]             DATETIME       NULL,
    [del]                  INT            CONSTRAINT [DF_HRM$REQ_Agreement_del_1] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_HRM$REQ_Agreement_1] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[HRM$REQ_Agreement] TO PUBLIC
    AS [dbo];

