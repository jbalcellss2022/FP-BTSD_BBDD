USE [master]
GO
/****** Object:  Database [UOCFP_qrfy]    Script Date: 04/04/2024 17:22:46 ******/
CREATE DATABASE [UOCFP_qrfy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UOCFP_qrfy', FILENAME = N'/var/opt/mssql/data/UOCFP_qrfy.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UOCFP_qrfy_log', FILENAME = N'/var/opt/mssql/data/UOCFP_qrfy_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UOCFP_qrfy] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UOCFP_qrfy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UOCFP_qrfy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET ARITHABORT OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UOCFP_qrfy] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [UOCFP_qrfy] SET AUTO_UPDATE_STATISTICS OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UOCFP_qrfy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UOCFP_qrfy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UOCFP_qrfy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UOCFP_qrfy] SET  MULTI_USER 
GO
ALTER DATABASE [UOCFP_qrfy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UOCFP_qrfy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UOCFP_qrfy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UOCFP_qrfy] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UOCFP_qrfy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UOCFP_qrfy] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UOCFP_qrfy] SET QUERY_STORE = ON
GO
ALTER DATABASE [UOCFP_qrfy] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UOCFP_qrfy]
GO
/****** Object:  Table [dbo].[appLogger]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appLogger](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [uniqueidentifier] NULL,
	[message] [nvarchar](max) NULL,
	[messageType] [nvarchar](15) NULL,
	[messageDetails] [nvarchar](max) NULL,
 CONSTRAINT [PK_sysCustomLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appProducts]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appProducts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [uniqueidentifier] NULL,
	[reference] [nvarchar](35) NOT NULL,
	[description] [nvarchar](135) NULL,
	[codeId] [nvarchar](15) NOT NULL,
	[actionId] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_appProducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appUsers]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appUsers](
	[userId] [uniqueidentifier] NOT NULL,
	[login] [nvarchar](max) NULL,
	[name] [nvarchar](35) NULL,
	[surname] [nvarchar](125) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](max) NOT NULL,
	[comments] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appUsersRoles]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appUsersRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [uniqueidentifier] NOT NULL,
	[role] [nvarchar](35) NOT NULL,
 CONSTRAINT [PK_user_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[appUsersStats]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appUsersStats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [uniqueidentifier] NULL,
	[userDateTime] [datetime] NULL,
	[userIPv6] [varchar](128) NULL,
	[userIPv4] [varchar](32) NULL,
	[userData] [nvarchar](max) NULL,
 CONSTRAINT [PK_sysUserConn] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysActionTypes]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysActionTypes](
	[actionId] [nvarchar](15) NOT NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_sysActionTypes] PRIMARY KEY CLUSTERED 
(
	[actionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysCodeTypes]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysCodeTypes](
	[codeId] [nvarchar](15) NOT NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_sysCodeTypes] PRIMARY KEY CLUSTERED 
(
	[codeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysLogger]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysLogger](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Project] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[Level] [nvarchar](10) NULL,
	[Message] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
	[Logger] [nvarchar](255) NULL,
	[Url] [nvarchar](255) NULL,
 CONSTRAINT [PK__sysLogger__3214EC075E654400] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysRoles]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysRoles](
	[role] [nvarchar](35) NOT NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_sysRoles] PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysValues]    Script Date: 04/04/2024 17:22:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysValues](
	[setting] [nvarchar](35) NOT NULL,
	[value] [nvarchar](135) NULL,
	[description] [nvarchar](135) NULL,
 CONSTRAINT [PK_sysValues] PRIMARY KEY CLUSTERED 
(
	[setting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[appUsers] ADD  CONSTRAINT [DF_users_Id]  DEFAULT (newid()) FOR [userId]
GO
ALTER TABLE [dbo].[appLogger]  WITH CHECK ADD  CONSTRAINT [FK_sysCustomLog_appUsers] FOREIGN KEY([userId])
REFERENCES [dbo].[appUsers] ([userId])
GO
ALTER TABLE [dbo].[appLogger] CHECK CONSTRAINT [FK_sysCustomLog_appUsers]
GO
ALTER TABLE [dbo].[appProducts]  WITH CHECK ADD  CONSTRAINT [FK_appProducts_appUsers] FOREIGN KEY([userId])
REFERENCES [dbo].[appUsers] ([userId])
GO
ALTER TABLE [dbo].[appProducts] CHECK CONSTRAINT [FK_appProducts_appUsers]
GO
ALTER TABLE [dbo].[appProducts]  WITH CHECK ADD  CONSTRAINT [FK_appProducts_sysActionTypes] FOREIGN KEY([actionId])
REFERENCES [dbo].[sysActionTypes] ([actionId])
GO
ALTER TABLE [dbo].[appProducts] CHECK CONSTRAINT [FK_appProducts_sysActionTypes]
GO
ALTER TABLE [dbo].[appProducts]  WITH CHECK ADD  CONSTRAINT [FK_appProducts_sysCodeTypes] FOREIGN KEY([codeId])
REFERENCES [dbo].[sysCodeTypes] ([codeId])
GO
ALTER TABLE [dbo].[appProducts] CHECK CONSTRAINT [FK_appProducts_sysCodeTypes]
GO
ALTER TABLE [dbo].[appUsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_appUsersRoles_sysRoles] FOREIGN KEY([role])
REFERENCES [dbo].[sysRoles] ([role])
GO
ALTER TABLE [dbo].[appUsersRoles] CHECK CONSTRAINT [FK_appUsersRoles_sysRoles]
GO
ALTER TABLE [dbo].[appUsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_usersRoles_users] FOREIGN KEY([userId])
REFERENCES [dbo].[appUsers] ([userId])
GO
ALTER TABLE [dbo].[appUsersRoles] CHECK CONSTRAINT [FK_usersRoles_users]
GO
ALTER TABLE [dbo].[appUsersStats]  WITH CHECK ADD  CONSTRAINT [FK_sysUserConn_appUsers] FOREIGN KEY([userId])
REFERENCES [dbo].[appUsers] ([userId])
GO
ALTER TABLE [dbo].[appUsersStats] CHECK CONSTRAINT [FK_sysUserConn_appUsers]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Auto ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appLogger', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appLogger', @level2type=N'COLUMN',@level2name=N'userId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'message of the warning or error' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appLogger', @level2type=N'COLUMN',@level2name=N'message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'type of the message (Warning, Info, Debug, Error...)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appLogger', @level2type=N'COLUMN',@level2name=N'messageType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Additional info' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appLogger', @level2type=N'COLUMN',@level2name=N'messageDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Auto ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appProducts', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appProducts', @level2type=N'COLUMN',@level2name=N'userId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product reference' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appProducts', @level2type=N'COLUMN',@level2name=N'reference'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appProducts', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product CodeType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appProducts', @level2type=N'COLUMN',@level2name=N'codeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product ActionType' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appProducts', @level2type=N'COLUMN',@level2name=N'actionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Users Products table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appProducts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UUID unique User ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsers', @level2type=N'COLUMN',@level2name=N'userId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User login email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsers', @level2type=N'COLUMN',@level2name=N'login'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsers', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User surname' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsers', @level2type=N'COLUMN',@level2name=N'surname'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User phone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsers', @level2type=N'COLUMN',@level2name=N'phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'User address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsers', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Internal comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsers', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application User table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Auto ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersRoles', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersRoles', @level2type=N'COLUMN',@level2name=N'userId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Role code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersRoles', @level2type=N'COLUMN',@level2name=N'role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Applicaction Roles table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersRoles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Auto ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersStats', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UserId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersStats', @level2type=N'COLUMN',@level2name=N'userId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DateTime of the connection' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersStats', @level2type=N'COLUMN',@level2name=N'userDateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Connection IPv6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersStats', @level2type=N'COLUMN',@level2name=N'userIPv6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Connection IPv4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersStats', @level2type=N'COLUMN',@level2name=N'userIPv4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Connection Device, City, OS...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'appUsersStats', @level2type=N'COLUMN',@level2name=N'userData'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Code Type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysActionTypes', @level2type=N'COLUMN',@level2name=N'actionId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Action description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysActionTypes', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product actions types availables' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysActionTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product Code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysCodeTypes', @level2type=N'COLUMN',@level2name=N'codeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysCodeTypes', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product codes availables' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysCodeTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code of the authorization role' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysRoles', @level2type=N'COLUMN',@level2name=N'role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Role description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysRoles', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Roles available table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysRoles'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Setting Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysValues', @level2type=N'COLUMN',@level2name=N'setting'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Seeting Value' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysValues', @level2type=N'COLUMN',@level2name=N'value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Key-Value description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysValues', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Settings and Configuration values table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysValues'
GO
USE [master]
GO
ALTER DATABASE [UOCFP_qrfy] SET  READ_WRITE 
GO
