USE [master]
GO
/****** Object:  Database [SinemaOtomasyonu1]    Script Date: 7.05.2020 12:09:48 ******/
CREATE DATABASE [SinemaOtomasyonu1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SinemaOtomasyonu1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SinemaOtomasyonu1.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SinemaOtomasyonu1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SinemaOtomasyonu1_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SinemaOtomasyonu1] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SinemaOtomasyonu1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SinemaOtomasyonu1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET  MULTI_USER 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SinemaOtomasyonu1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SinemaOtomasyonu1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SinemaOtomasyonu1]
GO
/****** Object:  Table [dbo].[Film]    Script Date: 7.05.2020 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Film](
	[FilmID] [int] IDENTITY(1,1) NOT NULL,
	[FilmAdi] [varchar](50) NULL,
	[FilmTürü] [varchar](50) NULL,
	[Yönetmen] [varchar](50) NULL,
	[Imdb] [float] NULL,
 CONSTRAINT [PK_Film_1] PRIMARY KEY CLUSTERED 
(
	[FilmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Koltuk]    Script Date: 7.05.2020 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Koltuk](
	[KoltukID] [int] IDENTITY(1,1) NOT NULL,
	[SalonID] [int] NOT NULL,
 CONSTRAINT [PK_Koltuk] PRIMARY KEY CLUSTERED 
(
	[KoltukID] ASC,
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MusteriBilet]    Script Date: 7.05.2020 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MusteriBilet](
	[BiletID] [int] IDENTITY(1,1) NOT NULL,
	[TC] [numeric](11, 0) NULL,
	[Adi] [varchar](50) NULL,
	[Soyadi] [varchar](50) NULL,
	[FilmID] [int] NULL,
	[SeansID] [int] NULL,
	[SalonID] [int] NULL,
	[KoltukID] [int] NULL,
 CONSTRAINT [PK_MusteriBilet] PRIMARY KEY CLUSTERED 
(
	[BiletID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SalonID]    Script Date: 7.05.2020 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalonID](
	[SalonID] [int] IDENTITY(1,1) NOT NULL,
	[Kapasite] [int] NOT NULL,
 CONSTRAINT [PK_SalonID] PRIMARY KEY CLUSTERED 
(
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seans]    Script Date: 7.05.2020 12:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seans](
	[SeansID] [int] IDENTITY(1,1) NOT NULL,
	[SeansSaat] [varchar](50) NULL,
	[FilmID] [int] NULL,
	[Tarih] [varchar](50) NULL,
	[SalonID] [int] NULL,
 CONSTRAINT [PK_Seans] PRIMARY KEY CLUSTERED 
(
	[SeansID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Film] ON 

INSERT [dbo].[Film] ([FilmID], [FilmAdi], [FilmTürü], [Yönetmen], [Imdb]) VALUES (16, N'Joker', N'Dram/Suç', N'Todd Phillips', 9)
INSERT [dbo].[Film] ([FilmID], [FilmAdi], [FilmTürü], [Yönetmen], [Imdb]) VALUES (20, N'Django Unchained', N'Western/Dram', N'Quentin Tarantino', 8)
INSERT [dbo].[Film] ([FilmID], [FilmAdi], [FilmTürü], [Yönetmen], [Imdb]) VALUES (21, N'Enigma', N'Savaş/Dram', N'Morten Tyldum', 8)
INSERT [dbo].[Film] ([FilmID], [FilmAdi], [FilmTürü], [Yönetmen], [Imdb]) VALUES (22, N'Seven', N'Suç/Dram', N'David Fincher', 9)
INSERT [dbo].[Film] ([FilmID], [FilmAdi], [FilmTürü], [Yönetmen], [Imdb]) VALUES (23, N'The Revenant', N'Western/Macera ', N'Alejandro González Iñárritu', 8)
SET IDENTITY_INSERT [dbo].[Film] OFF
SET IDENTITY_INSERT [dbo].[Koltuk] ON 

INSERT [dbo].[Koltuk] ([KoltukID], [SalonID]) VALUES (14, 25)
INSERT [dbo].[Koltuk] ([KoltukID], [SalonID]) VALUES (17, 25)
INSERT [dbo].[Koltuk] ([KoltukID], [SalonID]) VALUES (18, 25)
INSERT [dbo].[Koltuk] ([KoltukID], [SalonID]) VALUES (19, 25)
SET IDENTITY_INSERT [dbo].[Koltuk] OFF
SET IDENTITY_INSERT [dbo].[MusteriBilet] ON 

INSERT [dbo].[MusteriBilet] ([BiletID], [TC], [Adi], [Soyadi], [FilmID], [SeansID], [SalonID], [KoltukID]) VALUES (40, CAST(41914233726 AS Numeric(11, 0)), N'Ahmet', N'Özkan', 16, 25, 25, 14)
INSERT [dbo].[MusteriBilet] ([BiletID], [TC], [Adi], [Soyadi], [FilmID], [SeansID], [SalonID], [KoltukID]) VALUES (43, CAST(41914233726 AS Numeric(11, 0)), N'Ahmet', N'Özkan', 21, 25, 25, 17)
INSERT [dbo].[MusteriBilet] ([BiletID], [TC], [Adi], [Soyadi], [FilmID], [SeansID], [SalonID], [KoltukID]) VALUES (44, CAST(11212121212 AS Numeric(11, 0)), N'ALi', N'Candan', 16, 25, 25, 18)
SET IDENTITY_INSERT [dbo].[MusteriBilet] OFF
SET IDENTITY_INSERT [dbo].[SalonID] ON 

INSERT [dbo].[SalonID] ([SalonID], [Kapasite]) VALUES (25, 150)
INSERT [dbo].[SalonID] ([SalonID], [Kapasite]) VALUES (33, 70)
INSERT [dbo].[SalonID] ([SalonID], [Kapasite]) VALUES (36, 0)
SET IDENTITY_INSERT [dbo].[SalonID] OFF
SET IDENTITY_INSERT [dbo].[Seans] ON 

INSERT [dbo].[Seans] ([SeansID], [SeansSaat], [FilmID], [Tarih], [SalonID]) VALUES (25, N'14:00', 16, N'3 Mayıs 2020 Pazar', 25)
SET IDENTITY_INSERT [dbo].[Seans] OFF
ALTER TABLE [dbo].[Koltuk]  WITH CHECK ADD  CONSTRAINT [FK_Koltuk_SalonID] FOREIGN KEY([SalonID])
REFERENCES [dbo].[SalonID] ([SalonID])
GO
ALTER TABLE [dbo].[Koltuk] CHECK CONSTRAINT [FK_Koltuk_SalonID]
GO
ALTER TABLE [dbo].[Koltuk]  WITH CHECK ADD  CONSTRAINT [FK_Koltuk_Seans] FOREIGN KEY([SalonID])
REFERENCES [dbo].[Seans] ([SeansID])
GO
ALTER TABLE [dbo].[Koltuk] CHECK CONSTRAINT [FK_Koltuk_Seans]
GO
ALTER TABLE [dbo].[MusteriBilet]  WITH CHECK ADD  CONSTRAINT [FK_MusteriBilet_Film] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Film] ([FilmID])
GO
ALTER TABLE [dbo].[MusteriBilet] CHECK CONSTRAINT [FK_MusteriBilet_Film]
GO
ALTER TABLE [dbo].[MusteriBilet]  WITH CHECK ADD  CONSTRAINT [FK_MusteriBilet_Seans] FOREIGN KEY([SeansID])
REFERENCES [dbo].[Seans] ([SeansID])
GO
ALTER TABLE [dbo].[MusteriBilet] CHECK CONSTRAINT [FK_MusteriBilet_Seans]
GO
ALTER TABLE [dbo].[Seans]  WITH CHECK ADD  CONSTRAINT [FK_Seans_Film1] FOREIGN KEY([FilmID])
REFERENCES [dbo].[Film] ([FilmID])
GO
ALTER TABLE [dbo].[Seans] CHECK CONSTRAINT [FK_Seans_Film1]
GO
USE [master]
GO
ALTER DATABASE [SinemaOtomasyonu1] SET  READ_WRITE 
GO
