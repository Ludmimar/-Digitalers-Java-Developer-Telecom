-- EJERCICIO 1 - BONUS_TRACK
-- Solución completa para los tres puntos del ejercicio

-- 1. Modificar el nombre del autor de apellido ECHEVERRÍA por Esteban
-- (modificar el nombre, no el apellido)
USE BONUS_TRACK;

UPDATE AUTORES 
SET NOMBRE = 'Esteban' 
WHERE APELLIDO = 'ECHEVERRÍA';

-- Verificar el cambio
SELECT * FROM AUTORES WHERE APELLIDO = 'ECHEVERRÍA';

-- 2. Agregar columna PERMANENCIA a la tabla EMPLEADOS
-- y completar con valor 2 para todos los empleados
ALTER TABLE EMPLEADOS 
ADD COLUMN PERMANENCIA INT;

UPDATE EMPLEADOS 
SET PERMANENCIA = 2;

-- Verificar la nueva columna
SELECT * FROM EMPLEADOS;

-- 3. Agregar columna PRECIO_PÚBLICO a la tabla LIBROS
-- y completar con precio + 21% de IVA
USE LIBRERIA;

ALTER TABLE LIBROS 
ADD COLUMN PRECIO_PUBLICO DECIMAL(10,2);

UPDATE LIBROS 
SET PRECIO_PUBLICO = PRECIO * 1.21;

-- Verificar la nueva columna con los precios calculados
SELECT TITULO, PRECIO, PRECIO_PUBLICO, 
       ROUND((PRECIO_PUBLICO - PRECIO), 2) AS IVA_AGREGADO
FROM LIBROS;
