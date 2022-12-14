USE [master]
GO
/****** Object:  Database [StudentManagementPortal]    Script Date: 22-08-2022 14:40:29 ******/
CREATE DATABASE [StudentManagementPortal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentManagementPortal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentManagementPortal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentManagementPortal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentManagementPortal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentManagementPortal] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentManagementPortal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentManagementPortal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentManagementPortal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentManagementPortal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentManagementPortal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentManagementPortal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentManagementPortal] SET  MULTI_USER 
GO
ALTER DATABASE [StudentManagementPortal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentManagementPortal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentManagementPortal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentManagementPortal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentManagementPortal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StudentManagementPortal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentManagementPortal', N'ON'
GO
ALTER DATABASE [StudentManagementPortal] SET QUERY_STORE = OFF
GO
USE [StudentManagementPortal]
GO
/****** Object:  Table [dbo].[Admin_Login]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_Login](
	[UserName] [nvarchar](max) NOT NULL,
	[UserPass] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[BatchId] [int] IDENTITY(1,1) NOT NULL,
	[BatchStartingDate] [datetime] NULL,
	[BatchStrength] [int] NULL,
	[CourseId] [int] NULL,
 CONSTRAINT [PK__Batch__5D55CE580229EAE8] PRIMARY KEY CLUSTERED 
(
	[BatchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](max) NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [varchar](40) NULL,
	[CourseCategory] [varchar](20) NULL,
	[CourseFees] [decimal](10, 2) NULL,
	[CourseDuration] [int] NULL,
 CONSTRAINT [PK__Course__C92D71A7947BB172] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[BatchId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[EnrollDate] [date] NULL,
	[EnrollId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__Enroll__DE799CE16EA74B72] PRIMARY KEY CLUSTERED 
(
	[EnrollId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[CityId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentInitiateModel]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentInitiateModel](
	[name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[contactNumber] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[amount] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](max) NOT NULL,
	[StudentDob] [date] NOT NULL,
	[StudentMobile] [varchar](50) NOT NULL,
	[StudentEmail] [varchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](55) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserM]    Script Date: 22-08-2022 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserM](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[EmailVerification] [bit] NULL,
	[ActivetionCode] [uniqueidentifier] NULL,
	[OldPassword] [varchar](50) NULL,
	[DecryptPassword] [nvarchar](250) NULL,
 CONSTRAINT [PK_UserM] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Batch]  WITH CHECK ADD  CONSTRAINT [FK__Batch__CourseId__29572725] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Batch] CHECK CONSTRAINT [FK__Batch__CourseId__29572725]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK__Enroll__BatchId__32E0915F] FOREIGN KEY([BatchId])
REFERENCES [dbo].[Batch] ([BatchId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK__Enroll__BatchId__32E0915F]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK__Enroll__StudentI__33D4B598] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Student] ([StudentId])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK__Enroll__StudentI__33D4B598]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_State]
GO
USE [master]
GO
ALTER DATABASE [StudentManagementPortal] SET  READ_WRITE 
GO
