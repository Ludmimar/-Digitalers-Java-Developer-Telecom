-- CONSULTAS SQL PARA EL SISTEMA DE GESTIÓN
-- Basado en las tablas: Cliente, Localidad, Provincia, Movimiento, Item

-- ==============================================
-- CONSULTAS PARA TABLA CLIENTE (Customers)
-- ==============================================

-- 1. El detalle de todos los clientes cuya ciudad de residencia es "Madrid"
SELECT 
    c.id,
    c.Nombre,
    c.Apellido,
    c.Fecha_nacimiento,
    c.Direccion,
    c.Telefono,
    l.Nombre AS Ciudad,
    l.CP AS Codigo_Postal,
    p.Nombre AS Provincia,
    p.Pais
FROM Cliente c
INNER JOIN Localidad l ON c.Localidad = l.id
INNER JOIN Provincia p ON l.Provincia = p.id
WHERE l.Nombre = 'Madrid';

-- 2. De esos mismos clientes, obtener el nombre de contacto y dirección cuyo código postal es 28034
SELECT 
    CONCAT(c.Nombre, ' ', c.Apellido) AS Nombre_Contacto,
    c.Direccion,
    l.CP AS Codigo_Postal,
    l.Nombre AS Ciudad
FROM Cliente c
INNER JOIN Localidad l ON c.Localidad = l.id
WHERE l.Nombre = 'Madrid' AND l.CP = '28034';

-- 3. Determinar si hay algún cliente de Argentina. En el caso de que haya, mostrar nombre y ciudad de cada uno de ellos
SELECT 
    CONCAT(c.Nombre, ' ', c.Apellido) AS Nombre_Completo,
    l.Nombre AS Ciudad,
    p.Nombre AS Provincia,
    p.Pais
FROM Cliente c
INNER JOIN Localidad l ON c.Localidad = l.id
INNER JOIN Provincia p ON l.Provincia = p.id
WHERE p.Pais = 'Argentina';

-- ==============================================
-- CONSULTAS PARA TABLA ITEM (Products equivalent)
-- ==============================================

-- 4. Obtener el nombre de aquellos productos cuyo precio sea mayor a 39
-- Nota: Asumiendo que "Detalle" es el nombre del producto y "Valor" es el precio
SELECT 
    i.id,
    i.Detalle AS Nombre_Producto,
    i.Valor AS Precio,
    i.Cantidad
FROM Item i
WHERE i.Valor > 39;

-- 5. Obtener el detalle completo de los productos que la unidad sea "24 - 4 oz tins"
-- Nota: Adaptando la consulta al esquema actual (asumiendo que "Detalle" contiene esta información)
SELECT 
    i.id,
    i.Detalle,
    i.Cantidad,
    i.Valor,
    i.Movimiento
FROM Item i
WHERE i.Detalle LIKE '%24 - 4 oz tins%' 
   OR i.Detalle = '24 - 4 oz tins';

-- ==============================================
-- CONSULTAS PARA TABLA MOVIMIENTO (OrderDetails equivalent)
-- ==============================================

-- 6. Obtener el ID de la orden y el ID del detalle de orden de aquellas cuyo ID de producto es igual a 42
-- Nota: Adaptando al esquema actual donde Movimiento sería la "orden" e Item sería el "detalle"
SELECT 
    m.id AS ID_Orden,
    i.id AS ID_Detalle_Orden,
    i.Detalle AS Producto,
    i.Cantidad,
    i.Valor
FROM Movimiento m
INNER JOIN Item i ON m.id = i.Movimiento
WHERE i.id = 42;

-- ==============================================
-- CONSULTAS PARA TABLA TRANSPORTISTAS (Shippers)
-- ==============================================

-- 7. Obtener el nombre y número de teléfono de todos los transportistas
SELECT 
    id,
    Nombre,
    Telefono,
    Email,
    Direccion
FROM Transportistas;

-- ==============================================
-- CONSULTAS ADICIONALES ÚTILES
-- ==============================================

-- Consulta para verificar la estructura completa de un cliente con todos sus datos relacionados
SELECT 
    c.id AS Cliente_ID,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente_Nombre,
    c.Fecha_nacimiento,
    c.Direccion,
    c.Telefono,
    l.Nombre AS Ciudad,
    l.CP AS Codigo_Postal,
    p.Nombre AS Provincia,
    p.Pais,
    COUNT(m.id) AS Total_Movimientos
FROM Cliente c
INNER JOIN Localidad l ON c.Localidad = l.id
INNER JOIN Provincia p ON l.Provincia = p.id
LEFT JOIN Movimiento m ON c.id = m.Cliente
GROUP BY c.id, c.Nombre, c.Apellido, c.Fecha_nacimiento, c.Direccion, c.Telefono, 
         l.Nombre, l.CP, p.Nombre, p.Pais;

-- Consulta para obtener el resumen de movimientos por cliente
SELECT 
    c.id AS Cliente_ID,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente_Nombre,
    COUNT(m.id) AS Total_Movimientos,
    COUNT(i.id) AS Total_Items,
    SUM(i.Valor * i.Cantidad) AS Valor_Total
FROM Cliente c
LEFT JOIN Movimiento m ON c.id = m.Cliente
LEFT JOIN Item i ON m.id = i.Movimiento
GROUP BY c.id, c.Nombre, c.Apellido;

-- ==============================================
-- NOTAS IMPORTANTES
-- ==============================================
-- 1. Las consultas están adaptadas al esquema de tablas creado anteriormente
-- 2. Se asume que los datos de ejemplo incluyen ciudades como "Madrid" y países como "Argentina"
-- 3. Para la tabla "Transportistas" mencionada en el ejercicio, sería necesario crear una tabla adicional
-- 4. Las consultas utilizan JOINs para obtener información relacionada entre tablas
-- 5. Se incluyen consultas adicionales útiles para el análisis de datos
