USE [master]
GO
/****** Object:  Database [EcommerceDataSource]    Script Date: 31/08/2022 14:37:21 ******/
CREATE DATABASE [EcommerceDataSource]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcommerceDataSource', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EcommerceDataSource.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcommerceDataSource_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EcommerceDataSource_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EcommerceDataSource] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcommerceDataSource].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcommerceDataSource] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcommerceDataSource] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcommerceDataSource] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EcommerceDataSource] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcommerceDataSource] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET RECOVERY FULL 
GO
ALTER DATABASE [EcommerceDataSource] SET  MULTI_USER 
GO
ALTER DATABASE [EcommerceDataSource] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcommerceDataSource] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcommerceDataSource] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcommerceDataSource] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcommerceDataSource] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcommerceDataSource] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EcommerceDataSource', N'ON'
GO
ALTER DATABASE [EcommerceDataSource] SET QUERY_STORE = OFF
GO
USE [EcommerceDataSource]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31/08/2022 14:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [varchar](256) NOT NULL,
	[CategoryName] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 31/08/2022 14:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [varchar](256) NOT NULL,
	[Name] [varchar](256) NOT NULL,
	[Discount] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Availability] [bit] NOT NULL,
	[CategoryId] [varchar](256) NOT NULL,
	[Url] [varchar](256) NOT NULL,
	[Description] [text] NOT NULL,
	[Shiping] [bit] NOT NULL,
	[RatingId] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 31/08/2022 14:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingsId] [varchar](256) NOT NULL,
	[Ratinglevel] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 31/08/2022 14:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [varchar](256) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[Email] [varchar](256) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1001', N'Bags')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1002', N'Sneakers')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1003', N'Sneakers')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1004', N'Sneakers')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1005', N'Sneakers')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1006', N'Bags')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1007', N'Bags')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1008', N'Bags')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (N'ctg1009', N'Bags')
GO
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1001', N'FS - QUILTED MAXI CROSS BAG', 24, CAST(534 AS Decimal(18, 0)), 1, N'ctg1001', N'/Images/blackbag.png', N'Cross Bag are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1001')
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1002', N'FS - NIKE AIR MAX 270 REACT AIR...', 23, CAST(600 AS Decimal(18, 0)), 1, N'ctg1002', N'/Images/yellowShow.png', N'air max are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1002')
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1003', N'FS - Addidas AIR MAX 200 REACT AIR...', 23, CAST(459 AS Decimal(18, 0)), 1, N'ctg1003', N'/Images/RedShoe.png', N'Addidas AIR are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1003')
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1004', N'Prada shoe MAX 200 REACT AIR...', 20, CAST(557 AS Decimal(18, 0)), 1, N'ctg1004', N'/Images/fineShoe.png', N'Prada shoe MAX are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1004')
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1005', N'Puma basketballers editon ...', 22, CAST(459 AS Decimal(18, 0)), 1, N'ctg1005', N'/Images/ShoeUnder.png', N'Prada shoe MAX are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1005')
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1006', N'Puma basketballers editon ...', 21, CAST(703 AS Decimal(18, 0)), 1, N'ctg1006', N'/Images/finepurse.png', N'Puma basketballers editon 
		   are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1006')
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1007', N'Gucci purse', 21, CAST(435 AS Decimal(18, 0)), 1, N'ctg1007', N'/Images/brownPurse.png', N'Gucci purse editon are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1007')
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1008', N'FS - QUILTED MAXI CROSS BAG second edition', 15, CAST(570 AS Decimal(18, 0)), 1, N'ctg1008', N'/Images/blackbag.png', N'FS - QUILTED MAXI CROSS BAG
		   second edition are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1008')
INSERT [dbo].[Product] ([Id], [Name], [Discount], [Price], [Availability], [CategoryId], [Url], [Description], [Shiping], [RatingId]) VALUES (N'prd1009', N'Black Swade Nicky', 15, CAST(318 AS Decimal(18, 0)), 1, N'ctg1009', N'/Images/blackbag.png', N'Black Swade Nicky
		   second edition are always very 
		   comfortable fit, clean and
		   just perfect in every way.
		   just the box was too small
		   and scrunched the sneakers 
		   up a little bit, not sure 
		   if the box was always this
		   small but the 90s are and 
		   will always be one of my 
		   favorites.', 1, N'rtg1009')
GO
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1001', 4)
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1002', 4)
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1003', 4)
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1004', 4)
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1005', 4)
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1006', 4)
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1007', 4)
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1008', 4)
INSERT [dbo].[Ratings] ([RatingsId], [Ratinglevel]) VALUES (N'rtg1009', 4)
GO
INSERT [dbo].[Users] ([UserId], [Password], [Email]) VALUES (N'dc1ce6f6-7d42-49a6-a7bb-e770170ea477', N'893f31839a5d9700de26164fd42ef2240cd9feeb8d113686dd5a4157fa5c4330', N'omenigideon@yahoo.com')
INSERT [dbo].[Users] ([UserId], [Password], [Email]) VALUES (N'ed8e0861-60ea-4b4a-b0dd-75b96360fc2d', N'893f31839a5d9700de26164fd42ef2240cd9feeb8d113686dd5a4157fa5c4330', N'favour@gmail.com')
INSERT [dbo].[Users] ([UserId], [Password], [Email]) VALUES (N'fdead484-b129-4ca6-a4fa-2bed60762c9f', N'893f31839a5d9700de26164fd42ef2240cd9feeb8d113686dd5a4157fa5c4330', N'omenigph@gmail.com')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__A9D1053440F7D073]    Script Date: 31/08/2022 14:37:21 ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product.CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product.CategoryId]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product.RatingId] FOREIGN KEY([RatingId])
REFERENCES [dbo].[Ratings] ([RatingsId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product.RatingId]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllProducts]    Script Date: 31/08/2022 14:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGetAllProducts]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Product.Id,
		   Product.Name,
		   Product.Price,
	       Product.Discount,
		   Product.Availability,
		   Product.Url,
		   Product.Description,
		   Product.Shiping,
		   Category.CategoryName,
		   Ratings.RatingLevel 
	FROM   Category,Product,Ratings
	WHERE Category.CategoryId = Product.CategoryId
	AND   Product.RatingId = Ratings.RatingsId
END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 31/08/2022 14:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spLogin]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM dbo.Users
	
END
GO
/****** Object:  StoredProcedure [dbo].[spRegister]    Script Date: 31/08/2022 14:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spRegister]
	-- Add the parameters for the stored procedure here
	@UserId varchar(256),
	@Password varchar(256),
	@Email varchar(256)
AS
BEGIN


    -- Insert statements for procedure here
	INSERT INTO dbo.Users (UserId,Password,Email) VALUES(@UserId,@Password,@Email)
	
END
GO
USE [master]
GO
ALTER DATABASE [EcommerceDataSource] SET  READ_WRITE 
GO
