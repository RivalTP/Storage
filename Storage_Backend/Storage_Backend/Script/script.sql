USE [master]
GO
/****** Object:  Database [Storage]    Script Date: 03/12/2022 15:55 ******/
CREATE DATABASE [Storage] ON  PRIMARY 
( NAME = N'Storage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.RIVALSQLSERVER\MSSQL\DATA\Storage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Storage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.RIVALSQLSERVER\MSSQL\DATA\Storage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Storage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Storage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Storage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Storage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Storage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Storage] SET ARITHABORT OFF 
GO
ALTER DATABASE [Storage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Storage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Storage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Storage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Storage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Storage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Storage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Storage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Storage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Storage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Storage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Storage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Storage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Storage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Storage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Storage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Storage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Storage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Storage] SET  MULTI_USER 
GO
ALTER DATABASE [Storage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Storage] SET DB_CHAINING OFF 
GO
USE [Storage]
GO
/****** Object:  Table [dbo].[ms_storage_location]    Script Date: 03/12/2022 15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ms_storage_location](
	[location_id] [varchar](10) NOT NULL,
	[location_name] [varchar](100) NULL,
 CONSTRAINT [PK_ms_storage_location] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tr_bpkb]    Script Date: 03/12/2022 15:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tr_bpkb](
	[agreement_number] [varchar](100) NOT NULL,
	[bpkb_no] [varchar](100) NULL,
	[branch_id] [varchar](10) NULL,
	[bpkb_date] [datetime] NULL,
	[faktur_no] [varchar](100) NULL,
	[faktur_date] [datetime] NULL,
	[location_id] [varchar](10) NULL,
	[police_no] [varchar](20) NULL,
	[bpkb_date_on] [datetime] NULL,
 CONSTRAINT [PK_tr_bpkb] PRIMARY KEY CLUSTERED 
(
	[agreement_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ms_storage_location] ([location_id], [location_name]) VALUES (N'', N'')
INSERT [dbo].[ms_storage_location] ([location_id], [location_name]) VALUES (N'0000000001', N'Jakarta')
INSERT [dbo].[ms_storage_location] ([location_id], [location_name]) VALUES (N'0000000002', N'Bandung')
INSERT [dbo].[ms_storage_location] ([location_id], [location_name]) VALUES (N'string', N'string')
GO
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000001', N'123123', N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000002', N'123123', N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000003', N'123123', N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000004', N'asdasd', N'asdasd', CAST(N'2022-12-02T00:00:00.000' AS DateTime), N'asdasd', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000005', N'12312', N'123123', CAST(N'2022-12-02T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000006', N'123123', N'213123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000007', N'123123', N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000008', N'12312', N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-08T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000009', N'12312', N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-02T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[tr_bpkb] ([agreement_number], [bpkb_no], [branch_id], [bpkb_date], [faktur_no], [faktur_date], [location_id], [police_no], [bpkb_date_on]) VALUES (N'0000000010', N'123123', N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'123123', CAST(N'2022-12-01T00:00:00.000' AS DateTime), N'0000000001', NULL, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tr_bpkb]    Script Date: 03/12/2022 15:55 ******/
CREATE NONCLUSTERED INDEX [IX_tr_bpkb] ON [dbo].[tr_bpkb]
(
	[agreement_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ms_storage_location]  WITH NOCHECK ADD  CONSTRAINT [FK_ms_storage_location_ms_storage_location] FOREIGN KEY([location_id])
REFERENCES [dbo].[ms_storage_location] ([location_id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[ms_storage_location] NOCHECK CONSTRAINT [FK_ms_storage_location_ms_storage_location]
GO
USE [master]
GO
ALTER DATABASE [Storage] SET  READ_WRITE 
GO
