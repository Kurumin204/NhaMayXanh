CREATE DATABASE [SieuThi]
GO
USE [SieuThi]
GO
/****** Object:  Table [dbo].[tb_Accounts]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](6) NULL,
	[Active] [bit] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Categories]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Categories](
	[CatlID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](150) NULL,
	[Desciption] [nvarchar](max) NULL,
	[Ordering] [int] NULL,
	[Published] [bit] NOT NULL,
	[Thumb] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Cover] [nvarchar](250) NULL,
	[SchemaMarkup] [nvarchar](max) NULL,
 CONSTRAINT [PK_tb_Categories] PRIMARY KEY CLUSTERED 
(
	[CatlID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Customers]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[Birhday] [datetime] NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nchar](100) NULL,
	[Phone] [varchar](12) NULL,
	[CreateDate] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](10) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_tb_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_News]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_News](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[SContents] [nvarchar](250) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NOT NULL,
	[Alias] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Author] [nvarchar](250) NULL,
	[AccountID] [int] NULL,
	[Tags] [nvarchar](max) NULL,
	[CatlID] [int] NULL,
	[isHot] [bit] NULL,
	[isNewfeed] [bit] NULL,
	[MetaKey] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[Views] [int] NULL,
 CONSTRAINT [PK_tb_TinTuc] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_OrderDetaills]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_OrderDetaills](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Amount] [int] NULL,
	[Discount] [int] NULL,
	[TotalMoney] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_tb_OrderDetaills] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Orders]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[TransactStatusID] [int] NULL,
	[Deleted] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[TotalMoney] [int] NULL,
	[Address] [nvarchar](max) NULL,
	[PaymentDate] [datetime] NULL,
 CONSTRAINT [PK_tb_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Pages]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](250) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[Ordering] [int] NULL,
 CONSTRAINT [PK_tb_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Products]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](250) NULL,
	[ShortDesc] [nvarchar](250) NULL,
	[Desciption] [nvarchar](max) NULL,
	[CatllD] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Thumb] [nvarchar](250) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[BestSellers] [bit] NOT NULL,
	[HomeFlag] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[Title] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[UnitslnStock] [int] NULL,
 CONSTRAINT [PK_tb_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Roles]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Desciption] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_TransactStatus]    Script Date: 6/23/2024 9:31:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TransactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_tb_TrangThai] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Accounts] ON 

INSERT [dbo].[tb_Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (1, N'0945645564', N'tenkono69@gmail.com', N'28092002', NULL, 1, N'Vũ Hồng Phúc', 1, CAST(N'2024-06-10T15:20:53.033' AS DateTime), CAST(N'2023-03-17T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Categories] ON 

INSERT [dbo].[tb_Categories] ([CatlID], [CatName], [Desciption], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (1, N'Điện thoại', N'Điện Thoại', 124, 1, N'Phone.jpeg', N'Điện Thoại', N'Điện Thoại', N'Điện Thoại', N'Điện Thoại', NULL, N'123')
INSERT [dbo].[tb_Categories] ([CatlID], [CatName], [Desciption], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (2, N'Laptop', N'Laptop', 123, 1, N'Laptop.jpeg', N'Laptop', N'Laptop', N'Laptop', N'Laptop', NULL, N'1234')
SET IDENTITY_INSERT [dbo].[tb_Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Customers] ON 

INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (30, N'Lê Nhung', CAST(N'2023-05-20T00:00:00.000' AS DateTime), N'Hà Nội', N'nhung@gmail.com                                                                                     ', N'0124214124', CAST(N'2023-05-12T20:34:31.650' AS DateTime), N'95d66a2b0977ce298e6924261d0242d1', N'4q+wS     ', NULL, 1)
INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (31, N'Minh Hùng', CAST(N'2023-05-18T00:00:00.000' AS DateTime), N'Hà Nội', N'hung@gmail.com                                                                                      ', N'0124214124', CAST(N'2023-05-12T20:34:31.650' AS DateTime), N'95d66a2b0977ce298e6924261d0242d1', N'4q+wg     ', NULL, 1)
INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (32, N'Đào Tùng', CAST(N'2023-04-14T00:00:00.000' AS DateTime), N'Hà Nội', N'tung@email.com                                                                                      ', N'8667193634', CAST(N'2023-04-11T12:02:23.053' AS DateTime), N'430399605998e25faf47aae30b14490e', N'6:7ji     ', NULL, 1)
INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (33, N'Phương Lan', CAST(N'2023-05-19T00:00:00.000' AS DateTime), N'Hà Nội', N'lan@gmail.com                                                                                       ', N'018271251', CAST(N'2023-05-05T10:19:55.950' AS DateTime), N'a124844e4262ee2a501ac7fe13a51255', N'i0!%[     ', NULL, 1)
INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (34, N'Vũ Phúc', CAST(N'2002-09-23T00:00:00.000' AS DateTime), N'Hà Nội', N'tenkono69@gmail.com                                                                                 ', N'0866719363', CAST(N'2023-04-09T11:56:14.013' AS DateTime), N'e586612283bdf38c8261352d11703b44', N'x!u4z     ', NULL, 1)
INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (35, N'Nguyễn Hùng', CAST(N'2002-05-22T00:00:00.000' AS DateTime), N'Long Biên', N'ab12.12.21122@gmail.com                                                                             ', N'0825048283', CAST(N'2024-06-10T10:29:48.417' AS DateTime), N'07c0bc971ff5360a5d8d2ae4bd551cce', N'wx+8+     ', NULL, 1)
INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (36, N'phuc', CAST(N'2002-09-28T00:00:00.000' AS DateTime), NULL, N'phucvu2809@gmail.com                                                                                ', N'09124727555', CAST(N'2024-06-10T13:10:42.773' AS DateTime), N'85e58c6fad36bcdda07898925bc0652b', N'gdgt5     ', NULL, 1)
INSERT [dbo].[tb_Customers] ([CustomerID], [FullName], [Birhday], [Address], [Email], [Phone], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (37, N'phuc', CAST(N'1999-11-11T00:00:00.000' AS DateTime), NULL, N'tenkono@gmail.com                                                                                   ', N'0825048283', CAST(N'2024-06-20T15:36:45.023' AS DateTime), N'd3a025dc4bcd968c1007cfb82d0f3d79', N'(^$0+     ', NULL, 1)
SET IDENTITY_INSERT [dbo].[tb_Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_News] ON 

INSERT [dbo].[tb_News] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatlID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views]) VALUES (1, N'Bảo vệ điện thoại Galaxy toàn diện với gói bảo hành Samsung Care+', N'Samsung Care+ là dịch vụ bảo hành mở rộng dành riêng cho chủ sở hữu điện thoại và máy tính bảng Galaxy', N'<p style="overflow-wrap: break-word; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; hyphens: auto; color: rgb(0, 0, 0); line-height: 1.625em; font-size: 18px; text-align: justify; font-family: &quot;Times New Roman&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif !important;"> 1. Ưu đãi ngập tràn: Từ 02/05 đến 31/05/2024</p><p style="overflow-wrap: break-word; margin-right: 0px; margin-bottom: 1.25em; margin-left: 0px; hyphens: auto; color: rgb(0, 0, 0); line-height: 1.625em; font-size: 18px; text-align: justify; font-family: &quot;Times New Roman&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif !important;"> 2. Nội dung chương trình <br> - Chương trình khuyến mãi GIẢM 30% Samsung Care+ cho Gói 6 tháng, 12 tháng và 24 tháng Model áp dụng gồm: A55, A35, A54, A34, S23 FE (128), M54, Tab S9 FE, Tab S9 FE+ WIFI, Tab S6 Lite 2024, M34, A15, A15 5G, A25 5G, M15 5G, A05, A05s, S24 Series, S23 series, S23 FE (256), Tab S9 series, Tab S9 FE+ 5G, Galaxy Watch 6, Galaxy Watch 6 Classic. <br> - GIẢM 30% khi mua các gói nâng cấp 6 tháng => 1 năm, 6 tháng => 2 năm. <br> Model áp dụng gồm: Z Flip4 , Z Fold4 , Z Flip5 , Z Fold5</p> <p>3. Samsung Care+ là gì?<br> Samsung Care+ là dịch vụ bảo hành mở rộng dành riêng cho chủ sở hữu điện thoại thông minh và máy tính bảng Samsung Galaxy.<br> Với Samsung Care+, người dùng được tận hưởng đặc quyền bảo vệ thiết bị của mình đến 2 lần giá bán lẻ của thiết bị, đặc biệt nhóm rủi ro liên quan đến rơi vỡ và vào chất lỏng. Thời hạn bảo vệ có thể kéo dài tối đa 2 năm với quy trình bảo hành đơn giản và dịch vụ giao nhận miễn phí tiện lợi.<br> Hơn nữa, người dùng sẽ được thay một thiết bị hoàn toàn mới trong trường hợp tổng chi phí sửa chữa lớn hơn hoặc bằng 85% giá bán lẻ thiết bị.</p>', N'blog_1.jpg', 1, N'Peo', CAST(N'2023-03-31T00:00:00.000' AS DateTime), N'Nguyễn Minh Hùng', NULL, N'figure_type', 1, 1, 1, N'figure_type', N'figure_type', 1)
INSERT [dbo].[tb_News] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatlID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views]) VALUES (2, N'Mua sớm máy lạnh - Tặng 2 lần vệ sinh chỉ có tại Điện máy XANH | Mới 2024', N'Ưu đãi hấp dẫn dành cho khách hàng khi mua máy lạnh mới tại Điện máy XANH, tặng ngay 2 lần vệ sinh máy lạnh miễn phí chuẩn dịch vụ Thợ Điện máy XANH, giúp máy lạnh vận hành tốt hơn, tiết kiệm điện hơn cùng nhiều ưu đãi khác. Khám phá ngay.', N'<p>1. Thời gian khuyến mãi: Từ 01/05 đến 31/05/2024<br>2. Nội dung chương trình<br>- Trong thời gian diễn ra, khi mua máy lạnh mới tại Điện máy XANH sẽ được tặng 2 lần vệ sinh máy lạnh, sử dụng trong 1 năm đầu mua máy.<br> - Khách hàng sẽ được nhắc hẹn khi đến lịch vệ sinh hoặc gọi lên tổng đài (có sẵn trên máy) để hẹn lịch vệ sinh.<br> - Áp dụng cho tất cả sản phẩm Máy lạnh (mới) mua tại Điện máy XANH thuộc các hãng: LG và Sharp.<br> - Vệ sinh sẽ do dịch vụ Thợ Điện máy XANH thực hiện.<br>3. Dịch vụ vệ sinh máy lạnh chuẩn Thợ Điện máy XANH<br>bước 1: kiểm tra máy, dự đoán chi phí<br> bước 2: khách hàng xác nhận bẳng dự toán<br> bước 3: vệ sinh dàn lanh và dàn nóng đúng kỹ thuật<br> bước 4: kiểm tra lại máy, vệ sinh khu vực làm việc<br> bước 5: khách hàng kiếm tra lại lần nữa<br> bước 6: xác nhận thanh tonas trên điện thoại và nhận tin nhắn</p>', N'blog_2.jpg', 1, N'Tặng Quà', CAST(N'2023-04-01T13:54:33.000' AS DateTime), N'Vũ Hồng Phúc', NULL, N'Tặng Quà', 1, 1, 1, N'Tặng Quà', N'Tặng Quà', 2)
INSERT [dbo].[tb_News] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatlID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views]) VALUES (3, N'Ưu đãi khủng: Mua laptop gaming card RTX 30 series giảm thêm đến 400K', N'Sở hữu sức mạnh vượt trội với laptop gaming card RTX 30 series và được giảm thêm đến 400K với ưu đãi đặc quyền tại Điện máy XANH. Khám phá ngay để trải nghiệm game mượt mà, hình ảnh sắc nét hơn bao giờ hết. Đừng bỏ lỡ!', N'<p><span style="color: rgb(51, 48, 46); font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 15px; text-align: justify;">1. Thời gian khuyến mãi: Từ 01/05 đến 15/06/2024<br> 2. Nội dung chương trình <br> Trong thời gian khuyến mãi, khi mua laptop gaming card rời RTX 30 series khách hàng sẽ được giảm thêm 400.000đ.<br> Chi tiết khuyến mãi:<br> - Laptop gaming trang bị CARD RTX 30 Series giá chỉ từ 15.990.000đ.<br> - Trả góp 0%, trả trước từ 10%.<br> - 100% tặng kèm balo gaming.<br> - Học sinh, sinh viên giảm thêm 400.000đ.<br><br>Đừng bỏ lỡ cơ hội sở hữu laptop gaming card RTX 30 series với ưu đãi giảm thêm đến 400K, hãy đặt mua ngay để tận hưởng trải nghiệm game tuyệt vời nhất!</p>', N'blog_3.jpg', 1, N'Ưu đãi khủng', CAST(N'2023-04-01T13:55:07.000' AS DateTime), N'Lê Thị Nhung', NULL, N'Ưu đãi khủng', 1, 1, 1, N'Ưu đãi khủng', N'Ưu đãi khủng', 3)
SET IDENTITY_INSERT [dbo].[tb_News] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_OrderDetaills] ON 

INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (1, 2, 22, NULL, 1, NULL, 20000, CAST(N'2023-04-15T11:12:09.207' AS DateTime), 20000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (2, 3, 22, NULL, 1, NULL, 20000, CAST(N'2023-04-15T11:15:58.680' AS DateTime), 20000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (3, 4, 22, NULL, 4, NULL, 80000, CAST(N'2023-04-21T08:09:31.230' AS DateTime), 20000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (4, 5, 1, NULL, 1, NULL, 20000, CAST(N'2023-04-21T14:28:34.123' AS DateTime), 20000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (5, 6, 1, NULL, 3, NULL, 60000, CAST(N'2023-05-05T10:22:09.067' AS DateTime), 20000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (6, 7, 22, NULL, 2, NULL, 40000, CAST(N'2023-05-12T20:35:38.887' AS DateTime), 20000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (7, 8, 1, NULL, 3, NULL, 60000, CAST(N'2023-05-15T13:50:28.013' AS DateTime), 20000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (8, 9, 1, NULL, 5, NULL, 100000, CAST(N'2023-05-22T08:15:57.910' AS DateTime), 20000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (9, 10, 11, NULL, 1, NULL, 10990000, CAST(N'2024-06-20T11:15:22.810' AS DateTime), 10990000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (10, 11, 11, NULL, 1, NULL, 10990000, CAST(N'2024-06-22T15:32:24.797' AS DateTime), 10990000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (11, 12, 16, NULL, 1, NULL, 120000, CAST(N'2024-06-22T22:20:11.450' AS DateTime), 120000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (12, 13, 16, NULL, 1, NULL, 120000, CAST(N'2024-06-22T22:27:23.647' AS DateTime), 120000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (13, 14, 16, NULL, 1, NULL, 120000, CAST(N'2024-06-22T22:34:51.343' AS DateTime), 120000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (14, 15, 16, NULL, 1, NULL, 120000, CAST(N'2024-06-22T22:39:47.350' AS DateTime), 120000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (15, 16, 16, NULL, 1, NULL, 120000, CAST(N'2024-06-22T22:40:51.323' AS DateTime), 120000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (16, 17, 11, NULL, 1, NULL, 10990000, CAST(N'2024-06-22T22:46:35.107' AS DateTime), 10990000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (17, 18, 11, NULL, 1, NULL, 10990000, CAST(N'2024-06-22T22:52:22.890' AS DateTime), 10990000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (18, 19, 11, NULL, 1, NULL, 10990000, CAST(N'2024-06-22T22:54:50.263' AS DateTime), 10990000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (19, 20, 11, NULL, 1, NULL, 10990000, CAST(N'2024-06-22T22:57:34.413' AS DateTime), 10990000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (20, 21, 11, NULL, 1, NULL, 10990000, CAST(N'2024-06-22T22:58:26.057' AS DateTime), 10990000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (21, 22, 16, NULL, 1, NULL, 120000, CAST(N'2024-06-22T23:08:17.447' AS DateTime), 120000)
INSERT [dbo].[tb_OrderDetaills] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (22, 23, 11, NULL, 1, NULL, 10990000, CAST(N'2024-06-22T23:12:40.350' AS DateTime), 10990000)
SET IDENTITY_INSERT [dbo].[tb_OrderDetaills] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Orders] ON 

INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (2, 36, CAST(N'2023-04-15T11:12:09.050' AS DateTime), NULL, 4, 0, 1, 779000, N'Long Biên', CAST(N'2023-05-22T08:19:13.663' AS DateTime))
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (3, 36, CAST(N'2023-04-15T11:15:58.670' AS DateTime), NULL, 1, 0, 0, 4990000, N'Hà Nội', NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (4, 30, CAST(N'2023-04-21T08:09:31.117' AS DateTime), CAST(N'2023-04-21T10:07:54.540' AS DateTime), 5, 1, 1, 80000, N'Hà Nội', CAST(N'2023-04-21T10:08:15.543' AS DateTime))
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (5, 30, CAST(N'2023-04-21T14:28:34.043' AS DateTime), NULL, 1, 0, 0, 20000, N'Hà Nội', NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (6, 31, CAST(N'2023-05-05T10:22:08.987' AS DateTime), NULL, 1, 0, 0, 60000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (7, 32, CAST(N'2023-05-12T20:35:38.823' AS DateTime), NULL, 1, 0, 0, 40000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (8, 32, CAST(N'2023-05-15T13:50:27.813' AS DateTime), NULL, 1, 0, 0, 60000, N'Hà Nội', NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (9, 32, CAST(N'2023-05-22T08:15:57.653' AS DateTime), NULL, 4, 0, 1, 100000, N'Hà Nội', CAST(N'2023-05-22T08:20:13.810' AS DateTime))
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (10, 35, CAST(N'2024-06-20T11:14:52.180' AS DateTime), NULL, 1, 0, 1, 10990000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (11, 35, CAST(N'2024-06-22T15:32:24.657' AS DateTime), NULL, 1, 0, 1, 10990000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (12, 35, CAST(N'2024-06-22T22:20:11.303' AS DateTime), NULL, 1, 0, 1, 120000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (13, 35, CAST(N'2024-06-22T22:27:23.507' AS DateTime), NULL, 1, 0, 1, 120000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (14, 35, CAST(N'2024-06-22T22:34:51.207' AS DateTime), NULL, 1, 0, 1, 120000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (15, 35, CAST(N'2024-06-22T22:39:43.433' AS DateTime), NULL, 1, 0, 1, 120000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (16, 35, CAST(N'2024-06-22T22:40:51.313' AS DateTime), NULL, 1, 0, 1, 120000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (17, 35, CAST(N'2024-06-22T22:46:34.970' AS DateTime), NULL, 1, 0, 1, 10990000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (18, 35, CAST(N'2024-06-22T22:52:22.743' AS DateTime), NULL, 1, 0, 1, 10990000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (19, 35, CAST(N'2024-06-22T22:54:50.110' AS DateTime), NULL, 1, 0, 1, 10990000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (20, 35, CAST(N'2024-06-22T22:57:34.407' AS DateTime), NULL, 1, 0, 1, 10990000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (21, 35, CAST(N'2024-06-22T22:58:25.843' AS DateTime), NULL, 1, 0, 1, 10990000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (22, 35, CAST(N'2024-06-22T23:08:17.300' AS DateTime), NULL, 1, 0, 1, 120000, NULL, NULL)
INSERT [dbo].[tb_Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [TotalMoney], [Address], [PaymentDate]) VALUES (23, 35, CAST(N'2024-06-22T23:12:40.187' AS DateTime), NULL, 1, 0, 1, 10990000, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tb_Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Pages] ON 

INSERT [dbo].[tb_Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreateDate], [Ordering]) VALUES (1, N'Hướng Dẫn Mua Hàng', N'<div class="hc_box__header" style="padding: 0px 0px 24px; border-bottom: 1px solid rgb(221, 225, 230); margin: 0px 0px 24px; color: rgb(18, 22, 25); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 12px;"><h3 class="hc_box__title" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; font-weight: 700;"><span style="color: rgb(0, 0, 0);">1. Tìm kiếm sản phẩm</span></h3></div><div class="hc_box__body" style="color: rgb(18, 22, 25); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, &quot;Noto Sans&quot;, &quot;Liberation Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 12px;"><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Có 3 cách để tìm kiếm sản phẩm:</span><br><ul style="margin-bottom: 1rem;"><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px;">Cách 1:&nbsp;</span><span style="font-size: 14px;">Nhập URL sản phẩm vào thanh tìm kiếm.</span></span></li><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119); font-size: 14px;">Cách 2: Tìm kiếm theo danh mục sản phẩm</span></li><li><span style="color: rgb(104, 112, 119); font-size: 14px; line-height: 24px;">Cách 3: Tìm kiếm theo từ khóa/ từ khóa phổ biến.</span></li><li><span style="color: rgb(104, 112, 119); font-size: 14px; line-height: 24px;"><div class="hc_box__header" style="padding: 0px 0px 24px; border-bottom: 1px solid rgb(221, 225, 230); margin: 0px 0px 24px; color: rgb(18, 22, 25); font-size: 12px;"><h3 class="hc_box__title" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; font-weight: 700;"><span style="color: rgb(0, 0, 0);">2. Đặt hàng</span></h3></div><div class="hc_box__body" style="color: rgb(18, 22, 25); font-size: 12px;"><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;">Khi bạn tìm thấy một mặt hàng bạn muốn mua, hãy kiểm tra thông tin chi tiết của mặt hàng: tình trạng hàng hóa, hình ảnh, giá cả, người bán và thời gian giao hàng ước tính.</span></span></p><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;">Nếu bạn hài lòng với mặt hàng sau đó nhập đầy đủ thông tin đặt hàng theo yêu cầu như: số lượng, màu sắc, kích thước,...</span></span></p><p style="margin-bottom: 1rem; color: rgb(18, 22, 25); background-color: rgb(242, 244, 248);"><span style="color: rgb(0, 0, 0);"><span style="font-size: 18px;"><span style="font-weight: 700;">2.1 Chọn địa chỉ nhận hàng</span></span><span style="font-size: 0.75rem;"><br></span></span></p><div class="row" style="margin-right: -12px; margin-left: -12px; background-color: rgb(242, 244, 248);"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><span style="font-size: 14px; color: rgb(0, 0, 0);">B<span style="color: rgb(104, 112, 119); line-height: 24px;">ạn điền đầy đủ vào các thông tin sau:</span></span><br><ul style="margin-bottom: 1rem;"><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119); font-size: 14px;">Quốc gia.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Mã Zipcode.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Bang/Tỉnh/Thành Phố.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Thành Phố.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Địa chỉ chi tiết.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Họ và tên.</span></li><li><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;">Số điện thoại.</span></span></li></ul></div><div class="col-7" style="width: 496.062px; padding-right: 12px; padding-left: 12px; flex-basis: 58.3333%; max-width: 58.3333%;"><span style="color: rgb(0, 0, 0);"><img src="https://cdn.ezbuy.jp/image/default/2021/9/20/20210920085331.png" alt="" width="90%" height="" style="max-width: 100%; float: right;"></span><br><br></div></div><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;"><br style="color: rgb(18, 22, 25); font-size: 12px; background-color: rgb(242, 244, 248);"><span style="font-size: 12px; background-color: rgb(242, 244, 248); color: rgb(0, 0, 0);"><span style="font-size: 18px;"><span style="font-weight: 700;">2.2&nbsp; Chọn phương thức thanh toán<br><br></span></span><span style="font-size: 14px; line-height: 24px; color: rgb(104, 112, 119);">Bạn chọn một trong số các phương thức thanh toán sau:</span></span><span style="color: rgb(18, 22, 25); font-size: 12px; background-color: rgb(242, 244, 248);"></span></span></span></p><div class="row" style="margin-right: -12px; margin-left: -12px; background-color: rgb(242, 244, 248);"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><ul style="margin-bottom: 1rem;"><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Paypal.</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Ví Janbox.</span></li><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px;">Visa/Mastercar</span></span></li><li style="line-height: 24px;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px;"><div class="hc_box bg_light" style="border: 1px solid rgb(221, 225, 230); padding: 24px; margin: 0px 0px 24px; color: rgb(18, 22, 25); font-size: 12px;"><div class="hc_box__header" style="padding: 0px 0px 24px; border-bottom: 1px solid rgb(221, 225, 230); margin: 0px 0px 24px;"><h3 class="hc_box__title" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; font-weight: 700;"><span style="color: rgb(0, 0, 0);">3. Thanh toán</span></h3></div><div class="hc_box__body"><p style="margin-bottom: 1rem;"><span style="font-size: 18px; color: rgb(0, 0, 0);"><span style="font-weight: 700;">3.1 Kiểm tra đơn hàng&nbsp;</span></span></p><div class="row" style="margin-right: -12px; margin-left: -12px;"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119); font-size: 14px;"><span style="font-weight: 700;"><span style="line-height: 24px;">* Bạn cần chọn và kiểm tra đơn hàng trước khi thanh toán:</span></span></span></p><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Chọn gói dịch vụ gia tăng:</span><br><ul style="margin-bottom: 1rem; line-height: 22px;"><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Gói cơ bản</span></li><li style="line-height: 24px;"><span style="font-size: 14px; color: rgb(104, 112, 119);">Gói tiêu chuẩn.</span></li><li><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Gói bổ sung.</span></li></ul><span style="font-size: 14px; line-height: 22px; color: rgb(0, 0, 0);"><a href="https://janbox.com/vi/help/phi-goi-165" class="color_blue" style="color: rgb(0, 0, 0); transition: color 0.3s ease 0s;">→ Gói dịch vụ tại Janbox</a></span></div><div class="col-7" style="width: 496.062px; padding-right: 12px; padding-left: 12px; flex-basis: 58.3333%; max-width: 58.3333%;"><span style="color: rgb(0, 0, 0);"><img src="https://cdn.ezbuy.jp/image/default/2022/3/30/20220330090631.png" alt="" width="90%" height="" style="max-width: 100%; float: right;"></span><br><br></div></div><div class="row" style="margin-right: -12px; margin-left: -12px;"><div class="col-7" style="width: 496.062px; padding-right: 12px; padding-left: 12px; flex-basis: 58.3333%; max-width: 58.3333%;"></div><br><br></div></div><br><div class="row" style="margin-right: -12px; margin-left: -12px;"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><p style="margin-bottom: 1rem;"><span style="font-size: 18px; color: rgb(0, 0, 0);"><span style="font-weight: 700;">3.2 Thanh toán</span></span></p><ul style="margin-bottom: 1rem;"></ul><p style="margin-bottom: 1rem;"><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Bạn vui lòng kiểm tra lại các thông tin về thanh toán và thêm mã khuyến mãi (nếu có).</span></p><p style="margin-bottom: 1rem;"><span style="font-size: 14px; color: rgb(104, 112, 119); line-height: 24px;">Sau đó chọn "Xác nhận" để hoàn tất quá trình mua hàng.</span></p></div><br><br><div class="col-7" style="width: 496.062px; padding-right: 12px; padding-left: 12px; flex-basis: 58.3333%; max-width: 58.3333%;"><span style="color: rgb(0, 0, 0);"><img src="https://cdn.ezbuy.jp/image/default/2022/3/30/20220330090833.png" alt="" width="90%" style="max-width: 100%; float: right;"></span><br><br></div><br><br></div></div><div class="hc_box bg_light" style="border: 1px solid rgb(221, 225, 230); padding: 24px; margin: 0px 0px 24px; color: rgb(18, 22, 25); font-size: 12px;"><div class="hc_box__header" style="padding: 0px 0px 24px; border-bottom: 1px solid rgb(221, 225, 230); margin: 0px 0px 24px;"><h3 class="hc_box__title" style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font-size: 24px; font-weight: 700;"><span style="color: rgb(0, 0, 0);">4. Mua hàng thành công</span></h3></div><div class="hc_box__body"><div class="row" style="margin-right: -12px; margin-left: -12px;"><div class="col-5" style="width: 354.325px; padding-right: 12px; padding-left: 12px; flex-basis: 41.6667%; max-width: 41.6667%;"><p style="margin-bottom: 1rem;"><span style="color: rgb(104, 112, 119);"><span style="font-size: 14px; line-height: 24px;">Khi đã đặt hàng thành công, màn hình sẽ hiển thị thông báo “Tạo đơn hàng thành công” và hệ thống sẽ tự động gửi xác nhận đến địa chỉ Email của bạn. Bạn có thể kiểm tra lại đơn hàng và theo dõi tình trạng mua hàng của mình tại mục "Quản lý đơn hàng" trên trang cá nhân.</span></span></p></div></div></div></div></span></span></li></ul></div></div></div><span style="color: rgb(40, 128, 185);"></span></span></li></ul></div>', N'huong-dan-mua-hang.jpeg', 1, N'Hướng dẫn mua hàng trên Nhà Máy Xanh', N'Hướng Dẫn Mua Hàng', N'Hướng Dẫn Mua Hàng', N'mua hang', CAST(N'2023-03-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[tb_Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreateDate], [Ordering]) VALUES (11, N'Thông tin liên hệ', N'<p>Thông tin liên hệ<br></p>', N'thong-tin-lien-he.jpeg', 1, N'Thông tin liên hệ', N'Thông tin liên hệ', N'Thông tin liên hệ', N'thong-tin-lien-he', CAST(N'2023-04-01T13:41:39.953' AS DateTime), 2)
INSERT [dbo].[tb_Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreateDate], [Ordering]) VALUES (12, N'Giới Thiệu', N'<p>Giới Thiệu<br></p>', N'gioi-thieu.jpeg', 1, N'Giới Thiệu', N'Giới Thiệu', N'Giới Thiệu', N'gioi-thieu', CAST(N'2023-04-01T13:42:35.987' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[tb_Pages] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Products] ON 

INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (1, N'Iphone 13 128GB Chính Hãng Màu Trắng', N' ', N'<span style="color: rgb(17, 17, 17); font-family: Roboto, Helvetica, sans-serif; font-size: 16px;">Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao<br> • Không gian hiển thị sống động - Màn hình 6.1" Super Retina XDR de sáng cao, sắc nét <br> • Trải nghiệm điện ảnh đỉnh cao - Camera kép 12MP, hỗ trợ ổn định hình ảnh quang học<br> • Tôi ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 phút', 1, 779000, 3, N'phone1.png', NULL, CAST(N'2023-04-05T08:01:52.807' AS DateTime), 1, 1, 1, N'Gundam', N'Gundam', N'Gundam', N'Gundam', N'Gundam', 10)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (3, N'Nubia Neo 2', N'diẹnthoai', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">Trải
  nghiệm hình ảnh mượt mà, sống động - Màn hình 6.72" Full HD+ 120Hz<br>
    • Chơi game liên tục không lo gián đoạn - Pin 6.000 mAh, sạc nhanh
  33W<br>
    • Âm thanh sống động, nhập vai - Hệ thống âm thanh nổi DTS:X Ultra<br>
    • Trải nghiệm chơi game tuyệt vời - Trang bị nhiều tính năng chơi game,
  hiệu suất cao</td></tr></tbody></table>', 1, 4990000, 0, N'nubia-neo-2.png', CAST(N'2024-06-10T13:26:39.130' AS DateTime), CAST(N'2024-06-10T13:26:39.130' AS DateTime), 1, 1, 1, N'diẹnthoai', N'diẹnthoai', N'nubia-neo-2', N'diẹnthoai', N'diẹnthoai', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (4, N'Xiaomi Redmi Note 13 6GB 128GB', N'diẹnthoai', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">&nbsp;• Bắt trọn khoảnh khắc - Cụm camera đến
  108MP mạnh mẽ cùng khả năng thu phóng 3x<br>
    • Màn hình đẳng cấp - Kích thước lớn 6.67" AMOLED 120hz cuộn lướt mượt
  mà<br>
    • Hiệu suất ổn định, đa nhiệm dễ dàng - Snapdragon 685 8 nhân cùng RAM
  6GB<br>
    • Trải nghiệm cả ngày không lo lắng - pin 5000mAh cũng sạc nhanh 33W</td></tr></tbody></table>', 1, 4690000, 0, N'xiaomi-redmi-note-13-6gb-128gb.png', CAST(N'2024-06-10T13:28:30.550' AS DateTime), CAST(N'2024-06-10T13:28:30.550' AS DateTime), 0, 0, 1, N'điện thoại', N'điện thoại', N'xiaomi-redmi-note-13-6gb-128gb', N'điện thoại', N'điện thoại', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (5, N'OPPO Reno11 F 5G 8GB 256GB', N'điện thoại', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">Thoải
  mái sáng tạo nhiếp ảnh - Với cụm 3 camera lên đến 64MP đi kèm nhiều tính năng
  chỉnh sửa thú vị<br>
    • Rực rỡ mọi góc nhìn - Màn hình AMOLED 120Hz, cùng khả năng hiển thị trên
  1 tỉ màu<br>
    • Giải trí mượt mà, đa dạng tác vụ - Chip xử lí mạnh mẽ Dimensity 7050 5G
  cùng RAM 8GB<br>
    • Năng lượng bền bỉ cả ngày dài - Pin lớn 5.000mAh cùng chế độ sạc nhanh
  67W</td></tr></tbody></table>', 1, 8490000, 0, N'oppo-reno11-f-5g-8gb-256gb.png', CAST(N'2024-06-10T13:29:09.857' AS DateTime), CAST(N'2024-06-10T13:29:09.857' AS DateTime), 0, 1, 1, N'điện thoại', N'điện thoại', N'oppo-reno11-f-5g-8gb-256gb', N'điện thoại', N'điện thoại', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (6, N'Samsung Galaxy S23 Ultra 256GB', N'điện thoại', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">•
  Galaxy Al tiên ích - Khoanh vùng search đa năng, là trợ lý chỉnh ảnh, note
  thông minh, phiên dịch trực tiếp<br>
    • Thoả sức chụp ảnh, quay video chuyên nghiệp - Camera đến 200MP, chế độ
  chụp đêm cải tiến, bộ xử lí ảnh thông minh<br>
    &gt;<br>
    • Chiến game bùng nổ - chip Snapdragon 8 Gen 2 8 nhân tăng tốc độ xử lí,
  màn hình 120Hz, pin 5.000mAh<br>
    • Nâng cao hiệu suất làm việc với Siêu bút S Pen tích hợp, dễ dàng đánh dấu
  sự kiện từ hình ảnh hoặc video</td></tr></tbody></table>', 1, 21990000, 0, N'samsung-galaxy-s23-ultra-256gb.png', CAST(N'2024-06-10T13:30:06.747' AS DateTime), CAST(N'2024-06-10T13:30:06.747' AS DateTime), 0, 0, 1, N'điện thoại', N'điện thoại', N'samsung-galaxy-s23-ultra-256gb', N'điện thoại', N'điện thoại', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (7, N'Xiaomi Redmi Note 13 Pro 4G', N'điện thoại', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">• Thu
  hút mọi ánh nhìn với thiết kế đẹp mắt, mặt lưng và khung nhựa nhẹ được làm
  bóng.<br>
    • Công nghệ âm thanh Dolby Atmos - Trải nghiệm âm thanh sống động, chi tiết
  và mạnh mẽ.<br>
    • Màn hình lớn Full HD+ đi kèm tần số quét cao 120 Hz - Cho phép người dùng
  tận hưởng mọi chi tiết một cách rõ ràng.<br>
    • Hiệu năng mạnh mẽ, phù hợp với nhu cầu sử dụng đa nhiệm của người dùng
  hiện nay với chip MediaTek Helio G99-Ultra.</td></tr></tbody></table>', 1, 6890000, 0, N'xiaomi-redmi-note-13-pro-4g.png', CAST(N'2024-06-10T13:30:40.633' AS DateTime), CAST(N'2024-06-10T13:30:40.633' AS DateTime), 1, 0, 1, N'điện thoại', N'điện thoại', N'xiaomi-redmi-note-13-pro-4g', N'điện thoại', N'điện thoại', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (8, N'Laptop ASUS TUF Gaming F15 FX506HF-HN078W', N'Laptop', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">• CPU
  Intel Core i5 11260H đáp ứng tốt các tác vụ, mang lại trải nghiệm sử dụng
  tuyệt vời trong cả công việc lẫn giải trí, chiến game.<br>
    • Card đồ họa NVIDIA GeForce RTX 2050 đáp ứng tốt nhu cầu chơi game cấu
  hình cao và xử lý các file thiết kế nặng.<br>
    • RAM 16 GB cho bạn tận hưởng những giây phút chiến game đỉnh cao khi có
  thể mở nhiều ứng dụng cùng lúc.<br>
    - Ô cứng SSD 512 GB cho tóc đồ khởi đồng nhanh chóng cũng</td></tr></tbody></table>', 2, 17290000, 0, N'laptop-asus-tuf-gaming-f15-fx506hf-hn078w.png', CAST(N'2024-06-10T13:31:08.867' AS DateTime), CAST(N'2024-06-10T13:31:08.867' AS DateTime), 1, 1, 1, N'Laptop', N'Laptop', N'laptop-asus-tuf-gaming-f15-fx506hf-hn078w', N'Laptop', N'Laptop', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (9, N'Laptop ASUS VivoBook S 14 FLIP TP3402VA-LZ025W', N'Laptop', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">• Sở
  hữu thiết kế sang trọng, màu bạc sáng bóng dễ dàng thu hút mọi người<br>
    • CPU I3-1315U giúp bạn thực hiện các tác vụ văn phòng một cách tối đa, xử
  lý ảnh nhẹ<br>
    • RAM 8GB hỗ trợ mở các tạo ổn định, không lag<br>
    • Ổ cứng 256GB SSD giúp bạn lưu trữ không gian cực lớn, không cần sao chép
  qua USB<br>
    • Trang bị laptop có thiết kế gập và màn hình cảm ứng đem lại trải nghiệm
  tối đa</td></tr></tbody></table>', 2, 11490000, 0, N'laptop-asus-vivobook-s-14-flip-tp3402va-lz025w.png', CAST(N'2024-06-10T13:31:31.337' AS DateTime), CAST(N'2024-06-10T13:31:31.337' AS DateTime), 1, 1, 1, N'Laptop', N'Laptop', N'laptop-asus-vivobook-s-14-flip-tp3402va-lz025w', N'Laptop', N'Laptop', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (10, N'Laptop Lenovo Ideapad Slim 5 14IAH8 83BF002NVN', N'Laptop', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">* Sở
  hữu thiết kế tinh tế với lớp vỏ nhôm sáng bóng, sang trọng<br>
    • Màn hình 14 inch WUXGA cực sắc nét, hỗ trợ làm việc, giải trí dễ
  dàng<br>
    • CPU Intel Core i5-12450H mạnh mẽ, giải quyết nhanh mọi tác &gt; vụ học
  tập, văn phòng<br>
    RAM 16GB cùng ổ cứng 512GB SSD đa nhiệm, mở máy, mở ứng dụng cực
  nhanh<br>
    • Độ sáng lên đến 300nits hỗ trợ làm việc ở nơi có ánh sáng yếu</td></tr></tbody></table>', 2, 15190000, 0, N'laptop-lenovo-ideapad-slim-5-14iah8-83bf002nvn.png', CAST(N'2024-06-10T13:31:53.730' AS DateTime), CAST(N'2024-06-10T13:31:53.730' AS DateTime), 0, 0, 1, N'Laptop', N'Laptop', N'laptop-lenovo-ideapad-slim-5-14iah8-83bf002nvn', N'Laptop', N'Laptop', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (11, N'Laptop Lenovo V14 G4 AMN 82YT00M8VN', N'Laptop', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">• CPU
  AMD Ryzen 5 7520U cung cấp hiệu suất đủ mạnh để xử lý các tác vụ hàng ngày và
  văn phòng một cách mượt mà<br>
    - Bộ nhớ RAM lên đến 16GB và ổ cứng SSD PCIe 512GB, cung cấp không gian lưu
  trữ đủ rộng rãi và tốc độ truy cập nhanh ông người dùng<br>
    • Màn hình 14 inch Full HD cung cấp hình ảnh sắc nét và chi tiết, giúp tăng
  cường trải nghiệm làm việc và giải trì<br>
    • Với hệ điều hành Windows 11, người dùng có thể tận dụng các tính năng mới
  nhất và tối ưu hoá hiệu suất máy tính</td></tr></tbody></table>', 2, 10990000, 0, N'laptop-lenovo-v14-g4-amn-82yt00m8vn.png', CAST(N'2024-06-10T13:32:19.760' AS DateTime), CAST(N'2024-06-10T13:32:19.760' AS DateTime), 1, 1, 1, N'Laptop', N'Laptop', N'laptop-lenovo-v14-g4-amn-82yt00m8vn', N'Laptop', N'Laptop', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (12, N'Sạc Nhanh 20W Apple MHJE3ZA | Chính Hãng Apple Việt Nam', N'phụ kiện', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">Công
  nghệ PD sạc cho các sản phẩm Apple nhanh chóng<br>
    &nbsp;• Cổng Type-C công suất 20W giúp
  tiết kiệm nhiều thời gian <br>
    • Thiết kế chuẩn thương hiệu Apple nhỏ gọn và sang trọng<br>
    • Bảo vệ quá dòng, tránh hiện tượng chập mạch, quả nhiệt</td></tr></tbody></table>', NULL, 520000, 0, N'sac-nhanh-20w-apple-mhje3za-chinh-hang-apple-viet-nam.png', CAST(N'2024-06-10T13:32:52.273' AS DateTime), CAST(N'2024-06-10T13:32:52.273' AS DateTime), 0, 0, 1, N'phụ kiện', N'phụ kiện', N'sac-nhanh-20w-apple-mhje3za-chinh-hang-apple-viet-nam', N'phụ kiện', N'phụ kiện', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (13, N'Tai Nghe Bluetooth Apple AirPods Pro 2 2023 USB-C | Chính Hãng Apple Việt Nam', N'phụ kiện', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">- Tích
  hợp chip Apple H2 mang đến chất âm sống động cùng khả năng tái tạo âm thanh 3
  chiều vượt trôi<br>
    - Công nghệ Bluetooth 5.3 kết nối ổn định, mượt mà, tiêu thụ năng lượng
  thấp, giúp tiết kiệm pin đáng kể<br>
    - Chống ồn chủ động loại bỏ tiếng ồn hiệu quả gấp đôi thế hệ trước, giúp
  nâng cao trải nghiệm nghe nhạc<br>
    - Chống nước chuẩn IP54 trên tai nghe và hộp sạc, giúp bạn thỏa sức tập
  luyện không cần lo thấm mồ hôi</td></tr></tbody></table>', 1, 5600000, 0, N'tai-nghe-bluetooth-apple-airpods-pro-2-2023-usb-c-chinh-hang-apple-viet-nam.png', CAST(N'2024-06-10T13:33:30.017' AS DateTime), CAST(N'2024-06-10T13:33:30.017' AS DateTime), 1, 0, 1, N'phụ kiện', N'phụ kiện', N'tai-nghe-bluetooth-apple-airpods-pro-2-2023-usb-c-chinh-hang-apple-viet-nam', N'phụ kiện', N'phụ kiện', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (14, N'Hub Ugreen USB-C To 2 X USB-A 2.0 + USB-A 3.0 + HDMI + PD Hỗ Trợ 4K (15495)', N'phụ kiện', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="23" style="height:17.4pt">
  <td height="23" class="xl65" width="1057" style="height:17.4pt;width:793pt">• Thiết
  kế đẳng cấp 5 trong 1, siêu đa năng với chỉ 1 đầu vào Type-C, hỗ trợ 5 đầu ra
  HDMI, 3 x USB, Sạc PD<br>
    • Giữ trọn mọi khoảnh khắc đáng kinh ngạc với cổng HDMI hồ trợ hiển thị ở
  độ phân giải lên tới 4K@30Hz<br>
    • Cung cấp khả năng sạc nhanh hiệu quả lên đền 100W, kể cả sạc với laptop
  thông qua cổng USB-C PD<br>
    * Truyền dữ liệu nhanh chóng tốc độ lên tới 5Gbps với công USB-A 3.0 và 2
  cổng USB-A 2.0 480Mbps</td></tr></tbody></table>', NULL, 350000, 0, N'hub-ugreen-usb-c-to-2-x-usb-a-20-usb-a-30-hdmi-pd-ho-tro-4k-15495.png', CAST(N'2024-06-10T13:34:00.447' AS DateTime), CAST(N'2024-06-10T13:34:00.447' AS DateTime), 0, 0, 1, N'phụ kiện', N'phụ kiện', N'hub-ugreen-usb-c-to-2-x-usb-a-20-usb-a-30-hdmi-pd-ho-tro-4k-15495', N'phụ kiện', N'phụ kiện', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (15, N'Dán Màn Hình PPF Kasr Full Cao Cấp', N'phụ kiện', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">Mới,
  đầy đủ phụ kiện từ nhà sản xuất<br>
    - Dán được tất cả dòng máy<br>
    - Bảo hành 30 ngày/lần 1 đổi 1 tất cả các lỗi.<br>
    - Dán mới lần 2 được giảm 30%.<br>
    - Dán PPF /Dán UV Loca chỉ được thực hiện ở cửa hàng.</td></tr></tbody></table>', 1, 135000, 0, N'dan-man-hinh-ppf-kasr-full-cao-cap.png', CAST(N'2024-06-10T13:34:28.250' AS DateTime), CAST(N'2024-06-10T13:34:28.250' AS DateTime), 0, 0, 1, N'phụ kiện', N'phụ kiện', N'dan-man-hinh-ppf-kasr-full-cao-cap', N'phụ kiện', N'phụ kiện', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (16, N'Sạc Anker 1C/20W A2347', N'phụ kiện', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">Sạc
  siêu nhanh với công suất 20W trên 1 cổng Type-C, sac iPhone từ 14 đến 50% chỉ
  trong 30 phút<br>
    Thiết kế nhỏ gọn, vừa văn trong túi quần hoặc túi xách thuận tiện mang theo
  mọi lúc mọi nơi<br>
    Đảm bảo an toàn cho thiết bị khi sạc khỏi các mối lo tiềm ẩn nhờ hệ thống
  an toàn MultiProtect<br>
    Khả năng tương thích an toàn với iPhone, iPad, điện thoại Samsung và nhiều
  thiết bị USB-C khác nhau</td></tr></tbody></table>', 1, 120000, 0, N'sac-anker-1c20w-a2347.png', CAST(N'2024-06-10T13:34:57.590' AS DateTime), CAST(N'2024-06-10T13:34:57.590' AS DateTime), 0, 1, 1, N'phụ kiện', N'phụ kiện', N'sac-anker-1c20w-a2347', N'phụ kiện', N'phụ kiện', 100)
INSERT [dbo].[tb_Products] ([ProductID], [ProductName], [ShortDesc], [Desciption], [CatllD], [Price], [Discount], [Thumb], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitslnStock]) VALUES (17, N'Cáp 3 In 1 Devia Smart Series', N'phụ kiện', N'<table border="0" cellpadding="0" cellspacing="0" width="1057" style="width: 793pt;"><tbody><tr height="21" style="height:15.75pt">
  <td height="21" class="xl65" width="1057" style="height:15.75pt;width:793pt">• Công
  suất sạc 10W, phổ biến với nhiều thiết bị hiện nay<br>
    • Tiết kiệm tối đa thời gian sạc nhở vào thiết kế 3 trong 1<br>
    - Bộ 3 đầu sạc Lightning, Type-C và Micro cực kỳ tiện lợi<br>
    • Chiều dài cáp đến 1.2m dễ dàng sạc hơn khi ở xa ở điện</td></tr></tbody></table>', 1, 100000, 0, N'cap-3-in-1-devia-smart-series.png', CAST(N'2024-06-10T13:35:21.260' AS DateTime), CAST(N'2024-06-10T13:35:21.260' AS DateTime), 0, 0, 1, N'phụ kiện', N'phụ kiện', N'cap-3-in-1-devia-smart-series', N'phụ kiện', N'phụ kiện', 100)
SET IDENTITY_INSERT [dbo].[tb_Products] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_Roles] ON 

INSERT [dbo].[tb_Roles] ([RoleID], [RoleName], [Desciption]) VALUES (1, N'Admin', N'Quản Trị')
INSERT [dbo].[tb_Roles] ([RoleID], [RoleName], [Desciption]) VALUES (2, N'Staff', N'Nhân Viên ')
SET IDENTITY_INSERT [dbo].[tb_Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_TransactStatus] ON 

INSERT [dbo].[tb_TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (1, N'Chờ lấy hàng', N'Đã xác nhận và đang chuẩn bị hàng')
INSERT [dbo].[tb_TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (2, N'Chờ xác nhận', N'Đang chờ người bán xác nhận với người mua')
INSERT [dbo].[tb_TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (3, N'Đang giao', N'Đơn hàng đang được giao tới người mua')
INSERT [dbo].[tb_TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (4, N'Đã giao thành công', N'Đơn hàng giao thành công đến người mua')
INSERT [dbo].[tb_TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (5, N'Đã hủy', N'Đơn hàng đã được hủy thành công')
INSERT [dbo].[tb_TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (6, N'Trả hàng', N'Đơn hàng đã được trả thành công')
SET IDENTITY_INSERT [dbo].[tb_TransactStatus] OFF
GO
ALTER TABLE [dbo].[tb_Accounts]  WITH CHECK ADD  CONSTRAINT [FK_tb_Accounts_tb_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[tb_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[tb_Accounts] CHECK CONSTRAINT [FK_tb_Accounts_tb_Roles]
GO
ALTER TABLE [dbo].[tb_News]  WITH CHECK ADD  CONSTRAINT [FK_tb_News_tb_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[tb_Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[tb_News] CHECK CONSTRAINT [FK_tb_News_tb_Accounts]
GO
ALTER TABLE [dbo].[tb_News]  WITH CHECK ADD  CONSTRAINT [FK_tb_TinTuc_tb_Categories] FOREIGN KEY([CatlID])
REFERENCES [dbo].[tb_Categories] ([CatlID])
GO
ALTER TABLE [dbo].[tb_News] CHECK CONSTRAINT [FK_tb_TinTuc_tb_Categories]
GO
ALTER TABLE [dbo].[tb_OrderDetaills]  WITH CHECK ADD  CONSTRAINT [FK_tb_OrderDetaills_tb_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[tb_Orders] ([OrderID])
GO
ALTER TABLE [dbo].[tb_OrderDetaills] CHECK CONSTRAINT [FK_tb_OrderDetaills_tb_Orders]
GO
ALTER TABLE [dbo].[tb_Orders]  WITH CHECK ADD  CONSTRAINT [FK_tb_Orders_tb_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[tb_Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[tb_Orders] CHECK CONSTRAINT [FK_tb_Orders_tb_Customers]
GO
ALTER TABLE [dbo].[tb_Orders]  WITH CHECK ADD  CONSTRAINT [FK_tb_Orders_tb_TrangThai] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[tb_TransactStatus] ([TransactStatusID])
GO
ALTER TABLE [dbo].[tb_Orders] CHECK CONSTRAINT [FK_tb_Orders_tb_TrangThai]
GO
ALTER TABLE [dbo].[tb_Products]  WITH CHECK ADD  CONSTRAINT [FK_tb_Products_tb_Categories] FOREIGN KEY([CatllD])
REFERENCES [dbo].[tb_Categories] ([CatlID])
GO
ALTER TABLE [dbo].[tb_Products] CHECK CONSTRAINT [FK_tb_Products_tb_Categories]
GO
