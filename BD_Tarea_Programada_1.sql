USE [master]
GO
/****** Object:  Database [tarea_programada_1_db]    Script Date: 5/6/2020 00:05:51 ******/
CREATE DATABASE [tarea_programada_1_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tarea_programada_1_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.JRVSERVER\MSSQL\DATA\tarea_programada_1_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tarea_programada_1_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.JRVSERVER\MSSQL\DATA\tarea_programada_1_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tarea_programada_1_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tarea_programada_1_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tarea_programada_1_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tarea_programada_1_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tarea_programada_1_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tarea_programada_1_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tarea_programada_1_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET RECOVERY FULL 
GO
ALTER DATABASE [tarea_programada_1_db] SET  MULTI_USER 
GO
ALTER DATABASE [tarea_programada_1_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tarea_programada_1_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tarea_programada_1_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tarea_programada_1_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tarea_programada_1_db] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'tarea_programada_1_db', N'ON'
GO
ALTER DATABASE [tarea_programada_1_db] SET QUERY_STORE = OFF
GO
USE [tarea_programada_1_db]
GO
/****** Object:  Table [dbo].[Partes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](32) NOT NULL,
	[Marca] [nchar](32) NOT NULL,
	[NombreFabricante] [nchar](32) NOT NULL,
	[IdAutomovil] [int] NULL,
 CONSTRAINT [PK_Partes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](32) NOT NULL,
	[Direccion] [nchar](128) NULL,
	[Ciudad] [nchar](32) NULL,
	[NombreContacto] [nchar](32) NULL,
	[Codigo] [nchar](32) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProveedorPartes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProveedorPartes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdParte] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Precio] [decimal](9, 2) NOT NULL,
	[PorcentajeGanancia] [decimal](9, 2) NOT NULL,
	[PrecioFinal] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_ProveedorPartes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewProveedorPartes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ViewProveedorPartes]
as
select 
	Pp.Id, 
	P.Nombre ,
	P.Marca,
	Pr.Nombre as 'NombreProveedor', 
	Pp.Precio, 
	Pp.PorcentajeGanancia,
	Pp.PrecioFinal
	FROM 
		ProveedorPartes Pp, Partes P, Proveedores Pr
	WHERE 
		Pp.IdProveedor= Pr.Id AND 
		Pp.IdParte = P.Id;
			
GO
/****** Object:  Table [dbo].[Automoviles]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automoviles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Detalle] [nchar](64) NULL,
	[Anno] [nchar](4) NOT NULL,
	[NombreFabricante] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Automovil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPartes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewPartes]
AS
SELECT        P.Id, P.Nombre, P.Marca, P.NombreFabricante
FROM            dbo.Partes AS P INNER JOIN
                         dbo.Automoviles AS A ON P.IdAutomovil = A.Id
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Estado] [nchar](10) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personas](
	[Cedula] [nchar](16) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](64) NOT NULL,
	[Direccion] [nchar](128) NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteTelefonos]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteTelefonos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [nchar](12) NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_ClienteID] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPersonas]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ViewPersonas] as
SELECT        dbo.Clientes.Estado, p.Cedula, p.Nombre, p.Direccion, ct.Numero
FROM            dbo.Personas AS p INNER JOIN
                         dbo.ClienteTelefonos AS ct ON p.IdCliente = ct.IdCliente INNER JOIN
                         dbo.Clientes ON p.IdCliente = dbo.Clientes.Id AND ct.IdCliente = dbo.Clientes.Id
GO
/****** Object:  Table [dbo].[Organizaciones]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CedulaJuridica] [nchar](16) NOT NULL,
	[Direccion] [nchar](128) NOT NULL,
	[Ciudad] [nchar](32) NULL,
	[Nombre] [nchar](64) NOT NULL,
	[IdCliente] [int] NOT NULL,
 CONSTRAINT [PK_Organizaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizacionContactos]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizacionContactos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdOrganizacion] [int] NOT NULL,
	[Nombre] [nchar](64) NOT NULL,
	[Cargo] [nchar](32) NOT NULL,
 CONSTRAINT [PK_OrganizacionContactos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewOrganizaciones]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[ViewOrganizaciones] AS
SELECT        o.CedulaJuridica, o.Nombre, o.Ciudad, o.Direccion, oc.Nombre AS Nombre_Contacto, oc.Cargo AS Cargo_Contacto, dbo.ClienteTelefonos.Numero, c.Estado
FROM            dbo.Organizaciones AS o INNER JOIN
                         dbo.Clientes AS c ON o.IdCliente = c.Id INNER JOIN
                         dbo.ClienteTelefonos ON c.Id = dbo.ClienteTelefonos.IdCliente INNER JOIN
                         dbo.OrganizacionContactos AS oc ON oc.IdOrganizacion = o.Id
GO
/****** Object:  Table [dbo].[DATA_Estados_Cliente]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_Estados_Cliente](
	[estado] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATA_Fabricantes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_Fabricantes](
	[fabricante] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATA_Fabricantes_Partes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_Fabricantes_Partes](
	[fabricanteParte] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATA_Marcas_Partes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_Marcas_Partes](
	[marcaParte] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATA_Proveedores]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_Proveedores](
	[nombre] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[ciudad] [nvarchar](50) NOT NULL,
	[contacto] [nvarchar](50) NOT NULL,
	[telefono] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DATA_Tipos_Automoviles]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_Tipos_Automoviles](
	[fabricante] [nvarchar](50) NOT NULL,
	[modelo] [nvarchar](50) NOT NULL,
	[a_o] [int] NOT NULL,
	[detalle] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenDetalles](
	[Cantidad] [int] NOT NULL,
	[IdOrden] [int] NOT NULL,
	[MontoVenta] [decimal](10, 2) NOT NULL,
	[PrecioCobrado] [decimal](10, 2) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProveedorParte] [int] NULL,
 CONSTRAINT [PK_OrdenDetalles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FechaEmitida] [datetime] NOT NULL,
	[MontoVenta] [decimal](9, 2) NOT NULL,
	[MontoIva] [decimal](9, 2) NOT NULL,
	[MontoCobrado] [decimal](9, 2) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[NumeroConsecutivo] [int] NULL,
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProveedorTelefonos]    Script Date: 5/6/2020 00:05:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProveedorTelefonos](
	[Id] [int] NOT NULL,
	[Numero] [nchar](12) NOT NULL,
	[IdProveedor] [int] NOT NULL,
 CONSTRAINT [PK_ProveedorTelefonos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Automoviles] ON 

INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (1, N'5 Series long wheelbase                                         ', N'2011', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (2, N'Sports Activity Coupe                                           ', N'2015', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (3, N'Compact crossover SUV                                           ', N'2012', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (4, N'Family sedan                                                    ', N'2014', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (5, N'Small sedan                                                     ', N'2013', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (6, N'Sophisticated full-time dual-range 4WD                          ', N'2008', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (7, N'Sport coupe                                                     ', N'2010', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (8, N'Compact                                                         ', N'2007', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (9, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (10, N'Crossover                                                       ', N'2012', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (11, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (12, N'Subcompact                                                      ', N'2008', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (13, N'Full hybrid electric mid-size hatchback                         ', N'2011', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (14, N'Mid-size sedan                                                  ', N'2015', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (15, N'Compact                                                         ', N'2010', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (16, N'Compact                                                         ', N'2011', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (17, N'Hatchback                                                       ', N'2013', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (18, N'5 Series long wheelbase                                         ', N'2011', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (19, N'Sports Activity Coupe                                           ', N'2015', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (20, N'Compact crossover SUV                                           ', N'2012', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (21, N'Family sedan                                                    ', N'2014', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (22, N'Small sedan                                                     ', N'2013', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (23, N'Sophisticated full-time dual-range 4WD                          ', N'2008', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (24, N'Sport coupe                                                     ', N'2010', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (25, N'Compact                                                         ', N'2007', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (26, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (27, N'Crossover                                                       ', N'2012', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (28, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (29, N'Subcompact                                                      ', N'2008', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (30, N'Full hybrid electric mid-size hatchback                         ', N'2011', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (31, N'Mid-size sedan                                                  ', N'2015', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (32, N'Compact                                                         ', N'2010', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (33, N'Compact                                                         ', N'2011', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (34, N'Hatchback                                                       ', N'2013', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (35, N'5 Series long wheelbase                                         ', N'2011', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (36, N'Sports Activity Coupe                                           ', N'2015', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (37, N'Compact crossover SUV                                           ', N'2012', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (38, N'Family sedan                                                    ', N'2014', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (39, N'Small sedan                                                     ', N'2013', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (40, N'Sophisticated full-time dual-range 4WD                          ', N'2008', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (41, N'Sport coupe                                                     ', N'2010', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (42, N'Compact                                                         ', N'2007', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (43, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (44, N'Crossover                                                       ', N'2012', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (45, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (46, N'Subcompact                                                      ', N'2008', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (47, N'Full hybrid electric mid-size hatchback                         ', N'2011', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (48, N'Mid-size sedan                                                  ', N'2015', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (49, N'Compact                                                         ', N'2010', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (50, N'Compact                                                         ', N'2011', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (51, N'Hatchback                                                       ', N'2013', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (52, N'5 Series long wheelbase                                         ', N'2011', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (53, N'Sports Activity Coupe                                           ', N'2015', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (54, N'Compact crossover SUV                                           ', N'2012', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (55, N'Family sedan                                                    ', N'2014', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (56, N'Small sedan                                                     ', N'2013', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (57, N'Sophisticated full-time dual-range 4WD                          ', N'2008', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (58, N'Sport coupe                                                     ', N'2010', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (59, N'Compact                                                         ', N'2007', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (60, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (61, N'Crossover                                                       ', N'2012', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (62, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (63, N'Subcompact                                                      ', N'2008', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (64, N'Full hybrid electric mid-size hatchback                         ', N'2011', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (65, N'Mid-size sedan                                                  ', N'2015', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (66, N'Compact                                                         ', N'2010', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (67, N'Compact                                                         ', N'2011', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (68, N'Hatchback                                                       ', N'2013', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (69, N'5 Series long wheelbase                                         ', N'2011', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (70, N'Sports Activity Coupe                                           ', N'2015', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (71, N'Compact crossover SUV                                           ', N'2012', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (72, N'Family sedan                                                    ', N'2014', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (73, N'Small sedan                                                     ', N'2013', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (74, N'Sophisticated full-time dual-range 4WD                          ', N'2008', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (75, N'Sport coupe                                                     ', N'2010', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (76, N'Compact                                                         ', N'2007', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (77, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (78, N'Crossover                                                       ', N'2012', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (79, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (80, N'Subcompact                                                      ', N'2008', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (81, N'Full hybrid electric mid-size hatchback                         ', N'2011', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (82, N'Mid-size sedan                                                  ', N'2015', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (83, N'Compact                                                         ', N'2010', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (84, N'Compact                                                         ', N'2011', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (85, N'Hatchback                                                       ', N'2013', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (86, N'5 Series long wheelbase                                         ', N'2011', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (87, N'Sports Activity Coupe                                           ', N'2015', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (88, N'Compact crossover SUV                                           ', N'2012', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (89, N'Family sedan                                                    ', N'2014', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (90, N'Small sedan                                                     ', N'2013', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (91, N'Sophisticated full-time dual-range 4WD                          ', N'2008', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (92, N'Sport coupe                                                     ', N'2010', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (93, N'Compact                                                         ', N'2007', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (94, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (95, N'Crossover                                                       ', N'2012', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (96, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (97, N'Subcompact                                                      ', N'2008', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (98, N'Full hybrid electric mid-size hatchback                         ', N'2011', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (99, N'Mid-size sedan                                                  ', N'2015', N'Toyota    ')
GO
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (100, N'Compact                                                         ', N'2010', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (101, N'Compact                                                         ', N'2011', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (102, N'Hatchback                                                       ', N'2013', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (103, N'5 Series long wheelbase                                         ', N'2011', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (104, N'Sports Activity Coupe                                           ', N'2015', N'BMW       ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (105, N'Compact crossover SUV                                           ', N'2012', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (106, N'Family sedan                                                    ', N'2014', N'Mazda     ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (107, N'Small sedan                                                     ', N'2013', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (108, N'Sophisticated full-time dual-range 4WD                          ', N'2008', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (109, N'Sport coupe                                                     ', N'2010', N'Mitsubishi')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (110, N'Compact                                                         ', N'2007', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (111, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (112, N'Crossover                                                       ', N'2012', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (113, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (114, N'Subcompact                                                      ', N'2008', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (115, N'Full hybrid electric mid-size hatchback                         ', N'2011', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (116, N'Mid-size sedan                                                  ', N'2015', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (117, N'Compact                                                         ', N'2010', N'Toyota    ')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (118, N'Compact                                                         ', N'2011', N'Volkswagen')
INSERT [dbo].[Automoviles] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (119, N'Hatchback                                                       ', N'2013', N'Volkswagen')
SET IDENTITY_INSERT [dbo].[Automoviles] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Estado], [Id]) VALUES (N'ACTIVO    ', 1)
INSERT [dbo].[Clientes] ([Estado], [Id]) VALUES (N'ACTIVO    ', 2)
INSERT [dbo].[Clientes] ([Estado], [Id]) VALUES (N'ACTIVO    ', 3)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClienteTelefonos] ON 

INSERT [dbo].[ClienteTelefonos] ([Id], [Numero], [IdCliente]) VALUES (1, N'87829129    ', 2)
INSERT [dbo].[ClienteTelefonos] ([Id], [Numero], [IdCliente]) VALUES (2, N'89086138    ', 3)
SET IDENTITY_INSERT [dbo].[ClienteTelefonos] OFF
GO
INSERT [dbo].[DATA_Estados_Cliente] ([estado]) VALUES (N'ACTIVO')
INSERT [dbo].[DATA_Estados_Cliente] ([estado]) VALUES (N'INACTIVO')
INSERT [dbo].[DATA_Estados_Cliente] ([estado]) VALUES (N'SUSPENDIDO')
GO
INSERT [dbo].[DATA_Fabricantes] ([fabricante]) VALUES (N'Fabricantes')
INSERT [dbo].[DATA_Fabricantes] ([fabricante]) VALUES (N'Toyota')
INSERT [dbo].[DATA_Fabricantes] ([fabricante]) VALUES (N'Nissan')
INSERT [dbo].[DATA_Fabricantes] ([fabricante]) VALUES (N'BMW')
INSERT [dbo].[DATA_Fabricantes] ([fabricante]) VALUES (N'Mazda')
INSERT [dbo].[DATA_Fabricantes] ([fabricante]) VALUES (N'Volkswagen')
INSERT [dbo].[DATA_Fabricantes] ([fabricante]) VALUES (N'Mitsubishi')
GO
INSERT [dbo].[DATA_Fabricantes_Partes] ([fabricanteParte]) VALUES (N'Fabricantes de partes')
INSERT [dbo].[DATA_Fabricantes_Partes] ([fabricanteParte]) VALUES (N'International Spare Parts')
INSERT [dbo].[DATA_Fabricantes_Partes] ([fabricanteParte]) VALUES (N'Auto Spare Parts')
INSERT [dbo].[DATA_Fabricantes_Partes] ([fabricanteParte]) VALUES (N'AJS Auto Parts')
INSERT [dbo].[DATA_Fabricantes_Partes] ([fabricanteParte]) VALUES (N'Discounted Parts')
GO
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Marcas')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Delphi')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Falken')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Kelly')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Bondo')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Goyo')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Koni')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Kleber')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Fuller')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Armstrong')
INSERT [dbo].[DATA_Marcas_Partes] ([marcaParte]) VALUES (N'Walker')
GO
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Auto Repuestos Jim�nez', N'Pavas', N'San Jos�', N'Sergio Mancilla Alfonso', 65033078)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Repuestos Z��iga', N'700 m N peaje', N'Naranjo', N'Ruben Mir Mestres', 61840940)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'J y A Autopartes', N'Plaza Ferias', N'Alajuela', N'Marina Paez Melgarejo', 61219649)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Servicios Omega', N'200m S Pal�', N'Grecia', N'Felipe Escudero Andrades', 84676801)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Repuestos ABZ', N'250 O Mercado Municipal', N'Puntarenas', N'Marcos Vara Rua', 88404529)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Autopartes USA', N'300 sur parque', N'Lim�n', N'Diego Teran Quintela', 78607436)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Super Repuestos', N'150 E Plaza Santa Rosa', N'Liberia', N'Irene Carranza Pellicer', 74502614)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Megapartes Mart�nez', N'Parque Los �ngeles', N'Heredia', N'Beatriz Lucena Duque', 74039438)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'LACOR Repuestos', N'350m E Bas�lica', N'Cartago', N'Eva Palacios Alejo', 72126866)
INSERT [dbo].[DATA_Proveedores] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Autopartes Mandi', N'150m E Mall El Dorado', N'Guadalupe', N'Francisco Jose Salguero Bruno', 69495933)
GO
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'BMW', N'F18', 2011, N'5 Series long wheelbase')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'BMW', N'X6 M', 2015, N'Sports Activity Coupe')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mazda', N'CX-5', 2012, N'Compact crossover SUV')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mazda', N'Mazda 6', 2014, N'Family sedan')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mitsubishi', N'Lancer', 2013, N'Small sedan')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mitsubishi', N'Pajero', 2008, N'Sophisticated full-time dual-range 4WD')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mitsubishi', N'Eclipse', 2010, N'Sport coupe')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Nissan', N'Sentra', 2007, N'Compact')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Nissan', N'X-Trail', 2015, N'Mid-size crossover')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Nissan', N'Terrano', 2012, N'Crossover')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Nissan', N'Murano', 2015, N'Mid-size crossover')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Toyota', N'Yaris', 2008, N'Subcompact')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Toyota', N'Prius', 2011, N'Full hybrid electric mid-size hatchback')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Toyota', N'Camry', 2015, N'Mid-size sedan')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Toyota', N'Corolla', 2010, N'Compact')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Volkswagen', N'Golf', 2011, N'Compact')
INSERT [dbo].[DATA_Tipos_Automoviles] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Volkswagen', N'Fox', 2013, N'Hatchback')
GO
SET IDENTITY_INSERT [dbo].[OrdenDetalles] ON 

INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (1, 6, CAST(1122.00 AS Decimal(10, 2)), CAST(1122.00 AS Decimal(10, 2)), 2, 6)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (12, 5, CAST(1122.00 AS Decimal(10, 2)), CAST(13464.00 AS Decimal(10, 2)), 4, 6)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (3, 5, CAST(1122.00 AS Decimal(10, 2)), CAST(3366.00 AS Decimal(10, 2)), 5, 6)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (12, 8, CAST(1122.00 AS Decimal(10, 2)), CAST(13464.00 AS Decimal(10, 2)), 6, 6)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (3, 8, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 7, 12)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (12, 8, CAST(12222.00 AS Decimal(10, 2)), CAST(146664.00 AS Decimal(10, 2)), 8, 10)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (4, 8, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 9, 13)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (12, 1, CAST(10000.00 AS Decimal(10, 2)), CAST(120000.00 AS Decimal(10, 2)), 10, 5)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (12, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), 11, 12)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (12, 8, CAST(1122.00 AS Decimal(10, 2)), CAST(13464.00 AS Decimal(10, 2)), 12, 6)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (32, 5, CAST(1122.00 AS Decimal(10, 2)), CAST(35904.00 AS Decimal(10, 2)), 13, 6)
INSERT [dbo].[OrdenDetalles] ([Cantidad], [IdOrden], [MontoVenta], [PrecioCobrado], [Id], [IdProveedorParte]) VALUES (12, 7, CAST(1122.00 AS Decimal(10, 2)), CAST(13464.00 AS Decimal(10, 2)), 14, 6)
SET IDENTITY_INSERT [dbo].[OrdenDetalles] OFF
GO
SET IDENTITY_INSERT [dbo].[Ordenes] ON 

INSERT [dbo].[Ordenes] ([Id], [FechaEmitida], [MontoVenta], [MontoIva], [MontoCobrado], [IdCliente], [NumeroConsecutivo]) VALUES (1, CAST(N'2020-06-20T00:17:28.000' AS DateTime), CAST(12244.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(169368.00 AS Decimal(9, 2)), 2, 1)
INSERT [dbo].[Ordenes] ([Id], [FechaEmitida], [MontoVenta], [MontoIva], [MontoCobrado], [IdCliente], [NumeroConsecutivo]) VALUES (2, CAST(N'2020-06-14T00:22:39.000' AS DateTime), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 3, 2)
INSERT [dbo].[Ordenes] ([Id], [FechaEmitida], [MontoVenta], [MontoIva], [MontoCobrado], [IdCliente], [NumeroConsecutivo]) VALUES (3, CAST(N'2020-06-06T00:25:25.000' AS DateTime), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 3, 3)
INSERT [dbo].[Ordenes] ([Id], [FechaEmitida], [MontoVenta], [MontoIva], [MontoCobrado], [IdCliente], [NumeroConsecutivo]) VALUES (4, CAST(N'2020-06-12T10:54:35.000' AS DateTime), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 1, 4)
INSERT [dbo].[Ordenes] ([Id], [FechaEmitida], [MontoVenta], [MontoIva], [MontoCobrado], [IdCliente], [NumeroConsecutivo]) VALUES (5, CAST(N'2020-06-12T10:57:10.000' AS DateTime), CAST(27832.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(346326.00 AS Decimal(9, 2)), 1, 5)
INSERT [dbo].[Ordenes] ([Id], [FechaEmitida], [MontoVenta], [MontoIva], [MontoCobrado], [IdCliente], [NumeroConsecutivo]) VALUES (6, CAST(N'2020-06-04T10:58:49.217' AS DateTime), CAST(28954.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(347448.00 AS Decimal(9, 2)), 1, 6)
INSERT [dbo].[Ordenes] ([Id], [FechaEmitida], [MontoVenta], [MontoIva], [MontoCobrado], [IdCliente], [NumeroConsecutivo]) VALUES (7, CAST(N'2020-06-04T11:02:31.870' AS DateTime), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), 3, 7)
INSERT [dbo].[Ordenes] ([Id], [FechaEmitida], [MontoVenta], [MontoIva], [MontoCobrado], [IdCliente], [NumeroConsecutivo]) VALUES (8, CAST(N'2020-06-12T23:03:18.000' AS DateTime), CAST(25588.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(329496.00 AS Decimal(9, 2)), 3, 8)
SET IDENTITY_INSERT [dbo].[Ordenes] OFF
GO
SET IDENTITY_INSERT [dbo].[OrganizacionContactos] ON 

INSERT [dbo].[OrganizacionContactos] ([Id], [IdOrganizacion], [Nombre], [Cargo]) VALUES (1, 1, N'Horacio                                                         ', N'Rojas                           ')
SET IDENTITY_INSERT [dbo].[OrganizacionContactos] OFF
GO
SET IDENTITY_INSERT [dbo].[Organizaciones] ON 

INSERT [dbo].[Organizaciones] ([Id], [CedulaJuridica], [Direccion], [Ciudad], [Nombre], [IdCliente]) VALUES (1, N'504250370       ', N'Donde yo quiera                                                                                                                 ', N'Fortuna de Bagaces              ', N'Josue S.A.                                                      ', 2)
SET IDENTITY_INSERT [dbo].[Organizaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Partes] ON 

INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (3, N'Tanque de gasolina              ', N'Suzuki                          ', N'WorldParts                      ', 1)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (4, N'Mufla                           ', N'Oil Eyes                        ', N'PIndustry                       ', 9)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (5, N'Mufla de Acero                  ', N'AIWA                            ', N'World Car Center                ', 5)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (6, N'Retrovisor                      ', N'YamaY                           ', N'PIndustry                       ', 5)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (8, N'Bateria                         ', N'ICECUBE                         ', N'PIndustry                       ', 2)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (9, N'Bumper                          ', N'KIK                             ', N'PleasureMotor                   ', 3)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (10, N'Tapa de tanque                  ', N'KiuK                            ', N'Iowa                            ', 4)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (12, N'Valvula de Acero                ', N'Juton                           ', N'PartFactory                     ', NULL)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (13, N'Tanque de Aceite                ', N'Penzoil                         ', N'Penzoil                         ', NULL)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (14, N'Marco de Ventana                ', N'Generico                        ', N'Generico                        ', NULL)
INSERT [dbo].[Partes] ([Id], [Nombre], [Marca], [NombreFabricante], [IdAutomovil]) VALUES (15, N'Llanta                          ', N'Michellin                       ', N'Products                        ', NULL)
SET IDENTITY_INSERT [dbo].[Partes] OFF
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([Cedula], [Id], [Nombre], [Direccion], [IdCliente]) VALUES (N'504250370       ', 2, N'Josue Rojas Vega                                                ', N'Fortuna de Bagaces                                                                                                              ', 1)
INSERT [dbo].[Personas] ([Cedula], [Id], [Nombre], [Direccion], [IdCliente]) VALUES (N'502560091       ', 3, N'Roberto Rojas                                                   ', N'No hay descripcion                                                                                                              ', 3)
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (1, N'Auto Repuestos Jim�nez          ', N'Pavas                                                                                                                           ', N'San Jos�                        ', N'Sergio Mancilla Alfonso         ', N'1                               ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (2, N'Repuestos Z��iga                ', N'700 m N peaje                                                                                                                   ', N'Naranjo                         ', N'Ruben Mir Mestres               ', N'11                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (3, N'J y A Autopartes                ', N'Plaza Ferias                                                                                                                    ', N'Alajuela                        ', N'Marina Paez Melgarejo           ', N'21                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (4, N'Servicios Omega                 ', N'200m S Pal�                                                                                                                     ', N'Grecia                          ', N'Felipe Escudero Andrades        ', N'31                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (5, N'Repuestos ABZ                   ', N'250 O Mercado Municipal                                                                                                         ', N'Puntarenas                      ', N'Marcos Vara Rua                 ', N'41                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (6, N'Autopartes USA                  ', N'300 sur parque                                                                                                                  ', N'Lim�n                           ', N'Diego Teran Quintela            ', N'51                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (7, N'Super Repuestos                 ', N'150 E Plaza Santa Rosa                                                                                                          ', N'Liberia                         ', N'Irene Carranza Pellicer         ', N'61                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (8, N'Megapartes Mart�nez             ', N'Parque Los �ngeles                                                                                                              ', N'Heredia                         ', N'Beatriz Lucena Duque            ', N'71                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (9, N'LACOR Repuestos                 ', N'350m E Bas�lica                                                                                                                 ', N'Cartago                         ', N'Eva Palacios Alejo              ', N'81                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (10, N'Autopartes Mandi                ', N'150m E Mall El Dorado                                                                                                           ', N'Guadalupe                       ', N'Francisco Jose Salguero Bruno   ', N'91                              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (11, N'Auto Repuestos Jim�nez          ', N'Pavas                                                                                                                           ', N'San Jos�                        ', N'Sergio Mancilla Alfonso         ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (12, N'Repuestos Z��iga                ', N'700 m N peaje                                                                                                                   ', N'Naranjo                         ', N'Ruben Mir Mestres               ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (13, N'J y A Autopartes                ', N'Plaza Ferias                                                                                                                    ', N'Alajuela                        ', N'Marina Paez Melgarejo           ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (14, N'Servicios Omega                 ', N'200m S Pal�                                                                                                                     ', N'Grecia                          ', N'Felipe Escudero Andrades        ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (15, N'Repuestos ABZ                   ', N'250 O Mercado Municipal                                                                                                         ', N'Puntarenas                      ', N'Marcos Vara Rua                 ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (16, N'Autopartes USA                  ', N'300 sur parque                                                                                                                  ', N'Lim�n                           ', N'Diego Teran Quintela            ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (17, N'Super Repuestos                 ', N'150 E Plaza Santa Rosa                                                                                                          ', N'Liberia                         ', N'Irene Carranza Pellicer         ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (18, N'Megapartes Mart�nez             ', N'Parque Los �ngeles                                                                                                              ', N'Heredia                         ', N'Beatriz Lucena Duque            ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (19, N'LACOR Repuestos                 ', N'350m E Bas�lica                                                                                                                 ', N'Cartago                         ', N'Eva Palacios Alejo              ', NULL)
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto], [Codigo]) VALUES (20, N'Autopartes Mandi                ', N'150m E Mall El Dorado                                                                                                           ', N'Guadalupe                       ', N'Francisco Jose Salguero Bruno   ', NULL)
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[ProveedorPartes] ON 

INSERT [dbo].[ProveedorPartes] ([Id], [IdParte], [IdProveedor], [Precio], [PorcentajeGanancia], [PrecioFinal]) VALUES (5, 3, 1, CAST(10000.00 AS Decimal(9, 2)), CAST(0.50 AS Decimal(9, 2)), CAST(15000.00 AS Decimal(9, 2)))
INSERT [dbo].[ProveedorPartes] ([Id], [IdParte], [IdProveedor], [Precio], [PorcentajeGanancia], [PrecioFinal]) VALUES (6, 3, 3, CAST(1122.00 AS Decimal(9, 2)), CAST(0.70 AS Decimal(9, 2)), CAST(1129.85 AS Decimal(9, 2)))
INSERT [dbo].[ProveedorPartes] ([Id], [IdParte], [IdProveedor], [Precio], [PorcentajeGanancia], [PrecioFinal]) VALUES (10, 5, 6, CAST(12222.00 AS Decimal(9, 2)), CAST(123.00 AS Decimal(9, 2)), CAST(27255.06 AS Decimal(9, 2)))
INSERT [dbo].[ProveedorPartes] ([Id], [IdParte], [IdProveedor], [Precio], [PorcentajeGanancia], [PrecioFinal]) VALUES (11, 4, 12, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)))
INSERT [dbo].[ProveedorPartes] ([Id], [IdParte], [IdProveedor], [Precio], [PorcentajeGanancia], [PrecioFinal]) VALUES (12, 9, 6, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)))
INSERT [dbo].[ProveedorPartes] ([Id], [IdParte], [IdProveedor], [Precio], [PorcentajeGanancia], [PrecioFinal]) VALUES (13, 5, 3, CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)), CAST(0.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[ProveedorPartes] OFF
GO
ALTER TABLE [dbo].[Proveedores] ADD  CONSTRAINT [DF_Proveedores_Codigo]  DEFAULT (N'') FOR [Codigo]
GO
ALTER TABLE [dbo].[ClienteTelefonos]  WITH CHECK ADD  CONSTRAINT [FkClienteTelefonos_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[ClienteTelefonos] CHECK CONSTRAINT [FkClienteTelefonos_IdCliente]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FkDetalleOrden_IdOrden] FOREIGN KEY([IdOrden])
REFERENCES [dbo].[Ordenes] ([Id])
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FkDetalleOrden_IdOrden]
GO
ALTER TABLE [dbo].[OrdenDetalles]  WITH CHECK ADD  CONSTRAINT [FkOrdenDetalles_IdProveedorParte] FOREIGN KEY([IdProveedorParte])
REFERENCES [dbo].[ProveedorPartes] ([Id])
GO
ALTER TABLE [dbo].[OrdenDetalles] CHECK CONSTRAINT [FkOrdenDetalles_IdProveedorParte]
GO
ALTER TABLE [dbo].[Ordenes]  WITH CHECK ADD  CONSTRAINT [FkOrdenes_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Ordenes] CHECK CONSTRAINT [FkOrdenes_IdCliente]
GO
ALTER TABLE [dbo].[OrganizacionContactos]  WITH CHECK ADD  CONSTRAINT [FkContactos_IdOrganizacion] FOREIGN KEY([IdOrganizacion])
REFERENCES [dbo].[Organizaciones] ([Id])
GO
ALTER TABLE [dbo].[OrganizacionContactos] CHECK CONSTRAINT [FkContactos_IdOrganizacion]
GO
ALTER TABLE [dbo].[Organizaciones]  WITH CHECK ADD  CONSTRAINT [FkOrganizaciones_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Organizaciones] CHECK CONSTRAINT [FkOrganizaciones_IdCliente]
GO
ALTER TABLE [dbo].[Partes]  WITH CHECK ADD  CONSTRAINT [FkPartes_IdAutomovil] FOREIGN KEY([IdAutomovil])
REFERENCES [dbo].[Automoviles] ([Id])
GO
ALTER TABLE [dbo].[Partes] CHECK CONSTRAINT [FkPartes_IdAutomovil]
GO
ALTER TABLE [dbo].[Personas]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_IdCliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([Id])
GO
ALTER TABLE [dbo].[Personas] CHECK CONSTRAINT [FK_Clientes_IdCliente]
GO
ALTER TABLE [dbo].[ProveedorPartes]  WITH CHECK ADD  CONSTRAINT [FK_ProveedorPartes_IdParte] FOREIGN KEY([IdParte])
REFERENCES [dbo].[Partes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProveedorPartes] CHECK CONSTRAINT [FK_ProveedorPartes_IdParte]
GO
ALTER TABLE [dbo].[ProveedorPartes]  WITH CHECK ADD  CONSTRAINT [FK_ProveedorPartes_IdProveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([Id])
GO
ALTER TABLE [dbo].[ProveedorPartes] CHECK CONSTRAINT [FK_ProveedorPartes_IdProveedor]
GO
ALTER TABLE [dbo].[ProveedorTelefonos]  WITH CHECK ADD  CONSTRAINT [FkProveedores_IdTelefono] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedores] ([Id])
GO
ALTER TABLE [dbo].[ProveedorTelefonos] CHECK CONSTRAINT [FkProveedores_IdTelefono]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrden]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateOrden]
	@TipoCliente int,
	@CedulaCliente nchar(16), 
	@FechaEmitida datetime = N'',
	@MontoVenta decimal(9,2) = 0,
	@MontoIva decimal(9,2) = 0,
	@MontoCobrado decimal (9,2) = 0,
	@RespuestaOperacion int OUTPUT
AS
BEGIN
	/*
		POSIBLES RESPUESTAS
		0  = caso exitoso
		-1 = cliente no existente
		-2 = fecha invalida
	*/

	SET @RespuestaOperacion = 0;

	-- obtenemos el id cliente

	DECLARE @IdCliente int;
	SET @IdCliente = 0;

	IF (@TipoCliente = 0)
	BEGIN
		IF NOT EXISTS (
			SELECT P.Id
			FROM Personas as P 
			WHERE P.Cedula = @CedulaCliente
		)
			BEGIN
				SET @RespuestaOperacion = -1;
			END
		ELSE
		BEGIN
			SET @IdCliente = (
				SELECT P.IdCliente
				FROM Personas as P 
				WHERE P.Cedula = @CedulaCliente
			);
		END
	END
	ELSE 
	BEGIN 
		IF NOT EXISTS (
			SELECT O.Id
			FROM Organizaciones as O
			WHERE O.CedulaJuridica = @CedulaCliente
		)
			BEGIN
				SET @RespuestaOperacion = -1;
			END
		ELSE
		BEGIN
			SET @IdCliente = (
				SELECT o.IdCliente
				FROM Organizaciones as o
				WHERE o.CedulaJuridica = @CedulaCliente
			);
		END
	END

	IF (@FechaEmitida = N'')
	BEGIN
		SET @RespuestaOperacion = -2;
	END

	-- procedemos a agregar la nueva orden
	IF (@RespuestaOperacion = 0 AND @IdCliente != 0)
	BEGIN
		
		declare @consecutivo int;
		set @consecutivo = IsNull((Select MAX(O.NumeroConsecutivo) FROM Ordenes O),0) + 1;

		INSERT 
		INTO Ordenes(
			FechaEmitida, 
			MontoVenta, 
			MontoIva, 
			MontoCobrado,
			IdCliente, NumeroConsecutivo)
		VALUES (
			@FechaEmitida, 
			@MontoVenta,
			@MontoIva,
			@MontoCobrado,
			@IdCliente,
			@consecutivo
		);

		SET @RespuestaOperacion = @@IDENTITY;

	END

	SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateOrdenDetalle]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Asociar a una orden la compra 
-- de una cantidad de partes obtenidas 
-- de cierto proveedor.

CREATE PROCEDURE [dbo].[CreateOrdenDetalle]
	@IdOrden int, 
	@IdProveedorParte int,
	@Cantidad int, 
	@MontoVenta decimal(9,2),
	@PrecioCobrado decimal(9,2),
	@RespuestaOperacion int OUTPUT
AS
BEGIN
	
	/*
		POSIBLES RESPUESTAS:
		0  = caso exitoso
		-1 = orden no existente, 
		-2 = proveedor no existente
	*/
	SET @RespuestaOperacion = 0;

	IF NOT EXISTS 
		(SELECT O.Id FROM Ordenes O WHERE O.Id = @IdOrden)
	BEGIN
		SET @RespuestaOperacion = -1;
	END
	ELSE IF NOT EXISTS 
		(SELECT Pp.Id FROM ProveedorPartes Pp WHERE Pp.Id = @IdProveedorParte)
	BEGIN
		SET @RespuestaOperacion = -2;
	END
	ELSE
	BEGIN 
		
		INSERT INTO OrdenDetalles(
			IdOrden, 
			IdProveedorParte,
			Cantidad,
			PrecioCobrado,
			MontoVenta
		) VALUES (
			@IdOrden,
			@IdProveedorParte,
			@Cantidad,
			@PrecioCobrado,
			@MontoVenta
		);
		
	END

	SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateOrganizacion]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateOrganizacion]
	-- Add the parameters for the stored procedure here
	@CedulaJuridica nchar(32),
	@Nombre nchar(128),
	@Direccion nchar(256),
	@Ciudad nchar(64),
	@Numero nchar(24),
	@NombreContacto nchar(128),
	@CargoContacto nchar(64),
	@Estado nchar(10),
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
/*INSERT INTO Clientes(Estado)
VALUES ('ACTIVO')

INSERT INTO Organizaciones(IdCliente,CedulaJuridica,Ciudad,Direccion,Nombre)
VALUES (IDENT_CURRENT('Clientes'), '3002078494', 'Matina','2km este, 1km sur, Finca Probana','ASEPROBA')

INSERT INTO OrganizacionContactos(IdOrganizacion,Nombre,Cargo)
VALUES(IDENT_CURRENT('Organizaciones'),'Yessenia CE', 'Oficinista')*/
	/*
	Insertar nuevas personas 
	(además de los datos de la persona, se 
	incluye el numero del telefono)
	*/

	/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = cedulaJuridica invalida
	-2 = nombre invalida
	-3 = Direccion invalido
	-4 = Ciudad  invalida
	-5 = Numero invalido
	-6 = NombreContacto invalido
	-7 = Cargo de Contacto invalido
	-8 = Estado invalido
	-9 = Organizacion ya existe
	*/

	SET @RespuestaOperacion = 0;

	-- validaciones de parametros
	IF (@CedulaJuridica = '')
	BEGIN
		SET @RespuestaOperacion = -1;
	END

	IF (@Nombre = '')
	BEGIN
		SET @RespuestaOperacion = -2;
	END

	IF (@Direccion = '')
	BEGIN
		SET @RespuestaOperacion = -3;
	END

	IF(@Ciudad = '')
	BEGIN
		SET @RespuestaOperacion = -4
	END

	IF (@Numero = '')
	BEGIN
		SET @RespuestaOperacion = -5;
	END

	IF(@NombreContacto = '')
	BEGIN
		SET @RespuestaOperacion = -6
	END

	IF(@CargoContacto = '')
	BEGIN
		SET @RespuestaOperacion = -7
	END

	IF NOT(@Estado = 'ACTIVO' or @Estado = 'INACTIVO' or @Estado = 'SUSPENDIDO')
	BEGIN
		SET @RespuestaOperacion = -8;
	END

	IF EXISTS (
		SELECT org.CedulaJuridica, org.Nombre, org.Direccion, org.Ciudad
		FROM Organizaciones org
		WHERE org.CedulaJuridica=@CedulaJuridica and  org.Nombre=@Nombre and 
		org.Direccion=@Direccion and org.Ciudad=@Ciudad
	)
		BEGIN
			SET @RespuestaOperacion = -9;
		END
	ELSE
		BEGIN
		INSERT INTO Clientes(Estado) VALUES(@Estado)

		INSERT INTO Organizaciones(
			IdCliente, CedulaJuridica, Nombre, Direccion, Ciudad
		) VALUES(
			IDENT_CURRENT('Clientes'), @CedulaJuridica, @Nombre, @Direccion, @Ciudad
		);
		INSERT INTO OrganizacionContactos(IdOrganizacion, Nombre, Cargo)
		VALUES (IDENT_CURRENT('Organizaciones'), @NombreContacto, @CargoContacto);

		INSERT INTO ClienteTelefonos(IdCliente, Numero)
		VALUES (IDENT_CURRENT('Clientes'), @Numero)

		END
	SELECT @RespuestaOperacion
END
GO
/****** Object:  StoredProcedure [dbo].[CreateParte]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateParte]
	@Nombre nchar(32) = '',
	@Marca nchar(32) = '',
	@NombreFabricante nchar(32) = '',
	@IdAutomovil int = 0,
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
	
	/*
	Insertar nuevas partes 
	(además de los datos de parte, se 
	incluye la marca y el fabricante, 
	pero no proveedores)
	*/

	/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = nombre invalido
	-2 = marca invalida
	-3 = nombreFabricante invalido
	-4 = automovil no existente
	*/

	SET @RespuestaOperacion = 0;

	-- validaciones de parametros
	IF (@Nombre = '')
	BEGIN
		SET @RespuestaOperacion = -1;
	END

	IF (@Marca = '')
	BEGIN
		SET @RespuestaOperacion = -2;
	END

	IF (@NombreFabricante = '')
	BEGIN
		SET @RespuestaOperacion = -3;
	END

	IF (@IdAutomovil != 0)
		BEGIN
		IF NOT EXISTS (
			SELECT A.Id FROM Automovil A WHERE A.Id = @IdAutomovil
		)
			BEGIN
				SET @RespuestaOperacion = -4;
			END
		END

	IF (@RespuestaOperacion = 0)
		BEGIN
		
		IF (@IdAutomovil != 0)
			INSERT INTO Partes(
				Nombre, Marca, NombreFabricante, IdAutomovil
			) VALUES(
				@Nombre, @Marca, @NombreFabricante, @IdAutomovil
			);
		ELSE
			INSERT INTO Partes(
				Nombre, Marca, NombreFabricante, IdAutomovil
			) VALUES(
				@Nombre, @Marca, @NombreFabricante, Null
			);

		END

	SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[CreatePersona]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreatePersona]
	-- Add the parameters for the stored procedure here
	@Cedula nchar(32),
	@Nombre nchar(128),
	@Direccion nchar(256),
	@Numero nchar(24),
	@Estado nchar(10),
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
/*SELECT IDENT_CURRENT('Clientes')

Insert  INTO Personas(IdCliente, Cedula, Direccion, Nombre)
VALUES( IDENT_CURRENT('Clientes'), '702820758', 'Bataan, Matina, Limon', 'Andrew J Gutierrez Castro')

INSERT INTO ClienteTelefonos(IdCliente, Numero)
VALUES (IDENT_CURRENT('Clientes'), '84423996')*/
	/*
	Insertar nuevas personas 
	(además de los datos de la persona, se 
	incluye el numero del telefono)
	*/

	/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = cedula invalida
	-2 = nombre invalida
	-3 = Direccion invalido
	-4 = Numero no invalido
	-5 = Estado invalido
	-6 = Persona ya existe
	*/

	SET @RespuestaOperacion = 0;

	-- validaciones de parametros
	IF (@Cedula = '')
	BEGIN
		SET @RespuestaOperacion = -1;
	END

	IF (@Nombre = '')
	BEGIN
		SET @RespuestaOperacion = -2;
	END

	IF (@Direccion = '')
	BEGIN
		SET @RespuestaOperacion = -3;
	END

	IF (@Numero = '')
	BEGIN
		SET @RespuestaOperacion = -4;
	END

	IF NOT(@Estado = 'ACTIVO' or @Estado = 'INACTIVO' or @Estado = 'SUSPENDIDO')
	BEGIN
		SET @RespuestaOperacion = -5;
	END

	IF EXISTS (
		SELECT p.Cedula, p.Nombre, p.Direccion
		FROM Personas p 
		WHERE p.Cedula=@Cedula and p.Nombre=@Nombre and p.Direccion=@Direccion
	)
		BEGIN
			SET @RespuestaOperacion = -6;
		END
	ELSE
		BEGIN
		INSERT INTO Clientes(Estado) VALUES(@Estado)

		INSERT INTO Personas(
			IdCliente, Cedula, Nombre, Direccion
		) VALUES(
			IDENT_CURRENT('Clientes'), @Cedula, @Nombre, @Direccion
		);
		INSERT INTO ClienteTelefonos(IdCliente, Numero)
		VALUES (IDENT_CURRENT('Clientes'), @Numero)

		END
	SELECT @RespuestaOperacion
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteParte]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteParte]
	@IdParte int = 0,
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
/*
	Borrar una parte 
	(no borrar si participa en una orden)
*/
 
/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = parte no existente
	-2 = participa en una orden
*/

SET @RespuestaOperacion = 0;

-- validacion de parte existente
IF NOT EXISTS ( SELECT P.Id FROM Partes P WHERE P.Id = @IdParte)
BEGIN
	SET @RespuestaOperacion = -1;
END
ELSE
	BEGIN
	IF NOT EXISTS ( 
		SELECT P.Id 
		FROM Partes P, ProveedorPartes Pp, OrdenDetalles Od
		WHERE P.Id = Pp.IdParte AND Pp.Id = Od.IdProveedorParte
		)
	BEGIN
		DELETE FROM Partes 
			WHERE Partes.Id = @IdParte;
	END
	ELSE 
	BEGIN
		SET @RespuestaOperacion = -2;
	END
END

SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[LinkParteProveedor]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LinkParteProveedor]
	@IdParte int,
	@IdProveedor int, 
	@Precio decimal(9,2),
	@PorcentajeGanancia decimal(9,2),
	@PrecioFinal decimal(9,2),
	@RespuestaOperacion int OUTPUT
AS
BEGIN
/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = parte no existente
	-2 = proveedor no existente
	-3 = parte y proveedor no existente
*/

SET @RespuestaOperacion = 0;
DECLARE @Bandera int = 0;

-- validacion de parte existente
IF NOT EXISTS ( SELECT P.Id FROM Partes P WHERE P.Id = @IdParte)
BEGIN
	SET @RespuestaOperacion = -1;
	SET @Bandera = 1;
END

IF NOT EXISTS ( SELECT P.Id FROM Proveedores P WHERE P.Id = @IdProveedor) 
BEGIN
	IF (@Bandera = 1)
	BEGIN
		SET @RespuestaOperacion = -3;
	END
	ELSE
	BEGIN
		SET @RespuestaOperacion = -2;
	END
END

IF (@RespuestaOperacion = 0) 
BEGIN
	
	INSERT INTO ProveedorPartes(
		IdParte,
		IdProveedor, 
		Precio,
		PorcentajeGanancia,
		PrecioFinal)
	VALUES (
		@IdParte, 
		@IdProveedor,
		@Precio,
		@PorcentajeGanancia,
		@PrecioFinal
	)
END

SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[LinkParteTipoAutomovil]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LinkParteTipoAutomovil]
	@IdParte int,
	@IdAutomovil int, 
	@RespuestaOperacion int OUTPUT
AS
BEGIN
/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = parte no existente
	-2 = automovil no existente
	-3 = parte y automovil no existente
*/

SET @RespuestaOperacion = 0;
DECLARE @Bandera int = 0;

-- validacion de parte existente
IF NOT EXISTS ( SELECT P.Id FROM Partes P WHERE P.Id = @IdParte)
BEGIN
	SET @RespuestaOperacion = -1;
	SET @Bandera = 1;
END

IF NOT EXISTS ( SELECT A.Id FROM Automovil A WHERE A.Id = @IdAutomovil) 
BEGIN
	IF (@Bandera = 1)
	BEGIN
		SET @RespuestaOperacion = -3;
	END
	ELSE
	BEGIN
		SET @RespuestaOperacion = -2;
	END
END

IF (@RespuestaOperacion = 0) 
BEGIN
	UPDATE Partes SET IdAutomovil = @IdAutomovil WHERE Partes.Id = @IdParte;
END

SELECT @RespuestaOperacion;
END

GO
/****** Object:  StoredProcedure [dbo].[Read_Fabricantes_Data]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Read_Fabricantes_Data]
AS
BEGIN

SELECT * from DATA_FABRICANTES;
END
GO
/****** Object:  StoredProcedure [dbo].[Read_FabricantesPartes_Data]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Read_FabricantesPartes_Data]
AS
BEGIN

SELECT * from DATA_FABRICANTES_Partes;
END
GO
/****** Object:  StoredProcedure [dbo].[Read_MarcasPartes_Data]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Read_MarcasPartes_Data]
AS
BEGIN

SELECT * from DATA_MARCAS_PARTES;
END
GO
/****** Object:  StoredProcedure [dbo].[Read_Proveedores_Data]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Read_Proveedores_Data]
AS
BEGIN

SELECT * from DATA_PROVEEDORES;
END
GO
/****** Object:  StoredProcedure [dbo].[Read_TiposAutomoviles_Data]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Read_TiposAutomoviles_Data]
AS
BEGIN

SELECT * from Data_Tipos_Automoviles;
END
GO
/****** Object:  StoredProcedure [dbo].[ReadAutomoviles]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ReadAutomoviles]
as
begin
	
	select * from Automoviles;

end

GO
/****** Object:  StoredProcedure [dbo].[ReadOrdenes]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[ReadOrdenes] 
	@TipoCliente int
AS
BEGIN
	
	IF (@TipoCliente = 1)
		SELECT 
			O.Id, 
			O.NumeroConsecutivo, 
			O.FechaEmitida,
			P.Cedula, N'' as 'Cedula',
			P.Nombre, N'' as 'Nombre', 
			O.MontoVenta, 
			O.MontoIva, 
			O.MontoCobrado
		FROM 
			Ordenes O, Clientes C, Personas P
		WHERE 
			P.IdCliente = O.IdCliente AND C.Id = P.IdCliente;
	ELSE 

		SELECT 
			O.Id, 
			O.NumeroConsecutivo, 
			O.FechaEmitida,
			Org.CedulaJuridica, N'' as 'Cedula',
			Org.Nombre, N'' as 'Nombre', 
			O.MontoVenta, 
			O.MontoIva, 
			O.MontoCobrado
		FROM 
			Ordenes O, Organizaciones Org, Clientes C
		WHERE 
			Org.IdCliente = O.IdCliente AND O.IdCliente = C.Id;

END
GO
/****** Object:  StoredProcedure [dbo].[ReadPartes]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ReadPartes]
as
begin
	SELECT P.Id, P.Nombre, P.Marca, P.NombreFabricante
	from Partes P;
end
GO
/****** Object:  StoredProcedure [dbo].[ReadPartesPorAutomovil]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReadPartesPorAutomovil]
	-- Add the parameters for the stored procedure here
	@Modelo nchar(64) = '', 
	@Anno nchar(4) = '',
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
	
-- Listar partes por tipos de automóviles: 
-- dado modelo y año de manufactura, obtener los datos de
-- las partes que corresponden.

	/*
		POSIBLES RESPUESTAS
		0  = caso exitoso
		-1 = modelo invalido,
		-2 = anno invalido
	*/
	SET @RespuestaOperacion = 0;

	IF (@Modelo = N'')
	BEGIN 
		RETURN -1;
	END
	ELSE IF (@Anno = N'')
	BEGIN 
		SET @RespuestaOperacion = -2;
	END

	IF (@RespuestaOperacion = 0)
	BEGIN
		SELECT P.Nombre as NombreParte, P.Marca, P.NombreFabricante as NombreFabricanteParte, A.NombreFabricante, Pro.Nombre as NombreProveedor
		FROM Partes as P, Automoviles as A, ProveedorPartes as ProP, Proveedores as Pro
		WHERE 
			A.Id = P.IdAutomovil AND
			Pro.Id = ProP.IdProveedor AND
			ProP.IdParte = P.Id AND
			A.Detalle = @Modelo AND
			A.Anno = @Anno;
	END

	SELECT @RespuestaOperacion
END
GO
/****** Object:  StoredProcedure [dbo].[ReadProveedores]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[ReadProveedores]
as begin

	select P.Id, P.Codigo, P.Nombre
	from Proveedores as P;


end
GO
/****** Object:  StoredProcedure [dbo].[ReadProveedoresPartes]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ReadProveedoresPartes]
as begin

	select * from ViewProveedorPartes;

end
GO
/****** Object:  StoredProcedure [dbo].[ReadProveedoresPorParte]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReadProveedoresPorParte]
@NombreParte nchar(32),
@RespuestaOperacion int OUTPUT
AS
BEGIN
	/*
		POSIBLES RESPUESTAS
		0  =  caso exitoso
		-1 = parte no existente
	*/

	SET @RespuestaOperacion = 0;
	IF NOT EXISTS ( SELECT P.Nombre FROM Partes as P WHERE
				P.Nombre = @NombreParte )
		BEGIN
			SET @RespuestaOperacion = -1;
		END
	ELSE
		BEGIN
			SELECT P.Nombre as 'Nombre', P.Codigo as 'Codigo'
			FROM Proveedores P, ProveedorPartes Pp, Partes pa
			WHERE Pp.IdProveedor = P.Id AND Pa.Nombre = @NombreParte and
			PA.Id = pp.IdParte
		END

	SELECT @RespuestaOperacion
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEstadoCliente]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateEstadoCliente] 

	@Cedula nchar(16), --Puede ser juridica o cedula de persona fisica/
	@Estado nchar(10),
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
	/*
	Cambiar el estado de un cliente ya existente
	*/

	/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = Estado invalido
	-2 = cedula incorrecta o no existe
	*/
	DECLARE @idCliente as int;
	SET @idCliente = 0;
	SET @RespuestaOperacion = 0;
	--Validaciones de parametros--

	IF NOT(@Estado = 'ACTIVO' or @Estado = 'INACTIVO' or @Estado = 'SUSPENDIDO')
	BEGIN
		SET @RespuestaOperacion = -1;
	END
	IF EXISTS(
		Select IdCliente FROM Organizaciones as o WHERE o.CedulaJuridica = @Cedula)
	BEGIN
		SET @idCliente = (Select IdCliente FROM Organizaciones as o WHERE o.CedulaJuridica = @Cedula);
	END
	ELSE IF EXISTS(
		Select IdCliente FROM Personas as p WHERE p.Cedula = @Cedula)
	BEGIN
		SET @idCliente = (Select IdCliente FROM Personas as p WHERE p.Cedula = @Cedula);
	END
	ELSE
	BEGIN
		SET @RespuestaOperacion = -2
	END

	IF EXISTS(Select Id FROM Clientes as c WHERE c.Id = @idCliente and @RespuestaOperacion = 0)
		BEGIN
			UPDATE Clientes
			SET Estado = @Estado
			WHERE Id = @idCliente
		END
	SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEstadoOrganizacion]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateEstadoOrganizacion]

	@Cedula nchar(16), 
	@Estado nchar(10),
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
	/*
	Cambiar el estado de un cliente ya existente
	*/

	/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = Estado invalido
	-2 = cedula incorrecta o no existe
	*/
	DECLARE @idCliente as int;
	SET @idCliente = 0;
	SET @RespuestaOperacion = 0;
	--Validaciones de parametros--

	IF NOT(@Estado = 'ACTIVO' or @Estado = 'INACTIVO' or @Estado = 'SUSPENDIDO')
	BEGIN
		SET @RespuestaOperacion = -1;
	END
	IF EXISTS(
		Select IdCliente FROM Organizaciones as o WHERE o.CedulaJuridica = @Cedula)
	BEGIN
		SET @idCliente = (Select IdCliente FROM Organizaciones as o WHERE o.CedulaJuridica = @Cedula);
	END
	ELSE
	BEGIN
		SET @RespuestaOperacion = -2
	END

	IF EXISTS(Select Id FROM Clientes as c WHERE c.Id = @idCliente and @RespuestaOperacion = 0)
		BEGIN
			UPDATE Clientes
			SET Estado = @Estado
			WHERE Id = @idCliente
		END
	SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEstadoPersona]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UpdateEstadoPersona] 

	@Cedula nchar(16), --Puede ser juridica o cedula de persona fisica/
	@Estado nchar(10),
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
	/*
	Cambiar el estado de un cliente ya existente
	*/

	/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = Estado invalido
	-2 = cedula incorrecta o no existe
	*/
	DECLARE @idCliente as int;
	SET @idCliente = 0;
	SET @RespuestaOperacion = 0;
	--Validaciones de parametros--

	IF NOT(@Estado = 'ACTIVO' or @Estado = 'INACTIVO' or @Estado = 'SUSPENDIDO')
	BEGIN
		SET @RespuestaOperacion = -1;
	END
	IF EXISTS(
		Select IdCliente FROM Personas as p WHERE p.Cedula = @Cedula)
	BEGIN
		SET @idCliente = (Select IdCliente FROM Personas as p WHERE p.Cedula = @Cedula);
	END
	ELSE
	BEGIN
		SET @RespuestaOperacion = -2
	END

	IF EXISTS(Select Id FROM Clientes as c WHERE c.Id = @idCliente and @RespuestaOperacion = 0)
		BEGIN
			UPDATE Clientes
			SET Estado = @Estado
			WHERE Id = @idCliente
		END
	SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrdenMontoIva]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateOrdenMontoIva]
	@IdOrden int,
	@MontoIva decimal,
	@ResultadoOperacion int OUTPUT
AS
begin 

	SET @ResultadoOperacion = 0;

	/*
		POSIBLES RESPUESTAS
		0  = caso exitoso
		-1 = Orden no existente
	*/

	IF NOT EXISTS (
		SELECT O.Id FROM Ordenes O where O.Id = @IdOrden
	)
	BEGIN

		SET @ResultadoOperacion = -1;

	END
	ELSE
	BEGIN
		
		UPDATE Ordenes 
		SET MontoIva = @MontoIva
		WHERE Id = @IdOrden;

	END

	SELECT @ResultadoOperacion;
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganizacion]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateOrganizacion]
	@CedulaJuridica nchar(32),
	@Nombre nchar(128),
	@Direccion nchar(256),
	@Ciudad nchar(64),
	@Numero nchar(24),
	@NombreContacto nchar(128),
	@CargoContacto nchar(64),
	@Estado nchar(10),
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN

	/*
	Modificar una organizacion, todos sus atributos
	*/

	/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = Organizacion no existe
	*/
	SET @RespuestaOperacion = 0;

	-- validaciones de parametros
	IF NOT EXISTS (
		SELECT c.Id 
		FROM Clientes c
		WHERE c.Id = (Select Id FROM Organizaciones as o WHERE o.CedulaJuridica = @CedulaJuridica)
	)
		BEGIN
			SET @RespuestaOperacion = -1;
		END

	ELSE
	BEGIN
		IF NOT(@Nombre = '')
		BEGIN
			UPDATE Organizaciones
			SET Nombre = @Nombre
			WHERE IdCliente = (Select Id FROM Organizaciones as o WHERE o.CedulaJuridica = @CedulaJuridica)
		END

		IF NOT(@Direccion = '')
		BEGIN
			UPDATE Organizaciones
			SET Direccion = @Direccion
			WHERE IdCliente = (Select Id FROM Organizaciones as o WHERE o.CedulaJuridica = @CedulaJuridica)
		END

		IF NOT(@Ciudad = '')
		BEGIN
			UPDATE Organizaciones
			SET Ciudad = @Ciudad
			WHERE IdCliente = (Select Id FROM Organizaciones as o WHERE o.CedulaJuridica = @CedulaJuridica)
		END

		IF NOT(@Numero = '' or LEN(@Numero) < 8)
		BEGIN
			UPDATE ClienteTelefonos
			SET Numero = @Numero
			WHERE IdCliente = (Select Id FROM Organizaciones as o WHERE o.CedulaJuridica = @CedulaJuridica)
		END

		IF NOT(@NombreContacto = '')
		BEGIN
			UPDATE OrganizacionContactos
			SET Nombre = @NombreContacto
			WHERE IdOrganizacion = (Select Id FROM Organizaciones as o WHERE o.CedulaJuridica = @CedulaJuridica)
		END

		IF NOT(@CargoContacto = '')
		BEGIN
			UPDATE OrganizacionContactos
			SET Cargo = @CargoContacto
			WHERE IdOrganizacion = (Select Id FROM Organizaciones as o WHERE o.CedulaJuridica = @CedulaJuridica)
		END

		IF(@Estado = 'ACTIVO' or @Estado = 'INACTIVO' or @Estado = 'SUSPENDIDO')
		BEGIN
			UPDATE Clientes
			SET Estado = @Estado
			WHERE Id = (Select Id FROM Organizaciones as o WHERE o.CedulaJuridica = @CedulaJuridica)
		END
	END
	SELECT @RespuestaOperacion
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePersona]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdatePersona]
	@Cedula nchar(32),
	@Nombre nchar(128),
	@Direccion nchar(256),
	@Numero nchar(24),
	@Estado nchar(10),
	@RespuestaOperacion int = 0 OUTPUT
AS
BEGIN
	/*
	Modificar personas, se puede modificar todos sus
	datos excepto la llave primaria
	*/

	/*
	POSIBLES RESPUESTAS
	 0 = caso exitoso
	-1 = Persona no existe
	*/

	SET @RespuestaOperacion = 0;
	
	-- validaciones de parametros
	IF NOT EXISTS (
		SELECT c.Id 
		FROM Clientes c
		WHERE c.Id = (Select Id FROM Personas as p WHERE p.Cedula = @Cedula)
	)
		BEGIN
			SET @RespuestaOperacion = -1;
		END
	ELSE
	BEGIN

		IF NOT(@Nombre = '')
		BEGIN
			UPDATE Personas
			SET Nombre = @Nombre
			WHERE IdCliente = (Select Id FROM Personas as p WHERE p.Cedula = @Cedula)
		END

		IF NOT(@Direccion = '')
		BEGIN
			UPDATE Personas
			SET Direccion = @Direccion
			WHERE IdCliente = (Select Id FROM Personas as p WHERE p.Cedula = @Cedula)
		END

		IF NOT(@Numero = '' or LEN(@Numero) < 8)
		BEGIN
			UPDATE ClienteTelefonos
			SET Numero = @Numero
			WHERE IdCliente = (Select Id FROM Personas as p WHERE p.Cedula = @Cedula)
		END

		IF (@Estado = 'ACTIVO' or @Estado = 'INACTIVO' or @Estado = 'SUSPENDIDO')
		BEGIN
			UPDATE Clientes
			SET Estado = @Estado
			WHERE Id = (Select Id FROM Personas as p WHERE p.Cedula = @Cedula)
		END

	END
	
		
	SELECT @RespuestaOperacion
END

GO
/****** Object:  StoredProcedure [dbo].[UpdatePreciosParteProveedor]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePreciosParteProveedor]
	@IdProveedorParte int,
	@Precio decimal(9,2),
	@PorcentajeGanancia decimal(9,2),
	@PrecioFinal decimal(9,2),
	@ResultadoOperacion int OUTPUT	
AS
BEGIN
	-- Actualizar precios de una parte 	-- ofrecida por un proveedor.
	SET @ResultadoOperacion = 0;
	IF EXISTS ( SELECT Pp.Id FROM ProveedorPartes Pp WHERE Pp.Id = @IdProveedorParte )
	BEGIN

		UPDATE ProveedorPartes
		SET Precio = @Precio,
			PorcentajeGanancia = @PorcentajeGanancia,
			PrecioFinal = @PrecioFinal
		WHERE Id = @IdProveedorParte;

	END
	ELSE
	BEGIN
		SET @ResultadoOperacion = -1;
	END

	SELECT @ResultadoOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[UtilCargarData]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UtilCargarData]
AS
BEGIN
	INSERT INTO Proveedores(Nombre, Direccion, Ciudad, NombreContacto)
	SELECT D.nombre, D.direccion, D.ciudad, D.contacto FROM DATA_Proveedores D;

	INSERT INTO Automoviles(Detalle, Anno, NombreFabricante)
	SELECT D.detalle, D.a_o, D.fabricante FROM Data_Tipos_Automoviles D;
END
GO
/****** Object:  Trigger [dbo].[UpdateMontos]    Script Date: 5/6/2020 00:05:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[UpdateMontos]
   ON  [dbo].[OrdenDetalles]
   AFTER INSERT
AS 
BEGIN
	
	DECLARE @PrecioCobrado decimal(9,2);
	SET @PrecioCobrado = (Select Od.PrecioCobrado FROM OrdenDetalles Od WHERE Od.Id = IDENT_CURRENT('OrdenDetalles'));
	
	DECLARE @MontoVenta decimal(9,2);
	SET @MontoVenta = (Select Od.MontoVenta FROM OrdenDetalles Od WHERE Od.Id = IDENT_CURRENT('OrdenDetalles'));

	UPDATE Ordenes SET 
	MontoCobrado= isNull(MontoCobrado, 0) + @PrecioCobrado + MontoIva,
	Ordenes.MontoVenta = isNull(Ordenes.MontoVenta, 0) + @MontoVenta
	FROM OrdenDetalles Ord
	WHERE Ord.IdOrden = IDENT_CURRENT('OrdenDetalles');

END
GO
ALTER TABLE [dbo].[OrdenDetalles] ENABLE TRIGGER [UpdateMontos]
GO
/****** Object:  Trigger [dbo].[CalcularPrecioFinal]    Script Date: 5/6/2020 00:05:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[CalcularPrecioFinal]
ON [dbo].[ProveedorPartes] 
AFTER INSERT
AS
BEGIN
	UPDATE ProveedorPartes 
	SET PrecioFinal = Precio + Precio*PorcentajeGanancia
	WHERE Id = @@IDENTITY;
END
GO
ALTER TABLE [dbo].[ProveedorPartes] ENABLE TRIGGER [CalcularPrecioFinal]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[34] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 264
               Bottom = 136
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPartes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewPartes'
GO
USE [master]
GO
ALTER DATABASE [tarea_programada_1_db] SET  READ_WRITE 
GO
