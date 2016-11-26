
/*
SQL Employee Database file for
Go Group Project at GMIT 2016
Date:    Nov 17, 2016
Adapted from: Murach's ADO.NET 4 with Visual Basic 2010
*/

/* Check if database already exists and delete it if it does exist*/
IF EXISTS(SELECT 1 FROM master.dbo.sysdatabases WHERE name = 'GoGroupDB') 
BEGIN
DROP DATABASE GoGroupDB
END
GO

CREATE DATABASE GoGroupDB
GO

USE [GoGroupDB]
GO

/****** Object:  Table [dbo].[Employees]    Script Date: 05/23/2013 13:58:32  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(5,1) NOT NULL,
	[FirstName] [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[LastName] [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[Email] [varchar](50) COLLATE Latin1_General_CI_AS NOT NULL,
	[Password] [varchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[Employees] ON
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Password]) VALUES (0, N'Alanna', N'Curran', N'alanna@gomail.com', N'password1')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Declan', N'Duffy', N'declan@gomail.com', N'password2')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Claire', N'Finn', N'claire@gomail.com', N'password3')
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'Thomas', N'McNamara', N'thomas@gomail.com', N'password4')
SET IDENTITY_INSERT [dbo].[Employees] OFF
/****** Object:  Table [dbo].[Jobs]    Script Date: 05/23/2013 13:58:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Jobs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Jobs](
	[JobID] [int] IDENTITY(1010,1) NOT NULL,
	[JobTitle] [nchar](30) COLLATE Latin1_General_CI_AS NOT NULL,
	[WageRate] [int] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
)
END
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (0, N'Beautician', 9.25)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (1, N'Builder', 9.15)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (2, N'Carpenter', 10.00)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (3, N'Cleaner', 9.00)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (4, N'Delivery', 9.15)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (5, N'Electrician', 10.25)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (6, N'Farmer', 8.50)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (7, N'Gardener', 12.30)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (8, N'Hair and Beauty', 9.15)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (9, N'Hairdresser', 9.15)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (10, N'Mechanic', 9.15)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (11, N'Painter', 9.15)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (12, N'Plumber', 16.74)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (13, N'Technician', 20.83)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (14, N'Tiler', 13.43)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (15, N'Transport', 18.11)
INSERT [dbo].[Jobs] ([JobID], [JobTitle], [WageRate]) VALUES (16, N'Other', 14.20)
SET IDENTITY_INSERT [dbo].[Jobs] OFF

/****** Object:  Table [dbo].[EmployeeJobs]    Script Date: 05/23/2013 13:58:32  ******/
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployeeJobs](
	[EmployeeID] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[wosQuantity] [int] NOT NULL,
	[wosCost] [money] NOT NULL,
 CONSTRAINT [PK_EmployeeJobs] PRIMARY KEY CLUSTERED 
(
    [EmployeeID] ASC,
	[JobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON
GO
INSERT [dbo].[EmployeeJobs] ([EmployeeID],[JobID],[wosQuantity], [wosCost]) VALUES (9999, 1000,  11, 11.11)
SET ANSI_PADDING OFF
GO /

/****** Object:  ForeignKey [FK_EmployeeJobs_Employees]     ******/
/*ALTER TABLE [dbo].[EmployeeJobs]  WITH NOCHECK ADD CONSTRAINT [FK_EmployeeJobs_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeJobs] CHECK CONSTRAINT [FK_EmployeeJobs_Employees]
GO */

/****** Object:  ForeignKey [FK_EmployeeJobs_Jobs]     ******/
/*ALTER TABLE [dbo].[EmployeeJobs]  WITH CHECK ADD CONSTRAINT [FK_EmployeeJobs_Jobs] FOREIGN KEY([JobID])
REFERENCES [dbo].[Jobs] ([JobID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[EmployeeJobs] CHECK CONSTRAINT [FK_EmployeeJobs_Jobs]
GO */
