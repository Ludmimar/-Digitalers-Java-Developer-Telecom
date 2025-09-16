-- =====================================================
-- PROYECTO INTEGRADOR ETAPA 01 - TECNO_PRJ
-- Datos de Ejemplo para la Base de Datos
-- =====================================================

USE TECNO_PRJ;

-- =====================================================
-- INSERTAR DATOS EN TABLA CLIENTES
-- =====================================================
INSERT INTO CLIENTES (Nombre, Apellido, CUIT, Direccion, Comentarios) VALUES
('Juan', 'Pérez', '20-12345678-9', 'Av. Corrientes 1234, CABA', 'Cliente frecuente'),
('María', 'González', '27-87654321-0', 'Av. Santa Fe 5678, CABA', 'Pyme local'),
('Carlos', 'Rodríguez', '20-11223344-5', 'Av. Rivadavia 9012, CABA', 'Empresa grande'),
('Ana', 'López', '27-55667788-9', 'Av. Córdoba 3456, CABA', 'Cliente nuevo'),
('Pedro', 'Martínez', '20-99887766-5', 'Av. Callao 7890, CABA', 'Cliente VIP'),
('Laura', 'Fernández', '27-44332211-7', 'Av. 9 de Julio 1111, CABA', 'Cliente corporativo'),
('Diego', 'Sánchez', '20-77889900-3', 'Av. Belgrano 2222, CABA', 'Cliente regular'),
('Sofía', 'Torres', '27-33445566-1', 'Av. San Martín 3333, CABA', 'Cliente frecuente'),
('Miguel', 'Ramírez', '20-66778899-4', 'Av. Las Heras 4444, CABA', 'Cliente nuevo'),
('Valentina', 'Morales', '27-22334455-8', 'Av. Libertador 5555, CABA', 'Cliente VIP');

-- =====================================================
-- INSERTAR DATOS EN TABLA ARTÍCULOS
-- =====================================================
INSERT INTO ARTICULOS (Nombre, Precio, Stock) VALUES
('Laptop HP Pavilion', 85000.00, 15),
('Mouse Logitech', 2500.00, 50),
('Teclado Mecánico', 12000.00, 25),
('Monitor Samsung 24"', 45000.00, 20),
('Impresora Canon', 35000.00, 10),
('Tablet iPad', 120000.00, 8),
('Smartphone Samsung Galaxy', 95000.00, 12),
('Auriculares Bluetooth', 8500.00, 30),
('Webcam HD', 15000.00, 18),
('Disco SSD 500GB', 25000.00, 22),
('Memoria RAM 8GB', 12000.00, 35),
('Cable HDMI', 1500.00, 100),
('Router WiFi', 18000.00, 15),
('Cargador Universal', 3500.00, 40),
('Funda para Laptop', 8000.00, 25);

-- =====================================================
-- INSERTAR DATOS EN TABLA FACTURAS
-- =====================================================
INSERT INTO FACTURAS (Letra, Numero, ClienteID, Fecha) VALUES
('A', 1, 1, '2024-01-15'),
('A', 2, 2, '2024-01-16'),
('B', 1, 3, '2024-01-17'),
('A', 3, 1, '2024-01-18'),
('C', 1, 4, '2024-01-19'),
('A', 4, 5, '2024-01-20'),
('B', 2, 6, '2024-01-21'),
('A', 5, 7, '2024-01-22'),
('C', 2, 8, '2024-01-23'),
('A', 6, 9, '2024-01-24'),
('B', 3, 10, '2024-01-25'),
('A', 7, 2, '2024-01-26'),
('C', 3, 1, '2024-01-27'),
('A', 8, 3, '2024-01-28'),
('B', 4, 4, '2024-01-29');

-- =====================================================
-- INSERTAR DATOS EN TABLA DETALLE
-- =====================================================
-- Factura A-1 (Cliente Juan Pérez)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(1, 1, 1),  -- Laptop HP Pavilion
(2, 1, 2),  -- Mouse Logitech
(3, 1, 1);  -- Teclado Mecánico

-- Factura A-2 (Cliente María González)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(4, 2, 1),  -- Monitor Samsung 24"
(5, 2, 1);  -- Impresora Canon

-- Factura B-1 (Cliente Carlos Rodríguez)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(6, 3, 1),  -- Tablet iPad
(7, 3, 1),  -- Smartphone Samsung Galaxy
(8, 3, 2);  -- Auriculares Bluetooth

-- Factura A-3 (Cliente Juan Pérez - segunda compra)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(9, 4, 1),  -- Webcam HD
(10, 4, 1); -- Disco SSD 500GB

-- Factura C-1 (Cliente Ana López)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(11, 5, 2), -- Memoria RAM 8GB
(12, 5, 3); -- Cable HDMI

-- Factura A-4 (Cliente Pedro Martínez)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(13, 6, 1), -- Router WiFi
(14, 6, 2); -- Cargador Universal

-- Factura B-2 (Cliente Laura Fernández)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(1, 7, 1),  -- Laptop HP Pavilion
(15, 7, 1); -- Funda para Laptop

-- Factura A-5 (Cliente Diego Sánchez)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(2, 8, 3),  -- Mouse Logitech
(3, 8, 1),  -- Teclado Mecánico
(8, 8, 1);  -- Auriculares Bluetooth

-- Factura C-2 (Cliente Sofía Torres)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(4, 9, 2),  -- Monitor Samsung 24"
(9, 9, 1);  -- Webcam HD

-- Factura A-6 (Cliente Miguel Ramírez)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(10, 10, 1), -- Disco SSD 500GB
(11, 10, 1); -- Memoria RAM 8GB

-- Factura B-3 (Cliente Valentina Morales)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(6, 11, 1),  -- Tablet iPad
(7, 11, 1),  -- Smartphone Samsung Galaxy
(8, 11, 1);  -- Auriculares Bluetooth

-- Factura A-7 (Cliente María González - segunda compra)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(5, 12, 1),  -- Impresora Canon
(12, 12, 2); -- Cable HDMI

-- Factura C-3 (Cliente Juan Pérez - tercera compra)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(13, 13, 1), -- Router WiFi
(14, 13, 1); -- Cargador Universal

-- Factura A-8 (Cliente Carlos Rodríguez - segunda compra)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(1, 14, 1),  -- Laptop HP Pavilion
(2, 14, 1),  -- Mouse Logitech
(3, 14, 1);  -- Teclado Mecánico

-- Factura B-4 (Cliente Ana López - segunda compra)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad) VALUES
(4, 15, 1),  -- Monitor Samsung 24"
(9, 15, 1);  -- Webcam HD

-- =====================================================
-- VERIFICAR DATOS INSERTADOS
-- =====================================================

-- Mostrar resumen de datos insertados
SELECT 'CLIENTES' AS Tabla, COUNT(*) AS Registros FROM CLIENTES
UNION ALL
SELECT 'ARTICULOS' AS Tabla, COUNT(*) AS Registros FROM ARTICULOS
UNION ALL
SELECT 'FACTURAS' AS Tabla, COUNT(*) AS Registros FROM FACTURAS
UNION ALL
SELECT 'DETALLE' AS Tabla, COUNT(*) AS Registros FROM DETALLE;

-- Mostrar facturas con sus montos calculados
SELECT 
    f.Letra,
    f.Numero,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    f.Fecha,
    f.Monto
FROM FACTURAS f
JOIN CLIENTES c ON f.ClienteID = c.ClienteID
ORDER BY f.FacturaID;

-- Mostrar stock actual de artículos
SELECT 
    ArticuloID,
    Nombre,
    Precio,
    Stock
FROM ARTICULOS
ORDER BY Nombre;
