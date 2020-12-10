use TestDB
GO
CREATE TABLE Categorias
(
	CategoriaId INT IDENTITY(1,1),
	Nombre NVARCHAR(100),
	DescripcionLarga NVARCHAR(250),
	Abreviatura NVARCHAR(10)
	CONSTRAINT PK_Categorias PRIMARY KEY CLUSTERED (CategoriaId)
)
GO

CREATE TABLE Proveedores
(
	ProveedorId INT IDENTITY(1,1),
	Nombre NVARCHAR(100),
	Representante NVARCHAR(250),
	CONSTRAINT PK_Proveedores PRIMARY KEY CLUSTERED (ProveedorId)

)

GO

CREATE TABLE Medidas
(
	MedidaId INT IDENTITY(1,1),
	Nombre NVARCHAR(100),
	DescripcionLarga NVARCHAR(250),
	Codigo NVARCHAR(10),
	CONSTRAINT PK_Medidas PRIMARY KEY CLUSTERED (MedidaId)
	

)

GO

CREATE TABLE Productos
(
	ProductoId INT IDENTITY(1,1),
	CategoriaId INT NOT NULL,
	ProveedorId INT NOT NULL,
	MedidaId INT NOT NULL,
	Nombre NVARCHAR(100) NOT NULL,
	DescripcionLarga NVARCHAR(250),
	Codigo NVARCHAR(10),
	Precio DECIMAL(18,2),
	Existencia DECIMAL(18,2),

	CONSTRAINT PK_Productos PRIMARY KEY CLUSTERED (ProductoId),
	CONSTRAINT FK_Productos_Categorias FOREIGN KEY (CategoriaId) REFERENCES dbo.Categorias(CategoriaId),
	CONSTRAINT FK_Productos_Proveedores FOREIGN KEY (ProveedorId) REFERENCES dbo.Proveedores(ProveedorId),
	CONSTRAINT FK_Productos_Medidas FOREIGN KEY (MedidaId) REFERENCES dbo.Medidas(MedidaId)
	

)

