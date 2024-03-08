USE [master]
GO
/****** Object:  Database [BookingHotel1]    Script Date: 03/08/24 15:59:13 ******/
CREATE DATABASE [BookingHotel1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingHotel1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookingHotel1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingHotel1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\BookingHotel1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookingHotel1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingHotel1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingHotel1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingHotel1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingHotel1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingHotel1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingHotel1] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingHotel1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookingHotel1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingHotel1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingHotel1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingHotel1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingHotel1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingHotel1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingHotel1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingHotel1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingHotel1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookingHotel1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingHotel1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingHotel1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingHotel1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingHotel1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingHotel1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingHotel1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingHotel1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookingHotel1] SET  MULTI_USER 
GO
ALTER DATABASE [BookingHotel1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingHotel1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingHotel1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingHotel1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingHotel1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookingHotel1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookingHotel1] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookingHotel1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookingHotel1]
GO
/****** Object:  Table [dbo].[blogs]    Script Date: 03/08/24 15:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogs](
	[blogID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[title] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[img] [nvarchar](255) NULL,
	[publishDate] [datetime] NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_blogs] PRIMARY KEY CLUSTERED 
(
	[blogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookings]    Script Date: 03/08/24 15:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookings](
	[bookingID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[roomID] [int] NOT NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL,
	[numberOfGuest] [int] NULL,
	[total] [float] NULL,
	[status] [nvarchar](50) NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](10) NULL,
	[email] [nvarchar](50) NULL,
	[requests] [nvarchar](max) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_bookings] PRIMARY KEY CLUSTERED 
(
	[bookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 03/08/24 15:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurant]    Script Date: 03/08/24 15:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurant](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[price] [float] NULL,
	[description] [nvarchar](255) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_restaurant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 03/08/24 15:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[roomID] [int] NOT NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[reviewDate] [datetime] NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_reviews] PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 03/08/24 15:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[price] [float] NULL,
	[size] [nvarchar](50) NULL,
	[img] [ntext] NULL,
	[description] [nvarchar](max) NULL,
	[max] [int] NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_rooms] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 03/08/24 15:59:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](20) NOT NULL,
	[role] [char](10) NOT NULL,
	[email] [nvarchar](100) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_role]  DEFAULT ('user') FOR [role]
GO
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD  CONSTRAINT [FK_blogs_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[blogs] CHECK CONSTRAINT [FK_blogs_users]
GO
ALTER TABLE [dbo].[bookings]  WITH CHECK ADD  CONSTRAINT [FK_bookings_rooms1] FOREIGN KEY([roomID])
REFERENCES [dbo].[rooms] ([roomID])
GO
ALTER TABLE [dbo].[bookings] CHECK CONSTRAINT [FK_bookings_rooms1]
GO
ALTER TABLE [dbo].[bookings]  WITH CHECK ADD  CONSTRAINT [FK_bookings_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[bookings] CHECK CONSTRAINT [FK_bookings_users]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_rooms] FOREIGN KEY([roomID])
REFERENCES [dbo].[rooms] ([roomID])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_rooms]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [FK_reviews_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [FK_reviews_users]
GO
USE [master]
GO
ALTER DATABASE [BookingHotel1] SET  READ_WRITE 
GO


INSERT INTO menu VALUES (1, 'Home', NULL, N'trang-chu', 1, 2, CAST(N'2024-03-09 00:00:00' AS SmallDateTime))
INSERT INTO menu VALUES (2, 'Rooms', NULL, N'rooms', 1, 2, CAST(N'2024-03-09 00:00:00' AS SmallDateTime))
INSERT INTO menu VALUES (3, 'Restaurant', NULL, N'nha-hang', 1, 2, CAST(N'2024-03-09 00:00:00' AS SmallDateTime))
INSERT INTO menu VALUES (4, 'Blog', NULL, N'blog', 1, 2, CAST(N'2024-03-09 00:00:00' AS SmallDateTime))
INSERT INTO menu VALUES (5, 'Contact', NULL, N'lien-he', 1, 2, CAST(N'2024-03-09 00:00:00' AS SmallDateTime))

INSERT INTO users VALUES ('admin', 'admin123', 'admin', 'admin@gmail.com',NULL, NULL, NULL, NULL)
INSERT INTO users VALUES ('kngaan', '123456', 'user', 'ngan@gmail.com',NULL, NULL, NULL, NULL)
INSERT INTO users VALUES ('thtruc', '654321', 'user', 'truc@gmail.com',NULL, NULL, NULL, NULL)

INSERT INTO rooms VALUES ('Suite', 120, '44m2', 'room-1.jpg', 'Our luxurious suite rooms are designed to provide an exceptional and indulgent stay for our guests. These spacious accommodations go beyond the conventional hotel room, offering a distinct blend of comfort, style, and functionality.','Sea', 3, '2 Adults 1 Children', NULL, NULL, NULL, NULL)
INSERT INTO rooms VALUES ('Family', 20, '40m2', 'room-2.jpg', 'Welcome to our family-friendly accommodations designed to cater to the needs of your entire family. Our spacious and thoughtfully appointed family rooms provide a comfortable retreat where you can create lasting memories together.','Mountain', 2,'2 Adults', NULL, NULL, NULL, NULL)
INSERT INTO rooms VALUES ('Deluxe', 150, '50m2', 'room-3.jpg', 'Indulge in a refined and elevated stay with our deluxe rooms, where sophistication meets comfort. Designed for discerning travelers seeking a touch of luxury, our deluxe accommodations offer an exquisite blend of style, modern amenities, and personalized service.','Sea', 1, '1 Adults', NULL, NULL, NULL, NULL)
INSERT INTO rooms VALUES ('Classic', 130, '56m2', 'room-4.jpg', 'Step into timeless comfort with our classic rooms, where simplicity meets sophistication. Ideal for those who appreciate understated elegance, our classic accommodations offer a warm and inviting atmosphere coupled with essential amenities for a relaxing stay.','Sea', 2, '2 Adults 1 Children',NULL, NULL, NULL, NULL)
INSERT INTO rooms VALUES ('Superior', 300, '89m2', 'room-5.jpg', 'Discover a heightened level of comfort and style in our superior rooms, meticulously designed to offer an elevated experience for discerning travelers. With a focus on modern amenities, thoughtful details, and a touch of luxury, our superior accommodations redefine the standard for a memorable stay.','Mountain', 2,'2 Adults 1 Children', NULL, NULL, NULL, NULL)
INSERT INTO rooms VALUES ('Luxury', 500, '100m2', 'room-6.jpg', 'Step into a world of opulence and sophistication with our luxury rooms, where unparalleled comfort, exquisite design, and exclusive amenities redefine the art of hospitality. Indulge in the epitome of refined living and create lasting memories in these meticulously crafted accommodations.','Forest', 2,'2 Adults', NULL, NULL, NULL, NULL)

INSERT INTO reviews VALUES (2,2,5, N'Phòng gọn gàng, sạch sẽ, view đẹp, dịch vụ tốt', '2024-02-28', NULL, NULL, NULL, NULL)
INSERT INTO reviews VALUES (3,5,4, N'Nhân viên khá thái độ với khách hàng, đề nghị xem lại. Mọi thứ khác đều ok','2024-03-05', NULL, NULL, NULL, NULL)

INSERT INTO bookings VALUES(2,2,'2024-02-26', '2024-02-28', 2, 40, 'Pending', N'Lê Kim Ngân', '0968665563', 'ngan@gmail.com',NULL, NULL, NULL, NULL, NULL)
INSERT INTO bookings VALUES(3,5,'2024-03-01', '2024-03-02', 1, 300, 'Pending', N'Thanh Trúc', '0686215562', 'truc@gmail.com',NULL, NULL, NULL, NULL, NULL)

INSERT INTO blogs VALUES(2, N'Kì nghỉ mát tuyệt vời', N'Không gian xung quanh tôi tràn ngập sắc màu của thiên nhiên, từ bãi biển dịu dàng với cát trắng mịn màng, đến những khu rừng xanh tươi, mỗi hình ảnh là một bức tranh sống động. Tiếng sóng biển nhấp nhô như điệu nhảy êm đềm, tạo nên nhịp hòa mình vào bản nhạc tĩnh lặng của thiên nhiên.', 'image-1.jpg', '2024-03-01', NULL, NULL, NULL, NULL)
INSERT INTO blogs VALUES(2, N'Những bữa ăn thơm ngon', N'Mỗi bữa ăn tại đây không chỉ là hương vị tuyệt vời của đặc sản địa phương, mà còn là cơ hội để tận hưởng những thực đơn được chế biến với tâm huyết. Thức ăn ngon và không khí ấm cúng tạo nên những kí ức ngọt ngào, như một chiếc vé dẫn tôi đến hành trình của sự hạnh phúc.', 'image-2.jpg', '2024-03-01', NULL, NULL, NULL, NULL)
INSERT INTO blogs VALUES(2, N'Kỉ niệm đáng nhớ', N'Tại đây, mỗi bức tranh, mỗi khoảnh khắc, và mỗi cảm xúc đều là một phần của hành trình nghỉ mát, làm cho trái tim tôi tràn ngập sự biết ơn với vẻ đẹp tinh tế và hòa mình vào hạnh phúc của những khoảnh khắc bình yên và trọn vẹn.', 'image-3.jpg', '2024-03-02', NULL, NULL, NULL, NULL)
INSERT INTO blogs VALUES(3, N'Trải nghiệm khá tệ tại khách sạn', N'Nhân viên không lễ phép, có thái độ thách thức khách hàng làm cho tôi không hài lòng. Nhưng mọi thứ còn lại đều khá tốt nên tôi sẽ suy nghĩ lại về việc đến đây lần tiếp theo', 'image-4.jpg', '2024-03-05', NULL, NULL, NULL, NULL)

