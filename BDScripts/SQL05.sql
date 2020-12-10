USE TestDB
GO
SELECT ProductoId,
       CategoriaId,
       ProveedorId,
       MedidaId,
       Nombre,
       DescripcionLarga,
       Codigo,
       Precio,
       Existencia
	   FROM dbo.Productos
GO

CREATE PROCEDURE usp_add_Producto
@CategoriaId INT,
@ProveedorId INT,
@MedidaId INT,
@Nombre NVARCHAR(100),
@DescripcionLarga NVARCHAR(250),
@Codigo NVARCHAR(10),
@Precio DECIMAL(18,2),
@Existencia DECIMAL(18,2)
AS 
BEGIN
	SET NOCOUNT OFF

	INSERT INTO dbo.Productos
	(
	    CategoriaId,
	    ProveedorId,
	    MedidaId,
	    Nombre,
	    DescripcionLarga,
	    Codigo,
	    Precio,
	    Existencia
	)
	VALUES
	(   @CategoriaId,    -- CategoriaId - int
	    @ProveedorId,    -- ProveedorId - int
	    @MedidaId,    -- MedidaId - int
	    @Nombre,  -- Nombre - nvarchar(100)
	    @DescripcionLarga,  -- DescripcionLarga - nvarchar(250)
	    @Codigo,  -- Codigo - nvarchar(10)
	    @Precio, -- Precio - decimal(18, 2)
	    @Existencia  -- Existencia - decimal(18, 2)
	    )
	

	DECLARE @ProductoId int

    SELECT @ProductoId = ProductoId
    FROM dbo.Productos
    WHERE @@ROWCOUNT > 0 AND ProductoId= SCOPE_IDENTITY()

	SELECT t0.ProductoId,
           t0.CategoriaId,
           t0.ProveedorId,
           t0.MedidaId,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo,
           t0.Precio,
           t0.Existencia
    FROM dbo.Productos AS t0
    WHERE @@ROWCOUNT > 0 AND t0.ProductoId =@ProductoId

END
GO

CREATE PROCEDURE usp_upd_Producto
@ProductoId INT,
@CategoriaId INT,
@ProveedorId INT,
@MedidaId INT,
@Nombre NVARCHAR(100),
@DescripcionLarga NVARCHAR(250),
@Codigo NVARCHAR(10),
@Precio DECIMAL(18,2),
@Existencia DECIMAL(18,2)
AS 
BEGIN
	SET NOCOUNT OFF

	UPDATE dbo.Productos
	SET CategoriaId=@CategoriaId,ProveedorId=@ProveedorId,MedidaId=@MedidaId,
		Nombre = @Nombre, DescripcionLarga = @DescripcionLarga,Codigo= @Codigo,
		Precio = @Precio,Existencia = @Existencia
	WHERE ProductoId = @ProductoId

	

END
GO

CREATE PROCEDURE usp_get_Producto
@ProductoId INT
AS 
BEGIN
	SET NOCOUNT OFF

	SELECT t0.ProductoId,
           t0.CategoriaId,
           t0.ProveedorId,
           t0.MedidaId,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo,
           t0.Precio,
           t0.Existencia
    FROM dbo.Productos AS t0
    WHERE t0.ProductoId =@ProductoId

	

END
GO

CREATE PROCEDURE usp_get_all_Producto
AS 
BEGIN
	SET NOCOUNT OFF

	SELECT t0.ProductoId,
           t0.CategoriaId,
           t0.ProveedorId,
           t0.MedidaId,
           t0.Nombre,
           t0.DescripcionLarga,
           t0.Codigo,
           t0.Precio,
           t0.Existencia

    FROM dbo.Productos AS t0
	

END

--EXEC dbo.usp_add_categoria @Nombre = N'Electronica ',           -- nvarchar(100)
--                           @DescripcionLarga = N'Productos electronicos, radios, audifonos, etc', -- nvarchar(250)
--                           @Abreviatura = N''       -- nvarchar(10)

