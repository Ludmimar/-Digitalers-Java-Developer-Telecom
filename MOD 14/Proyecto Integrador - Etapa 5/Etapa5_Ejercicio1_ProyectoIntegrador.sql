-- =====================================================
-- PROYECTO INTEGRADOR - ETAPA 5 - EJERCICIO 1
-- Funciones de Cadena y Matemáticas
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- EJERCICIO 1.1: CONCAT - NOMBRE COMPLETO CON GUION
-- =====================================================

SELECT '=== EJERCICIO 1.1: CONCAT - NOMBRE COMPLETO CON GUION ===' as TITULO;

SELECT 
    ClienteID,
    Dirección,
    CONCAT(Apellido, '-', Nombre) as 'Nombre completo'
FROM Clientes
ORDER BY Apellido, Nombre;

-- =====================================================
-- EJERCICIO 1.2: CONCAT_WS - NOMBRE COMPLETO CON GUION
-- =====================================================

SELECT '=== EJERCICIO 1.2: CONCAT_WS - NOMBRE COMPLETO CON GUION ===' as TITULO;

SELECT 
    ClienteID,
    Dirección,
    CONCAT_WS('-', Apellido, Nombre) as 'Nombre completo'
FROM Clientes
ORDER BY Apellido, Nombre;

-- =====================================================
-- EJERCICIO 1.3: CONCAT_WS CON NOMBRE EN MAYUSCULAS
-- =====================================================

SELECT '=== EJERCICIO 1.3: CONCAT_WS CON NOMBRE EN MAYUSCULAS ===' as TITULO;

SELECT 
    ClienteID,
    Dirección,
    CONCAT_WS('-', Apellido, UPPER(Nombre)) as 'Nombre completo'
FROM Clientes
ORDER BY Apellido, Nombre;

-- =====================================================
-- EJERCICIO 1.4: INICIAL DEL NOMBRE
-- =====================================================

SELECT '=== EJERCICIO 1.4: INICIAL DEL NOMBRE ===' as TITULO;

SELECT 
    Nombre,
    LEFT(Nombre, 1) as 'Inicial'
FROM Clientes
ORDER BY Nombre;

-- =====================================================
-- EJERCICIO 1.5: CALCULO DE IVA (21%)
-- =====================================================

SELECT '=== EJERCICIO 1.5: CALCULO DE IVA (21%) ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    ROUND((Total * 0.21), 2) as 'IVA'
FROM Facturas
ORDER BY FacturaID;

-- =====================================================
-- EJERCICIO 1.6: CALCULO DE NETO (TOTAL + IVA)
-- =====================================================

SELECT '=== EJERCICIO 1.6: CALCULO DE NETO (TOTAL + IVA) ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    ROUND((Total * 0.21), 2) as 'IVA',
    ROUND((Total + (Total * 0.21)), 2) as 'NETO'
FROM Facturas
ORDER BY FacturaID;

-- =====================================================
-- EJERCICIO 1.7: REDONDEO A FAVOR DEL CLIENTE
-- =====================================================

SELECT '=== EJERCICIO 1.7: REDONDEO A FAVOR DEL CLIENTE ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    ROUND((Total * 0.21), 2) as 'IVA',
    ROUND((Total + (Total * 0.21)), 2) as 'NETO',
    FLOOR(ROUND((Total + (Total * 0.21)), 2)) as 'REDONDEO A FAVOR CLIENTE'
FROM Facturas
ORDER BY FacturaID;

-- =====================================================
-- CONSULTAS DE VERIFICACION Y RESUMEN
-- =====================================================

SELECT '=== RESUMEN DE EJERCICIOS EJECUTADOS ===' as TITULO;

SELECT 
    'EJERCICIO 1.1' as EJERCICIO,
    'CONCAT con guion' as DESCRIPCION,
    COUNT(*) as TOTAL_CLIENTES
FROM Clientes

UNION ALL

SELECT 
    'EJERCICIO 1.2' as EJERCICIO,
    'CONCAT_WS con guion' as DESCRIPCION,
    COUNT(*) as TOTAL_CLIENTES
FROM Clientes

UNION ALL

SELECT 
    'EJERCICIO 1.3' as EJERCICIO,
    'CONCAT_WS con UPPER' as DESCRIPCION,
    COUNT(*) as TOTAL_CLIENTES
FROM Clientes

UNION ALL

SELECT 
    'EJERCICIO 1.4' as EJERCICIO,
    'LEFT para inicial' as DESCRIPCION,
    COUNT(*) as TOTAL_CLIENTES
FROM Clientes

UNION ALL

SELECT 
    'EJERCICIO 1.5' as EJERCICIO,
    'IVA 21%' as DESCRIPCION,
    COUNT(*) as TOTAL_FACTURAS
FROM Facturas

UNION ALL

SELECT 
    'EJERCICIO 1.6' as EJERCICIO,
    'NETO (Total + IVA)' as DESCRIPCION,
    COUNT(*) as TOTAL_FACTURAS
FROM Facturas

UNION ALL

SELECT 
    'EJERCICIO 1.7' as EJERCICIO,
    'FLOOR del NETO' as DESCRIPCION,
    COUNT(*) as TOTAL_FACTURAS
FROM Facturas;

-- =====================================================
-- CONSULTA FINAL DE VERIFICACION
-- =====================================================

SELECT 
    'ETAPA 5 - EJERCICIO 1 COMPLETADO EXITOSAMENTE' as ESTADO,
    NOW() as FECHA_EJECUCION,
    (SELECT COUNT(*) FROM Clientes) as TOTAL_CLIENTES,
    (SELECT COUNT(*) FROM Facturas) as TOTAL_FACTURAS,
    (SELECT SUM(Total) FROM Facturas) as SUMA_TOTAL_FACTURAS,
    (SELECT SUM(ROUND((Total * 0.21), 2)) FROM Facturas) as SUMA_IVA_TOTAL,
    (SELECT SUM(ROUND((Total + (Total * 0.21)), 2)) FROM Facturas) as SUMA_NETO_TOTAL;
