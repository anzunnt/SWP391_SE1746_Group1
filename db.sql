USE [master]
GO
/****** Object:  Database [FS_Thien]    Script Date: 2/1/2024 12:10:39 PM ******/
CREATE DATABASE [FS_Thien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FS_Thien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FS_Thien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FS_Thien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FS_Thien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FS_Thien] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FS_Thien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FS_Thien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FS_Thien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FS_Thien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FS_Thien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FS_Thien] SET ARITHABORT OFF 
GO
ALTER DATABASE [FS_Thien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FS_Thien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FS_Thien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FS_Thien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FS_Thien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FS_Thien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FS_Thien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FS_Thien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FS_Thien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FS_Thien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FS_Thien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FS_Thien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FS_Thien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FS_Thien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FS_Thien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FS_Thien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FS_Thien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FS_Thien] SET RECOVERY FULL 
GO
ALTER DATABASE [FS_Thien] SET  MULTI_USER 
GO
ALTER DATABASE [FS_Thien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FS_Thien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FS_Thien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FS_Thien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FS_Thien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FS_Thien] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FS_Thien', N'ON'
GO
ALTER DATABASE [FS_Thien] SET QUERY_STORE = OFF
GO
USE [FS_Thien]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[created_on] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_by] [int] NULL,
	[modified_on] [datetime] NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[created_on] [datetime2](0) NULL,
	[modified_on] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[cartId] [int] NOT NULL,
	[num] [int] NOT NULL,
	[created_on] [datetime2](0) NULL,
	[modified_on] [datetime2](0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[title] [varchar](100) NOT NULL,
	[description] [text] NOT NULL,
	[created_by] [int] NULL,
	[created_on] [datetime] NULL,
	[modified_by] [int] NULL,
	[modifie_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news_group]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [varchar](50) NOT NULL,
	[created_by] [int] NULL,
	[created_on] [datetime] NULL,
	[modified_by] [int] NULL,
	[modified_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[discount] [float] NULL,
	[order_date] [datetime2](0) NULL,
	[updated_on] [datetime2](0) NULL,
	[updated_by] [int] NULL,
	[status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[orderId] [int] NOT NULL,
	[num] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](75) NULL,
	[Description] [nvarchar](max) NULL,
	[BasePrice] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Quantity] [smallint] NULL,
	[CreatedAt] [smalldatetime] NULL,
	[ModifiedAt] [smalldatetime] NULL,
	[PublishedAt] [smalldatetime] NULL,
	[State] [bit] NULL,
	[StartsAt] [smalldatetime] NULL,
	[EndsAt] [smalldatetime] NULL,
	[Style] [nvarchar](50) NULL,
	[CreatedBy] [int] NULL,
	[ModifiedBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](150) NOT NULL,
	[ProductId] [int] NULL,
	[CreatedAt] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[ModifiedAt] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ImageDescription] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2/1/2024 12:10:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](150) NULL,
	[code_verify] [nvarchar](15) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](30) NULL,
	[image] [nvarchar](150) NULL,
	[dob] [date] NULL,
	[address] [nvarchar](80) NULL,
	[status] [int] NULL,
	[created_on] [datetime] NULL,
	[created_by] [int] NULL,
	[modified_by] [int] NULL,
	[modified_on] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([id], [username], [password], [created_on], [created_by], [modified_by], [modified_on]) VALUES (1, N'admin1', N'123456', NULL, NULL, NULL, NULL)
INSERT [dbo].[Admin] ([id], [username], [password], [created_on], [created_by], [modified_by], [modified_on]) VALUES (2, N'admin2', N'dat123', NULL, NULL, NULL, NULL)
INSERT [dbo].[Admin] ([id], [username], [password], [created_on], [created_by], [modified_by], [modified_on]) VALUES (3, N'admin3', N'654321', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (1, N'Áo Polo Nam Premium Cổ Phối Màu Trơn Form Fitted', N'Áo Polo Premium Nam Tay Ngắn Cổ Phối Màu Trơn Form Fitted là item mới nhất nằm trong Mini Collection Polo Premium. Sản phẩm sử dụng chất liệu 100% cotton với kiểu dệt Twill Pique giúp bề mặt vải mềm mịn, điểm khác biệt về cách dệt trực tiếp lên vải này mang lại hiệu quả bền bỉ, thấm hút mồ hôi tốt hơn cho chiếc áo polo.', CAST(500.00 AS Decimal(18, 2)), CAST(569.00 AS Decimal(18, 2)), CAST(0.10 AS Decimal(18, 2)), 100, CAST(N'2022-01-01T00:00:00' AS SmallDateTime), CAST(N'2024-02-01T02:25:00' AS SmallDateTime), CAST(N'2022-01-03T00:00:00' AS SmallDateTime), 0, CAST(N'2022-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-01-10T00:00:00' AS SmallDateTime), N'Áo Polo Nam', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (2, N'Áo Polo Nam Premium Cổ Khóa Kéo Trơn Form Fitted', N'là item mới nhất nằm trong Mini Collection Polo Premium. Sản phẩm sử dụng chất liệu 100% cotton với kiểu dệt Jacquard nổi bật đường gân ngang/ dọc nhỏ, điểm khác biệt về cách dệt trực tiếp lên vải này mang lại hiệu quả chống nhăn tối đa cho chiếc áo polo.', CAST(450.00 AS Decimal(18, 2)), CAST(540.00 AS Decimal(18, 2)), CAST(0.20 AS Decimal(18, 2)), 150, CAST(N'2022-02-01T00:00:00' AS SmallDateTime), CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-02-01T00:00:00' AS SmallDateTime), CAST(N'2022-02-15T00:00:00' AS SmallDateTime), N'Áo Polo Nam', 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (3, N'Áo Polo Nam Tay Bo Phối Màu Form Fitted', N'được may từ chất vải Cotton thoáng mát, thấm hút mồ hôi tốt, chống mùi phù hợp mội hoàn cảnh từ đi làm đến đi chơi. Áo có form thân và tay hơi ôm vào người nhưng không bó sát cơ thể, mặc vừa vai tôn nên vóc dáng mạnh mẽ. Đặc biệt. áo thiết kế phối màu phá cách giữa phần thân và tay áo mạng lại sự trẻ trung, cá tính.', CAST(400.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), CAST(0.20 AS Decimal(18, 2)), 200, CAST(N'2022-03-01T00:00:00' AS SmallDateTime), CAST(N'2022-03-02T00:00:00' AS SmallDateTime), CAST(N'2022-03-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-03-01T00:00:00' AS SmallDateTime), CAST(N'2022-03-20T00:00:00' AS SmallDateTime), N'Áo Polo Nam', 1, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (4, N'Quần Jean Nam Trơn.Wide Leg', N'Quần Jean Wide Leg', CAST(550.00 AS Decimal(18, 2)), CAST(618.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 100, CAST(N'2022-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-01-02T00:00:00' AS SmallDateTime), CAST(N'2022-01-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-01-10T00:00:00' AS SmallDateTime), N'Quần jean Unisex', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (5, N'Áo Sơ Mi Nam Pimacotton Trơn Limited Edition Form Loose', N'một trong những mẫu áo sơ mi mang thiết kế đặc biệt nằm trong Limited Edition Collection của nhà Routine với những điểm vượt trội', CAST(1000.00 AS Decimal(18, 2)), CAST(1276.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 150, CAST(N'2022-02-01T00:00:00' AS SmallDateTime), CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-02-01T00:00:00' AS SmallDateTime), CAST(N'2022-02-15T00:00:00' AS SmallDateTime), N'Áo Sơ Mi Nam', 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (6, N'Áo Polo Nam Premium C? Ph?i Màu Tron Form Fitted', N'Áo Polo Premium Nam Tay Ng?n C? Ph?i Màu Tron Form Fitted là item m?i nh?t n?m trong Mini Collection Polo Premium. S?n ph?m s? d?ng ch?t li?u 100% cotton v?i ki?u d?t Twill Pique giúp b? m?t v?i m?m m?n, di?m khác bi?t v? cách d?t tr?c ti?p lên v?i này mang l?i hi?u qu? b?n b?, th?m hút m? hôi t?t hon cho chi?c áo polo.', CAST(500.00 AS Decimal(18, 2)), CAST(569.00 AS Decimal(18, 2)), CAST(0.10 AS Decimal(18, 2)), 100, CAST(N'2022-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-01-02T00:00:00' AS SmallDateTime), CAST(N'2022-01-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-01-10T00:00:00' AS SmallDateTime), N'Áo Polo Nam', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (7, N'Áo Polo Nam Premium C? Khóa Kéo Tron Form Fitted', N'là item m?i nh?t n?m trong Mini Collection Polo Premium. S?n ph?m s? d?ng ch?t li?u 100% cotton v?i ki?u d?t Jacquard n?i b?t du?ng gân ngang/ d?c nh?, di?m khác bi?t v? cách d?t tr?c ti?p lên v?i này mang l?i hi?u qu? ch?ng nhan t?i da cho chi?c áo polo.', CAST(450.00 AS Decimal(18, 2)), CAST(540.00 AS Decimal(18, 2)), CAST(0.20 AS Decimal(18, 2)), 150, CAST(N'2022-02-01T00:00:00' AS SmallDateTime), CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-02-01T00:00:00' AS SmallDateTime), CAST(N'2022-02-15T00:00:00' AS SmallDateTime), N'Áo Polo Nam', 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (8, N'Áo Polo Nam Tay Bo Ph?i Màu Form Fitted', N'du?c may t? ch?t v?i Cotton thoáng mát, th?m hút m? hôi t?t, ch?ng mùi phù h?p m?i hoàn c?nh t? di làm d?n di choi. Áo có form thân và tay hoi ôm vào ngu?i nhung không bó sát co th?, m?c v?a vai tôn nên vóc dáng m?nh m?. Ð?c bi?t. áo thi?t k? ph?i màu phá cách gi?a ph?n thân và tay áo m?ng l?i s? tr? trung, cá tính.', CAST(400.00 AS Decimal(18, 2)), CAST(510.00 AS Decimal(18, 2)), CAST(0.20 AS Decimal(18, 2)), 200, CAST(N'2022-03-01T00:00:00' AS SmallDateTime), CAST(N'2022-03-02T00:00:00' AS SmallDateTime), CAST(N'2022-03-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-03-01T00:00:00' AS SmallDateTime), CAST(N'2022-03-20T00:00:00' AS SmallDateTime), N'Áo Polo Nam', 1, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (9, N'Qu?n Jean Nam Tron.Wide Leg', N'Qu?n Jean Wide Leg', CAST(550.00 AS Decimal(18, 2)), CAST(618.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 100, CAST(N'2022-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-01-02T00:00:00' AS SmallDateTime), CAST(N'2022-01-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-01T00:00:00' AS SmallDateTime), CAST(N'2022-01-10T00:00:00' AS SmallDateTime), N'Quần jean Unisex', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (10, N'Áo So Mi Nam Pimacotton Tron Limited Edition Form Loose', N'm?t trong nh?ng m?u áo so mi mang thi?t k? d?c bi?t n?m trong Limited Edition Collection c?a nhà Routine v?i nh?ng di?m vu?t tr?i', CAST(1000.00 AS Decimal(18, 2)), CAST(1276.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 150, CAST(N'2022-02-01T00:00:00' AS SmallDateTime), CAST(N'2022-02-02T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), 1, CAST(N'2022-02-01T00:00:00' AS SmallDateTime), CAST(N'2022-02-15T00:00:00' AS SmallDateTime), N'Áo Sơ Mi Nam', 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (11, N'Product 1', N'Description 1', CAST(100.00 AS Decimal(18, 2)), CAST(90.00 AS Decimal(18, 2)), CAST(0.10 AS Decimal(18, 2)), 50, CAST(N'2022-01-17T00:00:00' AS SmallDateTime), CAST(N'2022-01-17T00:00:00' AS SmallDateTime), CAST(N'2022-01-18T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-20T00:00:00' AS SmallDateTime), CAST(N'2022-01-25T00:00:00' AS SmallDateTime), N'Style A', 1, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (12, N'Product 2', N'Description 2', CAST(150.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(0.30 AS Decimal(18, 2)), 30, CAST(N'2022-01-18T00:00:00' AS SmallDateTime), CAST(N'2022-01-18T00:00:00' AS SmallDateTime), CAST(N'2022-01-20T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-22T00:00:00' AS SmallDateTime), CAST(N'2022-01-27T00:00:00' AS SmallDateTime), N'Style B', 3, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (13, N'Product 3', N'Description 3', CAST(80.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(0.15 AS Decimal(18, 2)), 20, CAST(N'2022-01-19T00:00:00' AS SmallDateTime), CAST(N'2022-01-19T00:00:00' AS SmallDateTime), CAST(N'2022-01-21T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-23T00:00:00' AS SmallDateTime), CAST(N'2022-01-28T00:00:00' AS SmallDateTime), N'Style C', 2, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (14, N'Product 4', N'Description 4', CAST(120.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(0.20 AS Decimal(18, 2)), 40, CAST(N'2022-01-20T00:00:00' AS SmallDateTime), CAST(N'2022-01-20T00:00:00' AS SmallDateTime), CAST(N'2022-01-22T00:00:00' AS SmallDateTime), 0, CAST(N'2022-01-24T00:00:00' AS SmallDateTime), CAST(N'2022-01-29T00:00:00' AS SmallDateTime), N'Style D', 1, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (15, N'Product 5', N'Description 5', CAST(200.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), CAST(0.45 AS Decimal(18, 2)), 60, CAST(N'2022-01-21T00:00:00' AS SmallDateTime), CAST(N'2022-01-21T00:00:00' AS SmallDateTime), CAST(N'2022-01-23T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-25T00:00:00' AS SmallDateTime), CAST(N'2022-01-30T00:00:00' AS SmallDateTime), N'Style E', 2, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (16, N'Product 6', N'Description 6', CAST(90.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), 25, CAST(N'2022-01-22T00:00:00' AS SmallDateTime), CAST(N'2022-01-22T00:00:00' AS SmallDateTime), CAST(N'2022-01-24T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-26T00:00:00' AS SmallDateTime), CAST(N'2022-01-31T00:00:00' AS SmallDateTime), N'Style F', 3, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (17, N'Product 7', N'Description 7', CAST(160.00 AS Decimal(18, 2)), CAST(140.00 AS Decimal(18, 2)), CAST(0.05 AS Decimal(18, 2)), 35, CAST(N'2022-01-23T00:00:00' AS SmallDateTime), CAST(N'2022-01-23T00:00:00' AS SmallDateTime), CAST(N'2022-01-25T00:00:00' AS SmallDateTime), 0, CAST(N'2022-01-27T00:00:00' AS SmallDateTime), CAST(N'2022-02-01T00:00:00' AS SmallDateTime), N'Style G', 1, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (18, N'Product 8', N'Description 8', CAST(110.00 AS Decimal(18, 2)), CAST(95.00 AS Decimal(18, 2)), CAST(0.15 AS Decimal(18, 2)), 45, CAST(N'2022-01-24T00:00:00' AS SmallDateTime), CAST(N'2022-01-24T00:00:00' AS SmallDateTime), CAST(N'2022-01-26T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-28T00:00:00' AS SmallDateTime), CAST(N'2022-02-02T00:00:00' AS SmallDateTime), N'Style H', 2, 3)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (19, N'Product 9', N'Description 9', CAST(180.00 AS Decimal(18, 2)), CAST(160.00 AS Decimal(18, 2)), CAST(0.25 AS Decimal(18, 2)), 55, CAST(N'2022-01-25T00:00:00' AS SmallDateTime), CAST(N'2022-01-25T00:00:00' AS SmallDateTime), CAST(N'2022-01-27T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-29T00:00:00' AS SmallDateTime), CAST(N'2022-02-03T00:00:00' AS SmallDateTime), N'Style I', 3, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (20, N'Product 10', N'Description 10', CAST(130.00 AS Decimal(18, 2)), CAST(110.00 AS Decimal(18, 2)), CAST(0.35 AS Decimal(18, 2)), 30, CAST(N'2022-01-26T00:00:00' AS SmallDateTime), CAST(N'2022-01-26T00:00:00' AS SmallDateTime), CAST(N'2022-01-28T00:00:00' AS SmallDateTime), 1, CAST(N'2022-01-30T00:00:00' AS SmallDateTime), CAST(N'2022-02-04T00:00:00' AS SmallDateTime), N'Style J', 1, 2)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (1021, N'Product 11', N'howeuhuf', CAST(12.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(0.16 AS Decimal(18, 2)), 10, CAST(N'2024-01-30T07:46:00' AS SmallDateTime), CAST(N'2024-01-30T08:57:00' AS SmallDateTime), CAST(N'2024-01-18T00:00:00' AS SmallDateTime), 1, CAST(N'2024-01-18T00:00:00' AS SmallDateTime), CAST(N'2024-02-18T00:00:00' AS SmallDateTime), N'Product 21', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (1022, N'Product 22', N'qwf9u208y9f', CAST(122.00 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0.24 AS Decimal(18, 2)), 10, CAST(N'2024-01-30T07:47:00' AS SmallDateTime), CAST(N'2024-01-30T07:47:00' AS SmallDateTime), CAST(N'2024-01-18T00:00:00' AS SmallDateTime), 1, CAST(N'2024-01-18T00:00:00' AS SmallDateTime), CAST(N'2024-02-18T00:00:00' AS SmallDateTime), N'Product 21', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (1027, N'Test3', N'qef24f', CAST(100.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(0.34 AS Decimal(18, 2)), 10, CAST(N'2024-01-31T16:19:00' AS SmallDateTime), CAST(N'2024-01-31T16:41:00' AS SmallDateTime), CAST(N'2024-01-18T00:00:00' AS SmallDateTime), 1, CAST(N'2024-01-18T00:00:00' AS SmallDateTime), CAST(N'2024-05-18T00:00:00' AS SmallDateTime), N'Test', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (1028, N'Test5', N'qef24f', CAST(100.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(0.34 AS Decimal(18, 2)), 11, CAST(N'2024-01-31T16:47:00' AS SmallDateTime), CAST(N'2024-01-31T19:50:00' AS SmallDateTime), CAST(N'2024-01-18T00:00:00' AS SmallDateTime), 1, CAST(N'2024-01-18T00:00:00' AS SmallDateTime), CAST(N'2024-05-18T00:00:00' AS SmallDateTime), N'Test', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (1029, N'Test2', N'qwfjoqfhw', CAST(100.00 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 10, CAST(N'2024-01-31T17:01:00' AS SmallDateTime), CAST(N'2024-01-31T17:01:00' AS SmallDateTime), CAST(N'2024-01-18T00:00:00' AS SmallDateTime), 1, CAST(N'2024-01-18T00:00:00' AS SmallDateTime), CAST(N'2024-02-18T00:00:00' AS SmallDateTime), N'Test', 1, 1)
INSERT [dbo].[Product] ([Id], [Name], [Description], [BasePrice], [Price], [Discount], [Quantity], [CreatedAt], [ModifiedAt], [PublishedAt], [State], [StartsAt], [EndsAt], [Style], [CreatedBy], [ModifiedBy]) VALUES (1032, N'Test4', N'test', CAST(110.00 AS Decimal(18, 2)), CAST(260.00 AS Decimal(18, 2)), CAST(0.02 AS Decimal(18, 2)), 10, CAST(N'2024-01-31T19:46:00' AS SmallDateTime), CAST(N'2024-01-31T19:46:00' AS SmallDateTime), CAST(N'2024-01-31T19:46:00' AS SmallDateTime), 1, CAST(N'2024-01-31T19:46:00' AS SmallDateTime), CAST(N'2024-03-10T19:46:00' AS SmallDateTime), N'test', 1, 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImage] ON 

INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (1, N'assets/images/product/poloNamS24POLO1_1.jpg', 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (2, N'assets/images/product/poloNamS24POLO1_2.jpg', 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (3, N'assets/images/product/poloNamS24POLO1_3.jpg', 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (4, N'assets/images/product/poloNamS24POLO1_4.jpg', 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (5, N'assets/images/product/poloNamS24POLO2_1.jpg', 2, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (6, N'assets/images/product/poloNamS24POLO2_2.jpg', 2, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (7, N'assets/images/product/poloNamS24POLO2_3.jpg', 2, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (8, N'assets/images/product/poloNamS24POLO2_4.jpg', 2, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (9, N'assets/images/product/poloNamS24POLO3_1.jpg', 3, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 3')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (10, N'assets/images/product/poloNamS24POLO3_2.jpg', 3, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 3')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (11, N'assets/images/product/poloNamS24POLO3_3.jpg', 3, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 3')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (12, N'assets/images/product/quanJeanS24QUANJEAN1_1.jpg', 4, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 4')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (13, N'assets/images/product/quanJeanS24QUANJEAN1_2.jpg', 4, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 4')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (14, N'assets/images/product/quanJeanS24QUANJEAN1_3.jpg', 4, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 4')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (15, N'assets/images/product/somiNamS24SOMI1_1.jpg', 5, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 5')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (16, N'assets/images/product/somiNamS24SOMI1_2.jpg', 5, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 5')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (17, N'assets/images/product/somiNamS24SOMI1_3.jpg', 5, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 5')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (18, N'assets/images/product/somiNamS24SOMI1_4.jpg', 5, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 5')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (19, N'assets/images/product/poloNamS24POLO1_1.jpg', 6, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (20, N'assets/images/product/poloNamS24POLO1_2.jpg', 7, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (21, N'assets/images/product/poloNamS24POLO1_3.jpg', 8, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (22, N'assets/images/product/poloNamS24POLO1_4.jpg', 9, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (23, N'assets/images/product/poloNamS24POLO2_1.jpg', 10, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (24, N'assets/images/product/poloNamS24POLO2_2.jpg', 11, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (25, N'assets/images/product/poloNamS24POLO2_3.jpg', 12, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (26, N'assets/images/product/poloNamS24POLO2_4.jpg', 13, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (27, N'assets/images/product/poloNamS24POLO1_4.jpg', 14, CAST(N'2022-01-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-01-02T00:00:00.000' AS DateTime), 1, N'Description for Image 1')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (28, N'assets/images/product/poloNamS24POLO2_1.jpg', 15, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (29, N'assets/images/product/poloNamS24POLO2_2.jpg', 16, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (30, N'assets/images/product/poloNamS24POLO2_3.jpg', 17, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (31, N'assets/images/product/poloNamS24POLO2_4.jpg', 18, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1, N'Description for Image 2')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (32, N'assets/images/product/poloNamS24POLO3_1.jpg', 19, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 3')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (33, N'assets/images/product/poloNamS24POLO3_2.jpg', 20, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 3')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (34, N'assets/images/product/poloNamS24POLO3_3.jpg', 11, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 3')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (35, N'assets/images/product/quanJeanS24QUANJEAN1_1.jpg', 16, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 4')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (36, N'assets/images/product/quanJeanS24QUANJEAN1_2.jpg', 19, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 4')
INSERT [dbo].[ProductImage] ([Id], [Image], [ProductId], [CreatedAt], [CreatedBy], [ModifiedAt], [ModifiedBy], [ImageDescription]) VALUES (37, N'assets/images/product/quanJeanS24QUANJEAN1_3.jpg', 20, CAST(N'2022-03-01T00:00:00.000' AS DateTime), 1, CAST(N'2022-03-02T00:00:00.000' AS DateTime), 2, N'Description for Image 4')
SET IDENTITY_INSERT [dbo].[ProductImage] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [full_name], [username], [password], [code_verify], [email], [phone], [image], [dob], [address], [status], [created_on], [created_by], [modified_by], [modified_on]) VALUES (1, N'Nguyen Dung', N'user1', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', N'999999', N'', N'', N'', CAST(N'2000-01-09' AS Date), N'Hanoi', 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[user] ([id], [full_name], [username], [password], [code_verify], [email], [phone], [image], [dob], [address], [status], [created_on], [created_by], [modified_by], [modified_on]) VALUES (2, N'Vuong Dat', N'user2', N'cfca1a5d348b6eadefcf14429be0ad4fb284021e8710500358d533e53f72fef4', NULL, N'datvn@gmail.com', N'0987784234', N'', CAST(N'2002-01-01' AS Date), N'Hanoi', 0, NULL, 1, 1, CAST(N'2024-02-01T11:38:53.000' AS DateTime))
INSERT [dbo].[user] ([id], [full_name], [username], [password], [code_verify], [email], [phone], [image], [dob], [address], [status], [created_on], [created_by], [modified_by], [modified_on]) VALUES (3, N'Vuong Thien', N'user3', N'28d66330c68eddc29784a4601f9ae8bb0fd4d1e56d8bf223ccab021f9f446452', NULL, N'thienvn@gmail.com', N'0987123456', N'', CAST(N'2002-10-10' AS Date), N'Hanoi', 0, NULL, 1, 1, CAST(N'2024-02-01T10:38:36.000' AS DateTime))
INSERT [dbo].[user] ([id], [full_name], [username], [password], [code_verify], [email], [phone], [image], [dob], [address], [status], [created_on], [created_by], [modified_by], [modified_on]) VALUES (4, N'Quy', N'user4', N'3af80ab0454995c52ebb1f4704fff7b71e61e39f2dc428d9fdef762b669ec811', N'087881', N'quy123@gmail.com', N'0912345678', N'', CAST(N'2002-10-01' AS Date), N'Hanoi', 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[user] ([id], [full_name], [username], [password], [code_verify], [email], [phone], [image], [dob], [address], [status], [created_on], [created_by], [modified_by], [modified_on]) VALUES (5, N'Anh Dung', N'user5', N'6460662e217c7a9f899208dd70a2c28abdea42f128666a9b78e6c0c064846493', N'613961', N'admin1@gmail.com', N'0981234765', N'', CAST(N'2000-02-02' AS Date), N'Hanoi', 1, CAST(N'2024-02-01T04:31:28.000' AS DateTime), NULL, NULL, CAST(N'2024-02-01T04:31:28.000' AS DateTime))
INSERT [dbo].[user] ([id], [full_name], [username], [password], [code_verify], [email], [phone], [image], [dob], [address], [status], [created_on], [created_by], [modified_by], [modified_on]) VALUES (6, N'Adam', N'user6', N'6460662e217c7a9f899208dd70a2c28abdea42f128666a9b78e6c0c064846493', N'899712', N'adam1@gmail.com', N'0986547321', N'SWR_EcosystemMap.drawio.png', CAST(N'2004-06-09' AS Date), N'UK', 1, CAST(N'2024-02-01T04:33:04.000' AS DateTime), NULL, NULL, CAST(N'2024-02-01T04:33:04.000' AS DateTime))
INSERT [dbo].[user] ([id], [full_name], [username], [password], [code_verify], [email], [phone], [image], [dob], [address], [status], [created_on], [created_by], [modified_by], [modified_on]) VALUES (7, N'Anh Dung', N'admin1@gmail.com', N'937377f056160fc4b15e0b770c67136a5f03c15205b4d3bf918268fefa2c6d0a', N'298021', N'dasdas@gmail.com', N'0981237654', N'SWR_EcosystemMap.drawio.png', CAST(N'2020-07-09' AS Date), N'UK', 1, CAST(N'2024-02-01T11:28:05.000' AS DateTime), 1, 1, CAST(N'2024-02-01T11:28:05.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Admin] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Admin]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Admin1] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Admin] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Admin1]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_ProductId]
GO
USE [master]
GO
ALTER DATABASE [FS_Thien] SET  READ_WRITE 
GO
