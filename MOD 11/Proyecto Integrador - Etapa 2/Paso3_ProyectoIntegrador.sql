-- =====================================================
-- PROYECTO INTEGRADOR - ETAPA 2 - PASO 3
-- Carga de datos en las tablas
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- PASO 3.1: CARGAR 5 REGISTROS EN LA TABLA LOCALIDADES
-- =====================================================

-- Limpiar tabla LOCALIDADES para empezar desde cero
TRUNCATE TABLE LOCALIDADES;

-- Insertar las 5 localidades especificadas
INSERT INTO LOCALIDADES (LocalidadID, Nombre, CP, Provincia) VALUES
(1, 'CABA', '1000', 'Buenos Aires'),
(2, 'Rosario', '2000', 'Santa Fe'),
(3, 'Córdoba', '5000', 'Córdoba'),
(4, 'San Miguel de Tucumán', '4000', 'Tucumán'),
(5, 'Neuquén', '8300', 'Neuquén');

-- =====================================================
-- PASO 3.2: CARGAR 5 REGISTROS EN LA TABLA CLIENTES
-- =====================================================

-- Limpiar tabla CLIENTES para empezar desde cero
TRUNCATE TABLE CLIENTES;

-- Insertar los 5 clientes especificados
-- NOTA: Se usa OBSERVACIONES en lugar de Comentarios según las modificaciones del Paso 2
INSERT INTO CLIENTES (CLIENTE_ID, NOMBRE, APELLIDO, CUIT, DIRECCION, LOCALIDAD_ID, OBSERVACIONES) VALUES
(5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 3, 'VIP'),
(14, 'Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 1, 'GBA'),
(17, 'Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 5, 'GBA'),
(26, 'Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 2, 'VIP'),
(50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 4, 'GBA');

-- =====================================================
-- PASO 3.3: CARGAR 4 REGISTROS EN LA TABLA ARTICULOS
-- =====================================================

-- Limpiar tabla ARTICULOS para empezar desde cero
TRUNCATE TABLE ARTICULOS;

-- Insertar los 4 artículos especificados
INSERT INTO ARTICULOS (ARTICULO_ID, NOMBRE, PRECIO, STOCK) VALUES
(95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
(157, 'Apple AirPods Pro', 979.75, 152),
(335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
(411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);

-- =====================================================
-- PASO 3.4: CARGAR 5 REGISTROS EN LA TABLA FACTURAS
-- =====================================================

-- Limpiar tabla FACTURAS para empezar desde cero
TRUNCATE TABLE FACTURAS;

-- Insertar las 5 facturas especificadas
INSERT INTO FACTURAS (FACTURA_ID, LETRA, NUMERO, CLIENTE_ID, FECHA, MONTO) VALUES
(1, 'A', 28, 14, '2021-03-18', 1589.50),
(2, 'A', 39, 26, '2021-04-12', 979.75),
(3, 'B', 8, 17, '2021-04-25', 513.35),
(4, 'B', 12, 5, '2021-05-01', 2385.70),
(5, 'B', 19, 50, '2022-05-26', 979.75);

-- =====================================================
-- CONSULTAS DE VERIFICACIÓN DE CARGA
-- =====================================================

-- Verificar datos cargados en LOCALIDADES
SELECT 'LOCALIDADES' as TABLA, COUNT(*) as REGISTROS FROM LOCALIDADES;

-- Verificar datos cargados en CLIENTES
SELECT 'CLIENTES' as TABLA, COUNT(*) as REGISTROS FROM CLIENTES;

-- Verificar datos cargados en ARTICULOS
SELECT 'ARTICULOS' as TABLA, COUNT(*) as REGISTROS FROM ARTICULOS;

-- Verificar datos cargados en FACTURAS
SELECT 'FACTURAS' as TABLA, COUNT(*) as REGISTROS FROM FACTURAS;

-- Mostrar todos los datos cargados
SELECT '=== DATOS EN LOCALIDADES ===' as INFO;
SELECT * FROM LOCALIDADES ORDER BY LocalidadID;

SELECT '=== DATOS EN CLIENTES ===' as INFO;
SELECT * FROM CLIENTES ORDER BY CLIENTE_ID;

SELECT '=== DATOS EN ARTICULOS ===' as INFO;
SELECT * FROM ARTICULOS ORDER BY ARTICULO_ID;

SELECT '=== DATOS EN FACTURAS ===' as INFO;
SELECT * FROM FACTURAS ORDER BY FACTURA_ID;

-- =====================================================
-- CONSULTA DE RELACIÓN CLIENTES-LOCALIDADES
-- =====================================================

SELECT '=== CLIENTES CON SUS LOCALIDADES ===' as INFO;
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

-- =====================================================
-- RESUMEN FINAL
-- =====================================================

SELECT 
    'CARGA DE DATOS COMPLETADA' as ESTADO,
    (SELECT COUNT(*) FROM LOCALIDADES) as LOCALIDADES_CARGADAS,
    (SELECT COUNT(*) FROM CLIENTES) as CLIENTES_CARGADOS,
    (SELECT COUNT(*) FROM ARTICULOS) as ARTICULOS_CARGADOS,
    (SELECT COUNT(*) FROM FACTURAS) as FACTURAS_CARGADAS;
