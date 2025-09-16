-- DATOS DE EJEMPLO PARA PROBAR LAS CONSULTAS
-- Insertar datos de prueba en las tablas creadas

-- Insertar datos en Provincia
INSERT INTO Provincia (id, Nombre, Pais) VALUES
(1, 'Madrid', 'España'),
(2, 'Buenos Aires', 'Argentina'),
(3, 'Barcelona', 'España'),
(4, 'Córdoba', 'Argentina'),
(5, 'Valencia', 'España');

-- Insertar datos en Localidad
INSERT INTO Localidad (id, Nombre, CP, Provincia) VALUES
(1, 'Madrid Centro', '28001', 1),
(2, 'Madrid Norte', '28034', 1),
(3, 'Madrid Sur', '28045', 1),
(4, 'Buenos Aires Centro', '1000', 2),
(5, 'Buenos Aires Norte', '1425', 2),
(6, 'Barcelona Centro', '08001', 3),
(7, 'Córdoba Centro', '5000', 4);

-- Insertar datos en Cliente
INSERT INTO Cliente (id, Nombre, Apellido, Fecha_nacimiento, Direccion, Localidad, Telefono) VALUES
(1, 'Juan', 'Pérez', '1985-03-15', 'Calle Mayor 123', 1, '600123456'),
(2, 'María', 'García', '1990-07-22', 'Avenida de la Paz 45', 2, '600234567'),
(3, 'Carlos', 'López', '1988-11-08', 'Calle del Sol 78', 1, '600345678'),
(4, 'Ana', 'Martín', '1992-05-14', 'Plaza Mayor 12', 2, '600456789'),
(5, 'Roberto', 'Fernández', '1987-09-30', 'Avenida Corrientes 1500', 4, '600567890'),
(6, 'Laura', 'Rodríguez', '1991-12-03', 'Calle Florida 200', 5, '600678901');

-- Insertar datos en Movimiento
INSERT INTO Movimiento (id, Letra, Fecha, Cliente) VALUES
(1, 'A', '2024-01-15', 1),
(2, 'B', '2024-01-16', 2),
(3, 'A', '2024-01-17', 1),
(4, 'C', '2024-01-18', 3),
(5, 'B', '2024-01-19', 4),
(6, 'A', '2024-01-20', 5),
(7, 'C', '2024-01-21', 6);

-- Insertar datos en Item
INSERT INTO Item (id, Detalle, Cantidad, Valor, Movimiento) VALUES
(1, 'Producto A - 24 - 4 oz tins', 10, 25.50, 1),
(2, 'Producto B - Botella 500ml', 5, 45.00, 1),
(3, 'Producto C - Caja 12 unidades', 3, 35.75, 2),
(4, 'Producto D - Bolsa 1kg', 8, 42.00, 2),
(5, 'Producto E - 24 - 4 oz tins', 15, 28.90, 3),
(6, 'Producto F - Botella 750ml', 2, 55.00, 3),
(7, 'Producto G - Caja 24 unidades', 4, 38.25, 4),
(8, 'Producto H - Bolsa 2kg', 6, 48.50, 4),
(9, 'Producto I - Botella 1L', 3, 65.00, 5),
(10, 'Producto J - Caja 6 unidades', 7, 32.75, 5),
(11, 'Producto K - 24 - 4 oz tins', 12, 26.40, 6),
(12, 'Producto L - Botella 500ml', 4, 47.80, 6),
(13, 'Producto M - Caja 12 unidades', 2, 41.50, 7),
(14, 'Producto N - Bolsa 1kg', 9, 39.90, 7),
(42, 'Producto Especial - 24 - 4 oz tins', 20, 75.00, 1);

-- Insertar datos en Transportistas
INSERT INTO Transportistas (id, Nombre, Telefono, Email, Direccion) VALUES
(1, 'Transportes Rápidos S.L.', '911234567', 'info@transportesrapidos.com', 'Calle Logística 100'),
(2, 'Envíos Express', '912345678', 'contacto@envios-express.com', 'Avenida Distribución 200'),
(3, 'Logística Nacional', '913456789', 'servicio@logisticanacional.com', 'Polígono Industrial 300'),
(4, 'Mensajería Veloz', '914567890', 'info@mensajeriaveloz.com', 'Calle Transporte 400'),
(5, 'Distribución Total', '915678901', 'contacto@distribuciontotal.com', 'Avenida Logística 500');

-- Verificar los datos insertados
SELECT 'Provincias:' AS Tabla, COUNT(*) AS Registros FROM Provincia
UNION ALL
SELECT 'Localidades:', COUNT(*) FROM Localidad
UNION ALL
SELECT 'Clientes:', COUNT(*) FROM Cliente
UNION ALL
SELECT 'Movimientos:', COUNT(*) FROM Movimiento
UNION ALL
SELECT 'Items:', COUNT(*) FROM Item
UNION ALL
SELECT 'Transportistas:', COUNT(*) FROM Transportistas;
