-- =====================================================
-- PROYECTO INTEGRADOR - ETAPA 5 - EJERCICIO 2
-- Funciones de Fecha y Tiempo
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- EJERCICIO 2.1: FACTURAS DEL AÑO 2021
-- =====================================================

SELECT '=== EJERCICIO 2.1: FACTURAS DEL AÑO 2021 ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total
FROM Facturas
WHERE YEAR(Fecha) = 2021
ORDER BY Fecha;

-- =====================================================
-- EJERCICIO 2.2: FACTURAS DE MARZO Y SEPTIEMBRE 2021
-- =====================================================

SELECT '=== EJERCICIO 2.2: FACTURAS DE MARZO Y SEPTIEMBRE 2021 ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    MONTHNAME(Fecha) as Mes,
    Total
FROM Facturas
WHERE YEAR(Fecha) = 2021 
  AND MONTH(Fecha) IN (3, 9)
ORDER BY Fecha;

-- =====================================================
-- EJERCICIO 2.3: FACTURAS DEL PRIMER DIA DE CADA MES
-- =====================================================

SELECT '=== EJERCICIO 2.3: FACTURAS DEL PRIMER DIA DE CADA MES ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    DAY(Fecha) as Dia,
    MONTHNAME(Fecha) as Mes,
    YEAR(Fecha) as Año,
    Total
FROM Facturas
WHERE DAY(Fecha) = 1
ORDER BY Fecha;

-- =====================================================
-- EJERCICIO 2.4: FACTURAS CON DIAS TRANSCURRIDOS
-- =====================================================

SELECT '=== EJERCICIO 2.4: FACTURAS CON DIAS TRANSCURRIDOS ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    DATEDIFF(CURDATE(), Fecha) as 'DIAS TRANSCURRIDOS'
FROM Facturas
ORDER BY Fecha;

-- =====================================================
-- EJERCICIO 2.5: AGREGAR COLUMNA DIA (NOMBRE DEL DIA)
-- =====================================================

SELECT '=== EJERCICIO 2.5: CON DIAS TRANSCURRIDOS Y NOMBRE DEL DIA ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    DATEDIFF(CURDATE(), Fecha) as 'DIAS TRANSCURRIDOS',
    DAYNAME(Fecha) as 'DIA'
FROM Facturas
ORDER BY Fecha;

-- =====================================================
-- EJERCICIO 2.6: AGREGAR COLUMNA DIA DEL AÑO
-- =====================================================

SELECT '=== EJERCICIO 2.6: CON DIA DEL AÑO ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    DATEDIFF(CURDATE(), Fecha) as 'DIAS TRANSCURRIDOS',
    DAYNAME(Fecha) as 'DIA',
    DAYOFYEAR(Fecha) as 'DIA DEL AÑO'
FROM Facturas
ORDER BY Fecha;

-- =====================================================
-- EJERCICIO 2.7: AGREGAR COLUMNA MES (NOMBRE DEL MES)
-- =====================================================

SELECT '=== EJERCICIO 2.7: CON NOMBRE DEL MES ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    DATEDIFF(CURDATE(), Fecha) as 'DIAS TRANSCURRIDOS',
    DAYNAME(Fecha) as 'DIA',
    DAYOFYEAR(Fecha) as 'DIA DEL AÑO',
    MONTHNAME(Fecha) as 'MES'
FROM Facturas
ORDER BY Fecha;

-- =====================================================
-- EJERCICIO 2.8: AGREGAR COLUMNA PRIMER VENCIMIENTO (30 DIAS)
-- =====================================================

SELECT '=== EJERCICIO 2.8: CON PRIMER VENCIMIENTO (30 DIAS) ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    DATEDIFF(CURDATE(), Fecha) as 'DIAS TRANSCURRIDOS',
    DAYNAME(Fecha) as 'DIA',
    DAYOFYEAR(Fecha) as 'DIA DEL AÑO',
    MONTHNAME(Fecha) as 'MES',
    DATE_ADD(Fecha, INTERVAL 30 DAY) as 'PRIMER VENCIMIENTO'
FROM Facturas
ORDER BY Fecha;

-- =====================================================
-- EJERCICIO 2.9: AGREGAR COLUMNA SEGUNDO VENCIMIENTO (2 MESES)
-- =====================================================

SELECT '=== EJERCICIO 2.9: CON SEGUNDO VENCIMIENTO (2 MESES) ===' as TITULO;

SELECT 
    FacturaID,
    Letra,
    Numero,
    Fecha,
    Total,
    DATEDIFF(CURDATE(), Fecha) as 'DIAS TRANSCURRIDOS',
    DAYNAME(Fecha) as 'DIA',
    DAYOFYEAR(Fecha) as 'DIA DEL AÑO',
    MONTHNAME(Fecha) as 'MES',
    DATE_ADD(Fecha, INTERVAL 30 DAY) as 'PRIMER VENCIMIENTO',
    DATE_ADD(Fecha, INTERVAL 2 MONTH) as 'SEGUNDO VENCIMIENTO'
FROM Facturas
ORDER BY Fecha;

-- =====================================================
-- CONSULTAS DE VERIFICACION Y RESUMEN
-- =====================================================

SELECT '=== RESUMEN DE EJERCICIOS EJECUTADOS ===' as TITULO;

SELECT 
    'EJERCICIO 2.1' as EJERCICIO,
    'Facturas del año 2021' as DESCRIPCION,
    COUNT(*) as TOTAL_FACTURAS
FROM Facturas
WHERE YEAR(Fecha) = 2021

UNION ALL

SELECT 
    'EJERCICIO 2.2' as EJERCICIO,
    'Facturas Marzo y Septiembre 2021' as DESCRIPCION,
    COUNT(*) as TOTAL_FACTURAS
FROM Facturas
WHERE YEAR(Fecha) = 2021 AND MONTH(Fecha) IN (3, 9)

UNION ALL

SELECT 
    'EJERCICIO 2.3' as EJERCICIO,
    'Facturas primer día del mes' as DESCRIPCION,
    COUNT(*) as TOTAL_FACTURAS
FROM Facturas
WHERE DAY(Fecha) = 1

UNION ALL

SELECT 
    'EJERCICIO 2.4-2.9' as EJERCICIO,
    'Todas las facturas con funciones de fecha' as DESCRIPCION,
    COUNT(*) as TOTAL_FACTURAS
FROM Facturas;

-- =====================================================
-- CONSULTAS ADICIONALES DE ANÁLISIS
-- =====================================================

SELECT '=== ANÁLISIS ADICIONAL DE FECHAS ===' as TITULO;

-- Facturas por año
SELECT 
    YEAR(Fecha) as Año,
    COUNT(*) as Cantidad_Facturas,
    SUM(Total) as Total_Facturado,
    AVG(Total) as Promedio_Factura
FROM Facturas
GROUP BY YEAR(Fecha)
ORDER BY Año;

-- Facturas por mes (todos los años)
SELECT 
    MONTHNAME(Fecha) as Mes,
    COUNT(*) as Cantidad_Facturas,
    SUM(Total) as Total_Facturado,
    AVG(Total) as Promedio_Factura
FROM Facturas
GROUP BY MONTH(Fecha), MONTHNAME(Fecha)
ORDER BY MONTH(Fecha);

-- Facturas por día de la semana
SELECT 
    DAYNAME(Fecha) as Dia_Semana,
    COUNT(*) as Cantidad_Facturas,
    SUM(Total) as Total_Facturado,
    AVG(Total) as Promedio_Factura
FROM Facturas
GROUP BY DAYOFWEEK(Fecha), DAYNAME(Fecha)
ORDER BY DAYOFWEEK(Fecha);

-- =====================================================
-- CONSULTA FINAL DE VERIFICACION
-- =====================================================

SELECT 
    'ETAPA 5 - EJERCICIO 2 COMPLETADO EXITOSAMENTE' as ESTADO,
    NOW() as FECHA_EJECUCION,
    (SELECT COUNT(*) FROM Facturas) as TOTAL_FACTURAS,
    (SELECT COUNT(*) FROM Facturas WHERE YEAR(Fecha) = 2021) as FACTURAS_2021,
    (SELECT COUNT(*) FROM Facturas WHERE YEAR(Fecha) = 2021 AND MONTH(Fecha) IN (3, 9)) as FACTURAS_MARZO_SEPT_2021,
    (SELECT COUNT(*) FROM Facturas WHERE DAY(Fecha) = 1) as FACTURAS_PRIMER_DIA,
    (SELECT MIN(Fecha) FROM Facturas) as FECHA_MAS_ANTIGUA,
    (SELECT MAX(Fecha) FROM Facturas) as FECHA_MAS_RECIENTE,
    (SELECT DATEDIFF(MAX(Fecha), MIN(Fecha)) FROM Facturas) as DIAS_ENTRE_PRIMERA_Y_ULTIMA;
