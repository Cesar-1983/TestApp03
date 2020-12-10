USE TestDB
GO
SELECT CategoriaId,
       Nombre,
       DescripcionLarga,
       Abreviatura FROM dbo.Categorias
GO

ALTER PROCEDURE usp_add_categoria
@Nombre NVARCHAR(100),
@DescripcionLarga NVARCHAR(250),
@Abreviatura NVARCHAR(10)
AS 
BEGIN
	SET NOCOUNT OFF

	INSERT INTO dbo.Categorias
	(
	    Nombre,
	    DescripcionLarga,
	    Abreviatura
	)
	VALUES
	(   @Nombre, -- Nombre - nvarchar(100)
	    @DescripcionLarga, -- DescripcionLarga - nvarchar(250)
	    @Abreviatura  -- Abreviatura - nvarchar(10)
	)

	DECLARE @CategoriaId int

    SELECT @CategoriaId = CategoriaId
    FROM dbo.Categorias
    WHERE @@ROWCOUNT > 0 AND CategoriaId= SCOPE_IDENTITY()

	SELECT t0.CategoriaId,Nombre,DescripcionLarga,Abreviatura
    FROM dbo.Categorias AS t0
    WHERE @@ROWCOUNT > 0 AND t0.CategoriaId = @CategoriaId

END
GO

CREATE PROCEDURE usp_upd_categoria
@CategoriaId INT,
@Nombre NVARCHAR(100),
@DescripcionLarga NVARCHAR(250),
@Abreviatura NVARCHAR(10)
AS 
BEGIN
	SET NOCOUNT OFF

	UPDATE dbo.Categorias
	SET Nombre = @Nombre,DescripcionLarga = @DescripcionLarga,Abreviatura = @Abreviatura
	WHERE CategoriaId =  @CategoriaId

	

END
GO

ALTER PROCEDURE usp_get_categoria
@CategoriaId INT
AS 
BEGIN
	SET NOCOUNT OFF

	SELECT t0.CategoriaId,Nombre,DescripcionLarga,Abreviatura
    FROM dbo.Categorias AS t0
    WHERE t0.CategoriaId = @CategoriaId

	

END
GO

CREATE PROCEDURE usp_get_all_categoria
AS 
BEGIN
	SET NOCOUNT OFF

	SELECT t0.CategoriaId,Nombre,DescripcionLarga,Abreviatura
    FROM dbo.Categorias AS t0
	

END

--EXEC dbo.usp_add_categoria @Nombre = N'Electronica ',           -- nvarchar(100)
--                           @DescripcionLarga = N'Productos electronicos, radios, audifonos, etc', -- nvarchar(250)
--                           @Abreviatura = N''       -- nvarchar(10)

