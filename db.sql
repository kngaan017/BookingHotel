USE [master]
GO
/****** Object:  Database [BookingHotel1]    Script Date: 4/19/2024 10:02:57 PM ******/
CREATE DATABASE [BookingHotel1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingHotel1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\BookingHotel1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingHotel1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\BookingHotel1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[blogs]    Script Date: 4/19/2024 10:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogs](
	[blogID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[title] [nvarchar](255) NULL,
	[content] [nvarchar](max) NULL,
	[tag] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[bookings]    Script Date: 4/19/2024 10:02:57 PM ******/
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
/****** Object:  Table [dbo].[menu]    Script Date: 4/19/2024 10:02:57 PM ******/
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
/****** Object:  Table [dbo].[restaurant]    Script Date: 4/19/2024 10:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurant](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[img] [ntext] NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 4/19/2024 10:02:57 PM ******/
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
/****** Object:  Table [dbo].[rooms]    Script Date: 4/19/2024 10:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[price] [float] NULL,
	[size] [nvarchar](50) NULL,
	[img1] [ntext] NULL,
	[img2] [ntext] NULL,
	[img3] [ntext] NULL,
	[description] [nvarchar](max) NULL,
	[view] [nvarchar](50) NULL,
	[bed] [int] NULL,
	[max] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[users]    Script Date: 4/19/2024 10:02:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](20) NOT NULL,
	[password] [varchar](max) NOT NULL,
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
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[blogs] ON 

INSERT [dbo].[blogs] ([blogID], [userID], [title], [content], [tag], [img], [publishDate], [meta], [hide], [order], [datebegin]) VALUES (1, 2, N'Kì nghỉ mát tuyệt vời nhất mà tôi từng có', N'Không gian xung quanh tôi tràn ngập sắc màu của thiên nhiên, từ bãi biển dịu dàng với cát trắng mịn màng, đến những khu rừng xanh tươi, mỗi hình ảnh là một bức tranh sống động. Tiếng sóng biển nhấp nhô như điệu nhảy êm đềm, tạo nên nhịp hòa mình vào bản nhạc tĩnh lặng của thiên nhiên.', N'Fresh', N'image_1.jpg', CAST(N'2024-03-01T00:00:00.000' AS DateTime), N'phong-canh', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[blogs] ([blogID], [userID], [title], [content], [tag], [img], [publishDate], [meta], [hide], [order], [datebegin]) VALUES (2, 2, N'Những bữa ăn thơm ngon tại nhà hàng của khách sạn', N'Mỗi bữa ăn tại đây không chỉ là hương vị tuyệt vời của đặc sản địa phương, mà còn là cơ hội để tận hưởng những thực đơn được chế biến với tâm huyết. Thức ăn ngon và không khí ấm cúng tạo nên những kí ức ngọt ngào, như một chiếc vé dẫn tôi đến hành trình của sự hạnh phúc.', N'Food', N'image_2.jpg', CAST(N'2024-03-01T00:00:00.000' AS DateTime), N'khong-khi', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[blogs] ([blogID], [userID], [title], [content], [tag], [img], [publishDate], [meta], [hide], [order], [datebegin]) VALUES (3, 2, N'Kỉ niệm đáng nhớ trong chuyến du lịch này', N'Tại đây, mỗi bức tranh, mỗi khoảnh khắc, và mỗi cảm xúc đều là một phần của hành trình nghỉ mát, làm cho trái tim tôi tràn ngập sự biết ơn với vẻ đẹp tinh tế và hòa mình vào hạnh phúc của những khoảnh khắc bình yên và trọn vẹn.', N'Beautiful', N'image_3.jpg', CAST(N'2024-03-02T00:00:00.000' AS DateTime), N'phong-canh', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[blogs] ([blogID], [userID], [title], [content], [tag], [img], [publishDate], [meta], [hide], [order], [datebegin]) VALUES (4, 3, N'Trải nghiệm khá tệ tại khách sạn', N'Nhân viên không lễ phép, có thái độ thách thức khách hàng làm cho tôi không hài lòng. Nhưng mọi thứ còn lại đều khá tốt nên tôi sẽ suy nghĩ lại về việc đến đây lần tiếp theo', N'Service', N'image_4.jpg', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'dich-vu', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[bookings] ON 

INSERT [dbo].[bookings] ([bookingID], [userID], [roomID], [startDate], [endDate], [numberOfGuest], [total], [status], [name], [phone], [email], [requests], [meta], [hide], [order], [datebegin]) VALUES (1, 2, 2, CAST(N'2024-02-26' AS Date), CAST(N'2024-02-28' AS Date), 2, 40, N'Accepted', N'Lê Kim Ngân', N'0968665563', N'ngan@gmail.com', NULL, N'dat-phong', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[bookings] ([bookingID], [userID], [roomID], [startDate], [endDate], [numberOfGuest], [total], [status], [name], [phone], [email], [requests], [meta], [hide], [order], [datebegin]) VALUES (2, 3, 5, CAST(N'2024-03-01' AS Date), CAST(N'2024-03-02' AS Date), 1, 300, N'Accepted', N'Thanh Trúc', N'0686215562', N'truc@gmail.com', NULL, N'dat-phong', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[bookings] OFF
GO
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Home', NULL, N'trang-chu', 1, 2, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Rooms', NULL, N'phong-o', 1, 2, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (3, N'Restaurant', NULL, N'nha-hang', 1, 2, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (4, N'Blog', NULL, N'blog', 1, 2, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (5, N'Contact', NULL, N'lien-he', 1, 2, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[restaurant] ON 

INSERT [dbo].[restaurant] ([id], [name], [img], [price], [description], [meta], [hide], [order], [datebegin]) VALUES (1, N'Spaghetti Carbonara', N'menu-1.jpg', 12.99, N'Classic Italian pasta dish made with eggs, cheese, bacon (or pancetta), and black pepper.', N'mon-an', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[restaurant] ([id], [name], [img], [price], [description], [meta], [hide], [order], [datebegin]) VALUES (2, N'Chicken Tikka Masala', N'menu-2.jpg', 14.75, N'Popular Indian curry dish consisting of marinated and grilled chicken pieces in a creamy tomato-based sauce.', N'mon-an', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[restaurant] ([id], [name], [img], [price], [description], [meta], [hide], [order], [datebegin]) VALUES (3, N'Sushi Roll Combo', N'menu-3.jpg', 18.5, N'Assortment of sushi rolls including California rolls, tuna rolls, and salmon rolls, served with soy sauce and wasabi.', N'mon-an', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[restaurant] ([id], [name], [img], [price], [description], [meta], [hide], [order], [datebegin]) VALUES (4, N'Steak Frites', N'menu-4.jpg', 22.99, N'French dish featuring grilled steak served with crispy French fries and a side salad.', N'mon-an', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[restaurant] ([id], [name], [img], [price], [description], [meta], [hide], [order], [datebegin]) VALUES (5, N'Pad Thai', N'menu-5.jpg', 11.99, N'Thai stir-fried noodle dish made with rice noodles, eggs, tofu, shrimp, bean sprouts, peanuts, and a tangy sauce.', N'mon-an', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[restaurant] ([id], [name], [img], [price], [description], [meta], [hide], [order], [datebegin]) VALUES (6, N'Caesar Salad', N'menu-6.jpg', 8.99, N'Classic salad made with romaine lettuce, croutons, Parmesan cheese, and Caesar dressing.', N'mon-an', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[restaurant] ([id], [name], [img], [price], [description], [meta], [hide], [order], [datebegin]) VALUES (7, N'Margherita Pizza', N'menu-7.jpg', 10.5, N'Traditional Italian pizza topped with tomato sauce, fresh mozzarella cheese, and fresh basil leaves.', N'mon-an', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[restaurant] ([id], [name], [img], [price], [description], [meta], [hide], [order], [datebegin]) VALUES (8, N'Beef Burger', N'menu-8.jpg', 9.99, N'Juicy beef patty served on a toasted bun with lettuce, tomato, onion, and pickles, accompanied by fries.', N'mon-an', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[restaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[reviews] ON 

INSERT [dbo].[reviews] ([reviewID], [userID], [roomID], [rating], [comment], [reviewDate], [meta], [hide], [order], [datebegin]) VALUES (1, 2, 2, 5, N'Phòng gọn gàng, sạch sẽ, view đẹp, dịch vụ tốt', CAST(N'2024-02-28T00:00:00.000' AS DateTime), N'danh-gia-chat-luong', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[reviews] ([reviewID], [userID], [roomID], [rating], [comment], [reviewDate], [meta], [hide], [order], [datebegin]) VALUES (2, 3, 5, 4, N'Nhân viên khá thái độ với khách hàng, đề nghị xem lại. Mọi thứ khác đều ok', CAST(N'2024-03-05T00:00:00.000' AS DateTime), N'danh-gia-thai-do', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[rooms] ON 

INSERT [dbo].[rooms] ([roomID], [type], [price], [size], [img1], [img2], [img3], [description], [view], [bed], [max], [meta], [hide], [order], [datebegin]) VALUES (1, N'Suite', 120, N'44m2', N'room-1.jpg', N'room-6.jpg', N'room-2.jpg', N'Our luxurious suite rooms are designed to provide an exceptional and indulgent stay for our guests. These spacious accommodations go beyond the conventional hotel room, offering a distinct blend of comfort, style, and functionality.', N'Sea', 3, N'2 Adults 1 Children', N'p-nguoi-lon-tre-em', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[rooms] ([roomID], [type], [price], [size], [img1], [img2], [img3], [description], [view], [bed], [max], [meta], [hide], [order], [datebegin]) VALUES (2, N'Family', 20, N'40m2', N'room-2.jpg', N'room-1.jpg', N'room-4.jpg', N'Welcome to our family-friendly accommodations designed to cater to the needs of your entire family. Our spacious and thoughtfully appointed family rooms provide a comfortable retreat where you can create lasting memories together.', N'Mountain', 2, N'2 Adults', N'p-nguoi-lon', 1, 2, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[rooms] ([roomID], [type], [price], [size], [img1], [img2], [img3], [description], [view], [bed], [max], [meta], [hide], [order], [datebegin]) VALUES (3, N'Deluxe', 150, N'50m2', N'room-3.jpg', N'room-4.jpg', N'room-5.jpg', N'Indulge in a refined and elevated stay with our deluxe rooms, where sophistication meets comfort. Designed for discerning travelers seeking a touch of luxury, our deluxe accommodations offer an exquisite blend of style, modern amenities, and personalized service.', N'Sea', 1, N'1 Adults', N'p-nguoi-lon', 1, 2, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[rooms] ([roomID], [type], [price], [size], [img1], [img2], [img3], [description], [view], [bed], [max], [meta], [hide], [order], [datebegin]) VALUES (4, N'Classic', 130, N'56m2', N'room-4.jpg', N'room-3.jpg', N'room-2.jpg', N'Step into timeless comfort with our classic rooms, where simplicity meets sophistication. Ideal for those who appreciate understated elegance, our classic accommodations offer a warm and inviting atmosphere coupled with essential amenities for a relaxing stay.', N'Sea', 2, N'2 Adults 1 Children', N'p-nguoi-lon-tre-em', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[rooms] ([roomID], [type], [price], [size], [img1], [img2], [img3], [description], [view], [bed], [max], [meta], [hide], [order], [datebegin]) VALUES (5, N'Superior', 300, N'89m2', N'room-5.jpg', N'room-6.jpg', N'room-1.jpg', N'Discover a heightened level of comfort and style in our superior rooms, meticulously designed to offer an elevated experience for discerning travelers. With a focus on modern amenities, thoughtful details, and a touch of luxury, our superior accommodations redefine the standard for a memorable stay.', N'Mountain', 2, N'2 Adults 1 Children', N'p-nguoi-lon-tre-em', 1, 2, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
INSERT [dbo].[rooms] ([roomID], [type], [price], [size], [img1], [img2], [img3], [description], [view], [bed], [max], [meta], [hide], [order], [datebegin]) VALUES (6, N'Luxury', 500, N'100m2', N'room-6.jpg', N'room-1.jpg', N'room-2.jpg', N'Step into a world of opulence and sophistication with our luxury rooms, where unparalleled comfort, exquisite design, and exclusive amenities redefine the art of hospitality. Indulge in the epitome of refined living and create lasting memories in these meticulously crafted accommodations.', N'Forest', 2, N'2 Adults', N'p-nguoi-lon', 1, 1, CAST(N'2024-03-09T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([userID], [username], [password], [role], [email], [meta], [hide], [order], [datebegin]) VALUES (2, N'admin', N'admin123', N'admin     ', N'admin@gmail.com', N'admin', 1, 1, CAST(N'2024-03-08T00:00:00' AS SmallDateTime))
INSERT [dbo].[users] ([userID], [username], [password], [role], [email], [meta], [hide], [order], [datebegin]) VALUES (3, N'kngaan', N'123456', N'user      ', N'ngan@gmail.com', NULL, 1, 1, CAST(N'2024-03-08T00:00:00' AS SmallDateTime))
INSERT [dbo].[users] ([userID], [username], [password], [role], [email], [meta], [hide], [order], [datebegin]) VALUES (11, N'ttruc', N'2251022057731868917119086224872421513662', N'user      ', N'thanhtruc@gmail.com', NULL, 1, 1, CAST(N'2024-04-16T10:01:00' AS SmallDateTime))
INSERT [dbo].[users] ([userID], [username], [password], [role], [email], [meta], [hide], [order], [datebegin]) VALUES (12, N'thanhtruc', N'2251022057731868917119086224872421513662', N'admin     ', N'thtruc@gmail.com', NULL, 1, 1, CAST(N'2024-04-16T10:24:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
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
