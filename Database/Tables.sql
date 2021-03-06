USE [ATM]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 02/26/2014 20:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccNo] [numeric](18, 0) NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DOB] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Gender] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Add1] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Add2] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[State] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Pin] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Phno] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[MailID] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Photo] [image] NULL,
	[Iris] [image] NULL,
	[ATMPIN] [nvarchar](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ATMCARD] [nvarchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[HKey] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 02/26/2014 20:04:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[UNAME] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[PSWD] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
