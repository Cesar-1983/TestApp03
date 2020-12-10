USE TestDB
GO
SELECT MedidaId,
       Nombre,
       DescripcionLarga,
       Codigo
	   FROM dbo.Medidas
GO

CREATE PROCEDURE usp_add_Medida
@Nombre NVARCHAR(100),
@DescripcionLarga NVARCHAR(250),
@Codigo NVARCHAR(10)
AS 
BEGIN
	SET NOCOUNT OFF

	INSERT INTO dbo.Medidas
	(
	    Nombre,
	    DescripcionLarga,
		Codigo
	)
	VALUES
	(  
		@Nombre, -- Nombre - nvarchar(100)
		@DescripcionLarga , -- Representante - nvarchar(250)
		@Codigo
	    )

	DECLARE @MedidaId int

    SELECT @MedidaId = MedidaId
    FROM dbo.Medidas
    WHERE @@ROWCOUNT > 0 AND MedidaId= SCOPE_IDENTITY()

	SELECT t0.MedidaId,Nombre,t0.Nombre,t0.DescripcionLarga,t0.Codigo
    FROM dbo.Medidas AS t0
    WHERE @@ROWCOUNT > 0 AND t0.MedidaId =@MedidaId

END
GO

CREATE PROCEDURE usp_upd_Medida
@MedidaId INT,
@Nombre NVARCHAR(100),
@DescripcionLarga NVARCHAR(250),
@Codigo NVARCHAR(10)
AS 
BEGIN
	SET NOCOUNT OFF

	UPDATE dbo.Medidas
	SET Nombre = @Nombre, DescripcionLarga = @DescripcionLarga,Codigo= @Codigo
	WHERE MedidaId = @MedidaId

	

END
GO

CREATE PROCEDURE usp_get_Medida
@MedidaId INT
AS 
BEGIN
	SET NOCOUNT OFF

	SELECT t0.MedidaId,Nombre,t0.Nombre,t0.DescripcionLarga,t0.Codigo
    FROM dbo.Medidas AS t0
    WHERE t0.MedidaId =@MedidaId

	

END
GO

CREATE PROCEDURE usp_get_all_Medida
AS 
BEGIN
	SET NOCOUNT OFF

	SELECT t0.MedidaId,Nombre,t0.Nombre,t0.DescripcionLarga,t0.Codigo
    FROM dbo.Medidas AS t0
	

END

--EXEC dbo.usp_add_categoria @Nombre = N'Electronica ',           -- nvarchar(100)
--                           @DescripcionLarga = N'Productos electronicos, radios, audifonos, etc', -- nvarchar(250)
--                           @Abreviatura = N''       -- nvarchar(10)

