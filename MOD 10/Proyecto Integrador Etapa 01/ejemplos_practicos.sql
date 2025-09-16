-- =====================================================
-- PROYECTO INTEGRADOR ETAPA 01 - TECNO_PRJ
-- Ejemplos Prácticos de Uso
-- =====================================================

USE TECNO_PRJ;

-- =====================================================
-- EJEMPLO 1: PROCESO COMPLETO DE VENTA
-- =====================================================

-- Paso 1: Verificar stock disponible
SELECT 
    ArticuloID,
    Nombre,
    Stock,
    Precio
FROM ARTICULOS 
WHERE ArticuloID IN (1, 2, 3)
ORDER BY ArticuloID;

-- Paso 2: Crear nueva factura
INSERT INTO FACTURAS (Letra, Numero, ClienteID, Fecha)
VALUES ('A', 9, 1, '2024-02-01');

-- Paso 3: Agregar detalles de venta
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad)
VALUES 
    (1, 16, 1),  -- Laptop HP Pavilion
    (2, 16, 2), -- Mouse Logitech
    (3, 16, 1); -- Teclado Mecánico

-- Paso 4: Verificar el resultado
SELECT 
    f.FacturaID,
    f.Letra,
    f.Numero,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    f.Fecha,
    f.Monto,
    COUNT(d.DetalleID) AS ItemsVendidos
FROM FACTURAS f
JOIN CLIENTES c ON f.ClienteID = c.ClienteID
LEFT JOIN DETALLE d ON f.FacturaID = d.FacturaID
WHERE f.FacturaID = 16
GROUP BY f.FacturaID, f.Letra, f.Numero, c.Nombre, c.Apellido, f.Fecha, f.Monto;

-- =====================================================
-- EJEMPLO 2: REPORTE DE VENTAS POR CLIENTE
-- =====================================================

SELECT 
    c.ClienteID,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    c.CUIT,
    COUNT(f.FacturaID) AS TotalFacturas,
    COALESCE(SUM(f.Monto), 0) AS TotalVentas,
    COALESCE(AVG(f.Monto), 0) AS PromedioFactura,
    COALESCE(MAX(f.Monto), 0) AS FacturaMaxima,
    COALESCE(MIN(f.Monto), 0) AS FacturaMinima
FROM CLIENTES c
LEFT JOIN FACTURAS f ON c.ClienteID = f.ClienteID
GROUP BY c.ClienteID, c.Nombre, c.Apellido, c.CUIT
ORDER BY TotalVentas DESC;

-- =====================================================
-- EJEMPLO 3: ANÁLISIS DE INVENTARIO
-- =====================================================

SELECT 
    ArticuloID,
    Nombre,
    Precio,
    Stock,
    (Precio * Stock) AS ValorInventario,
    CASE 
        WHEN Stock = 0 THEN 'Sin Stock'
        WHEN Stock < 10 THEN 'Stock Bajo'
        WHEN Stock BETWEEN 10 AND 30 THEN 'Stock Medio'
        ELSE 'Stock Alto'
    END AS EstadoStock,
    CASE 
        WHEN Precio < 10000 THEN 'Económico'
        WHEN Precio BETWEEN 10000 AND 50000 THEN 'Medio'
        ELSE 'Premium'
    END AS CategoriaPrecio
FROM ARTICULOS
ORDER BY ValorInventario DESC;

-- =====================================================
-- EJEMPLO 4: TOP ARTÍCULOS MÁS VENDIDOS
-- =====================================================

SELECT 
    a.ArticuloID,
    a.Nombre,
    a.Precio,
    SUM(d.Cantidad) AS TotalVendido,
    COUNT(DISTINCT d.FacturaID) AS FacturasConVenta,
    SUM(d.Cantidad * a.Precio) AS TotalFacturado,
    ROUND(AVG(d.Cantidad), 2) AS PromedioPorVenta
FROM ARTICULOS a
JOIN DETALLE d ON a.ArticuloID = d.ArticuloID
GROUP BY a.ArticuloID, a.Nombre, a.Precio
ORDER BY TotalVendido DESC
LIMIT 10;

-- =====================================================
-- EJEMPLO 5: VENTAS POR PERÍODO
-- =====================================================

-- Ventas por día
SELECT 
    Fecha,
    COUNT(*) AS FacturasDelDia,
    SUM(Monto) AS TotalVentas,
    AVG(Monto) AS PromedioFactura
FROM FACTURAS
WHERE Fecha >= '2024-01-15' AND Fecha <= '2024-01-29'
GROUP BY Fecha
ORDER BY Fecha;

-- Ventas por tipo de factura
SELECT 
    Letra,
    COUNT(*) AS CantidadFacturas,
    SUM(Monto) AS TotalVentas,
    AVG(Monto) AS PromedioFactura,
    MIN(Monto) AS FacturaMinima,
    MAX(Monto) AS FacturaMaxima
FROM FACTURAS
GROUP BY Letra
ORDER BY TotalVentas DESC;

-- =====================================================
-- EJEMPLO 6: CLIENTES CON MÚLTIPLES COMPRAS
-- =====================================================

SELECT 
    c.ClienteID,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    COUNT(f.FacturaID) AS TotalCompras,
    SUM(f.Monto) AS TotalGastado,
    AVG(f.Monto) AS PromedioCompra,
    MIN(f.Fecha) AS PrimeraCompra,
    MAX(f.Fecha) AS UltimaCompra,
    DATEDIFF(MAX(f.Fecha), MIN(f.Fecha)) AS DiasEntreCompras
FROM CLIENTES c
JOIN FACTURAS f ON c.ClienteID = f.ClienteID
GROUP BY c.ClienteID, c.Nombre, c.Apellido
HAVING COUNT(f.FacturaID) > 1
ORDER BY TotalCompras DESC, TotalGastado DESC;

-- =====================================================
-- EJEMPLO 7: ANÁLISIS DE PRODUCTOS POR CATEGORÍA
-- =====================================================

-- Productos de computación
SELECT 
    'Computación' AS Categoria,
    COUNT(*) AS CantidadProductos,
    SUM(Stock) AS TotalStock,
    SUM(Precio * Stock) AS ValorInventario,
    AVG(Precio) AS PrecioPromedio
FROM ARTICULOS
WHERE Nombre LIKE '%Laptop%' OR Nombre LIKE '%Monitor%' OR Nombre LIKE '%Teclado%' OR Nombre LIKE '%Mouse%';

-- Productos móviles
SELECT 
    'Móviles' AS Categoria,
    COUNT(*) AS CantidadProductos,
    SUM(Stock) AS TotalStock,
    SUM(Precio * Stock) AS ValorInventario,
    AVG(Precio) AS PrecioPromedio
FROM ARTICULOS
WHERE Nombre LIKE '%Smartphone%' OR Nombre LIKE '%Tablet%';

-- Accesorios
SELECT 
    'Accesorios' AS Categoria,
    COUNT(*) AS CantidadProductos,
    SUM(Stock) AS TotalStock,
    SUM(Precio * Stock) AS ValorInventario,
    AVG(Precio) AS PrecioPromedio
FROM ARTICULOS
WHERE Nombre LIKE '%Auriculares%' OR Nombre LIKE '%Cable%' OR Nombre LIKE '%Cargador%' OR Nombre LIKE '%Funda%';

-- =====================================================
-- EJEMPLO 8: USO DE FUNCIONES PERSONALIZADAS
-- =====================================================

-- Calcular total de una factura específica
SELECT 
    FacturaID,
    Letra,
    Numero,
    fn_calcular_total_factura(FacturaID) AS TotalCalculado,
    Monto AS TotalActual
FROM FACTURAS
WHERE FacturaID = 1;

-- Verificar stock para una venta
SELECT 
    ArticuloID,
    Nombre,
    Stock,
    fn_verificar_stock(ArticuloID, 5) AS StockSuficientePara5,
    fn_verificar_stock(ArticuloID, 10) AS StockSuficientePara10
FROM ARTICULOS
WHERE ArticuloID IN (1, 2, 3);

-- Obtener próximo número de factura
SELECT 
    'A' AS TipoFactura,
    fn_proximo_numero_factura('A') AS ProximoNumeroA,
    'B' AS TipoFactura,
    fn_proximo_numero_factura('B') AS ProximoNumeroB,
    'C' AS TipoFactura,
    fn_proximo_numero_factura('C') AS ProximoNumeroC;

-- =====================================================
-- EJEMPLO 9: USO DE PROCEDIMIENTOS ALMACENADOS
-- =====================================================

-- Actualizar precio de un artículo
CALL sp_actualizar_precio_articulo(1, 90000.00, @resultado_precio);
SELECT @resultado_precio AS ResultadoActualizacionPrecio;

-- Actualizar stock de un artículo
CALL sp_actualizar_stock_articulo(1, 25, @resultado_stock);
SELECT @resultado_stock AS ResultadoActualizacionStock;

-- Crear una nueva venta completa
CALL sp_crear_venta(
    2,  -- ClienteID
    'A', -- Tipo de factura
    '2024-02-01', -- Fecha
    '[{"articulo_id": 4, "cantidad": 1}, {"articulo_id": 5, "cantidad": 1}]', -- Detalles en JSON
    @factura_id, -- ID de la nueva factura
    @resultado_venta -- Resultado de la operación
);
SELECT @factura_id AS NuevaFacturaID, @resultado_venta AS ResultadoCreacionVenta;

-- Generar reporte de ventas del período
CALL sp_reporte_ventas_periodo('2024-01-01', '2024-01-31', @total_facturas, @total_ventas, @promedio_factura);
SELECT 
    @total_facturas AS TotalFacturas,
    @total_ventas AS TotalVentas,
    @promedio_factura AS PromedioFactura;

-- =====================================================
-- EJEMPLO 10: CONSULTAS CON OPERADORES LÓGICOS COMPLEJOS
-- =====================================================

-- Clientes que compraron productos caros O en grandes cantidades
SELECT DISTINCT
    c.ClienteID,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    f.Monto AS MontoFactura,
    a.Nombre AS Articulo,
    d.Cantidad
FROM CLIENTES c
JOIN FACTURAS f ON c.ClienteID = f.ClienteID
JOIN DETALLE d ON f.FacturaID = d.FacturaID
JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
WHERE (a.Precio > 80000) OR (d.Cantidad > 2)
ORDER BY c.ClienteID, f.Monto DESC;

-- Artículos que son caros Y tienen stock bajo
SELECT 
    ArticuloID,
    Nombre,
    Precio,
    Stock,
    (Precio * Stock) AS ValorInventario
FROM ARTICULOS
WHERE Precio > 50000 AND Stock < 20
ORDER BY ValorInventario DESC;

-- Facturas que NO son tipo C Y tienen monto mayor a $50,000
SELECT 
    FacturaID,
    Letra,
    Numero,
    Monto,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente
FROM FACTURAS f
JOIN CLIENTES c ON f.ClienteID = c.ClienteID
WHERE NOT Letra = 'C' AND Monto > 50000
ORDER BY Monto DESC;

-- =====================================================
-- EJEMPLO 11: ANÁLISIS DE TENDENCIAS
-- =====================================================

-- Evolución de ventas por día
SELECT 
    Fecha,
    COUNT(*) AS FacturasDelDia,
    SUM(Monto) AS TotalVentas,
    AVG(Monto) AS PromedioFactura,
    LAG(SUM(Monto)) OVER (ORDER BY Fecha) AS VentasDiaAnterior,
    ROUND(
        ((SUM(Monto) - LAG(SUM(Monto)) OVER (ORDER BY Fecha)) / 
         LAG(SUM(Monto)) OVER (ORDER BY Fecha)) * 100, 2
    ) AS VariacionPorcentual
FROM FACTURAS
GROUP BY Fecha
ORDER BY Fecha;

-- =====================================================
-- EJEMPLO 12: VERIFICACIÓN DE INTEGRIDAD
-- =====================================================

-- Verificar que todos los montos de facturas sean correctos
SELECT 
    f.FacturaID,
    f.Letra,
    f.Numero,
    f.Monto AS MontoActual,
    fn_calcular_total_factura(f.FacturaID) AS MontoCalculado,
    (f.Monto - fn_calcular_total_factura(f.FacturaID)) AS Diferencia
FROM FACTURAS f
WHERE f.Monto != fn_calcular_total_factura(f.FacturaID);

-- Verificar stock negativo (no debería haber ninguno)
SELECT 
    ArticuloID,
    Nombre,
    Stock
FROM ARTICULOS
WHERE Stock < 0;

-- Verificar facturas sin detalles
SELECT 
    f.FacturaID,
    f.Letra,
    f.Numero,
    f.Monto
FROM FACTURAS f
LEFT JOIN DETALLE d ON f.FacturaID = d.FacturaID
WHERE d.FacturaID IS NULL;

-- =====================================================
-- EJEMPLO 13: REPORTES EJECUTIVOS
-- =====================================================

-- Resumen ejecutivo de ventas
SELECT 
    'RESUMEN EJECUTIVO' AS Titulo,
    '' AS Detalle,
    '' AS Valor
UNION ALL
SELECT 
    'Total de Clientes' AS Titulo,
    '' AS Detalle,
    CAST(COUNT(*) AS CHAR) AS Valor
FROM CLIENTES
UNION ALL
SELECT 
    'Total de Artículos' AS Titulo,
    '' AS Detalle,
    CAST(COUNT(*) AS CHAR) AS Valor
FROM ARTICULOS
UNION ALL
SELECT 
    'Total de Facturas' AS Titulo,
    '' AS Detalle,
    CAST(COUNT(*) AS CHAR) AS Valor
FROM FACTURAS
UNION ALL
SELECT 
    'Total de Ventas' AS Titulo,
    '' AS Detalle,
    CONCAT('$', FORMAT(SUM(Monto), 2)) AS Valor
FROM FACTURAS
UNION ALL
SELECT 
    'Promedio por Factura' AS Titulo,
    '' AS Detalle,
    CONCAT('$', FORMAT(AVG(Monto), 2)) AS Valor
FROM FACTURAS
UNION ALL
SELECT 
    'Valor Total Inventario' AS Titulo,
    '' AS Detalle,
    CONCAT('$', FORMAT(SUM(Precio * Stock), 2)) AS Valor
FROM ARTICULOS;
