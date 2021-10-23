CREATE TABLE [dbo].[HRM$CANDIDATE] (
    [id]              INT              IDENTITY (1, 1) NOT NULL,
    [date_in]         DATETIME         CONSTRAINT [DF_HRM$CANDIDATE_date_in] DEFAULT (getdate()) NULL,
    [user_in]         VARCHAR (50)     NULL,
    [name_f]          VARCHAR (50)     NULL,
    [name_i]          VARCHAR (50)     NULL,
    [name_o]          VARCHAR (50)     NULL,
    [phone1]          VARCHAR (15)     NULL,
    [phone2]          VARCHAR (15)     NULL,
    [email1]          VARCHAR (50)     NULL,
    [email2]          VARCHAR (50)     NULL,
    [date_birth]      DATETIME         NULL,
    [education]       INT              NULL,
    [specialization]  INT              NULL,
    [profession]      INT              NULL,
    [status]          INT              NULL,
    [employment_date] DATETIME         NULL,
    [city]            INT              NULL,
    [description]     VARCHAR (2048)   NULL,
    [guid]            UNIQUEIDENTIFIER CONSTRAINT [DF_HRM$CANDIDATE_guid] DEFAULT (newid()) NULL,
    [fio]             AS               ((((isnull([name_f],'')+' ')+isnull([name_i],''))+' ')+isnull([name_o],'')),
    [user_cur]        VARCHAR (50)     NULL,
    [date_cur]        DATETIME         NULL,
    [del]             INT              CONSTRAINT [DF_HRM$CANDIDATE_del] DEFAULT ((0)) NULL,
    [drug]            INT              NULL,
    CONSTRAINT [PK_HRM$CANDIDATE] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_HRM$CANDIDATE]
    ON [dbo].[HRM$CANDIDATE]([del] ASC);


GO





CREATE TRIGGER [dbo].[trigger_ModifyCANDIDATE]
    ON [dbo].[HRM$CANDIDATE]    AFTER UPDATE, INSERT
    AS 
BEGIN
--if(
--(select count(*) from (
--select [name_f], [name_i], [name_o], [phone1], [phone2], [email1], [email2], [date_birth], [education], [specialization], [profession], [status], [employment_date], [city], [description], [guid], [user_cur], [date_cur], [del], [drug]
--From deleted
--union 
--select [name_f], [name_i], [name_o], [phone1], [phone2], [email1], [email2], [date_birth], [education], [specialization], [profession], [status], [employment_date], [city], [description], [guid], [user_cur], [date_cur], [del], [drug]
--From inserted
--)D) > 1 --если апдейт 
--or not exists(select * From deleted)
--) 
--begin
insert into [dbo].[HRM$CANDIDATE_History]
select *
From deleted
end
--END
GO
GRANT SELECT
    ON OBJECT::[dbo].[HRM$CANDIDATE] TO PUBLIC
    AS [dbo];

