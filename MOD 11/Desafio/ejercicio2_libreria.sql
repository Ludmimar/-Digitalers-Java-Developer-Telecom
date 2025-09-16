-- =====================================================
-- EJERCICIO 2 - BASE DE DATOS LIBRERÍA
-- =====================================================

-- 1. Crear una base de datos con el nombre "LIBRERÍA" y ponerla en uso
CREATE DATABASE LIBRERÍA;
USE LIBRERÍA;

-- =====================================================
-- CREACIÓN DE LAS 8 TABLAS
-- =====================================================

-- Tabla: autores
-- Estructura: autor_id VARCHAR(11), apellido VARCHAR(40), nombre VARCHAR(20), 
-- telefono VARCHAR(12), direccion VARCHAR(40), ciudad VARCHAR(20), 
-- provincia CHAR(2), c_postal CHAR(5), estado TINYINT(1)
CREATE TABLE autores (
    autor_id VARCHAR(11) PRIMARY KEY,
    apellido VARCHAR(40) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    telefono VARCHAR(12),
    direccion VARCHAR(40),
    ciudad VARCHAR(20),
    provincia CHAR(2),
    c_postal CHAR(5),
    estado TINYINT(1) DEFAULT 1
);

-- Tabla: locales
-- Estructura: local_id CHAR(4), nombre VARCHAR(40), direccion VARCHAR(40), 
-- ciudad VARCHAR(20), provincia CHAR(2), c_postal CHAR(5)
CREATE TABLE locales (
    local_id CHAR(4) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    direccion VARCHAR(40),
    ciudad VARCHAR(20),
    provincia CHAR(2),
    c_postal CHAR(5)
);

-- Tabla: editoriales
-- Estructura: editorial_id CHAR(4), nombre VARCHAR(40), ciudad VARCHAR(20), 
-- provincia CHAR(2), pais VARCHAR(30)
CREATE TABLE editoriales (
    editorial_id CHAR(4) PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    ciudad VARCHAR(20),
    provincia CHAR(2),
    pais VARCHAR(30)
);

-- Tabla: puestos
-- Estructura: puesto_id SMALLINT, descripcion VARCHAR(50)
CREATE TABLE puestos (
    puesto_id SMALLINT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

-- Tabla: libros
-- Estructura: libro_id VARCHAR(6), titulo VARCHAR(80), categoria CHAR(12), 
-- editorial_id CHAR(4), precio DOUBLE, comentarios VARCHAR(200), 
-- fecha_publicacion DATETIME
CREATE TABLE libros (
    libro_id VARCHAR(6) PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    categoria CHAR(12),
    editorial_id CHAR(4),
    precio DOUBLE,
    comentarios VARCHAR(200),
    fecha_publicacion DATETIME,
    FOREIGN KEY (editorial_id) REFERENCES editoriales(editorial_id)
);

-- Tabla: empleados
-- Estructura: empleado_id CHAR(9), nombre VARCHAR(20), apellido VARCHAR(30), 
-- puesto_id SMALLINT, editorial_id CHAR(4), fecha_ingreso DATETIME
CREATE TABLE empleados (
    empleado_id CHAR(9) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    puesto_id SMALLINT,
    editorial_id CHAR(4),
    fecha_ingreso DATETIME,
    FOREIGN KEY (puesto_id) REFERENCES puestos(puesto_id),
    FOREIGN KEY (editorial_id) REFERENCES editoriales(editorial_id)
);

-- Tabla: libroautor (tabla de relación muchos a muchos entre libros y autores)
-- Estructura: autor_id VARCHAR(11), libro_id VARCHAR(6)
CREATE TABLE libroautor (
    autor_id VARCHAR(11),
    libro_id VARCHAR(6),
    PRIMARY KEY (autor_id, libro_id),
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id),
    FOREIGN KEY (libro_id) REFERENCES libros(libro_id)
);

-- Tabla: ventas
-- Estructura: local_id CHAR(4), factura_nro VARCHAR(20), fecha DATETIME, 
-- cantidad SMALLINT, forma_pago VARCHAR(12), libro_id VARCHAR(6)
CREATE TABLE ventas (
    local_id CHAR(4),
    factura_nro VARCHAR(20),
    fecha DATETIME,
    cantidad SMALLINT,
    forma_pago VARCHAR(12),
    libro_id VARCHAR(6),
    PRIMARY KEY (local_id, factura_nro),
    FOREIGN KEY (local_id) REFERENCES locales(local_id),
    FOREIGN KEY (libro_id) REFERENCES libros(libro_id)
);

-- =====================================================
-- INSERCIÓN DE DATOS DE EJEMPLO
-- =====================================================

-- Insertar datos en la tabla puestos
INSERT INTO puestos (puesto_id, descripcion) VALUES
(1, 'Editor'),
(2, 'Diseñador'),
(3, 'Vendedor'),
(4, 'Gerente'),
(5, 'Contador');

-- Insertar datos en la tabla editoriales
INSERT INTO editoriales (editorial_id, nombre, ciudad, provincia, pais) VALUES
('E001', 'Editorial Planeta', 'Buenos Aires', 'BA', 'Argentina'),
('E002', 'Editorial Sudamericana', 'Buenos Aires', 'BA', 'Argentina'),
('E003', 'Editorial Norma', 'Bogotá', 'DC', 'Colombia'),
('E004', 'Editorial Anagrama', 'Barcelona', 'BC', 'España');

-- Insertar datos en la tabla autores
INSERT INTO autores (autor_id, apellido, nombre, telefono, direccion, ciudad, provincia, c_postal, estado) VALUES
('A001', 'García Márquez', 'Gabriel', '555-0101', 'Calle 12 #2-41', 'Aracataca', 'MG', '47000', 1),
('A002', 'Borges', 'Jorge Luis', '555-0102', 'Tucumán 840', 'Buenos Aires', 'BA', '1049', 1),
('A003', 'Cortázar', 'Julio', '555-0103', 'Rue de la Paix 123', 'París', 'IDF', '75001', 1),
('A004', 'Neruda', 'Pablo', '555-0104', 'Isla Negra', 'Valparaíso', 'VS', '25800', 1);

-- Insertar datos en la tabla locales
INSERT INTO locales (local_id, nombre, direccion, ciudad, provincia, c_postal) VALUES
('L001', 'Librería Central', 'Av. Corrientes 1234', 'Buenos Aires', 'BA', '1043'),
('L002', 'Librería Norte', 'Av. Santa Fe 5678', 'Buenos Aires', 'BA', '1060'),
('L003', 'Librería Sur', 'Av. 9 de Julio 9012', 'Buenos Aires', 'BA', '1073'),
('L004', 'Librería Oeste', 'Av. Rivadavia 3456', 'Buenos Aires', 'BA', '1033');

-- Insertar datos en la tabla libros
INSERT INTO libros (libro_id, titulo, categoria, editorial_id, precio, comentarios, fecha_publicacion) VALUES
('L00001', 'Cien años de soledad', 'Ficción', 'E001', 25.99, 'Obra maestra del realismo mágico', '1967-06-05'),
('L00002', 'El Aleph', 'Ficción', 'E002', 18.50, 'Colección de cuentos fantásticos', '1949-06-01'),
('L00003', 'Rayuela', 'Ficción', 'E002', 22.75, 'Novela experimental', '1963-06-28'),
('L00004', 'Veinte poemas de amor', 'Poesía', 'E001', 15.25, 'Poesía romántica', '1924-08-14');

-- Insertar datos en la tabla empleados
INSERT INTO empleados (empleado_id, nombre, apellido, puesto_id, editorial_id, fecha_ingreso) VALUES
('EMP000001', 'María', 'González', 1, 'E001', '2020-03-15'),
('EMP000002', 'Carlos', 'López', 2, 'E001', '2019-07-22'),
('EMP000003', 'Ana', 'Martínez', 3, 'E002', '2021-01-10'),
('EMP000004', 'Pedro', 'Rodríguez', 4, 'E002', '2018-11-05');

-- Insertar datos en la tabla libroautor (relación entre libros y autores)
INSERT INTO libroautor (autor_id, libro_id) VALUES
('A001', 'L00001'),
('A002', 'L00002'),
('A003', 'L00003'),
('A004', 'L00004');

-- Insertar datos en la tabla ventas
INSERT INTO ventas (local_id, factura_nro, fecha, cantidad, forma_pago, libro_id) VALUES
('L001', 'F001', '2024-01-15 10:30:00', 2, 'Efectivo', 'L00001'),
('L001', 'F002', '2024-01-15 14:45:00', 1, 'Tarjeta', 'L00002'),
('L002', 'F003', '2024-01-16 09:15:00', 3, 'Transferencia', 'L00003'),
('L003', 'F004', '2024-01-16 16:20:00', 1, 'Efectivo', 'L00004'),
('L004', 'F005', '2024-01-17 11:00:00', 2, 'Tarjeta', 'L00001');

-- =====================================================
-- VERIFICACIÓN DE DATOS INSERTADOS
-- =====================================================

-- Mostrar todas las tablas creadas
SHOW TABLES;

-- Mostrar estructura de cada tabla
DESCRIBE autores;
DESCRIBE locales;
DESCRIBE editoriales;
DESCRIBE puestos;
DESCRIBE libros;
DESCRIBE empleados;
DESCRIBE libroautor;
DESCRIBE ventas;

-- Mostrar datos insertados en cada tabla
SELECT 'AUTORES' as tabla, COUNT(*) as registros FROM autores
UNION ALL
SELECT 'LOCALES', COUNT(*) FROM locales
UNION ALL
SELECT 'EDITORIALES', COUNT(*) FROM editoriales
UNION ALL
SELECT 'PUESTOS', COUNT(*) FROM puestos
UNION ALL
SELECT 'LIBROS', COUNT(*) FROM libros
UNION ALL
SELECT 'EMPLEADOS', COUNT(*) FROM empleados
UNION ALL
SELECT 'LIBROAUTOR', COUNT(*) FROM libroautor
UNION ALL
SELECT 'VENTAS', COUNT(*) FROM ventas;
