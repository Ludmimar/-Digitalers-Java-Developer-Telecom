-- =====================================================
-- PROYECTO INTEGRADOR - ETAPA 4
-- Reportes y Consultas Avanzadas
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- EJERCICIO 1 - PUNTO 1: REPORTE ARTICULOS Y CATEGORIAS
-- =====================================================

-- Listado que incluya tanto los artículos como las categorías en el mismo informe
SELECT 
    '=== REPORTE ARTICULOS Y CATEGORIAS ===' as TITULO;

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

-- Listado que incluya tanto los clientes como las localidades en el mismo informe
-- Filtros: CLIENTES cuyo Apellido comience con 'G' y localidades de 'Buenos Aires'
SELECT 
    '=== REPORTE CLIENTES Y LOCALIDADES (FILTRADO) ===' as TITULO;

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
-- EJERCICIO 1 - PUNTO 3: ARTICULOS CON MAS DE 50 UNIDADES Y DETALLES
-- =====================================================

-- Crear un prompt para mostrar artículos con más de 50 unidades disponibles
-- y luego mostrar los detalles relacionados
SELECT 
    '=== ARTICULOS CON MAS DE 50 UNIDADES DISPONIBLES ===' as TITULO;

-- Primera consulta: Artículos con más de 50 unidades
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

-- Segunda consulta: Detalles relacionados de los artículos con más de 50 unidades
SELECT 
    '=== DETALLES DE VENTAS DE ARTICULOS CON MAS DE 50 UNIDADES ===' as TITULO;

SELECT 
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.STOCK as STOCK_ACTUAL,
    c.Nombre as CATEGORIA,
    COUNT(d.DETALLE_ID) as CANTIDAD_VENTAS,
    SUM(d.CANTIDAD) as TOTAL_UNIDADES_VENDIDAS,
    SUM(a.PRECIO * d.CANTIDAD) as TOTAL_VENDIDO,
    AVG(d.CANTIDAD) as PROMEDIO_UNIDADES_POR_VENTA
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
LEFT JOIN DETALLES d ON a.ARTICULO_ID = d.ARTICULO_ID
WHERE a.STOCK > 50
GROUP BY a.ARTICULO_ID, a.NOMBRE, a.STOCK, c.Nombre
ORDER BY TOTAL_VENDIDO DESC;

-- =====================================================
-- EJERCICIO 1 - PUNTO 4: COMBINACION DE RESULTADOS
-- =====================================================

-- Estrategia que combine los resultados de dos consultas en una sola lista
-- Usando UNION para combinar artículos con stock alto y sus detalles de venta
SELECT 
    '=== COMBINACION DE ARTICULOS Y DETALLES DE VENTAS ===' as TITULO;

-- Consulta combinada usando subconsultas y UNION
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
-- CONSULTAS ADICIONALES DE VERIFICACION
-- =====================================================

-- Verificar estructura de tablas principales
SELECT '=== ESTRUCTURA DE TABLAS ===' as TITULO;
DESCRIBE ARTICULOS;
DESCRIBE CATEGORIA;
DESCRIBE CLIENTES;
DESCRIBE LOCALIDADES;

-- Resumen estadístico
SELECT 
    '=== RESUMEN ESTADISTICO ===' as TITULO;

SELECT 
    'ARTICULOS' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(CASE WHEN STOCK > 50 THEN 1 END) as CON_STOCK_ALTO,
    AVG(STOCK) as STOCK_PROMEDIO,
    MAX(STOCK) as STOCK_MAXIMO,
    MIN(STOCK) as STOCK_MINIMO
FROM ARTICULOS

UNION ALL

SELECT 
    'CLIENTES' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(CASE WHEN APELLIDO LIKE 'G%' THEN 1 END) as APELLIDO_CON_G,
    NULL as STOCK_PROMEDIO,
    NULL as STOCK_MAXIMO,
    NULL as STOCK_MINIMO
FROM CLIENTES

UNION ALL

SELECT 
    'LOCALIDADES' as TABLA,
    COUNT(*) as TOTAL_REGISTROS,
    COUNT(CASE WHEN Provincia = 'Buenos Aires' THEN 1 END) as EN_BUENOS_AIRES,
    NULL as STOCK_PROMEDIO,
    NULL as STOCK_MAXIMO,
    NULL as STOCK_MINIMO
FROM LOCALIDADES;

-- =====================================================
-- CONSULTA FINAL DE VERIFICACION
-- =====================================================

SELECT 
    'ETAPA 4 COMPLETADA EXITOSAMENTE' as ESTADO,
    NOW() as FECHA_EJECUCION,
    (SELECT COUNT(*) FROM ARTICULOS WHERE STOCK > 50) as ARTICULOS_STOCK_ALTO,
    (SELECT COUNT(*) FROM CLIENTES WHERE APELLIDO LIKE 'G%') as CLIENTES_APELLIDO_G,
    (SELECT COUNT(*) FROM LOCALIDADES WHERE Provincia = 'Buenos Aires') as LOCALIDADES_BUENOS_AIRES;
