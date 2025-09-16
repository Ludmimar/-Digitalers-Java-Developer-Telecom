-- =====================================================
-- PROYECTO INTEGRADOR - ETAPA 2 - PASO 1
-- Base de datos: TECNO_DB
-- =====================================================

-- Paso 1: Eliminar la base de datos si existe y crear una nueva
DROP DATABASE IF EXISTS TECNO_DB;

-- Paso 2: Crear la base de datos TECNO_DB
CREATE DATABASE TECNO_DB;

-- Paso 3: Poner en uso la base de datos TECNO_DB
USE TECNO_DB;

-- Paso 4: Importar y ejecutar el código SQL del proyecto integrador anterior
-- (Código del archivo TECNO_PRJ-V1.sql)

-- Crear tabla FACTURAS
CREATE TABLE IF NOT EXISTS `FACTURAS` (
	`FACTURA_ID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`LETRA` varchar(1) NOT NULL,
	`NUMERO` int NOT NULL,
	`CLIENTE_ID` int NOT NULL,
	`FECHA` date NOT NULL,
	`MONTO` decimal(10,2) NOT NULL,
	PRIMARY KEY (`FACTURA_ID`)
);

-- Crear tabla ARTICULOS
CREATE TABLE IF NOT EXISTS `ARTICULOS` (
	`ARTICULO_ID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`NOMBRE` varchar(50) NOT NULL,
	`PRECIO` decimal(10,2) NOT NULL,
	`STOCK` int NOT NULL,
	PRIMARY KEY (`ARTICULO_ID`)
);

-- Crear tabla DETALLES
CREATE TABLE IF NOT EXISTS `DETALLES` (
	`DETALLE_ID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`ARTICULO_ID` int NOT NULL,
	`FACTURA_ID` int NOT NULL,
	`CANTIDAD` int NOT NULL,
	PRIMARY KEY (`DETALLE_ID`)
);

-- Crear tabla CLIENTES
CREATE TABLE IF NOT EXISTS `CLIENTES` (
	`CLIENTE_ID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`NOMBRE` varchar(25) NOT NULL,
	`APELLIDO` varchar(25) NOT NULL,
	`CUIT` varchar(16) NOT NULL,
	`COMENTARIOS` varchar(50) NOT NULL,
	`DIRECCION` varchar(50) NOT NULL,
	PRIMARY KEY (`CLIENTE_ID`)
);

-- Crear foreign keys
ALTER TABLE `FACTURAS` ADD CONSTRAINT `FACTURAS_fk3` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTES`(`CLIENTE_ID`);
ALTER TABLE `DETALLES` ADD CONSTRAINT `DETALLES_fk1` FOREIGN KEY (`ARTICULO_ID`) REFERENCES `ARTICULOS`(`ARTICULO_ID`);
ALTER TABLE `DETALLES` ADD CONSTRAINT `DETALLES_fk2` FOREIGN KEY (`FACTURA_ID`) REFERENCES `FACTURAS`(`FACTURA_ID`);

-- Modificaciones de columnas del proyecto anterior
ALTER TABLE articulos MODIFY PRECIO INT UNSIGNED NOT NULL;
ALTER TABLE articulos CHANGE NOMBRE NOMBRE VARCHAR(75);
ALTER TABLE facturas MODIFY MONTO DECIMAL(10,2) UNSIGNED NOT NULL;
ALTER TABLE articulos MODIFY STOCK int(11) UNSIGNED NOT NULL;
ALTER TABLE clientes CHANGE NOMBRE NOMBRE VARCHAR(30) NOT NULL;
ALTER TABLE clientes CHANGE APELLIDO APELLIDO VARCHAR(35) NOT NULL;
ALTER TABLE clientes CHANGE COMENTARIOS OBSERVACIONES VARCHAR(255);

-- Crear tabla localidad (existente en el proyecto anterior)
CREATE TABLE IF NOT EXISTS localidad (
    LOCALIDAD_ID INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    CP INT NOT NULL,
    PROVINCIA VARCHAR(100) NOT NULL
);

-- Crear relación cliente-localidad
ALTER TABLE clientes ADD COLUMN LOCALIDAD_ID INT;
ALTER TABLE clientes ADD CONSTRAINT fk_localidad FOREIGN KEY (LOCALIDAD_ID) REFERENCES localidad(LOCALIDAD_ID);

-- Insertar datos en localidad
INSERT INTO LOCALIDAD (NOMBRE, CP, PROVINCIA) VALUES
('CABA', 1000, 'Buenos Aires'),
('Rosario', 2000, 'Santa Fe'),
('Córdoba', 5000, 'Córdoba'),
('San Miguel de Tucumán', 4000, 'Tucumán'),
('Neuquén', 8300, 'Neuquén');

-- Insertar datos en clientes
INSERT INTO CLIENTES (NOMBRE, APELLIDO, CUIT, DIRECCION, LOCALIDAD_ID, OBSERVACIONES) VALUES
('Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 3, NULL),
('Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 1, 'GBA'),
('Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 5, 'GBA'),
('Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 2, 'VIP'),
('Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 4, 'GBA');

-- Insertar datos en articulos
INSERT INTO articulos (ARTICULO_ID, NOMBRE, PRECIO, STOCK)
VALUES
(95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
(157, 'Apple AirPods Pro', 979.75, 152),
(335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
(411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);

-- Crear tabla CATEGORIA
CREATE TABLE if NOT EXISTS CATEGORIA (
 categoria_id INT not NULL,
 nombre VARCHAR(50) NOT NULL,
 descripcion VARCHAR(255),
 PRIMARY KEY (categoria_id)
);

ALTER TABLE categoria MODIFY COLUMN categoria_id int(11) auto_increment NOT NULL;

-- Insertar datos en categoria
INSERT INTO CATEGORIA (Nombre, Descripcion) VALUES
('Componentes', 'Procesadores, memorias RAM, placas madre y otros componentes internos.'),
('Periféricos', 'Teclados, mouse, cámaras web y dispositivos de entrada/salida.'),
('Software', 'Aplicaciones, sistemas operativos y licencias de software.'),
('Redes', 'Routers, switches, cables de red y otros equipos de conectividad.'),
('Almacenamiento', 'Discos duros, SSD, memorias USB y soluciones de backup.'),
('Impresión', 'Impresoras láser, inyección de tinta, escáneres y consumibles.'),
('Monitores', 'Pantallas LED, monitores gamer y pantallas profesionales.'),
('Gaming', 'Accesorios para gaming como auriculares, sillas y consolas.'),
('Movilidad', 'Laptops, notebooks, tablets y accesorios móviles.'),
('Energía', 'UPS, baterías externas, estabilizadores y protectores de tensión.');

-- Crear relación articulo-categoria
ALTER TABLE ARTICULOS
ADD COLUMN CATEGORIA_ID INT DEFAULT 1,
ADD CONSTRAINT fk_articulo_categoria
FOREIGN KEY (CATEGORIA_ID) REFERENCES CATEGORIA(CATEGORIA_ID);

-- Paso 5: Crear la tabla LOCALIDADES según la estructura especificada
CREATE TABLE IF NOT EXISTS `LOCALIDADES` (
    `LocalidadID` INT AUTO_INCREMENT NOT NULL,
    `Nombre` VARCHAR(40) NOT NULL,
    `CP` VARCHAR(10) NOT NULL,
    `Provincia` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`LocalidadID`)
);

-- =====================================================
-- CONSULTAS SOLICITADAS
-- =====================================================

-- 5. Mostrar un listado de todas las bases de datos alojadas en el servidor
SHOW DATABASES;

-- 6. Mostrar un listado de todas las tablas generadas anteriormente dentro de la base de datos
-- NOTA: El requerimiento menciona "LABORATORIO" pero según el contexto debe ser "TECNO_DB"
SHOW TABLES;

-- 7. Comentar la instrucción que lista las tablas contenidas dentro de la base de datos
-- SHOW TABLES; -- Esta instrucción lista todas las tablas de la base de datos actual

-- 8. Describir la estructura de la tabla CLIENTES
DESCRIBE CLIENTES;

-- =====================================================
-- CONSULTAS ADICIONALES PARA VERIFICACIÓN
-- =====================================================

-- Verificar que la tabla LOCALIDADES fue creada correctamente
DESCRIBE LOCALIDADES;

-- Mostrar el contenido de las tablas principales
SELECT * FROM CLIENTES;
SELECT * FROM ARTICULOS;
SELECT * FROM LOCALIDAD;

-- Verificar las relaciones entre tablas
SELECT 
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.DIRECCION,
    l.NOMBRE as LOCALIDAD,
    l.PROVINCIA
FROM CLIENTES c
LEFT JOIN localidad l ON c.LOCALIDAD_ID = l.LOCALIDAD_ID;
