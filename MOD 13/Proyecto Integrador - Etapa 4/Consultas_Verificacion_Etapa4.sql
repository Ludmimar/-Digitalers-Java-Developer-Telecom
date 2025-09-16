-- =====================================================
-- CONSULTAS DE VERIFICACION - ETAPA 4
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- VERIFICACION 1: ESTRUCTURA DE DATOS ACTUAL
-- =====================================================

SELECT '=== VERIFICACION DE ESTRUCTURA DE DATOS ===' as TITULO;

-- Contar registros en cada tabla
SELECT 
    'ARTICULOS' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(CASE WHEN STOCK > 50 THEN 1 END) as CON_STOCK_MAYOR_50
FROM ARTICULOS

UNION ALL

SELECT 
    'CATEGORIA' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    NULL as CON_STOCK_MAYOR_50
FROM CATEGORIA

UNION ALL

SELECT 
    'CLIENTES' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(CASE WHEN APELLIDO LIKE 'G%' THEN 1 END) as CON_STOCK_MAYOR_50
FROM CLIENTES

UNION ALL

SELECT 
    'LOCALIDADES' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(CASE WHEN Provincia = 'Buenos Aires' THEN 1 END) as CON_STOCK_MAYOR_50
FROM LOCALIDADES

UNION ALL

SELECT 
    'DETALLES' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    NULL as CON_STOCK_MAYOR_50
FROM DETALLES;

-- =====================================================
-- VERIFICACION 2: ARTICULOS CON STOCK > 50
-- =====================================================

SELECT '=== ARTICULOS CON STOCK MAYOR A 50 UNIDADES ===' as TITULO;

SELECT 
    ARTICULO_ID,
    NOMBRE,
    PRECIO,
    STOCK,
    CASE 
        WHEN STOCK > 100 THEN 'ALTO STOCK (>100)'
        WHEN STOCK > 75 THEN 'STOCK MEDIO-ALTO (75-100)'
        WHEN STOCK > 50 THEN 'STOCK MEDIO (50-75)'
        ELSE 'STOCK BAJO (<50)'
    END as CLASIFICACION_STOCK
FROM ARTICULOS
WHERE STOCK > 50
ORDER BY STOCK DESC;

-- =====================================================
-- VERIFICACION 3: CLIENTES CON APELLIDO QUE COMIENCE CON 'G'
-- =====================================================

SELECT '=== CLIENTES CON APELLIDO QUE COMIENCE CON G ===' as TITULO;

SELECT 
    CLIENTE_ID,
    NOMBRE,
    APELLIDO,
    CUIT,
    DIRECCION,
    OBSERVACIONES
FROM CLIENTES
WHERE APELLIDO LIKE 'G%'
ORDER BY APELLIDO;

-- =====================================================
-- VERIFICACION 4: LOCALIDADES DE BUENOS AIRES
-- =====================================================

SELECT '=== LOCALIDADES DE BUENOS AIRES ===' as TITULO;

SELECT 
    LocalidadID,
    Nombre,
    CP,
    Provincia
FROM LOCALIDADES
WHERE Provincia = 'Buenos Aires'
ORDER BY Nombre;

-- =====================================================
-- VERIFICACION 5: RELACIONES ENTRE TABLAS
-- =====================================================

SELECT '=== VERIFICACION DE RELACIONES ===' as TITULO;

-- Artículos con categorías
SELECT 
    'ARTICULOS-CATEGORIA' as RELACION,
    COUNT(*) as TOTAL_ARTICULOS,
    COUNT(c.CategoriaID) as CON_CATEGORIA,
    COUNT(*) - COUNT(c.CategoriaID) as SIN_CATEGORIA
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID;

-- Clientes con localidades
SELECT 
    'CLIENTES-LOCALIDADES' as RELACION,
    COUNT(*) as TOTAL_CLIENTES,
    COUNT(l.LocalidadID) as CON_LOCALIDAD,
    COUNT(*) - COUNT(l.LocalidadID) as SIN_LOCALIDAD
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID;

-- Detalles con artículos y facturas
SELECT 
    'DETALLES-ARTICULOS-FACTURAS' as RELACION,
    COUNT(*) as TOTAL_DETALLES,
    COUNT(DISTINCT d.ARTICULO_ID) as ARTICULOS_DIFERENTES,
    COUNT(DISTINCT d.FACTURA_ID) as FACTURAS_DIFERENTES
FROM DETALLES d
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
INNER JOIN FACTURAS f ON d.FACTURA_ID = f.FACTURA_ID;

-- =====================================================
-- VERIFICACION 6: DATOS ESPECIFICOS PARA LOS REPORTES
-- =====================================================

SELECT '=== DATOS PARA REPORTES DE LA ETAPA 4 ===' as TITULO;

-- Clientes con apellido G y localidades de Buenos Aires
SELECT 
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.CUIT,
    l.Nombre as LOCALIDAD,
    l.Provincia,
    CASE 
        WHEN c.APELLIDO LIKE 'G%' THEN 'APELLIDO_G'
        WHEN l.Provincia = 'Buenos Aires' THEN 'LOCALIDAD_BA'
        ELSE 'OTRO'
    END as FILTRO_APLICADO
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
WHERE c.APELLIDO LIKE 'G%' OR l.Provincia = 'Buenos Aires'
ORDER BY c.APELLIDO, l.Provincia;

-- Artículos con stock alto y sus detalles de venta
SELECT 
    a.ARTICULO_ID,
    a.NOMBRE,
    a.STOCK,
    COUNT(d.DETALLE_ID) as VENTAS_REALIZADAS,
    SUM(d.CANTIDAD) as TOTAL_UNIDADES_VENDIDAS,
    SUM(a.PRECIO * d.CANTIDAD) as TOTAL_VENDIDO
FROM ARTICULOS a
LEFT JOIN DETALLES d ON a.ARTICULO_ID = d.ARTICULO_ID
WHERE a.STOCK > 50
GROUP BY a.ARTICULO_ID, a.NOMBRE, a.STOCK
ORDER BY a.STOCK DESC;

-- =====================================================
-- VERIFICACION 7: INTEGRIDAD DE DATOS
-- =====================================================

SELECT '=== VERIFICACION DE INTEGRIDAD ===' as TITULO;

-- Verificar claves foráneas válidas
SELECT 
    'CLAVES_FORANEAS' as TIPO_VERIFICACION,
    'ARTICULOS.CategoriaID -> CATEGORIA.CategoriaID' as RELACION,
    COUNT(*) as REGISTROS_VALIDOS
FROM ARTICULOS a
INNER JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID

UNION ALL

SELECT 
    'CLAVES_FORANEAS' as TIPO_VERIFICACION,
    'CLIENTES.LOCALIDAD_ID -> LOCALIDADES.LocalidadID' as RELACION,
    COUNT(*) as REGISTROS_VALIDOS
FROM CLIENTES c
INNER JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID

UNION ALL

SELECT 
    'CLAVES_FORANEAS' as TIPO_VERIFICACION,
    'DETALLES.ARTICULO_ID -> ARTICULOS.ARTICULO_ID' as RELACION,
    COUNT(*) as REGISTROS_VALIDOS
FROM DETALLES d
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID

UNION ALL

SELECT 
    'CLAVES_FORANEAS' as TIPO_VERIFICACION,
    'DETALLES.FACTURA_ID -> FACTURAS.FACTURA_ID' as RELACION,
    COUNT(*) as REGISTROS_VALIDOS
FROM DETALLES d
INNER JOIN FACTURAS f ON d.FACTURA_ID = f.FACTURA_ID;

-- =====================================================
-- RESUMEN FINAL DE VERIFICACION
-- =====================================================

SELECT 
    'VERIFICACION COMPLETADA' as ESTADO,
    NOW() as FECHA_VERIFICACION,
    (SELECT COUNT(*) FROM ARTICULOS) as TOTAL_ARTICULOS,
    (SELECT COUNT(*) FROM ARTICULOS WHERE STOCK > 50) as ARTICULOS_STOCK_ALTO,
    (SELECT COUNT(*) FROM CLIENTES WHERE APELLIDO LIKE 'G%') as CLIENTES_APELLIDO_G,
    (SELECT COUNT(*) FROM LOCALIDADES WHERE Provincia = 'Buenos Aires') as LOCALIDADES_BA,
    (SELECT COUNT(*) FROM DETALLES) as TOTAL_DETALLES;
