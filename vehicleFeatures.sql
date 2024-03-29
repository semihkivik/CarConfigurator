
USE [VehicleConfigurator]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 26.05.2019 00:54:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[AdminUserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK__AdminUse__02DDFE7B552FF6D5] PRIMARY KEY CLUSTERED 
(
	[AdminUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 26.05.2019 00:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarsId] [int] IDENTITY(1,1) NOT NULL,
	[CarName] [nvarchar](max) NULL,
	[CarModel] [nvarchar](100) NULL,
	[Price] [int] NOT NULL,
	[CarImagePath] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK__Cars__51FED41A4AE4DE66] PRIMARY KEY CLUSTERED 
(
	[CarsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealer]    Script Date: 26.05.2019 00:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealer](
	[DealerId] [int] IDENTITY(1,1) NOT NULL,
	[DealerName] [nvarchar](100) NULL,
	[DealerEmail] [nvarchar](100) NULL,
	[DealerPhone] [nvarchar](200) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DealerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 26.05.2019 00:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[VehicleFeaturesId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26.05.2019 00:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersId] [int] IDENTITY(1,1) NOT NULL,
	[ClientMail] [nvarchar](100) NULL,
	[DealerId] [int] NULL,
	[CarsId] [int] NULL,
	[IsStandartPackage] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrdersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleFeatures]    Script Date: 26.05.2019 00:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleFeatures](
	[VehicleFeaturesId] [int] IDENTITY(1,1) NOT NULL,
	[FeaturesName] [nvarchar](max) NULL,
	[FeaturesPrice] [int] NOT NULL,
	[IsStandartPackage] [bit] NOT NULL,
	[VehicleFeaturesTypeId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK__VehicleF__C138A147FFA6EDA5] PRIMARY KEY CLUSTERED 
(
	[VehicleFeaturesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VehicleFeaturesType]    Script Date: 26.05.2019 00:54:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleFeaturesType](
	[VehicleFeaturesTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK__VehicleF__8A347D4E33E4D342] PRIMARY KEY CLUSTERED 
(
	[VehicleFeaturesTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

INSERT [dbo].[AdminUser] ([AdminUserId], [Username], [Password], [IsActive], [IsDeleted], [CreateDate]) VALUES (1, N'admin', N'123', 1, 0, CAST(N'2019-05-25T20:05:43.323' AS DateTime))
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarsId], [CarName], [CarModel], [Price], [CarImagePath], [IsActive], [IsDeleted], [CreateDate]) VALUES (1, N'Fiesta', N'2019', 70000, N'fiesta.png', 1, 0, CAST(N'2019-05-25T01:29:34.710' AS DateTime))
INSERT [dbo].[Cars] ([CarsId], [CarName], [CarModel], [Price], [CarImagePath], [IsActive], [IsDeleted], [CreateDate]) VALUES (2, N'Focus', N'2019', 80000, N'focus.png', 1, 0, CAST(N'2019-05-25T01:30:31.897' AS DateTime))
INSERT [dbo].[Cars] ([CarsId], [CarName], [CarModel], [Price], [CarImagePath], [IsActive], [IsDeleted], [CreateDate]) VALUES (5, N'Mondeo', N'2019', 60000, N'Mondeo.png', 1, 0, CAST(N'2019-05-25T20:57:16.173' AS DateTime))
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Dealer] ON 

INSERT [dbo].[Dealer] ([DealerId], [DealerName], [DealerEmail], [DealerPhone], [IsActive], [IsDeleted], [CreateDate]) VALUES (1, N'Keleşler Oto', N'ibanez75612@yandex.com.tr', N'32432432', 1, 0, CAST(N'2019-05-25T18:19:24.840' AS DateTime))
INSERT [dbo].[Dealer] ([DealerId], [DealerName], [DealerEmail], [DealerPhone], [IsActive], [IsDeleted], [CreateDate]) VALUES (2, N'Tepretoğulları Oto', N'tepretogullari1@gmail.com', N'3243242', 1, 0, CAST(N'2019-05-25T18:19:55.680' AS DateTime))
INSERT [dbo].[Dealer] ([DealerId], [DealerName], [DealerEmail], [DealerPhone], [IsActive], [IsDeleted], [CreateDate]) VALUES (3, N'Oto Koç', N'otokoc1@gmail.com', N'1231231', 1, 0, CAST(N'2019-05-25T18:20:32.530' AS DateTime))
INSERT [dbo].[Dealer] ([DealerId], [DealerName], [DealerEmail], [DealerPhone], [IsActive], [IsDeleted], [CreateDate]) VALUES (4, N'Çetaş', N'cetas@gmaill.com', N'131231', 1, 0, CAST(N'2019-05-25T18:20:57.873' AS DateTime))
SET IDENTITY_INSERT [dbo].[Dealer] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (1, 1, 2, 1, 0, CAST(N'2019-05-25T19:34:38.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (2, 1, 23, 1, 0, CAST(N'2019-05-25T19:34:38.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (3, 1, 8, 1, 0, CAST(N'2019-05-25T19:34:38.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (4, 1, 44, 1, 0, CAST(N'2019-05-25T19:34:38.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (5, 1, 11, 1, 0, CAST(N'2019-05-25T19:34:38.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (6, 1, 48, 1, 0, CAST(N'2019-05-25T19:34:38.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (7, 1, 50, 1, 0, CAST(N'2019-05-25T19:34:38.217' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (8, 2, 1, 1, 0, CAST(N'2019-05-25T19:36:36.907' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (9, 2, 15, 1, 0, CAST(N'2019-05-25T19:36:36.907' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (10, 2, 6, 1, 0, CAST(N'2019-05-25T19:36:36.907' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (11, 2, 43, 1, 0, CAST(N'2019-05-25T19:36:36.907' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (12, 2, 10, 1, 0, CAST(N'2019-05-25T19:36:36.907' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (13, 2, 49, 1, 0, CAST(N'2019-05-25T19:36:36.907' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (14, 2, 51, 1, 0, CAST(N'2019-05-25T19:36:36.907' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (15, 3, 2, 1, 0, CAST(N'2019-05-25T20:58:10.053' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (16, 3, 34, 1, 0, CAST(N'2019-05-25T20:58:10.053' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (17, 3, 8, 1, 0, CAST(N'2019-05-25T20:58:10.053' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (18, 3, 44, 1, 0, CAST(N'2019-05-25T20:58:10.053' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (19, 3, 11, 1, 0, CAST(N'2019-05-25T20:58:10.053' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (20, 3, 48, 1, 0, CAST(N'2019-05-25T20:58:10.053' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (21, 3, 50, 1, 0, CAST(N'2019-05-25T20:58:10.053' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (22, 4, 1, 1, 0, CAST(N'2019-05-25T21:02:48.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (23, 4, 15, 1, 0, CAST(N'2019-05-25T21:02:48.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (24, 4, 6, 1, 0, CAST(N'2019-05-25T21:02:48.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (25, 4, 43, 1, 0, CAST(N'2019-05-25T21:02:48.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (26, 4, 10, 1, 0, CAST(N'2019-05-25T21:02:48.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (27, 4, 49, 1, 0, CAST(N'2019-05-25T21:02:48.013' AS DateTime))
INSERT [dbo].[OrderDetails] ([OrderDetailsId], [OrderId], [VehicleFeaturesId], [IsActive], [IsDeleted], [CreateDate]) VALUES (28, 4, 51, 1, 0, CAST(N'2019-05-25T21:02:48.013' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrdersId], [ClientMail], [DealerId], [CarsId], [IsStandartPackage], [IsActive], [IsDeleted], [CreateDate]) VALUES (1, N'ibanez75612@gmail.com', 1, 1, 1, 1, 0, CAST(N'2019-05-25T19:34:38.217' AS DateTime))
INSERT [dbo].[Orders] ([OrdersId], [ClientMail], [DealerId], [CarsId], [IsStandartPackage], [IsActive], [IsDeleted], [CreateDate]) VALUES (2, N'ibanez75612@yandex.com.tr', 1, 1, 1, 1, 0, CAST(N'2019-05-25T19:36:36.907' AS DateTime))
INSERT [dbo].[Orders] ([OrdersId], [ClientMail], [DealerId], [CarsId], [IsStandartPackage], [IsActive], [IsDeleted], [CreateDate]) VALUES (3, N'ibanez75612@gmail.com', 1, 5, 1, 1, 0, CAST(N'2019-05-25T20:58:10.053' AS DateTime))
INSERT [dbo].[Orders] ([OrdersId], [ClientMail], [DealerId], [CarsId], [IsStandartPackage], [IsActive], [IsDeleted], [CreateDate]) VALUES (4, N'ibanez75612@yandex.com.tr', 1, 2, 1, 1, 0, CAST(N'2019-05-25T21:02:48.013' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[VehicleFeatures] ON 

INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (1, N'5 Kapı', 0, 1, 1, 1, 0, CAST(N'2019-05-25T02:03:38.060' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (2, N'HatchBack', 5000, 0, 1, 1, 0, CAST(N'2019-05-25T02:05:12.700' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (3, N'4 Kapı Sedan', 0, 1, 1, 1, 0, CAST(N'2019-05-25T02:09:07.287' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (4, N'ST Line', 6000, 0, 1, 1, 0, CAST(N'2019-05-25T02:09:28.047' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (5, N'SW', 8000, 0, 1, 1, 0, CAST(N'2019-05-25T02:09:28.047' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (6, N'1.5l TDCi 100 PS', 1000, 1, 2, 1, 0, CAST(N'2019-05-25T02:12:35.043' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (7, N'1.0l EcoBoost 125 PS', 0, 1, 2, 1, 0, CAST(N'2019-05-25T02:12:59.050' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (8, N'2.0 TDCi 180PS PowerShift A/T', 9000, 0, 2, 1, 0, CAST(N'2019-05-25T02:13:34.860' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (9, N'1.5 EcoBoost 160PS A/T', 8000, 0, 2, 1, 0, CAST(N'2019-05-25T02:14:06.757' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (10, N'5 Manuel', 0, 1, 3, 1, 0, CAST(N'2019-05-25T02:15:02.793' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (11, N'5 İleri Otomatik', 9000, 0, 3, 1, 0, CAST(N'2019-05-25T02:15:22.007' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (12, N'6 Manuel', 1000, 1, 3, 1, 0, CAST(N'2019-05-25T02:15:41.387' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (13, N'6 İleri Otomatik', 12000, 0, 3, 1, 0, CAST(N'2019-05-25T02:15:54.120' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (14, N'Buz Beyazi', 0, 1, 4, 1, 0, CAST(N'2019-05-25T02:29:45.137' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (15, N'Blazer Mavi
', 1000, 1, 4, 1, 0, CAST(N'2019-05-25T02:30:15.553' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (16, N'Platin Beyaz', 1500, 1, 4, 1, 0, CAST(N'2019-05-25T02:30:51.290' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (17, N'
Spor Kirmizi', 1500, 1, 4, 1, 0, CAST(N'2019-05-25T02:30:51.290' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (18, N'Manyetik Gri', 1500, 1, 4, 1, 0, CAST(N'2019-05-25T02:30:51.290' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (19, N'
Yildirim Mavi', 1500, 1, 4, 1, 0, CAST(N'2019-05-25T02:30:51.290' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (20, N'Inci Siyahi', 1500, 1, 4, 1, 0, CAST(N'2019-05-25T02:30:51.290' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (21, N'Aytozu Gri
', 1500, 1, 4, 1, 0, CAST(N'2019-05-25T02:46:01.117' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (22, N'Buz Beyazi', 1500, 0, 4, 1, 0, CAST(N'2019-05-25T02:46:01.170' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (23, N'Blazer Mavi', 1500, 0, 4, 1, 0, CAST(N'2019-05-25T02:47:04.783' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (34, N'Platin Beyaz', 1500, 0, 4, 1, 0, CAST(N'2019-05-25T02:30:51.290' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (35, N'
Spor Kirmizi', 1500, 0, 4, 1, 0, CAST(N'2019-05-25T02:48:05.027' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (36, N'Manyetik Gri', 1500, 0, 4, 1, 0, CAST(N'2019-05-25T02:48:05.063' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (37, N'
Yildirim Mavi', 1500, 0, 4, 1, 0, CAST(N'2019-05-25T02:30:51.290' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (38, N'Inci Siyahi', 1500, 0, 4, 1, 0, CAST(N'2019-05-25T02:48:05.137' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (39, N'Aytozu Gri
', 1500, 0, 4, 1, 0, CAST(N'2019-05-25T02:48:05.173' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (43, N'Trend Siyah', 0, 1, 5, 1, 0, CAST(N'2019-05-25T02:50:32.157' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (44, N'ST-LINE SIYAH', 9000, 0, 5, 1, 0, CAST(N'2019-05-25T02:51:04.287' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (45, N'Siyah Kumaş Döşeme', 8000, 1, 5, 1, 0, CAST(N'2019-05-25T02:51:43.470' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (46, N'TREND SIYAH KUMAS', 0, 0, 5, 1, 0, CAST(N'2019-05-25T02:52:22.820' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (47, N'KONFOR PAKET', 5000, 0, 6, 1, 0, CAST(N'2019-05-25T02:54:55.500' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (48, N'SUNROOF', 7000, 0, 6, 1, 0, CAST(N'2019-05-25T02:55:23.867' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (49, N'KONFOR PAKET', 5000, 1, 6, 1, 0, CAST(N'2019-05-25T02:54:55.500' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (50, N'17 ALUMINYUM ALASIM JANT', 5000, 0, 6, 1, 0, CAST(N'2019-05-25T02:56:10.590' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (51, N'B&O MUZIK SISTEMI', 3000, 1, 6, 1, 0, CAST(N'2019-05-25T02:56:31.037' AS DateTime))
INSERT [dbo].[VehicleFeatures] ([VehicleFeaturesId], [FeaturesName], [FeaturesPrice], [IsStandartPackage], [VehicleFeaturesTypeId], [IsActive], [IsDeleted], [CreateDate]) VALUES (52, N'B&O MUZIK SISTEMI', 3000, 0, 6, 1, 0, CAST(N'2019-05-25T02:56:43.150' AS DateTime))
SET IDENTITY_INSERT [dbo].[VehicleFeatures] OFF
SET IDENTITY_INSERT [dbo].[VehicleFeaturesType] ON 

INSERT [dbo].[VehicleFeaturesType] ([VehicleFeaturesTypeId], [Name], [IsActive], [IsDeleted], [CreateDate]) VALUES (1, N'Gövde', 1, 0, CAST(N'2019-05-25T02:02:09.340' AS DateTime))
INSERT [dbo].[VehicleFeaturesType] ([VehicleFeaturesTypeId], [Name], [IsActive], [IsDeleted], [CreateDate]) VALUES (2, N'Motor', 1, 0, CAST(N'2019-05-25T02:02:18.897' AS DateTime))
INSERT [dbo].[VehicleFeaturesType] ([VehicleFeaturesTypeId], [Name], [IsActive], [IsDeleted], [CreateDate]) VALUES (3, N'Şanzıman', 1, 0, CAST(N'2019-05-25T02:02:27.223' AS DateTime))
INSERT [dbo].[VehicleFeaturesType] ([VehicleFeaturesTypeId], [Name], [IsActive], [IsDeleted], [CreateDate]) VALUES (4, N'Renk', 1, 0, CAST(N'2019-05-25T02:02:32.760' AS DateTime))
INSERT [dbo].[VehicleFeaturesType] ([VehicleFeaturesTypeId], [Name], [IsActive], [IsDeleted], [CreateDate]) VALUES (5, N'Döşeme', 1, 0, CAST(N'2019-05-25T02:02:36.410' AS DateTime))
INSERT [dbo].[VehicleFeaturesType] ([VehicleFeaturesTypeId], [Name], [IsActive], [IsDeleted], [CreateDate]) VALUES (6, N'Opsiyon', 1, 0, CAST(N'2019-05-25T02:02:43.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[VehicleFeaturesType] OFF
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [DF__AdminUser__IsAct__59FA5E80]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [DF__AdminUser__IsDel__5AEE82B9]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [DF__AdminUser__Creat__5BE2A6F2]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Cars] ADD  CONSTRAINT [DF__Cars__IsActive__49C3F6B7]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Cars] ADD  CONSTRAINT [DF__Cars__IsDeleted__4AB81AF0]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Cars] ADD  CONSTRAINT [DF__Cars__CreateDate__4BAC3F29]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Dealer] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Dealer] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Dealer] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[VehicleFeatures] ADD  CONSTRAINT [DF__VehicleFe__IsSta__534D60F1]  DEFAULT ((1)) FOR [IsStandartPackage]
GO
ALTER TABLE [dbo].[VehicleFeatures] ADD  CONSTRAINT [DF__VehicleFe__IsAct__5535A963]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[VehicleFeatures] ADD  CONSTRAINT [DF__VehicleFe__IsDel__5629CD9C]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleFeatures] ADD  CONSTRAINT [DF__VehicleFe__Creat__571DF1D5]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[VehicleFeaturesType] ADD  CONSTRAINT [DF__VehicleFe__IsAct__4E88ABD4]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[VehicleFeaturesType] ADD  CONSTRAINT [DF__VehicleFe__IsDel__4F7CD00D]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[VehicleFeaturesType] ADD  CONSTRAINT [DF__VehicleFe__Creat__5070F446]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrdersId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CarsId])
REFERENCES [dbo].[Cars] ([CarsId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([DealerId])
REFERENCES [dbo].[Dealer] ([DealerId])
GO
ALTER TABLE [dbo].[VehicleFeatures]  WITH CHECK ADD  CONSTRAINT [FK__VehicleFe__Vehic__5441852A] FOREIGN KEY([VehicleFeaturesTypeId])
REFERENCES [dbo].[VehicleFeaturesType] ([VehicleFeaturesTypeId])
GO
ALTER TABLE [dbo].[VehicleFeatures] CHECK CONSTRAINT [FK__VehicleFe__Vehic__5441852A]
GO
