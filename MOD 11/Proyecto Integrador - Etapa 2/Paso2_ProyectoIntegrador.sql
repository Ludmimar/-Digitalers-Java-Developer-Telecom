-- =====================================================
-- PROYECTO INTEGRADOR - ETAPA 2 - PASO 2
-- Modificaciones de tablas y relaciones
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- PASO 2.1: MODIFICACIONES TABLA FACTURAS
-- =====================================================

-- 1a. Asignar la restricción UNSIGNED al campo Monto
-- (Ya está implementado en el Paso 1, pero se incluye para claridad)
ALTER TABLE FACTURAS MODIFY MONTO DECIMAL(10,2) UNSIGNED NOT NULL;

-- =====================================================
-- PASO 2.2: MODIFICACIONES TABLA ARTICULOS
-- =====================================================

-- 2c. Cambiar el tipo de dato del campo Nombre para que admita hasta 75 caracteres
-- (Ya está implementado en el Paso 1, pero se incluye para claridad)
ALTER TABLE ARTICULOS MODIFY NOMBRE VARCHAR(75) NOT NULL;

-- 2d. Asignar las restricciones UNSIGNED y NOT NULL al campo Precio
-- (Ya está implementado en el Paso 1, pero se incluye para claridad)
ALTER TABLE ARTICULOS MODIFY PRECIO INT UNSIGNED NOT NULL;

-- 2e. Asignar las restricciones UNSIGNED y NOT NULL al campo Stock
-- (Ya está implementado en el Paso 1, pero se incluye para claridad)
ALTER TABLE ARTICULOS MODIFY STOCK INT UNSIGNED NOT NULL;

-- =====================================================
-- PASO 2.3: MODIFICACIONES TABLA CLIENTES
-- =====================================================

-- 3a. Cambiar el tipo de dato del campo Nombre para que admita hasta 30 caracteres
-- (Ya está implementado en el Paso 1, pero se incluye para claridad)
ALTER TABLE CLIENTES MODIFY NOMBRE VARCHAR(30) NOT NULL;

-- 3c. Cambiar el tipo de dato del campo Apellido para que admita hasta 35 caracteres
-- (Ya está implementado en el Paso 1, pero se incluye para claridad)
ALTER TABLE CLIENTES MODIFY APELLIDO VARCHAR(35) NOT NULL;

-- 3c. Cambiar el nombre del campo Comentarios por Observaciones y su tipo de dato para que admita hasta 255 caracteres
-- (Ya está implementado en el Paso 1, pero se incluye para claridad)
ALTER TABLE CLIENTES CHANGE COMENTARIOS OBSERVACIONES VARCHAR(255);

-- =====================================================
-- PASO 2.4: RELACIÓN ENTRE CLIENTES Y LOCALIDADES
-- =====================================================

-- Crear la tabla LOCALIDADES si no existe (estructura específica del Paso 1)
CREATE TABLE IF NOT EXISTS `LOCALIDADES` (
    `LocalidadID` INT AUTO_INCREMENT NOT NULL,
    `Nombre` VARCHAR(40) NOT NULL,
    `CP` VARCHAR(10) NOT NULL,
    `Provincia` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`LocalidadID`)
);

-- Insertar datos de ejemplo en la tabla LOCALIDADES
INSERT IGNORE INTO LOCALIDADES (Nombre, CP, Provincia) VALUES
('CABA', '1000', 'Buenos Aires'),
('Rosario', '2000', 'Santa Fe'),
('Córdoba', '5000', 'Córdoba'),
('San Miguel de Tucumán', '4000', 'Tucumán'),
('Neuquén', '8300', 'Neuquén'),
('La Plata', '1900', 'Buenos Aires'),
('Mendoza', '5500', 'Mendoza'),
('Salta', '4400', 'Salta');

-- Agregar columna LOCALIDAD_ID a la tabla CLIENTES si no existe
-- Primero verificamos si la columna ya existe para evitar errores
SET @column_exists = 0;
SELECT COUNT(*) INTO @column_exists 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'TECNO_DB' 
AND TABLE_NAME = 'CLIENTES' 
AND COLUMN_NAME = 'LOCALIDAD_ID';

-- Solo agregar la columna si no existe
SET @sql = IF(@column_exists = 0, 
    'ALTER TABLE CLIENTES ADD COLUMN LOCALIDAD_ID INT', 
    'SELECT "Columna LOCALIDAD_ID ya existe" as mensaje');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Crear la relación entre CLIENTES y LOCALIDADES
-- Primero eliminamos la restricción anterior si existe
ALTER TABLE CLIENTES DROP FOREIGN KEY IF EXISTS fk_localidad;
ALTER TABLE CLIENTES DROP FOREIGN KEY IF EXISTS fk_clientes_localidades;

-- Agregar la nueva restricción de clave foránea
ALTER TABLE CLIENTES 
ADD CONSTRAINT fk_clientes_localidades 
FOREIGN KEY (LOCALIDAD_ID) REFERENCES LOCALIDADES(LocalidadID);

-- Actualizar algunos registros de clientes para que tengan localidad asignada
UPDATE CLIENTES SET LOCALIDAD_ID = 1 WHERE CLIENTE_ID = 1; -- CABA
UPDATE CLIENTES SET LOCALIDAD_ID = 2 WHERE CLIENTE_ID = 2; -- Rosario
UPDATE CLIENTES SET LOCALIDAD_ID = 3 WHERE CLIENTE_ID = 3; -- Córdoba
UPDATE CLIENTES SET LOCALIDAD_ID = 4 WHERE CLIENTE_ID = 4; -- San Miguel de Tucumán
UPDATE CLIENTES SET LOCALIDAD_ID = 5 WHERE CLIENTE_ID = 5; -- Neuquén

-- =====================================================
-- CONSULTAS DE VERIFICACIÓN
-- =====================================================

-- Verificar la estructura de las tablas modificadas
DESCRIBE FACTURAS;
DESCRIBE ARTICULOS;
DESCRIBE CLIENTES;
DESCRIBE LOCALIDADES;

-- Verificar la relación entre CLIENTES y LOCALIDADES
SELECT 
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.CUIT,
    c.DIRECCION,
    c.OBSERVACIONES,
    l.Nombre as LOCALIDAD,
    l.CP,
    l.Provincia
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID;

-- Mostrar todas las tablas de la base de datos
SHOW TABLES;

-- Verificar las restricciones de las tablas
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    EXTRA
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'TECNO_DB' 
AND TABLE_NAME IN ('FACTURAS', 'ARTICULOS', 'CLIENTES', 'LOCALIDADES')
ORDER BY TABLE_NAME, ORDINAL_POSITION;

-- Verificar las relaciones de claves foráneas
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'TECNO_DB' 
AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;

-- =====================================================
-- CONSULTAS DE PRUEBA
-- =====================================================

-- Insertar un nuevo cliente con localidad
INSERT INTO CLIENTES (NOMBRE, APELLIDO, CUIT, DIRECCION, LOCALIDAD_ID, OBSERVACIONES) 
VALUES ('María', 'González', '27-12345678-9', 'Av. Corrientes 1234', 1, 'Cliente VIP');

-- Insertar una nueva localidad
INSERT INTO LOCALIDADES (Nombre, CP, Provincia) 
VALUES ('Mar del Plata', '7600', 'Buenos Aires');

-- Consulta final para mostrar el resultado de las modificaciones
SELECT 
    'MODIFICACIONES COMPLETADAS' as STATUS,
    COUNT(*) as TOTAL_CLIENTES,
    (SELECT COUNT(*) FROM LOCALIDADES) as TOTAL_LOCALIDADES
FROM CLIENTES;
