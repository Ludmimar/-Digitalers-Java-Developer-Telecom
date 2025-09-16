-- =====================================================
-- PROYECTO INTEGRADOR ETAPA 01 - TECNO_PRJ
-- Consultas Diversas con Operadores de Comparación y Lógicos
-- =====================================================

USE TECNO_PRJ;

-- =====================================================
-- 1. CONSULTAS BÁSICAS CON OPERADORES DE COMPARACIÓN
-- =====================================================

-- 1.1 Clientes con CUIT que empieza con "20" (personas físicas)
SELECT ClienteID, Nombre, Apellido, CUIT
FROM CLIENTES
WHERE CUIT LIKE '20%';

-- 1.2 Artículos con precio mayor a $50,000
SELECT ArticuloID, Nombre, Precio
FROM ARTICULOS
WHERE Precio > 50000;

-- 1.3 Artículos con precio menor o igual a $10,000
SELECT ArticuloID, Nombre, Precio
FROM ARTICULOS
WHERE Precio <= 10000;

-- 1.4 Facturas del mes de enero de 2024
SELECT FacturaID, Letra, Numero, Fecha, Monto
FROM FACTURAS
WHERE Fecha >= '2024-01-01' AND Fecha <= '2024-01-31';

-- 1.5 Artículos con stock entre 10 y 30 unidades
SELECT ArticuloID, Nombre, Stock
FROM ARTICULOS
WHERE Stock BETWEEN 10 AND 30;

-- =====================================================
-- 2. CONSULTAS CON OPERADORES LÓGICOS (AND, OR, NOT)
-- =====================================================

-- 2.1 Clientes que son personas físicas Y tienen comentarios
SELECT ClienteID, Nombre, Apellido, CUIT, Comentarios
FROM CLIENTES
WHERE CUIT LIKE '20%' AND Comentarios IS NOT NULL;

-- 2.2 Artículos caros O con stock bajo
SELECT ArticuloID, Nombre, Precio, Stock
FROM ARTICULOS
WHERE Precio > 80000 OR Stock < 15;

-- 2.3 Facturas tipo A O B con monto mayor a $100,000
SELECT FacturaID, Letra, Numero, Monto
FROM FACTURAS
WHERE (Letra = 'A' OR Letra = 'B') AND Monto > 100000;

-- 2.4 Clientes que NO son personas jurídicas
SELECT ClienteID, Nombre, Apellido, CUIT
FROM CLIENTES
WHERE NOT CUIT LIKE '27%';

-- 2.5 Artículos que NO son laptops NI smartphones
SELECT ArticuloID, Nombre, Precio
FROM ARTICULOS
WHERE NOT (Nombre LIKE '%Laptop%' OR Nombre LIKE '%Smartphone%');

-- =====================================================
-- 3. CONSULTAS COMPLEJAS CON MÚLTIPLES OPERADORES
-- =====================================================

-- 3.1 Clientes con facturas de más de $50,000 en enero
SELECT DISTINCT c.ClienteID, c.Nombre, c.Apellido, f.Monto
FROM CLIENTES c
JOIN FACTURAS f ON c.ClienteID = f.ClienteID
WHERE f.Monto > 50000 AND f.Fecha BETWEEN '2024-01-01' AND '2024-01-31';

-- 3.2 Artículos vendidos en cantidades mayores a 1
SELECT a.Nombre, d.Cantidad, f.Letra, f.Numero
FROM ARTICULOS a
JOIN DETALLE d ON a.ArticuloID = d.ArticuloID
JOIN FACTURAS f ON d.FacturaID = f.FacturaID
WHERE d.Cantidad > 1;

-- 3.3 Top 5 clientes por monto total de compras
SELECT c.ClienteID, c.Nombre, c.Apellido, SUM(f.Monto) AS TotalCompras
FROM CLIENTES c
JOIN FACTURAS f ON c.ClienteID = f.ClienteID
GROUP BY c.ClienteID, c.Nombre, c.Apellido
ORDER BY TotalCompras DESC
LIMIT 5;

-- 3.4 Artículos más vendidos (por cantidad total)
SELECT a.Nombre, SUM(d.Cantidad) AS TotalVendido, COUNT(DISTINCT d.FacturaID) AS Facturas
FROM ARTICULOS a
JOIN DETALLE d ON a.ArticuloID = d.ArticuloID
GROUP BY a.ArticuloID, a.Nombre
ORDER BY TotalVendido DESC;

-- =====================================================
-- 4. CONSULTAS CON FUNCIONES DE AGREGACIÓN
-- =====================================================

-- 4.1 Estadísticas generales de ventas
SELECT 
    COUNT(*) AS TotalFacturas,
    SUM(Monto) AS TotalVentas,
    AVG(Monto) AS PromedioFactura,
    MIN(Monto) AS FacturaMinima,
    MAX(Monto) AS FacturaMaxima
FROM FACTURAS;

-- 4.2 Ventas por tipo de factura
SELECT 
    Letra,
    COUNT(*) AS CantidadFacturas,
    SUM(Monto) AS TotalVentas,
    AVG(Monto) AS PromedioFactura
FROM FACTURAS
GROUP BY Letra;

-- 4.3 Inventario total por valor
SELECT 
    COUNT(*) AS TotalArticulos,
    SUM(Stock) AS TotalStock,
    SUM(Precio * Stock) AS ValorInventario
FROM ARTICULOS;

-- =====================================================
-- 5. CONSULTAS CON SUBCONSULTAS
-- =====================================================

-- 5.1 Clientes que han comprado laptops
SELECT ClienteID, Nombre, Apellido
FROM CLIENTES
WHERE ClienteID IN (
    SELECT DISTINCT f.ClienteID
    FROM FACTURAS f
    JOIN DETALLE d ON f.FacturaID = d.FacturaID
    JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
    WHERE a.Nombre LIKE '%Laptop%'
);

-- 5.2 Artículos que nunca se han vendido
SELECT ArticuloID, Nombre, Precio, Stock
FROM ARTICULOS
WHERE ArticuloID NOT IN (
    SELECT DISTINCT ArticuloID
    FROM DETALLE
);

-- 5.3 Facturas con monto superior al promedio
SELECT FacturaID, Letra, Numero, Monto
FROM FACTURAS
WHERE Monto > (
    SELECT AVG(Monto)
    FROM FACTURAS
);

-- =====================================================
-- 6. CONSULTAS CON JOINS COMPLEJOS
-- =====================================================

-- 6.1 Vista completa de todas las ventas con detalles
SELECT 
    f.Letra,
    f.Numero,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    f.Fecha,
    a.Nombre AS Articulo,
    d.Cantidad,
    a.Precio,
    (d.Cantidad * a.Precio) AS Subtotal,
    f.Monto AS TotalFactura
FROM FACTURAS f
JOIN CLIENTES c ON f.ClienteID = c.ClienteID
JOIN DETALLE d ON f.FacturaID = d.FacturaID
JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
ORDER BY f.FacturaID, d.DetalleID;

-- 6.2 Reporte de ventas por cliente y artículo
SELECT 
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    a.Nombre AS Articulo,
    SUM(d.Cantidad) AS TotalCantidad,
    SUM(d.Cantidad * a.Precio) AS TotalVendido
FROM CLIENTES c
JOIN FACTURAS f ON c.ClienteID = f.ClienteID
JOIN DETALLE d ON f.FacturaID = d.FacturaID
JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
GROUP BY c.ClienteID, c.Nombre, c.Apellido, a.ArticuloID, a.Nombre
ORDER BY Cliente, Articulo;

-- =====================================================
-- 7. CONSULTAS CON OPERADORES DE PATRÓN (LIKE)
-- =====================================================

-- 7.1 Artículos que contienen "Samsung" en el nombre
SELECT ArticuloID, Nombre, Precio
FROM ARTICULOS
WHERE Nombre LIKE '%Samsung%';

-- 7.2 Clientes con apellido que termina en "ez"
SELECT ClienteID, Nombre, Apellido
FROM CLIENTES
WHERE Apellido LIKE '%ez';

-- 7.3 Artículos que empiezan con "M"
SELECT ArticuloID, Nombre, Precio
FROM ARTICULOS
WHERE Nombre LIKE 'M%';

-- =====================================================
-- 8. CONSULTAS CON OPERADORES NULL
-- =====================================================

-- 8.1 Clientes sin comentarios
SELECT ClienteID, Nombre, Apellido, CUIT
FROM CLIENTES
WHERE Comentarios IS NULL;

-- 8.2 Clientes con comentarios
SELECT ClienteID, Nombre, Apellido, Comentarios
FROM CLIENTES
WHERE Comentarios IS NOT NULL;

-- =====================================================
-- 9. CONSULTAS CON ORDER BY Y LIMIT
-- =====================================================

-- 9.1 Top 3 artículos más caros
SELECT ArticuloID, Nombre, Precio
FROM ARTICULOS
ORDER BY Precio DESC
LIMIT 3;

-- 9.2 Facturas ordenadas por fecha (más recientes primero)
SELECT FacturaID, Letra, Numero, Fecha, Monto
FROM FACTURAS
ORDER BY Fecha DESC;

-- 9.3 Clientes ordenados alfabéticamente
SELECT ClienteID, Nombre, Apellido
FROM CLIENTES
ORDER BY Apellido, Nombre;

-- =====================================================
-- 10. CONSULTAS CON CASE (CONDICIONALES)
-- =====================================================

-- 10.1 Clasificación de facturas por monto
SELECT 
    FacturaID,
    Letra,
    Numero,
    Monto,
    CASE 
        WHEN Monto < 50000 THEN 'Baja'
        WHEN Monto BETWEEN 50000 AND 100000 THEN 'Media'
        ELSE 'Alta'
    END AS Clasificacion
FROM FACTURAS;

-- 10.2 Clasificación de stock
SELECT 
    ArticuloID,
    Nombre,
    Stock,
    CASE 
        WHEN Stock = 0 THEN 'Sin Stock'
        WHEN Stock < 10 THEN 'Stock Bajo'
        WHEN Stock BETWEEN 10 AND 30 THEN 'Stock Medio'
        ELSE 'Stock Alto'
    END AS EstadoStock
FROM ARTICULOS;
