--GUIA BASICA DE SQL-SERVER
--AUTHOR:

Lo primero que hacemos cuando ya tenemos una base de datos creada es ver las tablas que la componen
para esto podemos usar el StoredProcedure siguiente:
--Recordar que solo mostrara las creadas por el usuario y no por el SQL Server
  SP_TABLE @TABLE_OWNER='DBO'

--CREAR UNA TABLA
  CREATE TABLE USUARIO
  (ID_USUARIO VARCHAR(8) PRIMARY KEY,
  NOMBRE_USUARIO VARCHAR(14),
  CLAVE_USUARIO VARCHAR(10)
  )

  CREATE TABLE AGENDA
  (AG_APELLIDO VARCHAR(15),
  AG_NOMBRE VARCHAR(15),
  AG_DOMICILIO VARCHAR(15),
  AG_TELEFONO VARCHAR(11)
  )


--ELIMINAR UNA TABLA PERO PRIMERO PREGUNTAREMOS SI LA TABLA EXISTE
  IF OBJECT_ID('USUARIO') IS NOT NULL
    DROP TABLE USUARIO
  GO


--MOSTRAMOS LA ESTRUCTURA DE LA TABLA USUARIO
  SP_COLUMNS USUARIO
  GO

--INSERTAMOS REGISTROS(FILAS) PARA LA TABLA USUARIO
  INSERT INTO USUARIO(ID_USUARIO,NOMBRE_USUARIO,CLAVE_USUARIO) 
  VALUES ('12345','MIGUEL CHIN','PWDS')
  GO

--INSERTAMOS UN CONTACTO A LA AGENDA
  INSERT INTO AGENDA(AG_NOMBRE,AG_APELLIDO,AG_DOMICILIO,AG_TELEFONO) 
  VALUES ('Michael','Renmc','Av. Libertad','963778547')
  GO

--AHORA MOSTRAREMOS LOS DATOS USANDO EL COMANDO SELECT EN LA TABLA AGENDA
  SELECT*FROM AGENDA
  GO

--MOSTRAR SOLO EL NOMBRE DE LA PELICULA Y EL ACTOR
SELECT NOMB_PELICULA,ACTOR_PELICULA FROM PELICULA
GO

--MOSTRAR EL TITULO Y CANTIDAD DE COPIAS
SELECT NOMB_PELICULA,CANTIDAD_COPIAS_PELICULA FROM PELICULAS

--CONDICIONES EN LAS CONSULTAS 'WHERE'
--PARA INDICAR CONDICIONES EN LA CONSULTA SELECT, Y ASI PODER RECUPERAR SOLO ALGUNOS
--REGISTROS AQUELLOS QUE CUMPLAN CON LA CONDICION INDICADA EN LA CLAUSULA 'WHERE'
--SINTAXIS GENERAL

SELECT CAMPO1,CAMPO2,...,CAMPO_N FROM NOMBRE_TABLA WHERE CONDICION

--EJEMPLO
SELECT ID_USUARIO,CLAVE_USUARIO FROM USUARIO WHERE NOMBRE_USUARIO='MICHAEL'
GO

IF OBJECT_ID('AGENDA') IS NOT NULL
  DROP TABLE AGENDA
GO
--ESTRUCTURA DE LA TABLA
SP_COLUMNS AGENDA
GO

--INGRESAMOS ALGUNOS REGISTROS A LA AGENDA
INSERT INTO AGENDA(AG_APELLIDO,AG_NOMBRE,AG_DOMICILIO,AG_TELEFONO) 
VALUES ('ACOSTA','ANA','COLON 123',12345)
GO

--SELECCIONAMOS TODOS LOS CAMPOS DE LA TABLA
SELECT*FROM AGENDA
GO

--SELECCIONAMOS EL REGISTRO DE NOMBRE 'MARISSA'
SELECT*FROM AGENDA WHERE AG_NOMBRE='MARISSA'
GO

--MOSTRAMOS LOS NOMBRE Y DOMICILIO DE TODOS LOS LOPEZ
SELECT AG_NOMBRE,AG_DOMICILIO, FROM AGENDA WHERE AG_APELLIDO='LOPEZ'
GO

--MOSTRAR EL NOMBRE DE QUIENES TENGAN EL NUMERO TELF 4545454
SELECT AG_NOMBRE FROM AGENDA WHERE AG_TELEFONO='4545454'
GO

--LOS OPERADORES RELACIONALES
--LOS OPERADORES SON SIMBOLOS QUE NOS VA A PERMITIR REALIZAR OPERACIONES 
--MATEMATICAS. SQL TIENE 4 TIPOS DE OPERADORES:
--RELACIONALES(O DE COMPARACION), ARITMETICOS,DE CONCATENACION,LOGICOS
--EN PRINCIPIO USAREMOS LOS REALACIONALES: =,<>,<,>,<=,>=
--EJEMPLO SELECCIONAR LOS REGISTROS CUYO AUTOR SEA DIFERENTE A 'BORGES'

SELECT*FROM LIBROS WHERE AUTOR<>'BORGES'
GO


SELECT*FROM LIBROS WHERE AUTOR<>'BORGES'
GO



--ELIMINAMOS LA TABLA ARTICULOS
IF OBJECT_ID('ARTICULOS') IS NOT NULL
  DROP TABLE ARTICULOS

CREATE TABLE ARTICULOS
(COD_ART INT,
NOMB_ART VARCHAR(20),
DESC_ART VARCHAR(30),
PREC_ART DECIMAL(8,2)
CANT_ART INT
)
GO

--ESTRUCTURA DE LA TABLA
SP_COLUMNS ARTICULOS
GO

--INGRESAMOS ALGUNO REGISTROS
INSERT INTO ARTICULOS(COD_ART,NOMB_ART,DESC_ART,PREC_ART,CANT_ART)
VALUES (1,'IMPRESORA','EPSON STYLUS C45',400.80,20)
GO

INSERT INTO ARTICULOS(COD_ART,NOMB_ART,DESC_ART,PREC_ART,CANT_ART)
VALUES (2,'IMMPRESORA','EPSON STYLUS C85',500,30)
GO

INSERT INTO ARTICULOS(COD_ART,NOMB_ART,DESC_ART,PREC_ART,CANT_ART)
VALUES (3,'MONITOR','SAMSUNG 14',800,10)
GO

INSERT INTO ARTICULOS(COD_ART,NOMB_ART,DESC_ART,PREC_ART,CANT_ART)
VALUES (4,'TECLADO','INGLES BISWAL',100,50)
GO

INSERT INTO ARTICULOS(COD_ART,NOMB_ART,DESC_ART,PREC_ART,CANT_ART)
VALUES (5,'TECLADO','ESPAÑOL BISWAL',90,50)
GO


--BORRAR REGISTROS
--PARA BORRAR LOS REGISTROS USAREMOS EL COMANDO 'DELETE'
--LA SINTAXIS ES 'DELETE FROM NOMBRE_TABLA' ESTE COMANDO BORRARA TODOS LOS REGISTROS
--SI DESEAMOS BORRAR CIERTOS REGISTROS LO QUE DEBEMOS ES COMBINARLO CON
--WHERE Y SOLO BORRAREMOS AQUEL QUE CUMPLA LA CONDICION POR EJEMPLO
DELETE FROM USUARIO WHERE NOMBRE='MARCELO'

IF OBJECT_ID('AGENDA') IS NOT NULL
	DROP TABLE AGENDA


INSERT INTO AGENDA(AG_APELLIDO,AG_NOMBRE,AG_DOMICILIO,AG_TELEFONO)
VALUES('Alvarez','Alberto','Colon 123',423456)
GO

INSERT INTO AGENDA(AG_APELLIDO,AG_NOMBRE,AG_DOMICILIO,AG_TELEFONO)
VALUES ('Juarez','Juan','Avellaneda 135',4458787)
GO

INSERT INTO AGENDA(AG_APELLIDO,AG_NOMBRE,AG_DOMICILIO,AG_TELEFONO)
VALUES ('Lopez','Maria','Urquiza 333',454545)
GO

INSERT INTO AGENDA(AG_APELLIDO,AG_NOMBRE,AG_DOMICILIO,AG_TELEFONO)
VALUES ('Lopez','Jose','Urquiza 333',4545454)
GO

INSERT INTO AGENDA(AG_APELLIDO,AG_NOMBRE,AG_DOMICILIO,AG_TELEFONO)
VALUES ('Salas','Susana','Gral. Paz 1234',4123456)
GO


--ACTUALIZAR DATOS DENTRO DE LOS REGISTROS
--PARA ELLO UTILIZAREMOS LOS COMANDOS 'UPDATE' SU SINTAXIS ES LA SIGUIENTE

--UPDATE NOMBRE_TABLA SET CAMPO1='TUTEXTO',...,CAMPO_N='NUEVO'
--ESTO ACTUALIZARA TODA LA TABLA

--PERO SI DESEAMOS MODIFICAR SOLO ALGUNOS TENEMOS QUE USARLO EN COMBINACION CON
--LA CONDICION 'WHERE' LA SINTAXIS ES LA SIGUIENTE
--UPDATE USUARIO SET CLAVE='sXrD' WHERE ID_USUARIO='1234'

IF OBJECT_ID('AGENDA') IS NOT NULL
	DROP TABLE AGENDA
GO

CREATE TABLE AGENDA
(APELLIDO VARCHAR(12),
NOMBRE VARCHAR(23),
DOMICILIO VARCHAR(23),
TELEFONO VARCHAR(33)
)
GO

INSER INTO AGENDA(APELLIDO,NOMBRE,DOMICILIO,TELEFONO) 
VALUES ('ACOSTA','ALBERTO','COLON 123','12234')
GO

--VALORES NULL(IS NULL) 
--NULL SIGNIFICA VALOR INEXISTENTE O DATOS DESCONOCIDO NO ES LO MISMO QUE CERO
--HAY QUE TENER EN CUENTA QUE NULL NO ES UNA CADENA POR TANTO NO VA ENTRE COMILLAS
--PARA RECUPERAR LOS REGISTROS DE VALOR NULL NO SE PUEDE UTILIZAR LOS OPERADORES RELACIONALES -- = O <> LO QUE DEBEMOS USAR ES 'IS NULL' O EN SU DEFECTO 'IS NOT NULL' POR EJEMPLO

SELECT*FROM LIBROS WHERE PRECIO IS NULL

--ES TOTALMENTE DISTINTO A ESTO OJO
SELECT*FROM LIBROS QHERE PRECIO=0


IF OBJECT_ID('MEDICAMENTOS') IS NOT NULL
	DROP TABLE MEDICAMENTOS
GO

CREATE TABLE MEDICAMENTOS
(COD_MED INTEGER NOT NULL,
NOMB_MED VARCHAR(10)NOT NULL,
LAB_MED VARCHAR(14),
PREC_MED DECIMAL(10,2),
CANT_MED INT NOT NULL
)
GO

SP_COLUMNS MEDICAMENTOS
GO

INSERT INTO MEDICAMENTOS(COD_MED,NOMB_MED,LAB_MED,PREC_MED,CANT_MED)
VALUES (1,'Sertal gotas',null,null,100)
GO

INSERT INTO MEDICAMENTOS(COD_MED,NOMB_MED,LAB_MED,PREC_MED,CANT_MED)
VALUES (2,'Sertal compuesto',null,8.90,150)
GO

INSERT INTO MEDICAMENTOS(COD_MED,NOMB_MED,LAB_MED,PREC_MED,CANT_MED)
VALUES (3,'Buscapina','Roche',null,200)

SELECT*FROM MEDICAMENTOS
GO
  continua...
