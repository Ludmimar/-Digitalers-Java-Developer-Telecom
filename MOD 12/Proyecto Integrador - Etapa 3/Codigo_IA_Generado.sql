-- =====================================================
-- CÓDIGO GENERADO POR IA - RELACIÓN CLIENTES Y LOCALIDADES
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- 1. CREAR TABLA LOCALIDADES SI NO EXISTE
-- =====================================================

CREATE TABLE IF NOT EXISTS `LOCALIDADES` (
    `LocalidadID` INT AUTO_INCREMENT NOT NULL,
    `Nombre` VARCHAR(40) NOT NULL,
    `CP` VARCHAR(10) NOT NULL,
    `Provincia` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`LocalidadID`)
);

-- =====================================================
-- 2. INSERTAR DATOS DE EJEMPLO EN LOCALIDADES
-- =====================================================

INSERT IGNORE INTO LOCALIDADES (Nombre, CP, Provincia) VALUES
('CABA', '1000', 'Buenos Aires'),
('Rosario', '2000', 'Santa Fe'),
('Córdoba', '5000', 'Córdoba'),
('San Miguel de Tucumán', '4000', 'Tucumán'),
('Neuquén', '8300', 'Neuquén'),
('La Plata', '1900', 'Buenos Aires'),
('Mendoza', '5500', 'Mendoza'),
('Salta', '4400', 'Salta'),
('San Juan', '5400', 'San Juan'),
('Ushuaia', '9410', 'Tierra del Fuego');

-- =====================================================
-- 3. AGREGAR COLUMNA LOCALIDAD_ID A TABLA CLIENTES
-- =====================================================

-- Verificar si la columna ya existe para evitar errores
SET @column_exists = 0;
SELECT COUNT(*) INTO @column_exists 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_SCHEMA = 'TECNO_DB' 
AND TABLE_NAME = 'CLIENTES' 
AND COLUMN_NAME = 'LOCALIDAD_ID';

-- Solo agregar la columna si no existe
SET @sql = IF(@column_exists = 0, 
    'ALTER TABLE CLIENTES ADD COLUMN LOCALIDAD_ID INT NULL', 
    'SELECT "Columna LOCALIDAD_ID ya existe en la tabla CLIENTES" as mensaje');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- =====================================================
-- 4. CREAR RELACIÓN DE CLAVE FORÁNEA
-- =====================================================

-- Eliminar restricciones anteriores si existen
ALTER TABLE CLIENTES DROP FOREIGN KEY IF EXISTS fk_localidad;
ALTER TABLE CLIENTES DROP FOREIGN KEY IF EXISTS fk_clientes_localidades;

-- Crear la nueva restricción de clave foránea
ALTER TABLE CLIENTES 
ADD CONSTRAINT fk_clientes_localidades 
FOREIGN KEY (LOCALIDAD_ID) REFERENCES LOCALIDADES(LocalidadID)
ON DELETE SET NULL ON UPDATE CASCADE;

-- =====================================================
-- 5. ACTUALIZAR REGISTROS EXISTENTES DE CLIENTES
-- =====================================================

-- Asignar localidades a clientes existentes
UPDATE CLIENTES SET LOCALIDAD_ID = 1 WHERE CLIENTE_ID = 1; -- CABA
UPDATE CLIENTES SET LOCALIDAD_ID = 2 WHERE CLIENTE_ID = 2; -- Rosario  
UPDATE CLIENTES SET LOCALIDAD_ID = 3 WHERE CLIENTE_ID = 3; -- Córdoba
UPDATE CLIENTES SET LOCALIDAD_ID = 4 WHERE CLIENTE_ID = 4; -- San Miguel de Tucumán
UPDATE CLIENTES SET LOCALIDAD_ID = 5 WHERE CLIENTE_ID = 5; -- Neuquén

-- =====================================================
-- 6. INSERTAR NUEVOS CLIENTES CON LOCALIDAD
-- =====================================================

INSERT INTO CLIENTES (NOMBRE, APELLIDO, CUIT, DIRECCION, LOCALIDAD_ID, OBSERVACIONES) VALUES
('Ana', 'Martínez', '27-98765432-1', 'Av. Santa Fe 1234', 1, 'Cliente Premium'),
('Pedro', 'López', '20-11223344-5', 'San Martín 567', 6, 'GBA'),
('Laura', 'Fernández', '23-55667788-9', 'Belgrano 890', 7, 'Interior');

-- =====================================================
-- 7. CONSULTAS DE VERIFICACIÓN
-- =====================================================

-- Verificar la estructura de las tablas
DESCRIBE CLIENTES;
DESCRIBE LOCALIDADES;

-- Mostrar la relación funcionando
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
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
ORDER BY c.CLIENTE_ID;

-- Contar clientes por localidad
SELECT 
    l.Nombre as LOCALIDAD,
    l.Provincia,
    COUNT(c.CLIENTE_ID) as CANTIDAD_CLIENTES
FROM LOCALIDADES l
LEFT JOIN CLIENTES c ON l.LocalidadID = c.LOCALIDAD_ID
GROUP BY l.LocalidadID, l.Nombre, l.Provincia
ORDER BY CANTIDAD_CLIENTES DESC;

-- Mostrar clientes sin localidad asignada
SELECT 
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.CUIT
FROM CLIENTES c
WHERE c.LOCALIDAD_ID IS NULL;

-- =====================================================
-- 8. VERIFICACIÓN DE INTEGRIDAD REFERENCIAL
-- =====================================================

-- Verificar que todas las claves foráneas son válidas
SELECT 
    'VERIFICACIÓN DE INTEGRIDAD' as TIPO,
    COUNT(*) as TOTAL_CLIENTES,
    COUNT(LOCALIDAD_ID) as CLIENTES_CON_LOCALIDAD,
    COUNT(*) - COUNT(LOCALIDAD_ID) as CLIENTES_SIN_LOCALIDAD
FROM CLIENTES;

-- Verificar restricciones de clave foránea
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'TECNO_DB' 
AND REFERENCED_TABLE_NAME = 'LOCALIDADES';

-- =====================================================
-- 9. CONSULTAS DE PRUEBA ADICIONALES
-- =====================================================

-- Buscar clientes por provincia
SELECT 
    c.NOMBRE,
    c.APELLIDO,
    l.Nombre as LOCALIDAD,
    l.Provincia
FROM CLIENTES c
INNER JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
WHERE l.Provincia = 'Buenos Aires';

-- Mostrar todas las localidades disponibles
SELECT 
    LocalidadID,
    Nombre,
    CP,
    Provincia
FROM LOCALIDADES
ORDER BY Provincia, Nombre;

-- Resumen final
SELECT 
    'RELACIÓN CLIENTES-LOCALIDADES ESTABLECIDA EXITOSAMENTE' as ESTADO,
    (SELECT COUNT(*) FROM CLIENTES) as TOTAL_CLIENTES,
    (SELECT COUNT(*) FROM LOCALIDADES) as TOTAL_LOCALIDADES,
    (SELECT COUNT(*) FROM CLIENTES WHERE LOCALIDAD_ID IS NOT NULL) as CLIENTES_CON_LOCALIDAD;
