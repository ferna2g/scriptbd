CREATE Database prueba

use prueba;

CREATE TABLE prueba.dbo.producto (
	ID int IDENTITY(0,1) NOT NULL PRIMARY KEY,
	descripcion varchar(50) NOT NULL,
	precio decimal(16,2) NOT NULL,
	activo bit NOT NULL,
	fechaCreacion datetime
)

create procedure pro_producto
	@ID int=NULL,
	@descripcion varchar(50)=NULL,
	@precio decimal(16,2)=NULL,
	@activo bit=NULL,
	@fechaCreacion datetime=NULL,
	@sel char(1)
as 
	if @sel='L'
	BEGIN 
		select * from producto
	END
	
	if @sel='B'
	BEGIN
		select ID, descripcion, precio, activo,fechaCreacion from producto where ID=@ID
	END 
	
	if @sel='A'
	BEGIN 
		UPDATE producto set descripcion=@descripcion, precio=@precio, activo=@activo WHERE ID=@ID
	END 
	
	if @sel='B'
	BEGIN 
		DELETE FROM producto where ID=@ID
	END

