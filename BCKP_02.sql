USE [tarea_programada_1_db]
GO
/****** Object:  Trigger [CalcularPrecioFinal]    Script Date: 1/6/2020 21:36:14 ******/
DROP TRIGGER [dbo].[CalcularPrecioFinal]
GO
/****** Object:  StoredProcedure [dbo].[UpdatePreciosParteProveedor]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[UpdatePreciosParteProveedor]
GO
/****** Object:  StoredProcedure [dbo].[UpdatePersona]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[UpdatePersona]
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganizacion]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[UpdateOrganizacion]
GO
/****** Object:  StoredProcedure [dbo].[ReadProveedoresPorParte]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[ReadProveedoresPorParte]
GO
/****** Object:  StoredProcedure [dbo].[ReadPartesPorAutomovil]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[ReadPartesPorAutomovil]
GO
/****** Object:  StoredProcedure [dbo].[ReadPartes]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[ReadPartes]
GO
/****** Object:  StoredProcedure [dbo].[LinkParteTipoAutomovil]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[LinkParteTipoAutomovil]
GO
/****** Object:  StoredProcedure [dbo].[LinkParteProveedor]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[LinkParteProveedor]
GO
/****** Object:  StoredProcedure [dbo].[DeleteParte]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[DeleteParte]
GO
/****** Object:  StoredProcedure [dbo].[CreatePersona]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[CreatePersona]
GO
/****** Object:  StoredProcedure [dbo].[CreateParte]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[CreateParte]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrganizacion]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[CreateOrganizacion]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrdenDetalle]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[CreateOrdenDetalle]
GO
/****** Object:  StoredProcedure [dbo].[CreateOrden]    Script Date: 1/6/2020 21:36:14 ******/
DROP PROCEDURE [dbo].[CreateOrden]
GO
ALTER TABLE [dbo].[ProveedorTelefonos] DROP CONSTRAINT [FkProveedores_IdTelefono]
GO
ALTER TABLE [dbo].[ProveedorPartes] DROP CONSTRAINT [FK_ProveedorPartes_IdProveedor]
GO
ALTER TABLE [dbo].[ProveedorPartes] DROP CONSTRAINT [FK_ProveedorPartes_IdParte]
GO
ALTER TABLE [dbo].[Personas] DROP CONSTRAINT [FK_Clientes_IdCliente]
GO
ALTER TABLE [dbo].[Partes] DROP CONSTRAINT [FkPartes_IdAutomovil]
GO
ALTER TABLE [dbo].[Organizaciones] DROP CONSTRAINT [FkOrganizaciones_IdCliente]
GO
ALTER TABLE [dbo].[OrganizacionContactos] DROP CONSTRAINT [FkContactos_IdOrganizacion]
GO
ALTER TABLE [dbo].[Ordenes] DROP CONSTRAINT [FkOrdenes_IdCliente]
GO
ALTER TABLE [dbo].[OrdenDetalles] DROP CONSTRAINT [FkOrdenDetalles_IdProveedorParte]
GO
ALTER TABLE [dbo].[OrdenDetalles] DROP CONSTRAINT [FkDetalleOrden_IdOrden]
GO
ALTER TABLE [dbo].[ClienteTelefonos] DROP CONSTRAINT [FkClienteTelefonos_IdCliente]
GO
/****** Object:  Table [dbo].[TIPOS_AUTOMOVILES]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TIPOS_AUTOMOVILES]') AND type in (N'U'))
DROP TABLE [dbo].[TIPOS_AUTOMOVILES]
GO
/****** Object:  Table [dbo].[ProveedorTelefonos]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProveedorTelefonos]') AND type in (N'U'))
DROP TABLE [dbo].[ProveedorTelefonos]
GO
/****** Object:  Table [dbo].[ProveedorPartes]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProveedorPartes]') AND type in (N'U'))
DROP TABLE [dbo].[ProveedorPartes]
GO
/****** Object:  Table [dbo].[PROVEEDORES_DATA]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROVEEDORES_DATA]') AND type in (N'U'))
DROP TABLE [dbo].[PROVEEDORES_DATA]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedores]') AND type in (N'U'))
DROP TABLE [dbo].[Proveedores]
GO
/****** Object:  Table [dbo].[Ordenes]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ordenes]') AND type in (N'U'))
DROP TABLE [dbo].[Ordenes]
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrdenDetalles]') AND type in (N'U'))
DROP TABLE [dbo].[OrdenDetalles]
GO
/****** Object:  Table [dbo].[MARCAS_PARTES]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MARCAS_PARTES]') AND type in (N'U'))
DROP TABLE [dbo].[MARCAS_PARTES]
GO
/****** Object:  Table [dbo].[FABRICANTES_PARTES]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FABRICANTES_PARTES]') AND type in (N'U'))
DROP TABLE [dbo].[FABRICANTES_PARTES]
GO
/****** Object:  Table [dbo].[FABRICANTES]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FABRICANTES]') AND type in (N'U'))
DROP TABLE [dbo].[FABRICANTES]
GO
/****** Object:  Table [dbo].[ESTADOS_CLIENTE]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ESTADOS_CLIENTE]') AND type in (N'U'))
DROP TABLE [dbo].[ESTADOS_CLIENTE]
GO
/****** Object:  View [dbo].[ViewOrganizaciones]    Script Date: 1/6/2020 21:36:14 ******/
DROP VIEW [dbo].[ViewOrganizaciones]
GO
/****** Object:  Table [dbo].[OrganizacionContactos]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrganizacionContactos]') AND type in (N'U'))
DROP TABLE [dbo].[OrganizacionContactos]
GO
/****** Object:  Table [dbo].[Organizaciones]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Organizaciones]') AND type in (N'U'))
DROP TABLE [dbo].[Organizaciones]
GO
/****** Object:  View [dbo].[ViewPersonas]    Script Date: 1/6/2020 21:36:14 ******/
DROP VIEW [dbo].[ViewPersonas]
GO
/****** Object:  Table [dbo].[ClienteTelefonos]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ClienteTelefonos]') AND type in (N'U'))
DROP TABLE [dbo].[ClienteTelefonos]
GO
/****** Object:  Table [dbo].[Personas]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Personas]') AND type in (N'U'))
DROP TABLE [dbo].[Personas]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND type in (N'U'))
DROP TABLE [dbo].[Clientes]
GO
/****** Object:  View [dbo].[ViewPartes]    Script Date: 1/6/2020 21:36:14 ******/
DROP VIEW [dbo].[ViewPartes]
GO
/****** Object:  Table [dbo].[Partes]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Partes]') AND type in (N'U'))
DROP TABLE [dbo].[Partes]
GO
/****** Object:  Table [dbo].[Automovil]    Script Date: 1/6/2020 21:36:14 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Automovil]') AND type in (N'U'))
DROP TABLE [dbo].[Automovil]
GO
USE [master]
GO
/****** Object:  Database [tarea_programada_1_db]    Script Date: 1/6/2020 21:36:14 ******/
DROP DATABASE [tarea_programada_1_db]
GO
/****** Object:  Database [tarea_programada_1_db]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[Automovil]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automovil](
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
/****** Object:  Table [dbo].[Partes]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](32) NOT NULL,
	[Marca] [nchar](32) NOT NULL,
	[NombreFabricante] [nchar](32) NOT NULL,
	[IdAutomovil] [int] NOT NULL,
 CONSTRAINT [PK_Partes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ViewPartes]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[ViewPartes] as
select P.Id, P.Nombre, P.Marca, P.NombreFabricante, A.Detalle
FROM Partes P, Automovil A where P.IdAutomovil = A.Id;
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[Personas]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[ClienteTelefonos]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  View [dbo].[ViewPersonas]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[Organizaciones]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[OrganizacionContactos]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  View [dbo].[ViewOrganizaciones]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[ESTADOS_CLIENTE]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADOS_CLIENTE](
	[Estado] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FABRICANTES]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FABRICANTES](
	[column1] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FABRICANTES_PARTES]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FABRICANTES_PARTES](
	[column1] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS_PARTES]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS_PARTES](
	[column1] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[Ordenes]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ordenes](
	[Id] [int] NOT NULL,
	[FechaEmitida] [datetime] NOT NULL,
	[MontoVenta] [decimal](9, 2) NOT NULL,
	[MontoIva] [decimal](9, 2) NOT NULL,
	[MontoCobrado] [decimal](9, 2) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[NumeroConsecutivo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Ordenes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 1/6/2020 21:36:14 ******/
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
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDORES_DATA]    Script Date: 1/6/2020 21:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDORES_DATA](
	[nombre] [nvarchar](32) NOT NULL,
	[direccion] [nvarchar](32) NOT NULL,
	[ciudad] [nvarchar](32) NOT NULL,
	[contacto] [nvarchar](32) NOT NULL,
	[telefono] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProveedorPartes]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[ProveedorTelefonos]    Script Date: 1/6/2020 21:36:14 ******/
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
/****** Object:  Table [dbo].[TIPOS_AUTOMOVILES]    Script Date: 1/6/2020 21:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPOS_AUTOMOVILES](
	[fabricante] [nvarchar](50) NOT NULL,
	[modelo] [nvarchar](50) NOT NULL,
	[a_o] [int] NOT NULL,
	[detalle] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Automovil] ON 

INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (1, N'5 Series long wheelbase                                         ', N'2011', N'BMW       ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (2, N'Sports Activity Coupe                                           ', N'2015', N'BMW       ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (3, N'Compact crossover SUV                                           ', N'2012', N'Mazda     ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (4, N'Family sedan                                                    ', N'2014', N'Mazda     ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (5, N'Small sedan                                                     ', N'2013', N'Mitsubishi')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (6, N'Sophisticated full-time dual-range 4WD                          ', N'2008', N'Mitsubishi')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (7, N'Sport coupe                                                     ', N'2010', N'Mitsubishi')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (8, N'Compact                                                         ', N'2007', N'Nissan    ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (9, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (10, N'Crossover                                                       ', N'2012', N'Nissan    ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (11, N'Mid-size crossover                                              ', N'2015', N'Nissan    ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (12, N'Subcompact                                                      ', N'2008', N'Toyota    ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (13, N'Full hybrid electric mid-size hatchback                         ', N'2011', N'Toyota    ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (14, N'Mid-size sedan                                                  ', N'2015', N'Toyota    ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (15, N'Compact                                                         ', N'2010', N'Toyota    ')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (16, N'Compact                                                         ', N'2011', N'Volkswagen')
INSERT [dbo].[Automovil] ([Id], [Detalle], [Anno], [NombreFabricante]) VALUES (17, N'Hatchback                                                       ', N'2013', N'Volkswagen')
SET IDENTITY_INSERT [dbo].[Automovil] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Estado], [Id]) VALUES (N'ACTIVO    ', 1)
INSERT [dbo].[Clientes] ([Estado], [Id]) VALUES (N'ACTIVO    ', 2)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[ClienteTelefonos] ON 

INSERT [dbo].[ClienteTelefonos] ([Id], [Numero], [IdCliente]) VALUES (1, N'87829129    ', 2)
SET IDENTITY_INSERT [dbo].[ClienteTelefonos] OFF
GO
INSERT [dbo].[ESTADOS_CLIENTE] ([Estado]) VALUES (N'ACTIVO')
INSERT [dbo].[ESTADOS_CLIENTE] ([Estado]) VALUES (N'INACTIVO')
INSERT [dbo].[ESTADOS_CLIENTE] ([Estado]) VALUES (N'SUSPENDIDO')
GO
INSERT [dbo].[FABRICANTES] ([column1]) VALUES (N'Fabricantes')
INSERT [dbo].[FABRICANTES] ([column1]) VALUES (N'Toyota')
INSERT [dbo].[FABRICANTES] ([column1]) VALUES (N'Nissan')
INSERT [dbo].[FABRICANTES] ([column1]) VALUES (N'BMW')
INSERT [dbo].[FABRICANTES] ([column1]) VALUES (N'Mazda')
INSERT [dbo].[FABRICANTES] ([column1]) VALUES (N'Volkswagen')
INSERT [dbo].[FABRICANTES] ([column1]) VALUES (N'Mitsubishi')
GO
INSERT [dbo].[FABRICANTES_PARTES] ([column1]) VALUES (N'Fabricantes de partes')
INSERT [dbo].[FABRICANTES_PARTES] ([column1]) VALUES (N'International Spare Parts')
INSERT [dbo].[FABRICANTES_PARTES] ([column1]) VALUES (N'Auto Spare Parts')
INSERT [dbo].[FABRICANTES_PARTES] ([column1]) VALUES (N'AJS Auto Parts')
INSERT [dbo].[FABRICANTES_PARTES] ([column1]) VALUES (N'Discounted Parts')
GO
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Marcas')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Delphi')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Falken')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Kelly')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Bondo')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Goyo')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Koni')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Kleber')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Fuller')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Armstrong')
INSERT [dbo].[MARCAS_PARTES] ([column1]) VALUES (N'Walker')
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
SET IDENTITY_INSERT [dbo].[Partes] OFF
GO
SET IDENTITY_INSERT [dbo].[Personas] ON 

INSERT [dbo].[Personas] ([Cedula], [Id], [Nombre], [Direccion], [IdCliente]) VALUES (N'504250370       ', 2, N'Josue Rojas Vega                                                ', N'Fortuna de Bagaces                                                                                                              ', 1)
SET IDENTITY_INSERT [dbo].[Personas] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedores] ON 

INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (1, N'Auto Repuestos Jim�nez          ', N'Pavas                                                                                                                           ', N'San Jos�                        ', N'Sergio Mancilla Alfonso         ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (2, N'Repuestos Z��iga                ', N'700 m N peaje                                                                                                                   ', N'Naranjo                         ', N'Ruben Mir Mestres               ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (3, N'J y A Autopartes                ', N'Plaza Ferias                                                                                                                    ', N'Alajuela                        ', N'Marina Paez Melgarejo           ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (4, N'Servicios Omega                 ', N'200m S Pal�                                                                                                                     ', N'Grecia                          ', N'Felipe Escudero Andrades        ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (5, N'Repuestos ABZ                   ', N'250 O Mercado Municipal                                                                                                         ', N'Puntarenas                      ', N'Marcos Vara Rua                 ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (6, N'Autopartes USA                  ', N'300 sur parque                                                                                                                  ', N'Lim�n                           ', N'Diego Teran Quintela            ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (7, N'Super Repuestos                 ', N'150 E Plaza Santa Rosa                                                                                                          ', N'Liberia                         ', N'Irene Carranza Pellicer         ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (8, N'Megapartes Mart�nez             ', N'Parque Los �ngeles                                                                                                              ', N'Heredia                         ', N'Beatriz Lucena Duque            ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (9, N'LACOR Repuestos                 ', N'350m E Bas�lica                                                                                                                 ', N'Cartago                         ', N'Eva Palacios Alejo              ')
INSERT [dbo].[Proveedores] ([Id], [Nombre], [Direccion], [Ciudad], [NombreContacto]) VALUES (10, N'Autopartes Mandi                ', N'150m E Mall El Dorado                                                                                                           ', N'Guadalupe                       ', N'Francisco Jose Salguero Bruno   ')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Auto Repuestos Jim�nez', N'Pavas', N'San Jos�', N'Sergio Mancilla Alfonso', 65033078)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Repuestos Z��iga', N'700 m N peaje', N'Naranjo', N'Ruben Mir Mestres', 61840940)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'J y A Autopartes', N'Plaza Ferias', N'Alajuela', N'Marina Paez Melgarejo', 61219649)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Servicios Omega', N'200m S Pal�', N'Grecia', N'Felipe Escudero Andrades', 84676801)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Repuestos ABZ', N'250 O Mercado Municipal', N'Puntarenas', N'Marcos Vara Rua', 88404529)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Autopartes USA', N'300 sur parque', N'Lim�n', N'Diego Teran Quintela', 78607436)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Super Repuestos', N'150 E Plaza Santa Rosa', N'Liberia', N'Irene Carranza Pellicer', 74502614)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Megapartes Mart�nez', N'Parque Los �ngeles', N'Heredia', N'Beatriz Lucena Duque', 74039438)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'LACOR Repuestos', N'350m E Bas�lica', N'Cartago', N'Eva Palacios Alejo', 72126866)
INSERT [dbo].[PROVEEDORES_DATA] ([nombre], [direccion], [ciudad], [contacto], [telefono]) VALUES (N'Autopartes Mandi', N'150m E Mall El Dorado', N'Guadalupe', N'Francisco Jose Salguero Bruno', 69495933)
GO
SET IDENTITY_INSERT [dbo].[ProveedorPartes] ON 

INSERT [dbo].[ProveedorPartes] ([Id], [IdParte], [IdProveedor], [Precio], [PorcentajeGanancia], [PrecioFinal]) VALUES (5, 3, 1, CAST(10000.00 AS Decimal(9, 2)), CAST(0.50 AS Decimal(9, 2)), CAST(15000.00 AS Decimal(9, 2)))
INSERT [dbo].[ProveedorPartes] ([Id], [IdParte], [IdProveedor], [Precio], [PorcentajeGanancia], [PrecioFinal]) VALUES (6, 3, 3, CAST(10000.00 AS Decimal(9, 2)), CAST(0.70 AS Decimal(9, 2)), CAST(17000.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[ProveedorPartes] OFF
GO
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'BMW', N'F18', 2011, N'5 Series long wheelbase')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'BMW', N'X6 M', 2015, N'Sports Activity Coupe')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mazda', N'CX-5', 2012, N'Compact crossover SUV')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mazda', N'Mazda 6', 2014, N'Family sedan')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mitsubishi', N'Lancer', 2013, N'Small sedan')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mitsubishi', N'Pajero', 2008, N'Sophisticated full-time dual-range 4WD')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Mitsubishi', N'Eclipse', 2010, N'Sport coupe')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Nissan', N'Sentra', 2007, N'Compact')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Nissan', N'X-Trail', 2015, N'Mid-size crossover')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Nissan', N'Terrano', 2012, N'Crossover')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Nissan', N'Murano', 2015, N'Mid-size crossover')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Toyota', N'Yaris', 2008, N'Subcompact')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Toyota', N'Prius', 2011, N'Full hybrid electric mid-size hatchback')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Toyota', N'Camry', 2015, N'Mid-size sedan')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Toyota', N'Corolla', 2010, N'Compact')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Volkswagen', N'Golf', 2011, N'Compact')
INSERT [dbo].[TIPOS_AUTOMOVILES] ([fabricante], [modelo], [a_o], [detalle]) VALUES (N'Volkswagen', N'Fox', 2013, N'Hatchback')
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
REFERENCES [dbo].[Automovil] ([Id])
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
/****** Object:  StoredProcedure [dbo].[CreateOrden]    Script Date: 1/6/2020 21:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Insertar una nueva orden 
-- para un cliente dado y una fecha dada

CREATE PROCEDURE [dbo].[CreateOrden]
	@TipoCliente int,
	@CedulaCliente nchar(16), 
	@FechaEmitida datetime = N'',
	@MontoVenta decimal(9,2),
	@MontoIva decimal(9,2),
	@MontoCobrado decimal (9,2),
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
				SELECT P.Id
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
				SELECT P.Id
				FROM Personas as P 
				WHERE P.Cedula = @CedulaCliente
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

		INSERT 
		INTO Ordenes(
			FechaEmitida, 
			MontoVenta, 
			MontoIva, 
			MontoCobrado,
			IdCliente)
		VALUES (
			@FechaEmitida, 
			@MontoVenta,
			@MontoIva,
			@MontoCobrado,
			@IdCliente
		);

	END

	SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[CreateOrdenDetalle]    Script Date: 1/6/2020 21:36:15 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateOrganizacion]    Script Date: 1/6/2020 21:36:15 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateParte]    Script Date: 1/6/2020 21:36:15 ******/
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

	IF NOT EXISTS (
		SELECT A.Id FROM Automovil A WHERE A.Id = @IdAutomovil
	)
		BEGIN
			SET @RespuestaOperacion = -4;
		END
	ELSE
		BEGIN
		
		INSERT INTO Partes(
			Nombre, Marca, NombreFabricante, IdAutomovil
		) VALUES(
			@Nombre, @Marca, @NombreFabricante, @IdAutomovil
		);

		END

	SELECT @RespuestaOperacion;
END
GO
/****** Object:  StoredProcedure [dbo].[CreatePersona]    Script Date: 1/6/2020 21:36:15 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteParte]    Script Date: 1/6/2020 21:36:15 ******/
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
/****** Object:  StoredProcedure [dbo].[LinkParteProveedor]    Script Date: 1/6/2020 21:36:15 ******/
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
/****** Object:  StoredProcedure [dbo].[LinkParteTipoAutomovil]    Script Date: 1/6/2020 21:36:15 ******/
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
/****** Object:  StoredProcedure [dbo].[ReadPartes]    Script Date: 1/6/2020 21:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[ReadPartes]
as
begin
	SELECT * from [dbo].ViewPartes;
end
GO
/****** Object:  StoredProcedure [dbo].[ReadPartesPorAutomovil]    Script Date: 1/6/2020 21:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ReadPartesPorAutomovil]
	@Modelo nchar(64) = N'',
	@Anno nchar(4) = N'',
	@RespuestaOperacion int OUTPUT
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
		SET @RespuestaOperacion = -1;
	END
	ELSE IF (@Anno = N'')
	BEGIN 
		SET @RespuestaOperacion = -2;
	END

	IF (@RespuestaOperacion = 0)
	BEGIN
		SELECT P.Nombre, P.Marca, P.NombreFabricante
		FROM Partes as P, Automovil as A
		WHERE 
			A.Id = P.IdAutomovil AND
			A.Detalle = @Modelo AND
			A.Anno = @Anno;
	END

	SELECT @RespuestaOperacion;
END	
GO
/****** Object:  StoredProcedure [dbo].[ReadProveedoresPorParte]    Script Date: 1/6/2020 21:36:15 ******/
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
				P.Nombre =@NombreParte )
		BEGIN
			SET @RespuestaOperacion = -1;
		END
	ELSE
		BEGIN
			SELECT P.Nombre 
			FROM Proveedores P, ProveedorPartes Pp
			WHERE Pp.IdProveedor = P.Id;
		END

	SELECT @RespuestaOperacion
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrganizacion]    Script Date: 1/6/2020 21:36:15 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePersona]    Script Date: 1/6/2020 21:36:15 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePreciosParteProveedor]    Script Date: 1/6/2020 21:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdatePreciosParteProveedor]
	@IdProveedorParte int,
	@Precio decimal(9,2),
	@PorcentajeGanancia decimal(9,2),
	@PrecioFinal decimal(9,2),
	@RespuestaOperacion int OUTPUT
AS
BEGIN
	-- Actualizar precios de una parte 	-- ofrecida por un proveedor.
	/*
		RESPUESTAS:
		 0 = caso exitoso
		-1 = parte no existe
	*/

	SET @RespuestaOperacion = 0;

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
		SET @RespuestaOperacion = -1;
	END


END
GO
/****** Object:  Trigger [dbo].[CalcularPrecioFinal]    Script Date: 1/6/2020 21:36:15 ******/
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
USE [master]
GO
ALTER DATABASE [tarea_programada_1_db] SET  READ_WRITE 
GO
