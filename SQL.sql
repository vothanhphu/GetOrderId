
USE [OrderDB]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 9/27/2017 9:10:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[SeqNoDate] [int] NOT NULL,
	[CustomerID] [nvarchar](5) NOT NULL,
	[EmployeeID] [nvarchar](5) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShippedDate] [datetime] NOT NULL,
	[TotalItems] [int] NOT NULL,
	[TotalAmount] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[SeqNoDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeqNumber]    Script Date: 9/27/2017 9:10:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeqNumber](
	[SeqName] [nvarchar](30) NOT NULL,
	[SeqNumber] [int] NOT NULL,
	[DateChanged] [datetime] NOT NULL,
 CONSTRAINT [PK_SeqNumber] PRIMARY KEY CLUSTERED 
(
	[SeqName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Orders] ([OrderID], [SeqNoDate], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [TotalItems], [TotalAmount]) VALUES (1, 20170927, N'CUSO1', N'EMP01', CAST(N'2017-09-27T00:00:00.000' AS DateTime), CAST(N'2017-01-01T00:00:00.000' AS DateTime), 3, 5)
GO
INSERT [dbo].[Orders] ([OrderID], [SeqNoDate], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [TotalItems], [TotalAmount]) VALUES (2, 20170927, N'CUSO1', N'EMP01', CAST(N'2017-09-27T00:00:00.000' AS DateTime), CAST(N'2017-01-01T00:00:00.000' AS DateTime), 3, 5)
GO
INSERT [dbo].[Orders] ([OrderID], [SeqNoDate], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [TotalItems], [TotalAmount]) VALUES (1010, 20180119, N'CUSO1', N'EMP01', CAST(N'2018-01-19T00:00:00.000' AS DateTime), CAST(N'2017-01-01T00:00:00.000' AS DateTime), 3, 5)
GO
INSERT [dbo].[Orders] ([OrderID], [SeqNoDate], [CustomerID], [EmployeeID], [OrderDate], [ShippedDate], [TotalItems], [TotalAmount]) VALUES (1011, 20180119, N'CUSO1', N'EMP01', CAST(N'2018-01-19T00:00:00.000' AS DateTime), CAST(N'2017-01-01T00:00:00.000' AS DateTime), 3, 5)
GO
INSERT [dbo].[SeqNumber] ([SeqName], [SeqNumber], [DateChanged]) VALUES (N'OrderId', 2, CAST(N'2017-09-27T00:00:00.000' AS DateTime))
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_SeqNoDate]  DEFAULT ((0)) FOR [SeqNoDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__Customer__239E4DCF]  DEFAULT ('') FOR [CustomerID]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__Employee__24927208]  DEFAULT ('') FOR [EmployeeID]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__OrderDat__25869641]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__ShippedD__267ABA7A]  DEFAULT (getdate()) FOR [ShippedDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__TotalIte__276EDEB3]  DEFAULT ((0)) FOR [TotalItems]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF__Orders__TotalAmo__286302EC]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[SeqNumber] ADD  DEFAULT ('') FOR [SeqName]
GO
ALTER TABLE [dbo].[SeqNumber] ADD  DEFAULT ('') FOR [SeqNumber]
GO
ALTER TABLE [dbo].[SeqNumber] ADD  DEFAULT (getdate()) FOR [DateChanged]
GO
