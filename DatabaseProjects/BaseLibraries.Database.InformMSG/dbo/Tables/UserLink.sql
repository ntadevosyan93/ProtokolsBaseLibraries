CREATE TABLE [dbo].[UserLink] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [link]       VARCHAR (500) NULL,
    [parameters] VARCHAR (500) NULL,
    [user_in]    VARCHAR (500) NULL,
    [date_in]    DATETIME      NULL,
    [controller] VARCHAR (50)  NULL,
    [Action]     VARCHAR (50)  NULL,
    [query]      VARCHAR (500) NULL,
    [ip]         VARCHAR (50)  NULL,
    CONSTRAINT [PK_UserLink] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20200504-102749]
    ON [dbo].[UserLink]([user_in] ASC, [Action] ASC);

