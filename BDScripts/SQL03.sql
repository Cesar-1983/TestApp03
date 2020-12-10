USE TestDB
GO
--SELECT ProveedorId,
--       Nombre,
--       Representante 
--	   FROM dbo.Proveedores
GO

CREATE PROCEDURE usp_add_Proveedor
@Nombre NVARCHAR(100),
@Representante NVARCHAR(250)
AS 
BEGIN
	SET NOCOUNT OFF

	INSERT INTO dbo.Proveedores
	(
	    Nombre,
	    Representante
	)
	VALUES
	(  
		@Nombre, -- Nombre - nvarchar(100)
		@Representante  -- Representante - nvarchar(250)
	    )

	DECLARE @ProveedorId int

    SELECT @ProveedorId = ProveedorId
    FROM dbo.Proveedores
    WHERE @@ROWCOUNT > 0 AND ProveedorId= SCOPE_IDENTITY()

	SELECT t0.ProveedorId,Nombre,t0.Nombre,t0.Representante
    FROM dbo.Proveedores AS t0
    WHERE @@ROWCOUNT > 0 AND t0.ProveedorId =@ProveedorId

END
GO

CREATE PROCEDURE usp_upd_Proveedor
@ProveedorId INT,
@Nombre NVARCHAR(100),
@Representante NVARCHAR(250)
AS 
BEGIN
	SET NOCOUNT OFF

	UPDATE dbo.Proveedores
	SET Nombre = @Nombre, Representante = @Representante
	WHERE ProveedorId = @ProveedorId

	

END
GO

CREATE PROCEDURE usp_get_proveedor
@ProveedorId INT
AS 
BEGIN
	SET NOCOUNT OFF

	SELECT t0.ProveedorId,Nombre,t0.Representante
    FROM dbo.Proveedores AS t0
    WHERE t0.ProveedorId =@ProveedorId

	

END
GO

CREATE PROCEDURE usp_get_all_proveedor
AS 
BEGIN
	SET NOCOUNT OFF

	SELECT t0.ProveedorId,Nombre,t0.Representante
    FROM dbo.Proveedores AS t0
	

END

--EXEC dbo.usp_add_categoria @Nombre = N'Electronica ',           -- nvarchar(100)
--                           @DescripcionLarga = N'Productos electronicos, radios, audifonos, etc', -- nvarchar(250)
--                           @Abreviatura = N''       -- nvarchar(10)

