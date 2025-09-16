-- =====================================================
-- PROYECTO INTEGRADOR - ETAPA 4 COMPLETA
-- Ejercicio 1 y Ejercicio 2
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- EJERCICIO 1 - PUNTO 1: REPORTE ARTICULOS Y CATEGORIAS
-- =====================================================

SELECT 
    '=== EJERCICIO 1.1: REPORTE ARTICULOS Y CATEGORIAS ===' as TITULO;

SELECT 
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    a.STOCK,
    c.CategoriaID,
    c.Nombre as CATEGORIA,
    c.Descripcion as DESCRIPCION_CATEGORIA
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
ORDER BY c.Nombre, a.NOMBRE;

-- =====================================================
-- EJERCICIO 1 - PUNTO 2: REPORTE CLIENTES Y LOCALIDADES CON FILTROS
-- =====================================================

SELECT 
    '=== EJERCICIO 1.2: CLIENTES Y LOCALIDADES (FILTRADO) ===' as TITULO;

SELECT 
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.CUIT,
    c.DIRECCION,
    c.OBSERVACIONES,
    l.LocalidadID,
    l.Nombre as LOCALIDAD,
    l.CP,
    l.Provincia
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
WHERE c.APELLIDO LIKE 'G%' 
   OR l.Provincia = 'Buenos Aires'
ORDER BY c.APELLIDO, l.Provincia;

-- =====================================================
-- EJERCICIO 1 - PUNTO 3: ARTICULOS CON MAS DE 50 UNIDADES
-- =====================================================

SELECT 
    '=== EJERCICIO 1.3: ARTICULOS CON MAS DE 50 UNIDADES ===' as TITULO;

SELECT 
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    a.STOCK,
    c.Nombre as CATEGORIA,
    CASE 
        WHEN a.STOCK > 100 THEN 'ALTO STOCK'
        WHEN a.STOCK > 75 THEN 'STOCK MEDIO-ALTO'
        WHEN a.STOCK > 50 THEN 'STOCK MEDIO'
        ELSE 'STOCK BAJO'
    END as ESTADO_STOCK
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
WHERE a.STOCK > 50
ORDER BY a.STOCK DESC;

-- =====================================================
-- EJERCICIO 1 - PUNTO 4: COMBINACION DE RESULTADOS
-- =====================================================

SELECT 
    '=== EJERCICIO 1.4: COMBINACION DE ARTICULOS Y DETALLES ===' as TITULO;

SELECT 
    'ARTICULO' as TIPO_REGISTRO,
    a.ARTICULO_ID,
    a.NOMBRE as DESCRIPCION,
    a.STOCK as CANTIDAD,
    a.PRECIO as VALOR_UNITARIO,
    c.Nombre as CATEGORIA,
    NULL as FACTURA_ID,
    NULL as CLIENTE_NOMBRE,
    NULL as FECHA_VENTA
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
WHERE a.STOCK > 50

UNION ALL

SELECT 
    'DETALLE_VENTA' as TIPO_REGISTRO,
    d.DETALLE_ID as ARTICULO_ID,
    CONCAT(a.NOMBRE, ' - Factura ', f.LETRA, f.NUMERO) as DESCRIPCION,
    d.CANTIDAD,
    a.PRECIO as VALOR_UNITARIO,
    c.Nombre as CATEGORIA,
    d.FACTURA_ID,
    CONCAT(cl.NOMBRE, ' ', cl.APELLIDO) as CLIENTE_NOMBRE,
    f.FECHA as FECHA_VENTA
FROM DETALLES d
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
INNER JOIN FACTURAS f ON d.FACTURA_ID = f.FACTURA_ID
INNER JOIN CLIENTES cl ON f.CLIENTE_ID = cl.CLIENTE_ID
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
WHERE a.STOCK > 50

ORDER BY ARTICULO_ID, TIPO_REGISTRO;

-- =====================================================
-- EJERCICIO 2 - PUNTO 1: CLIENTES CON DATOS DE LOCALIDAD
-- =====================================================

SELECT 
    '=== EJERCICIO 2.1: CLIENTES CON DATOS DE LOCALIDAD ===' as TITULO;

SELECT 
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.CUIT,
    c.DIRECCION,
    c.OBSERVACIONES,
    l.LocalidadID,
    l.Nombre as LOCALIDAD,
    l.CP as CODIGO_POSTAL,
    l.Provincia
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
ORDER BY c.APELLIDO, c.NOMBRE;

-- =====================================================
-- EJERCICIO 2 - PUNTO 2: FACTURAS CON DETALLES (SIN INFO DE ARTICULOS)
-- =====================================================

SELECT 
    '=== EJERCICIO 2.2: FACTURAS CON DETALLES (SIN INFO ARTICULOS) ===' as TITULO;

SELECT 
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    f.MONTO as MONTO_TOTAL,
    c.NOMBRE as CLIENTE_NOMBRE,
    c.APELLIDO as CLIENTE_APELLIDO,
    d.DETALLE_ID,
    d.ARTICULO_ID,
    d.CANTIDAD,
    (d.CANTIDAD * (SELECT PRECIO FROM ARTICULOS WHERE ARTICULO_ID = d.ARTICULO_ID)) as SUBTOTAL_DETALLE
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
LEFT JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
ORDER BY f.FACTURA_ID, d.DETALLE_ID;

-- =====================================================
-- EJERCICIO 2 - PUNTO 3: FACTURAS CON DETALLES E INFORMACION DE ARTICULOS
-- =====================================================

SELECT 
    '=== EJERCICIO 2.3: FACTURAS CON DETALLES E INFO DE ARTICULOS ===' as TITULO;

SELECT 
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    f.MONTO as MONTO_TOTAL,
    c.NOMBRE as CLIENTE_NOMBRE,
    c.APELLIDO as CLIENTE_APELLIDO,
    d.DETALLE_ID,
    d.ARTICULO_ID,
    a.NOMBRE as ARTICULO_NOMBRE,
    a.PRECIO as PRECIO_UNITARIO,
    d.CANTIDAD,
    (a.PRECIO * d.CANTIDAD) as SUBTOTAL_DETALLE,
    cat.Nombre as CATEGORIA
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
LEFT JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
LEFT JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
LEFT JOIN CATEGORIA cat ON a.CategoriaID = cat.CategoriaID
ORDER BY f.FACTURA_ID, d.DETALLE_ID;

-- =====================================================
-- EJERCICIO 2 - PUNTO 4: FACTURAS DEL CLIENTE "GARCÍA"
-- =====================================================

SELECT 
    '=== EJERCICIO 2.4: FACTURAS DEL CLIENTE GARCÍA ===' as TITULO;

SELECT 
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    f.MONTO,
    c.CLIENTE_ID,
    c.NOMBRE as CLIENTE_NOMBRE,
    c.APELLIDO as CLIENTE_APELLIDO,
    c.CUIT,
    c.DIRECCION,
    c.OBSERVACIONES,
    l.Nombre as LOCALIDAD,
    l.Provincia
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
WHERE c.APELLIDO = 'García'
ORDER BY f.FECHA DESC;

-- =====================================================
-- EJERCICIO 2 - PUNTO 5: ARTICULOS COMPRADOS POR "LÓPEZ"
-- =====================================================

SELECT 
    '=== EJERCICIO 2.5: ARTICULOS COMPRADOS POR LÓPEZ ===' as TITULO;

SELECT 
    c.CLIENTE_ID,
    c.NOMBRE as CLIENTE_NOMBRE,
    c.APELLIDO as CLIENTE_APELLIDO,
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    d.DETALLE_ID,
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO_NOMBRE,
    a.PRECIO as PRECIO_UNITARIO,
    d.CANTIDAD as CANTIDAD_COMPRADA,
    (a.PRECIO * d.CANTIDAD) as SUBTOTAL,
    cat.Nombre as CATEGORIA,
    cat.Descripcion as DESCRIPCION_CATEGORIA
FROM CLIENTES c
INNER JOIN FACTURAS f ON c.CLIENTE_ID = f.CLIENTE_ID
INNER JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
LEFT JOIN CATEGORIA cat ON a.CategoriaID = cat.CategoriaID
WHERE c.APELLIDO = 'López'
ORDER BY f.FECHA, a.NOMBRE;

-- =====================================================
-- CONSULTAS ADICIONALES DE RESUMEN Y VERIFICACION
-- =====================================================

-- Resumen de facturas por cliente
SELECT 
    '=== RESUMEN DE FACTURAS POR CLIENTE ===' as TITULO;

SELECT 
    c.APELLIDO,
    c.NOMBRE,
    COUNT(f.FACTURA_ID) as CANTIDAD_FACTURAS,
    SUM(f.MONTO) as TOTAL_FACTURADO,
    AVG(f.MONTO) as PROMEDIO_FACTURA,
    MIN(f.FECHA) as PRIMERA_FACTURA,
    MAX(f.FECHA) as ULTIMA_FACTURA
FROM CLIENTES c
LEFT JOIN FACTURAS f ON c.CLIENTE_ID = f.CLIENTE_ID
GROUP BY c.CLIENTE_ID, c.NOMBRE, c.APELLIDO
ORDER BY TOTAL_FACTURADO DESC;

-- Resumen de artículos más vendidos
SELECT 
    '=== RESUMEN DE ARTICULOS MAS VENDIDOS ===' as TITULO;

SELECT 
    a.ARTICULO_ID,
    a.NOMBRE,
    a.PRECIO,
    a.STOCK,
    COUNT(d.DETALLE_ID) as VECES_VENDIDO,
    SUM(d.CANTIDAD) as TOTAL_UNIDADES_VENDIDAS,
    SUM(a.PRECIO * d.CANTIDAD) as TOTAL_VENDIDO,
    cat.Nombre as CATEGORIA
FROM ARTICULOS a
LEFT JOIN DETALLES d ON a.ARTICULO_ID = d.ARTICULO_ID
LEFT JOIN CATEGORIA cat ON a.CategoriaID = cat.CategoriaID
GROUP BY a.ARTICULO_ID, a.NOMBRE, a.PRECIO, a.STOCK, cat.Nombre
ORDER BY TOTAL_UNIDADES_VENDIDAS DESC;

-- Verificación de integridad de datos
SELECT 
    '=== VERIFICACION DE INTEGRIDAD ===' as TITULO;

SELECT 
    'FACTURAS' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(DISTINCT CLIENTE_ID) as CLIENTES_DIFERENTES
FROM FACTURAS

UNION ALL

SELECT 
    'DETALLES' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(DISTINCT FACTURA_ID) as FACTURAS_DIFERENTES
FROM DETALLES

UNION ALL

SELECT 
    'CLIENTES' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(DISTINCT LOCALIDAD_ID) as LOCALIDADES_DIFERENTES
FROM CLIENTES;

-- =====================================================
-- CONSULTA FINAL DE VERIFICACION
-- =====================================================

SELECT 
    'ETAPA 4 COMPLETA EJECUTADA EXITOSAMENTE' as ESTADO,
    NOW() as FECHA_EJECUCION,
    'EJERCICIO 1 Y EJERCICIO 2 COMPLETADOS' as DESCRIPCION,
    (SELECT COUNT(*) FROM CLIENTES) as TOTAL_CLIENTES,
    (SELECT COUNT(*) FROM FACTURAS) as TOTAL_FACTURAS,
    (SELECT COUNT(*) FROM DETALLES) as TOTAL_DETALLES,
    (SELECT COUNT(*) FROM ARTICULOS WHERE STOCK > 50) as ARTICULOS_STOCK_ALTO,
    (SELECT COUNT(*) FROM CLIENTES WHERE APELLIDO LIKE 'G%') as CLIENTES_APELLIDO_G,
    (SELECT COUNT(*) FROM LOCALIDADES WHERE Provincia = 'Buenos Aires') as LOCALIDADES_BUENOS_AIRES,
    (SELECT COUNT(*) FROM CLIENTES WHERE APELLIDO = 'García') as CLIENTES_GARCIA,
    (SELECT COUNT(*) FROM CLIENTES WHERE APELLIDO = 'López') as CLIENTES_LOPEZ;
