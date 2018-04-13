CREATE TABLE [dbo].[Users] (
    [UserID]      INT           IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (25) NOT NULL,
    [Username]    NVARCHAR (16) NOT NULL,
    [Password]    NVARCHAR (16) NOT NULL,
    [Email]       NVARCHAR (50) NOT NULL,
    [Address]     NVARCHAR (50) NOT NULL,
    [AccessLevel] TINYINT NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserID] ASC)
);

