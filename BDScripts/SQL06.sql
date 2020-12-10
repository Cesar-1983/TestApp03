USE TestDB
GO
--DROP TABLE dbo.ImagenesProductos
CREATE TABLE ImagenesProductos
(
	ImagenProductoId INT IDENTITY(1,1),
	ProductoId INT NOT NULL,
	file_name NVARCHAR(MAX) NOT NULL,  
	file_ext  NVARCHAR(max) NOT NULL,  
	file_base64 nvarchar(max) NOT NULL,
	description NVARCHAR(100),
	IsPrincipal BIT NOT NULL DEFAULT(0),
	CONSTRAINT PK_ImagenesProductos PRIMARY KEY (ImagenProductoId),
	CONSTRAINT FK_ImagenesProductos_Productos FOREIGN KEY (ProductoId) REFERENCES dbo.Productos (ProductoId)
)
GO
ALTER PROCEDURE sp_get_all_ImagenesProductos_by_Producto
   @ProductoId INT
AS  
BEGIN  
/****** Script for SelectTopNRows command from SSMS  ******/  
	SELECT 
		ImagenProductoId,
        ProductoId,
        file_name,
        file_ext,
        file_base64,
		description,
		IsPrincipal
	FROM dbo.ImagenesProductos
	WHERE ProductoId = @ProductoId
END
GO

alter PROCEDURE sp_get_detalle_ImagenesProductos
   @ImagenProductoId INT
AS  
BEGIN  
/****** Script for SelectTopNRows command from SSMS  ******/  
	SELECT 
		ImagenProductoId,
        ProductoId,
        file_name,
        file_ext,
        file_base64 ,
		description,
		IsPrincipal

	FROM dbo.ImagenesProductos
	WHERE ImagenProductoId = @ImagenProductoId
END

GO

ALTER PROCEDURE sp_add_ImagenesProductos
        @ProductoId INT,
        @file_name NVARCHAR(MAX),
        @file_ext NVARCHAR(MAX),
        @file_base64 NVARCHAR(MAX) ,
		@description NVARCHAR(100),
		@IsPrincipal BIT

AS  
BEGIN  
/****** Script for SelectTopNRows command from SSMS  ******/  
	INSERT INTO	 dbo.ImagenesProductos
	(
	    ProductoId,
	    file_name,
	    file_ext,
	    file_base64,
		description,
		IsPrincipal
	)
	VALUES
	(   
		@ProductoId,   -- ProductoId - int
	    @file_name, -- file_name - nvarchar(max)
	    @file_ext, -- file_ext - nvarchar(max)
	    @file_base64,  -- file_base64 - nvarchar(max)
		@description,
		@IsPrincipal
	    )

	DECLARE @ImagenProductoId int

    SELECT @ImagenProductoId = ImagenProductoId
    FROM dbo.ImagenesProductos
    WHERE @@ROWCOUNT > 0 AND ImagenProductoId= SCOPE_IDENTITY()

	IF @IsPrincipal = 1
	BEGIN
		UPDATE dbo.ImagenesProductos
		SET IsPrincipal = 0
		WHERE ProductoId = @ProductoId AND ImagenProductoId!=@ImagenProductoId
	END
END
GO

CREATE PROCEDURE sp_get_principal_ImagenProducto_by_Producto
   @ProductoId INT
AS  
BEGIN  
/****** Script for SelectTopNRows command from SSMS  ******/  
	SELECT 
		ImagenProductoId,
        ProductoId,
        file_name,
        file_ext,
        file_base64,
		description,
		IsPrincipal
	FROM dbo.ImagenesProductos
	WHERE ProductoId = @ProductoId AND IsPrincipal = 1
END