-- =====================================================
-- PROYECTO INTEGRADOR ETAPA 01 - TECNO_PRJ
-- Estructura de Base de Datos para Empresa de Tecnología
-- =====================================================

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS TECNO_PRJ;
USE TECNO_PRJ;

-- =====================================================
-- TABLA CLIENTES
-- =====================================================
CREATE TABLE CLIENTES (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(25) NOT NULL,
    Apellido VARCHAR(25) NOT NULL,
    CUIT CHAR(16) UNIQUE NOT NULL,
    Direccion VARCHAR(50),
    Comentarios VARCHAR(50),
    INDEX idx_cuit (CUIT),
    INDEX idx_nombre_apellido (Nombre, Apellido)
);

-- =====================================================
-- TABLA ARTÍCULOS
-- =====================================================
CREATE TABLE ARTICULOS (
    ArticuloID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL CHECK (Precio > 0),
    Stock INT NOT NULL DEFAULT 0 CHECK (Stock >= 0),
    INDEX idx_nombre (Nombre),
    INDEX idx_precio (Precio)
);

-- =====================================================
-- TABLA FACTURAS
-- =====================================================
CREATE TABLE FACTURAS (
    FacturaID INT AUTO_INCREMENT PRIMARY KEY,
    Letra CHAR(1) NOT NULL CHECK (Letra IN ('A', 'B', 'C')),
    Numero INT NOT NULL,
    ClienteID INT NOT NULL,
    Fecha DATE NOT NULL,
    Monto DECIMAL(12,2) DEFAULT 0.00,
    UNIQUE KEY unique_factura (Letra, Numero),
    FOREIGN KEY (ClienteID) REFERENCES CLIENTES(ClienteID) ON DELETE RESTRICT ON UPDATE CASCADE,
    INDEX idx_cliente (ClienteID),
    INDEX idx_fecha (Fecha),
    INDEX idx_monto (Monto)
);

-- =====================================================
-- TABLA DETALLE
-- =====================================================
CREATE TABLE DETALLE (
    DetalleID INT AUTO_INCREMENT PRIMARY KEY,
    ArticuloID INT NOT NULL,
    FacturaID INT NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    FOREIGN KEY (ArticuloID) REFERENCES ARTICULOS(ArticuloID) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (FacturaID) REFERENCES FACTURAS(FacturaID) ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_articulo (ArticuloID),
    INDEX idx_factura (FacturaID),
    INDEX idx_cantidad (Cantidad)
);

-- =====================================================
-- TRIGGERS PARA MANTENER INTEGRIDAD DE DATOS
-- =====================================================

-- Trigger para actualizar el monto de la factura cuando se inserta un detalle
DELIMITER //
CREATE TRIGGER tr_detalle_insert
AFTER INSERT ON DETALLE
FOR EACH ROW
BEGIN
    UPDATE FACTURAS 
    SET Monto = (
        SELECT SUM(d.Cantidad * a.Precio)
        FROM DETALLE d
        JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
        WHERE d.FacturaID = NEW.FacturaID
    )
    WHERE FacturaID = NEW.FacturaID;
END//

-- Trigger para actualizar el monto de la factura cuando se actualiza un detalle
CREATE TRIGGER tr_detalle_update
AFTER UPDATE ON DETALLE
FOR EACH ROW
BEGIN
    UPDATE FACTURAS 
    SET Monto = (
        SELECT SUM(d.Cantidad * a.Precio)
        FROM DETALLE d
        JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
        WHERE d.FacturaID = NEW.FacturaID
    )
    WHERE FacturaID = NEW.FacturaID;
END//

-- Trigger para actualizar el monto de la factura cuando se elimina un detalle
CREATE TRIGGER tr_detalle_delete
AFTER DELETE ON DETALLE
FOR EACH ROW
BEGIN
    UPDATE FACTURAS 
    SET Monto = (
        SELECT COALESCE(SUM(d.Cantidad * a.Precio), 0)
        FROM DETALLE d
        JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
        WHERE d.FacturaID = OLD.FacturaID
    )
    WHERE FacturaID = OLD.FacturaID;
END//

-- Trigger para actualizar el stock cuando se inserta un detalle
CREATE TRIGGER tr_detalle_stock_insert
AFTER INSERT ON DETALLE
FOR EACH ROW
BEGIN
    UPDATE ARTICULOS 
    SET Stock = Stock - NEW.Cantidad
    WHERE ArticuloID = NEW.ArticuloID;
END//

-- Trigger para actualizar el stock cuando se actualiza un detalle
CREATE TRIGGER tr_detalle_stock_update
AFTER UPDATE ON DETALLE
FOR EACH ROW
BEGIN
    UPDATE ARTICULOS 
    SET Stock = Stock + OLD.Cantidad - NEW.Cantidad
    WHERE ArticuloID = NEW.ArticuloID;
END//

-- Trigger para actualizar el stock cuando se elimina un detalle
CREATE TRIGGER tr_detalle_stock_delete
AFTER DELETE ON DETALLE
FOR EACH ROW
BEGIN
    UPDATE ARTICULOS 
    SET Stock = Stock + OLD.Cantidad
    WHERE ArticuloID = OLD.ArticuloID;
END//

DELIMITER ;

-- =====================================================
-- VISTAS ÚTILES
-- =====================================================

-- Vista para ver facturas completas con información del cliente
CREATE VIEW vw_facturas_completas AS
SELECT 
    f.FacturaID,
    f.Letra,
    f.Numero,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    c.CUIT,
    f.Fecha,
    f.Monto
FROM FACTURAS f
JOIN CLIENTES c ON f.ClienteID = c.ClienteID;

-- Vista para ver detalles de facturas con información de artículos
CREATE VIEW vw_detalles_completos AS
SELECT 
    d.DetalleID,
    f.Letra,
    f.Numero,
    a.Nombre AS Articulo,
    a.Precio,
    d.Cantidad,
    (a.Precio * d.Cantidad) AS Subtotal
FROM DETALLE d
JOIN FACTURAS f ON d.FacturaID = f.FacturaID
JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID;

-- Vista para reporte de ventas por cliente
CREATE VIEW vw_ventas_por_cliente AS
SELECT 
    c.ClienteID,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    COUNT(f.FacturaID) AS TotalFacturas,
    SUM(f.Monto) AS TotalVentas
FROM CLIENTES c
LEFT JOIN FACTURAS f ON c.ClienteID = f.ClienteID
GROUP BY c.ClienteID, c.Nombre, c.Apellido;

-- =====================================================
-- ÍNDICES ADICIONALES PARA OPTIMIZACIÓN
-- =====================================================

-- Índice compuesto para búsquedas frecuentes
CREATE INDEX idx_factura_fecha_cliente ON FACTURAS(ClienteID, Fecha);
CREATE INDEX idx_detalle_factura_articulo ON DETALLE(FacturaID, ArticuloID);

-- =====================================================
-- COMENTARIOS FINALES
-- =====================================================
-- La estructura de la base de datos está diseñada para:
-- 1. Mantener integridad referencial entre tablas
-- 2. Automatizar cálculos de montos y stock
-- 3. Optimizar consultas frecuentes
-- 4. Facilitar reportes y análisis de datos
