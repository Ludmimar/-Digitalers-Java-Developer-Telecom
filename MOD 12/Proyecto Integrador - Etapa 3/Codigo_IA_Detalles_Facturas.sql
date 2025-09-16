-- =====================================================
-- CÓDIGO GENERADO POR IA - TABLA DETALLES
-- 15 registros para la tabla DETALLES
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- Limpiar tabla DETALLES para empezar desde cero
TRUNCATE TABLE DETALLES;

-- =====================================================
-- INSERTAR 15 REGISTROS EN LA TABLA DETALLES
-- =====================================================

-- Detalles para Factura 1 (Gloria Fernández - Monto: 1589.50)
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(335, 1, 1); -- Lavasecarropas Automático Samsung (1589.50)

-- Detalles para Factura 2 (Carlos García - Monto: 979.75)
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(157, 2, 1); -- Apple AirPods Pro (979.75)

-- Detalles para Factura 3 (Gonzalo López - Monto: 513.35)
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(95, 3, 1); -- Webcam con Micrófono Plug & Play (513.35)

-- Detalles para Factura 4 (Santiago González - Monto: 2385.70)
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(411, 4, 1); -- Gloria Trevi / Gloria / CD+DVD (2385.70)

-- Detalles para Factura 5 (Micaela Altieri - Monto: 979.75)
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(157, 5, 1); -- Apple AirPods Pro (979.75)

-- Registros adicionales para completar 15 registros
-- Factura 1 - Agregar más productos
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(95, 1, 2); -- Webcam con Micrófono Plug & Play (cantidad: 2)

-- Factura 2 - Agregar más productos
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(411, 2, 1); -- Gloria Trevi / Gloria / CD+DVD (cantidad: 1)

-- Factura 3 - Agregar más productos
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(157, 3, 3); -- Apple AirPods Pro (cantidad: 3)

-- Factura 4 - Agregar más productos
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(335, 4, 2); -- Lavasecarropas Automático Samsung (cantidad: 2)

-- Factura 5 - Agregar más productos
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(95, 5, 4); -- Webcam con Micrófono Plug & Play (cantidad: 4)

-- Registros adicionales para completar los 15
INSERT INTO DETALLES (ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(157, 1, 1); -- Apple AirPods Pro en Factura 1
(335, 2, 1); -- Lavasecarropas en Factura 2
(411, 3, 1); -- Gloria Trevi en Factura 3
(95, 4, 1);  -- Webcam en Factura 4
(335, 5, 1); -- Lavasecarropas en Factura 5

-- =====================================================
-- CONSULTAS DE VERIFICACIÓN
-- =====================================================

-- Verificar cantidad de registros insertados
SELECT 'DETALLES' as TABLA, COUNT(*) as REGISTROS_INSERTADOS FROM DETALLES;

-- Mostrar todos los detalles con información de artículos y facturas
SELECT 
    d.DETALLE_ID,
    d.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    c.NOMBRE as CLIENTE,
    d.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    d.CANTIDAD,
    (a.PRECIO * d.CANTIDAD) as SUBTOTAL
FROM DETALLES d
INNER JOIN FACTURAS f ON d.FACTURA_ID = f.FACTURA_ID
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
ORDER BY d.FACTURA_ID, d.DETALLE_ID;

-- Resumen por factura
SELECT 
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    c.NOMBRE as CLIENTE,
    f.MONTO as MONTO_FACTURA,
    COUNT(d.DETALLE_ID) as CANTIDAD_ITEMS,
    SUM(d.CANTIDAD) as TOTAL_UNIDADES,
    SUM(a.PRECIO * d.CANTIDAD) as TOTAL_CALCULADO
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
LEFT JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
LEFT JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
GROUP BY f.FACTURA_ID, f.LETRA, f.NUMERO, c.NOMBRE, f.MONTO
ORDER BY f.FACTURA_ID;

-- Resumen por artículo
SELECT 
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    COUNT(d.DETALLE_ID) as VECES_VENDIDO,
    SUM(d.CANTIDAD) as TOTAL_UNIDADES_VENDIDAS,
    SUM(a.PRECIO * d.CANTIDAD) as TOTAL_VENDIDO
FROM ARTICULOS a
LEFT JOIN DETALLES d ON a.ARTICULO_ID = d.ARTICULO_ID
GROUP BY a.ARTICULO_ID, a.NOMBRE, a.PRECIO
ORDER BY TOTAL_VENDIDO DESC;

-- Verificar integridad referencial
SELECT 
    'VERIFICACIÓN DE INTEGRIDAD' as TIPO,
    COUNT(*) as TOTAL_DETALLES,
    COUNT(DISTINCT FACTURA_ID) as FACTURAS_CON_DETALLES,
    COUNT(DISTINCT ARTICULO_ID) as ARTICULOS_VENDIDOS
FROM DETALLES;

-- =====================================================
-- RESUMEN FINAL
-- =====================================================

SELECT 
    'CARGA DE DETALLES COMPLETADA' as ESTADO,
    (SELECT COUNT(*) FROM DETALLES) as DETALLES_INSERTADOS,
    (SELECT COUNT(DISTINCT FACTURA_ID) FROM DETALLES) as FACTURAS_CON_DETALLES,
    (SELECT COUNT(DISTINCT ARTICULO_ID) FROM DETALLES) as ARTICULOS_INCLUIDOS,
    (SELECT SUM(CANTIDAD) FROM DETALLES) as TOTAL_UNIDADES_VENDIDAS;
