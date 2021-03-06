USE [master]
GO
/****** Object:  Database [TomaszDyskoLab5Zad1]    Script Date: 2018-05-14 01:58:01 ******/
CREATE DATABASE [TomaszDyskoLab5Zad1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TomaszDyskoLab5Zad1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.LOL\MSSQL\DATA\TomaszDyskoLab5Zad1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TomaszDyskoLab5Zad1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.LOL\MSSQL\DATA\TomaszDyskoLab5Zad1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TomaszDyskoLab5Zad1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET ARITHABORT OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET  MULTI_USER 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET DELAYED_DURABILITY = DISABLED 
GO
USE [TomaszDyskoLab5Zad1]
GO
/****** Object:  Table [dbo].[Games]    Script Date: 2018-05-14 01:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Games](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](31) NOT NULL,
	[Producer] [nvarchar](31) NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Games] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages]    Script Date: 2018-05-14 01:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 2018-05-14 01:58:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [text] NOT NULL,
	[Stars] [int] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Games] ON 

INSERT [dbo].[Games] ([Id], [Name], [Producer], [Year]) VALUES (1, N'Witcher 3', N'Cd Project', 2016)
INSERT [dbo].[Games] ([Id], [Name], [Producer], [Year]) VALUES (2, N'Alladyn', N'Disney', 1999)
SET IDENTITY_INSERT [dbo].[Games] OFF
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [Name], [Description]) VALUES (1, N'Alladyas', N'asd')
SET IDENTITY_INSERT [dbo].[Messages] OFF
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [GameId], [Title], [Description], [Stars]) VALUES (9, 1, N'Niezła', N'Całkiem fajna gra, tylko czemu ten gościu ma białe włosy?', 5)
INSERT [dbo].[Reviews] ([Id], [GameId], [Title], [Description], [Stars]) VALUES (13, 1, N'Polecam!', N'Najlepsza gra na świecie, jedyna taka, tylko Wiedźmin, I  <3 CdProjectRed', 10)
INSERT [dbo].[Reviews] ([Id], [GameId], [Title], [Description], [Stars]) VALUES (14, 2, N'Wow!', N'Nie myślałem, że latanie na dywanie jest takie przyjemne! ProTip - jak poprosisz o nieskończoność życzeń w pierwzym życzniu od Dżina to wygrałeś grę!', 9)
INSERT [dbo].[Reviews] ([Id], [GameId], [Title], [Description], [Stars]) VALUES (15, 2, N'Słaba', N'Koleś w średnich dresach z małpą ugania się za jakąś panienką...', 3)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Games] FOREIGN KEY([GameId])
REFERENCES [dbo].[Games] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Games]
GO
USE [master]
GO
ALTER DATABASE [TomaszDyskoLab5Zad1] SET  READ_WRITE 
GO
