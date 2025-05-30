USE [master]
GO
/****** Object:  Database [FastWashdb]    Script Date: 30.05.2025 3:15:21 ******/
CREATE DATABASE [FastWashdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FastWashdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FastWashdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FastWashdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\FastWashdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FastWashdb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FastWashdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FastWashdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FastWashdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FastWashdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FastWashdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FastWashdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FastWashdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FastWashdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FastWashdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FastWashdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FastWashdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FastWashdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FastWashdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FastWashdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FastWashdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FastWashdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FastWashdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FastWashdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FastWashdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FastWashdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FastWashdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FastWashdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FastWashdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FastWashdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FastWashdb] SET  MULTI_USER 
GO
ALTER DATABASE [FastWashdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FastWashdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FastWashdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FastWashdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FastWashdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FastWashdb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FastWashdb] SET QUERY_STORE = ON
GO
ALTER DATABASE [FastWashdb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FastWashdb]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 30.05.2025 3:15:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 30.05.2025 3:15:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[ClientId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Adress] [nvarchar](max) NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 30.05.2025 3:15:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 30.05.2025 3:15:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 30.05.2025 3:15:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[TypeId] [int] NULL,
	[Days] [int] NULL,
	[Cost] [int] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30.05.2025 3:15:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (11, N'Полина', N'polina1990@hotmail.com', N'+7 (966) 816-54-21')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (12, N'Тимофей', N'timofey74@gmail.com', N'+7 (913) 555-86-91')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (13, N'Василиса', N'vasilisa1990@ya.ru', N'+7 (950) 797-78-81')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (14, N'Петр', N'petr1963@rambler.ru', N'+7 (927) 952-90-26')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (15, N'Тамара', N'tamara25101989@yandex.ru', N'+7 (923) 169-74-25')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (16, N'Ася', N'asya.dvornikova@rambler.ru', N'+7 (906) 985-51-44')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (17, N'Адам', N'adam12021961@yandex.ru', N'+7 (944) 848-93-78')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (18, N'Федот', N'fedot9312@outlook.com', N'+7 (937) 707-78-55')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (19, N'Григорий', N'grigoriy7388@outlook.com', N'+7 (930) 643-82-81')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (20, N'Дарья', N'darya63@ya.ru', N'+7 (939) 882-62-73')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (21, N'asdf', N'asdf', N'asdfasd')
INSERT [dbo].[Client] ([Id], [Name], [Email], [Phone]) VALUES (22, N'asdf', N'asdf', N'asdf')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (1, CAST(N'2025-02-14' AS Date), 11, 1, N'Интернациональная ул., д. 1 кв.125', 2150)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (2, CAST(N'2025-02-15' AS Date), 12, 2, N'Школьная ул., д. 25 кв.155', 2150)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (3, CAST(N'2025-02-16' AS Date), 13, 3, N'Октябрьский пер., д. 10 кв.186', 2150)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (4, CAST(N'2025-02-17' AS Date), 14, 4, N'Западная ул., д. 12 кв.163', 2150)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (5, CAST(N'2025-02-18' AS Date), 15, 5, N'Заречная ул., д. 22 кв.97', 2150)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (6, CAST(N'2025-02-19' AS Date), 16, 6, N'Школьная ул., д. 15 кв.139', 2150)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (12, CAST(N'2025-05-28' AS Date), 21, 1, NULL, 11400)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (13, CAST(N'2025-05-28' AS Date), 16, 1, N'asdf', 9900)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (14, CAST(N'2025-05-28' AS Date), 22, 1, N'asdf', 3950)
INSERT [dbo].[Order] ([Id], [Date], [ClientId], [UserId], [Adress], [Amount]) VALUES (15, CAST(N'2025-05-29' AS Date), 12, 1, N'фывафывафыва', 7450)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderService] ON 

INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (1, 1, 1, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (2, 1, 2, 2)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (3, 2, 1, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (4, 3, 4, 2)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (5, 4, 3, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (6, 3, 3, 2)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (7, 6, 3, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (10, 3, 5, 2)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (11, 12, 1, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (12, 12, 2, 2)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (13, 13, 3, 3)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (14, 14, 2, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (15, 15, 1, 1)
INSERT [dbo].[OrderService] ([Id], [OrderId], [ServiceId], [Quantity]) VALUES (16, 15, 2, 1)
SET IDENTITY_INSERT [dbo].[OrderService] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name], [TypeId], [Days], [Cost]) VALUES (1, N'Куртка', NULL, 2, 4500)
INSERT [dbo].[Service] ([Id], [Name], [TypeId], [Days], [Cost]) VALUES (2, N'Пальто', NULL, 3, 3950)
INSERT [dbo].[Service] ([Id], [Name], [TypeId], [Days], [Cost]) VALUES (3, N'Пуховик', NULL, 3, 3300)
INSERT [dbo].[Service] ([Id], [Name], [TypeId], [Days], [Cost]) VALUES (4, N'Плащ', NULL, 4, 2750)
INSERT [dbo].[Service] ([Id], [Name], [TypeId], [Days], [Cost]) VALUES (5, N'Ветровка', NULL, 4, 2150)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (1, N'Абоимова', N'1', N'+7 (919) 862-38-95', N'tamara@hotmail.com', 1, N'1')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (2, N'Вельдина', N'Елизавета', N'+7 (987) 596-61-99', N'elizaveta1984@yandex.ru', 1, N'27b59a81d')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (3, N'Щитта', N'Римма', N'+7 (909) 771-23-52', N'rimma66@yandex.ru', 1, N'54efe2f93')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (4, N'Лагутова', N'Марина', N'+7 (969) 457-95-47', N'marina1226@outlook.com', 1, N'bc2e833a5')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (5, N'Таттар', N'Герасим', N'+7 (920) 433-30-50', N'gerasim02041995@hotmail.com', 1, N'3a7e73560')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (6, N'Кучеров', N'Юрий', N'+7 (925) 472-53-77', N'yuriy26011977@mail.ru', 1, N'9a7585af3')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (7, N'Дябин', N'Макар', N'+7 (967) 541-98-89', N'makar5046@hotmail.com', 1, N'48f026567')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (8, N'Куусинена', N'Антонина', N'+7 (961) 119-79-62', N'antonina82@rambler.ru', 1, N'19760d11e')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (9, N'Сарана', N'Илья', N'+7 (914) 843-47-17', N'ilya.sarana@gmail.com', 1, N'2f6440709')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (10, N'Якшибаева', N'Марфа', N'+7 (995) 545-67-26', N'marfa05021990@ya.ru', 1, N'c17c12772')
INSERT [dbo].[User] ([Id], [Lastname], [Name], [Phone], [Email], [RoleId], [Password]) VALUES (11, N'2', N'2', N'2', N'2', 1, N'2')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Order]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Service]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [FastWashdb] SET  READ_WRITE 
GO
