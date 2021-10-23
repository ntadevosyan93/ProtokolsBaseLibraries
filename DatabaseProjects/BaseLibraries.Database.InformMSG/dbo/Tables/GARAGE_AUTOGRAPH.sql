CREATE TABLE [dbo].[GARAGE$AUTOGRAPH] (
    [id]                  INT           IDENTITY (1, 1) NOT NULL,
    [CarDevice]           INT           NULL,
    [CarModel]            VARCHAR (200) NULL,
    [CarNumber]           VARCHAR (200) NULL,
    [CarAlias]            VARCHAR (200) NULL,
    [CarTelNum]           VARCHAR (200) NULL,
    [CarLatitude]         FLOAT (53)    NULL,
    [CarLongitude]        FLOAT (53)    NULL,
    [CarCourse]           FLOAT (53)    NULL,
    [CarSpeed]            FLOAT (53)    NULL,
    [CarParkTime]         VARCHAR (200) NULL,
    [CarLastTime]         VARCHAR (200) NULL,
    [CarLastATime]        VARCHAR (200) NULL,
    [hide]                INT           CONSTRAINT [DF_GARAGE$AUTOGRAPH_show] DEFAULT ((0)) NULL,
    [idAuto]              INT           NULL,
    [androidGUID]         VARCHAR (50)  NULL,
    [androidLastNetQuery] DATETIME      NULL,
    [androidLastTelemat]  DATETIME      NULL,
    [disableAutografXY]   TINYINT       CONSTRAINT [DF_GARAGE$AUTOGRAPH_disableAutografXY] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_GARAGE$AUTOGRAPH] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE TRIGGER [dbo].[GARAGE$AUTOGRAPH_UPDATE]
   ON  [dbo].[GARAGE$AUTOGRAPH]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
declare @id int
declare @long float
declare @lat float
declare @long_old float
declare @lat_old float
declare @CPT varchar(200)
declare @CPT_old varchar(200)

select @id=id, @long=CarLongitude, @lat=CarLatitude,@CPT=CarParkTime from inserted
select @id=id, @long_old=CarLongitude, @lat_old=CarLatitude,@CPT_old=CarParkTime from deleted


if (ltrim(rtrim(@CPT))='0:00:00') and ((ltrim(rtrim(@CPT_old))<>'0:00:00'))
	insert into GARAGE$AUTOGRAPH_ROUTE(idm_autograph,start_lat,start_long,start_time) values(@id,@lat_old,@long_old,getdate())

if (ltrim(rtrim(@CPT))<>'0:00:00') and ((ltrim(rtrim(@CPT_old))='0:00:00'))
	update GARAGE$AUTOGRAPH_ROUTE set stop_lat=@lat,stop_long=@long,stop_time=getdate() where idm_autograph=@id and (stop_lat=0 or stop_lat is null)
	
	
	--(idm_autograph,start_lat,start_long,start_time) values(@id,@lat_old,@long_old,getdate())

--update SSMP$TEAM set date_stop=@dt where idm_avto=@id and date_stop is null and del=0 and id<>@idm
--select @status_o=status from deleted

--if (@status_o<>@status_i)
	--update REQ set date_last_update=getdate() where id=@id

    -- Insert statements for trigger here

END