USE [master]
GO
/****** Object:  Database [TestDB]    Script Date: 09/12/2020 22:39:30 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\TestDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL2017\MSSQL\DATA\TestDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDB] SET  MULTI_USER 
GO
ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestDB] SET QUERY_STORE = OFF
GO
USE [TestDB]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[CategoriaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[DescripcionLarga] [nvarchar](250) NULL,
	[Abreviatura] [nvarchar](10) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[CategoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImagenesProductos]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenesProductos](
	[ImagenProductoId] [int] IDENTITY(1,1) NOT NULL,
	[ProductoId] [int] NOT NULL,
	[file_name] [nvarchar](max) NOT NULL,
	[file_ext] [nvarchar](max) NOT NULL,
	[file_base64] [nvarchar](max) NOT NULL,
	[description] [nvarchar](100) NULL,
	[IsPrincipal] [bit] NOT NULL,
 CONSTRAINT [PK_ImagenesProductos] PRIMARY KEY CLUSTERED 
(
	[ImagenProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medidas]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medidas](
	[MedidaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[DescripcionLarga] [nvarchar](250) NULL,
	[Codigo] [nvarchar](10) NULL,
 CONSTRAINT [PK_Medidas] PRIMARY KEY CLUSTERED 
(
	[MedidaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ProductoId] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaId] [int] NOT NULL,
	[ProveedorId] [int] NOT NULL,
	[MedidaId] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[DescripcionLarga] [nvarchar](250) NULL,
	[Codigo] [nvarchar](10) NULL,
	[Precio] [decimal](18, 2) NULL,
	[Existencia] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ProveedorId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Representante] [nvarchar](250) NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[ProveedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ImagenesProductos] ADD  DEFAULT ((0)) FOR [IsPrincipal]
GO
ALTER TABLE [dbo].[ImagenesProductos]  WITH CHECK ADD  CONSTRAINT [FK_ImagenesProductos_Productos] FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([ProductoId])
GO
ALTER TABLE [dbo].[ImagenesProductos] CHECK CONSTRAINT [FK_ImagenesProductos_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([CategoriaId])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Medidas] FOREIGN KEY([MedidaId])
REFERENCES [dbo].[Medidas] ([MedidaId])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Medidas]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Proveedores] FOREIGN KEY([ProveedorId])
REFERENCES [dbo].[Proveedores] ([ProveedorId])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Proveedores]
GO
/****** Object:  StoredProcedure [dbo].[sp_add_ImagenesProductos]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_add_ImagenesProductos]
@ProductoId INT, @file_name NVARCHAR (MAX), @file_ext NVARCHAR (MAX), @file_base64 NVARCHAR (MAX), @description NVARCHAR (100), @IsPrincipal BIT
AS
BEGIN
    INSERT  INTO dbo.ImagenesProductos (ProductoId, file_name, file_ext, file_base64, description, IsPrincipal)
    VALUES                            (@ProductoId, @file_name, @file_ext, @file_base64, @description, @IsPrincipal);
    DECLARE @ImagenProductoId AS INT;
    SELECT @ImagenProductoId = ImagenProductoId
    FROM   dbo.ImagenesProductos
    WHERE  @@ROWCOUNT > 0
           AND ImagenProductoId = SCOPE_IDENTITY();
    IF @IsPrincipal = 1
        BEGIN
            UPDATE dbo.ImagenesProductos
            SET    IsPrincipal = 0
            WHERE  ProductoId = @ProductoId
                   AND ImagenProductoId != @ImagenProductoId;
        END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_all_ImagenesProductos_by_Producto]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_all_ImagenesProductos_by_Producto]
@ProductoId INT
AS
BEGIN
    SELECT ImagenProductoId,
           ProductoId,
           file_name,
           file_ext,
           file_base64,
           description,
           IsPrincipal
    FROM   dbo.ImagenesProductos
    WHERE  ProductoId = @ProductoId;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_detalle_ImagenesProductos]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_detalle_ImagenesProductos]
@ImagenProductoId INT
AS
BEGIN
    SELECT ImagenProductoId,
           ProductoId,
           file_name,
           file_ext,
           file_base64,
           description,
           IsPrincipal
    FROM   dbo.ImagenesProductos
    WHERE  ImagenProductoId = @ImagenProductoId;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_get_principal_ImagenProducto_by_Producto]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_get_principal_ImagenProducto_by_Producto]
@ProductoId INT
AS
BEGIN
    SELECT ImagenProductoId,
           ProductoId,
           file_name,
           file_ext,
           file_base64,
           description,
           IsPrincipal
    FROM   dbo.ImagenesProductos
    WHERE  ProductoId = @ProductoId
           AND IsPrincipal = 1;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_add_categoria]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_categoria]
@Nombre NVARCHAR (100), @DescripcionLarga NVARCHAR (250), @Abreviatura NVARCHAR (10)
AS
BEGIN
    SET NOCOUNT OFF;
    INSERT  INTO dbo.Categorias (Nombre, DescripcionLarga, Abreviatura)
    VALUES                     (@Nombre, @DescripcionLarga, @Abreviatura);
    DECLARE @CategoriaId AS INT;
    SELECT @CategoriaId = CategoriaId
    FROM   dbo.Categorias
    WHERE  @@ROWCOUNT > 0
           AND CategoriaId = SCOPE_IDENTITY();
    SELECT t0.CategoriaId,
           Nombre,
           DescripcionLarga,
           Abreviatura
    FROM   dbo.Categorias AS t0
    WHERE  @@ROWCOUNT > 0
           AND t0.CategoriaId = @CategoriaId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_add_Medida]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_Medida]
@Nombre NVARCHAR (100), @DescripcionLarga NVARCHAR (250), @Codigo NVARCHAR (10)
AS
BEGIN
    SET NOCOUNT OFF;
    INSERT  INTO dbo.Medidas (Nombre, DescripcionLarga, Codigo)
    VALUES                  (@Nombre, @DescripcionLarga, @Codigo);
    DECLARE @MedidaId AS INT;
    SELECT @MedidaId = MedidaId
    FROM   dbo.Medidas
    WHERE  @@ROWCOUNT > 0
           AND MedidaId = SCOPE_IDENTITY();
    SELECT t0.MedidaId,
           Nombre,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo
    FROM   dbo.Medidas AS t0
    WHERE  @@ROWCOUNT > 0
           AND t0.MedidaId = @MedidaId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_add_Producto]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_Producto]
@CategoriaId INT, @ProveedorId INT, @MedidaId INT, @Nombre NVARCHAR (100), @DescripcionLarga NVARCHAR (250), @Codigo NVARCHAR (10), @Precio DECIMAL (18, 2), @Existencia DECIMAL (18, 2)
AS
BEGIN
    SET NOCOUNT OFF;
    INSERT  INTO dbo.Productos (CategoriaId, ProveedorId, MedidaId, Nombre, DescripcionLarga, Codigo, Precio, Existencia)
    VALUES                    (@CategoriaId, @ProveedorId, @MedidaId, @Nombre, @DescripcionLarga, @Codigo, @Precio, @Existencia);
    DECLARE @ProductoId AS INT;
    SELECT @ProductoId = ProductoId
    FROM   dbo.Productos
    WHERE  @@ROWCOUNT > 0
           AND ProductoId = SCOPE_IDENTITY();
    SELECT t0.ProductoId,
           t0.CategoriaId,
           t0.ProveedorId,
           t0.MedidaId,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo,
           t0.Precio,
           t0.Existencia
    FROM   dbo.Productos AS t0
    WHERE  @@ROWCOUNT > 0
           AND t0.ProductoId = @ProductoId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_add_Proveedor]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_add_Proveedor]
@Nombre NVARCHAR (100), @Representante NVARCHAR (250)
AS
BEGIN
    SET NOCOUNT OFF;
    INSERT  INTO dbo.Proveedores (Nombre, Representante)
    VALUES                      (@Nombre, @Representante);
    DECLARE @ProveedorId AS INT;
    SELECT @ProveedorId = ProveedorId
    FROM   dbo.Proveedores
    WHERE  @@ROWCOUNT > 0
           AND ProveedorId = SCOPE_IDENTITY();
    SELECT t0.ProveedorId,
           Nombre,
           t0.Nombre,
           t0.Representante
    FROM   dbo.Proveedores AS t0
    WHERE  @@ROWCOUNT > 0
           AND t0.ProveedorId = @ProveedorId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_get_all_categoria]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_all_categoria]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT t0.CategoriaId,
           Nombre,
           DescripcionLarga,
           Abreviatura
    FROM   dbo.Categorias AS t0;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_get_all_Medida]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_all_Medida]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT t0.MedidaId,
           Nombre,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo
    FROM   dbo.Medidas AS t0;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_get_all_Producto]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_all_Producto]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT t0.ProductoId,
           t0.CategoriaId,
           t0.ProveedorId,
           t0.MedidaId,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo,
           t0.Precio,
           t0.Existencia
    FROM   dbo.Productos AS t0;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_get_all_proveedor]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_all_proveedor]
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT t0.ProveedorId,
           Nombre,
           t0.Representante
    FROM   dbo.Proveedores AS t0;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_get_categoria]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_categoria]
@CategoriaId INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT t0.CategoriaId,
           Nombre,
           DescripcionLarga,
           Abreviatura
    FROM   dbo.Categorias AS t0
    WHERE  t0.CategoriaId = @CategoriaId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_get_Medida]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_Medida]
@MedidaId INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT t0.MedidaId,
           Nombre,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo
    FROM   dbo.Medidas AS t0
    WHERE  t0.MedidaId = @MedidaId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_get_Producto]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_Producto]
@ProductoId INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT t0.ProductoId,
           t0.CategoriaId,
           t0.ProveedorId,
           t0.MedidaId,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo,
           t0.Precio,
           t0.Existencia
    FROM   dbo.Productos AS t0
    WHERE  t0.ProductoId = @ProductoId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_get_proveedor]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_get_proveedor]
@ProveedorId INT
AS
BEGIN
    SET NOCOUNT OFF;
    SELECT t0.ProveedorId,
           Nombre,
           t0.Representante
    FROM   dbo.Proveedores AS t0
    WHERE  t0.ProveedorId = @ProveedorId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_upd_categoria]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_upd_categoria]
@CategoriaId INT, @Nombre NVARCHAR (100), @DescripcionLarga NVARCHAR (250), @Abreviatura NVARCHAR (10)
AS
BEGIN
    SET NOCOUNT OFF;
    UPDATE dbo.Categorias
    SET    Nombre           = @Nombre,
           DescripcionLarga = @DescripcionLarga,
           Abreviatura      = @Abreviatura
    WHERE  CategoriaId = @CategoriaId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_upd_Medida]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_upd_Medida]
@MedidaId INT, @Nombre NVARCHAR (100), @DescripcionLarga NVARCHAR (250), @Codigo NVARCHAR (10)
AS
BEGIN
    SET NOCOUNT OFF;
    UPDATE dbo.Medidas
    SET    Nombre           = @Nombre,
           DescripcionLarga = @DescripcionLarga,
           Codigo           = @Codigo
    WHERE  MedidaId = @MedidaId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_upd_Producto]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_upd_Producto]
@ProductoId INT, @CategoriaId INT, @ProveedorId INT, @MedidaId INT, @Nombre NVARCHAR (100), @DescripcionLarga NVARCHAR (250), @Codigo NVARCHAR (10), @Precio DECIMAL (18, 2), @Existencia DECIMAL (18, 2)
AS
BEGIN
    SET NOCOUNT OFF;
    UPDATE dbo.Productos
    SET    CategoriaId      = @CategoriaId,
           ProveedorId      = @ProveedorId,
           MedidaId         = @MedidaId,
           Nombre           = @Nombre,
           DescripcionLarga = @DescripcionLarga,
           Codigo           = @Codigo,
           Precio           = @Precio,
           Existencia       = @Existencia
    WHERE  ProductoId = @ProductoId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_upd_Proveedor]    Script Date: 09/12/2020 22:39:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_upd_Proveedor]
@ProveedorId INT, @Nombre NVARCHAR (100), @Representante NVARCHAR (250)
AS
BEGIN
    SET NOCOUNT OFF;
    UPDATE dbo.Proveedores
    SET    Nombre        = @Nombre,
           Representante = @Representante
    WHERE  ProveedorId = @ProveedorId;
END

GO
USE [master]
GO
ALTER DATABASE [TestDB] SET  READ_WRITE 
GO
