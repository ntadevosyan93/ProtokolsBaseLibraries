CREATE TABLE [dbo].[HRM$REQ_CANDIDATE_HISTORY] (
    [id]              INT          IDENTITY (1, 1) NOT NULL,
    [id_OLD]          INT          NOT NULL,
    [date_in]         DATETIME     NULL,
    [user_in]         VARCHAR (50) NULL,
    [idm_req]         INT          NULL,
    [idm_candidate]   INT          NULL,
    [status]          INT          NULL,
    [del]             INT          NULL,
    [type_employment] INT          NULL,
    [user_cur]        VARCHAR (50) NULL,
    [date_cur]        DATETIME     NULL,
    CONSTRAINT [PK_HRM$REQ_CANDIDATE_HIST] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[HRM$REQ_CANDIDATE_HISTORY] TO PUBLIC
    AS [dbo];

