USE [master]
GO
/****** Object:  Database [ATM]    Script Date: 24/8/2020 15:12:22 ******/
CREATE DATABASE [ATM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ATM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ATM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ATM] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATM] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATM] SET RECOVERY FULL 
GO
ALTER DATABASE [ATM] SET  MULTI_USER 
GO
ALTER DATABASE [ATM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ATM', N'ON'
GO
ALTER DATABASE [ATM] SET QUERY_STORE = OFF
GO
USE [ATM]
GO
/****** Object:  Table [dbo].[Operacion]    Script Date: 24/8/2020 15:12:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operacion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cantidad] [decimal](18, 0) NULL,
	[Fecha] [datetime] NULL,
	[TipoOperacionId] [int] NULL,
	[TarjetaId] [int] NULL,
 CONSTRAINT [PK_Operacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjeta]    Script Date: 24/8/2020 15:12:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjeta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumeroTarjeta] [varchar](20) NOT NULL,
	[Estado] [bit] NULL,
	[FechaVencimiento] [datetime] NULL,
	[Pin] [varchar](10) NULL,
 CONSTRAINT [PK_Tarjeta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoOperacion]    Script Date: 24/8/2020 15:12:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoOperacion](
	[Id] [int] NOT NULL,
	[Nombre] [nvarchar](20) NULL,
 CONSTRAINT [PK_TipoOperacion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Operacion] ON 

INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (1, CAST(500 AS Decimal(18, 0)), CAST(N'2003-05-03T21:02:44.000' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (2, CAST(600 AS Decimal(18, 0)), CAST(N'2003-05-03T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (3, CAST(0 AS Decimal(18, 0)), NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (4, CAST(0 AS Decimal(18, 0)), NULL, 2, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (5, NULL, NULL, 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (6, CAST(0 AS Decimal(18, 0)), CAST(N'2020-08-24T01:05:33.893' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (7, CAST(1100 AS Decimal(18, 0)), CAST(N'2020-08-24T01:07:31.423' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (8, CAST(2200 AS Decimal(18, 0)), CAST(N'2020-08-24T01:08:13.487' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (9, CAST(5000 AS Decimal(18, 0)), CAST(N'2020-08-24T01:09:39.517' AS DateTime), 2, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (10, CAST(9400 AS Decimal(18, 0)), CAST(N'2020-08-24T01:09:58.450' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (11, CAST(18800 AS Decimal(18, 0)), CAST(N'2020-08-24T01:10:30.643' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (12, CAST(1555 AS Decimal(18, 0)), CAST(N'2020-08-24T01:10:47.817' AS DateTime), 2, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (13, CAST(39155 AS Decimal(18, 0)), CAST(N'2020-08-24T01:10:54.553' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (14, CAST(78310 AS Decimal(18, 0)), CAST(N'2020-08-24T01:12:08.827' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (15, CAST(-200 AS Decimal(18, 0)), CAST(N'2020-08-24T01:15:44.103' AS DateTime), 2, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (16, CAST(156420 AS Decimal(18, 0)), CAST(N'2020-08-24T01:15:47.047' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (17, CAST(-100000 AS Decimal(18, 0)), CAST(N'2020-08-24T01:16:22.413' AS DateTime), 2, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (18, CAST(212840 AS Decimal(18, 0)), CAST(N'2020-08-24T01:16:24.930' AS DateTime), 1, 1)
INSERT [dbo].[Operacion] ([Id], [Cantidad], [Fecha], [TipoOperacionId], [TarjetaId]) VALUES (19, CAST(-93045 AS Decimal(18, 0)), CAST(N'2020-08-24T01:19:42.653' AS DateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[Operacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarjeta] ON 

INSERT [dbo].[Tarjeta] ([Id], [NumeroTarjeta], [Estado], [FechaVencimiento], [Pin]) VALUES (1, N'1111111111111111', 1, CAST(N'2003-05-03T21:02:44.000' AS DateTime), N'1234')
SET IDENTITY_INSERT [dbo].[Tarjeta] OFF
GO
INSERT [dbo].[TipoOperacion] ([Id], [Nombre]) VALUES (1, N'Balance')
INSERT [dbo].[TipoOperacion] ([Id], [Nombre]) VALUES (2, N'Retiro')
INSERT [dbo].[TipoOperacion] ([Id], [Nombre]) VALUES (3, N'Ingreso')
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_Tarjeta] FOREIGN KEY([TarjetaId])
REFERENCES [dbo].[Tarjeta] ([Id])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_Tarjeta]
GO
ALTER TABLE [dbo].[Operacion]  WITH CHECK ADD  CONSTRAINT [FK_Operacion_TipoOperacion] FOREIGN KEY([TipoOperacionId])
REFERENCES [dbo].[TipoOperacion] ([Id])
GO
ALTER TABLE [dbo].[Operacion] CHECK CONSTRAINT [FK_Operacion_TipoOperacion]
GO
USE [master]
GO
ALTER DATABASE [ATM] SET  READ_WRITE 
GO
