-- Consultas para la base de datos Laboratorio_db
-- Utilizando la tabla artículos y otras tablas relacionadas

-- 1. Mostrar una lista de clientes con su nombre, apellido, localidad y provincia
SELECT 
    c.nombre,
    c.apellido,
    l.nombre AS localidad,
    p.nombre AS provincia
FROM clientes c
INNER JOIN localidades l ON c.id_localidad = l.id
INNER JOIN provincias p ON l.id_provincia = p.id
ORDER BY c.apellido, c.nombre;

-- 2. Mostrar una lista de movimientos con la letra del movimiento, la fecha, 
-- el nombre del cliente, el nombre del artículo, la cantidad y el valor
SELECT 
    m.letra,
    m.fecha,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    a.nombre AS nombre_articulo,
    md.cantidad,
    md.valor
FROM movimientos m
INNER JOIN clientes c ON m.id_cliente = c.id
INNER JOIN movimientos_detalle md ON m.id = md.id_movimiento
INNER JOIN articulos a ON md.id_articulo = a.id
ORDER BY m.fecha DESC, m.id;

-- 3. Mostrar una lista de localidades con su nombre y el nombre de la provincia a la que pertenecen
SELECT 
    l.nombre AS localidad,
    p.nombre AS provincia
FROM localidades l
INNER JOIN provincias p ON l.id_provincia = p.id
ORDER BY p.nombre, l.nombre;

-- 4. Mostrar una lista de clientes con su nombre, apellido y los movimientos asociados a ellos
SELECT 
    c.nombre,
    c.apellido,
    m.id AS id_movimiento,
    m.letra,
    m.fecha,
    m.total
FROM clientes c
LEFT JOIN movimientos m ON c.id = m.id_cliente
ORDER BY c.apellido, c.nombre, m.fecha DESC;

-- 5. Mostrar los artículos vendidos en un movimiento específico (ID = 1)
SELECT 
    a.nombre AS nombre_articulo,
    a.descripcion,
    md.cantidad,
    md.valor_unitario,
    md.valor_total,
    md.id AS id_detalle
FROM movimientos_detalle md
INNER JOIN articulos a ON md.id_articulo = a.id
WHERE md.id_movimiento = 1
ORDER BY a.nombre;

-- Consultas adicionales útiles:

-- Consulta alternativa para el punto 2 con información más detallada
SELECT 
    m.id AS id_movimiento,
    m.letra,
    m.fecha,
    CONCAT(c.nombre, ' ', c.apellido) AS cliente_completo,
    a.nombre AS articulo,
    a.codigo AS codigo_articulo,
    md.cantidad,
    md.valor_unitario,
    md.valor_total
FROM movimientos m
INNER JOIN clientes c ON m.id_cliente = c.id
INNER JOIN movimientos_detalle md ON m.id = md.id_movimiento
INNER JOIN articulos a ON md.id_articulo = a.id
ORDER BY m.fecha DESC, m.id;

-- Consulta para verificar la estructura de la tabla artículos
SELECT 
    id,
    nombre,
    descripcion,
    codigo,
    precio_unitario,
    stock_actual,
    stock_minimo
FROM articulos
ORDER BY nombre;

-- Consulta para obtener estadísticas de movimientos por cliente
SELECT 
    c.nombre,
    c.apellido,
    COUNT(m.id) AS total_movimientos,
    SUM(m.total) AS total_compras
FROM clientes c
LEFT JOIN movimientos m ON c.id = m.id_cliente
GROUP BY c.id, c.nombre, c.apellido
ORDER BY total_compras DESC;
