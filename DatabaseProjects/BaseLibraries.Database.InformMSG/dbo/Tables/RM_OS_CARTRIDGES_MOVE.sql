CREATE TABLE [dbo].[RM$OS$CARTRIDGES_MOVE] (
    [id]            INT             IDENTITY (1, 1) NOT NULL,
    [idm_billing]   INT             NULL,
    [date_in]       DATETIME        CONSTRAINT [DF_RM$OS$CARTRIDGES_MOVE_date_in] DEFAULT (getdate()) NULL,
    [date_transfer] DATETIME        NULL,
    [date_return]   DATETIME        NULL,
    [commnet]       VARCHAR (250)   NULL,
    [idm_service]   INT             NULL,
    [type_oper]     INT             NULL,
    [coast]         DECIMAL (18, 2) NULL,
    [transfer_to]   INT             NULL,
    CONSTRAINT [PK_RM$OS$CARTRIDGES_MOVE] PRIMARY KEY CLUSTERED ([id] ASC)
);

