USE [tarea_programada_1_db]
GO
/****** Object:  Table [dbo].[Automovil]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[Partes]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  View [dbo].[ViewPartes]    Script Date: 1/6/2020 21:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[ViewPartes] as
select P.Id, P.Nombre, P.Marca, P.NombreFabricante, A.Detalle
FROM Partes P, Automovil A where P.IdAutomovil = A.Id;
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[Personas]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[ClienteTelefonos]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  View [dbo].[ViewPersonas]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[Organizaciones]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[OrganizacionContactos]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  View [dbo].[ViewOrganizaciones]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[ESTADOS_CLIENTE]    Script Date: 1/6/2020 21:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADOS_CLIENTE](
	[Estado] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FABRICANTES]    Script Date: 1/6/2020 21:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FABRICANTES](
	[column1] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FABRICANTES_PARTES]    Script Date: 1/6/2020 21:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FABRICANTES_PARTES](
	[column1] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS_PARTES]    Script Date: 1/6/2020 21:16:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS_PARTES](
	[column1] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenDetalles]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[Ordenes]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[Proveedores]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[PROVEEDORES_DATA]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[ProveedorPartes]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[ProveedorTelefonos]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  Table [dbo].[TIPOS_AUTOMOVILES]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateOrden]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateOrdenDetalle]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateOrganizacion]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateParte]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[CreatePersona]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteParte]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[LinkParteProveedor]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[LinkParteTipoAutomovil]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[ReadPartes]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[ReadPartesPorAutomovil]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[ReadProveedoresPorParte]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateOrganizacion]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePersona]    Script Date: 1/6/2020 21:16:23 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePreciosParteProveedor]    Script Date: 1/6/2020 21:16:23 ******/
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
