-- =====================================================
-- CONSULTAS DE VERIFICACION - EJERCICIO 2
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- VERIFICACION 1: DATOS BASE PARA EJERCICIO 2
-- =====================================================

SELECT '=== VERIFICACION DE DATOS BASE ===' as TITULO;

-- Verificar clientes existentes
SELECT 
    'CLIENTES' as TABLA,
    CLIENTE_ID,
    NOMBRE,
    APELLIDO,
    CUIT,
    LOCALIDAD_ID
FROM CLIENTES
ORDER BY APELLIDO;

-- Verificar localidades existentes
SELECT 
    'LOCALIDADES' as TABLA,
    LocalidadID,
    Nombre,
    CP,
    Provincia
FROM LOCALIDADES
ORDER BY Provincia, Nombre;

-- Verificar facturas existentes
SELECT 
    'FACTURAS' as TABLA,
    FACTURA_ID,
    LETRA,
    NUMERO,
    CLIENTE_ID,
    FECHA,
    MONTO
FROM FACTURAS
ORDER BY FECHA;

-- =====================================================
-- VERIFICACION 2: RELACIONES CLIENTES-LOCALIDADES
-- =====================================================

SELECT '=== RELACIONES CLIENTES-LOCALIDADES ===' as TITULO;

SELECT 
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.LOCALIDAD_ID,
    l.Nombre as LOCALIDAD,
    l.Provincia,
    CASE 
        WHEN l.LocalidadID IS NULL THEN 'SIN LOCALIDAD'
        ELSE 'CON LOCALIDAD'
    END as ESTADO_LOCALIDAD
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
ORDER BY c.APELLIDO;

-- =====================================================
-- VERIFICACION 3: RELACIONES FACTURAS-DETALLES
-- =====================================================

SELECT '=== RELACIONES FACTURAS-DETALLES ===' as TITULO;

SELECT 
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.CLIENTE_ID,
    f.MONTO as MONTO_FACTURA,
    COUNT(d.DETALLE_ID) as CANTIDAD_DETALLES,
    SUM(d.CANTIDAD) as TOTAL_UNIDADES,
    CASE 
        WHEN COUNT(d.DETALLE_ID) = 0 THEN 'SIN DETALLES'
        ELSE 'CON DETALLES'
    END as ESTADO_DETALLES
FROM FACTURAS f
LEFT JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
GROUP BY f.FACTURA_ID, f.LETRA, f.NUMERO, f.CLIENTE_ID, f.MONTO
ORDER BY f.FACTURA_ID;

-- =====================================================
-- VERIFICACION 4: CLIENTES ESPECIFICOS (GARCÍA Y LÓPEZ)
-- =====================================================

SELECT '=== CLIENTES ESPECIFICOS ===' as TITULO;

-- Cliente García
SELECT 
    'GARCÍA' as CLIENTE_BUSCADO,
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.CUIT,
    l.Nombre as LOCALIDAD,
    l.Provincia
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
WHERE c.APELLIDO = 'García';

-- Cliente López
SELECT 
    'LÓPEZ' as CLIENTE_BUSCADO,
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.CUIT,
    l.Nombre as LOCALIDAD,
    l.Provincia
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
WHERE c.APELLIDO = 'López';

-- =====================================================
-- VERIFICACION 5: FACTURAS DE CLIENTES ESPECIFICOS
-- =====================================================

SELECT '=== FACTURAS DE CLIENTES ESPECIFICOS ===' as TITULO;

-- Facturas de García
SELECT 
    'GARCÍA' as CLIENTE,
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    f.MONTO,
    c.NOMBRE,
    c.APELLIDO
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
WHERE c.APELLIDO = 'García';

-- Facturas de López
SELECT 
    'LÓPEZ' as CLIENTE,
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    f.MONTO,
    c.NOMBRE,
    c.APELLIDO
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
WHERE c.APELLIDO = 'López';

-- =====================================================
-- VERIFICACION 6: ARTICULOS COMPRADOS POR CLIENTES ESPECIFICOS
-- =====================================================

SELECT '=== ARTICULOS COMPRADOS POR CLIENTES ESPECIFICOS ===' as TITULO;

-- Artículos comprados por García
SELECT 
    'GARCÍA' as CLIENTE,
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    d.CANTIDAD,
    (a.PRECIO * d.CANTIDAD) as SUBTOTAL,
    f.FACTURA_ID,
    f.FECHA
FROM CLIENTES c
INNER JOIN FACTURAS f ON c.CLIENTE_ID = f.CLIENTE_ID
INNER JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
WHERE c.APELLIDO = 'García'
ORDER BY f.FECHA;

-- Artículos comprados por López
SELECT 
    'LÓPEZ' as CLIENTE,
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    d.CANTIDAD,
    (a.PRECIO * d.CANTIDAD) as SUBTOTAL,
    f.FACTURA_ID,
    f.FECHA
FROM CLIENTES c
INNER JOIN FACTURAS f ON c.CLIENTE_ID = f.CLIENTE_ID
INNER JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
WHERE c.APELLIDO = 'López'
ORDER BY f.FECHA;

-- =====================================================
-- VERIFICACION 7: RESUMEN ESTADISTICO
-- =====================================================

SELECT '=== RESUMEN ESTADISTICO ===' as TITULO;

-- Resumen por cliente
SELECT 
    c.APELLIDO,
    c.NOMBRE,
    COUNT(f.FACTURA_ID) as FACTURAS,
    COALESCE(SUM(f.MONTO), 0) as TOTAL_FACTURADO,
    COUNT(d.DETALLE_ID) as DETALLES_COMPRADOS,
    COUNT(DISTINCT d.ARTICULO_ID) as ARTICULOS_DIFERENTES
FROM CLIENTES c
LEFT JOIN FACTURAS f ON c.CLIENTE_ID = f.CLIENTE_ID
LEFT JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
GROUP BY c.CLIENTE_ID, c.NOMBRE, c.APELLIDO
ORDER BY TOTAL_FACTURADO DESC;

-- Resumen por artículo
SELECT 
    a.ARTICULO_ID,
    a.NOMBRE,
    a.STOCK,
    COUNT(d.DETALLE_ID) as VECES_VENDIDO,
    SUM(d.CANTIDAD) as TOTAL_UNIDADES_VENDIDAS,
    SUM(a.PRECIO * d.CANTIDAD) as TOTAL_VENDIDO
FROM ARTICULOS a
LEFT JOIN DETALLES d ON a.ARTICULO_ID = d.ARTICULO_ID
GROUP BY a.ARTICULO_ID, a.NOMBRE, a.STOCK
ORDER BY TOTAL_UNIDADES_VENDIDAS DESC;

-- =====================================================
-- VERIFICACION 8: INTEGRIDAD DE DATOS
-- =====================================================

SELECT '=== VERIFICACION DE INTEGRIDAD ===' as TITULO;

-- Verificar claves foráneas válidas
SELECT 
    'INTEGRIDAD' as TIPO,
    'FACTURAS-CLIENTES' as RELACION,
    COUNT(*) as REGISTROS_VALIDOS
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID

UNION ALL

SELECT 
    'INTEGRIDAD' as TIPO,
    'DETALLES-FACTURAS' as RELACION,
    COUNT(*) as REGISTROS_VALIDOS
FROM DETALLES d
INNER JOIN FACTURAS f ON d.FACTURA_ID = f.FACTURA_ID

UNION ALL

SELECT 
    'INTEGRIDAD' as TIPO,
    'DETALLES-ARTICULOS' as RELACION,
    COUNT(*) as REGISTROS_VALIDOS
FROM DETALLES d
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID

UNION ALL

SELECT 
    'INTEGRIDAD' as TIPO,
    'CLIENTES-LOCALIDADES' as RELACION,
    COUNT(*) as REGISTROS_VALIDOS
FROM CLIENTES c
INNER JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID;

-- =====================================================
-- VERIFICACION 9: DATOS ESPECIFICOS PARA EJERCICIO 2
-- =====================================================

SELECT '=== DATOS ESPECIFICOS PARA EJERCICIO 2 ===' as TITULO;

-- Contar registros que cumplen los criterios del ejercicio
SELECT 
    'CRITERIOS_EJERCICIO_2' as TIPO,
    (SELECT COUNT(*) FROM CLIENTES) as TOTAL_CLIENTES,
    (SELECT COUNT(*) FROM CLIENTES WHERE LOCALIDAD_ID IS NOT NULL) as CLIENTES_CON_LOCALIDAD,
    (SELECT COUNT(*) FROM FACTURAS) as TOTAL_FACTURAS,
    (SELECT COUNT(*) FROM DETALLES) as TOTAL_DETALLES,
    (SELECT COUNT(*) FROM CLIENTES WHERE APELLIDO = 'García') as CLIENTES_GARCIA,
    (SELECT COUNT(*) FROM CLIENTES WHERE APELLIDO = 'López') as CLIENTES_LOPEZ,
    (SELECT COUNT(*) FROM FACTURAS f INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID WHERE c.APELLIDO = 'García') as FACTURAS_GARCIA,
    (SELECT COUNT(*) FROM FACTURAS f INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID WHERE c.APELLIDO = 'López') as FACTURAS_LOPEZ;

-- =====================================================
-- VERIFICACION FINAL
-- =====================================================

SELECT 
    'VERIFICACION EJERCICIO 2 COMPLETADA' as ESTADO,
    NOW() as FECHA_VERIFICACION,
    'TODOS LOS DATOS ESTAN LISTOS PARA EL EJERCICIO 2' as MENSAJE;
