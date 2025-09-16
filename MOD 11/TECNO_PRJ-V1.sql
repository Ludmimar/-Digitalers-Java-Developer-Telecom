CREATE TABLE IF NOT EXISTS `FACTURAS` (
	`FACTURA_ID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`LETRA` varchar(1) NOT NULL,
	`NUMERO` int NOT NULL,
	`CLIENTE_ID` int NOT NULL,
	`FECHA` date NOT NULL,
	`MONTO` decimal(10,2) NOT NULL,
	PRIMARY KEY (`FACTURA_ID`)
);

CREATE TABLE IF NOT EXISTS `ARTICULOS` (
	`ARTICULO_ID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`NOMBRE` varchar(50) NOT NULL,
	`PRECIO` decimal(10,2) NOT NULL,
	`STOCK` int NOT NULL,
	PRIMARY KEY (`ARTICULO_ID`)
);

CREATE TABLE IF NOT EXISTS `DETALLES` (
	`DETALLE_ID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`ARTICULO_ID` int NOT NULL,
	`FACTURA_ID` int NOT NULL,
	`CANTIDAD` int NOT NULL,
	PRIMARY KEY (`DETALLE_ID`)
);

CREATE TABLE IF NOT EXISTS `CLIENTES` (
	`CLIENTE_ID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`NOMBRE` varchar(25) NOT NULL,
	`APELLIDO` varchar(25) NOT NULL,
	`CUIT` varchar(16) NOT NULL,
	`COMENTARIOS` varchar(50) NOT NULL,
	`DIRECCION` varchar(50) NOT NULL,
	PRIMARY KEY (`CLIENTE_ID`)
);

ALTER TABLE `FACTURAS` ADD CONSTRAINT `FACTURAS_fk3` FOREIGN KEY (`CLIENTE_ID`) REFERENCES `CLIENTES`(`CLIENTE_ID`);

ALTER TABLE `DETALLES` ADD CONSTRAINT `DETALLES_fk1` FOREIGN KEY (`ARTICULO_ID`) REFERENCES `ARTICULOS`(`ARTICULO_ID`);

ALTER TABLE `DETALLES` ADD CONSTRAINT `DETALLES_fk2` FOREIGN KEY (`FACTURA_ID`) REFERENCES `FACTURAS`(`FACTURA_ID`);




INSERT INTO PRODUCTOS
(Nombre, Precio, Marca, Categoria, Stock, Disponible)
VALUES ('iPhone 5', 499.99, 'Apple', 'Smartphone', 500, false);


INSERT INTO PRODUCTOS
SET Nombre = 'iPhone 5', Precio = 499.99, Marca = 'Apple', Categoria =
'Smartphone', Stock = 500, Disponible = false;





--#################### Integrador n° 11: Consultas solbre la BASE DE DATOS TECNO_PRJ ##########################
--Modificar columna precio a monto y agregarle restriccion de signo
ALTER TABLE articulos MODIFY PRECIO INT UNSIGNED NOT NULL;
ALTER TABLE articulos CHANGE NOMBRE NOMBRE VARCHAR(75);
ALTER TABLE facturas MODIFY MONTO DECIMAL(10,2) UNSIGNED NOT NULL;
ALTER TABLE articulos MODIFY STOCK int(11) UNSIGNED NOT NULL;
ALTER TABLE clientes CHANGE NOMBRE NOMBRE VARCHAR(30) NOT NULL;
ALTER TABLE clientes CHANGE APELLIDO APELLIDO VARCHAR(35) NOT NULL;
ALTER TABLE clientes CHANGE COMENTARIOS OBSERVACIONES VARCHAR(255);

-- Creamos la tabla localidad

CREATE TABLE IF NOT EXISTS localidad (
    LOCALIDAD_ID INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL,
    CP INT NOT NULL,
    PROVINCIA VARCHAR(100) NOT NULL
);

-- creamos la relacion usuario-localidad

ALTER TABLE clientes ADD COLUMN LOCALIDAD_ID INT;

ALTER TABLE clientes ADD CONSTRAINT fk_localidad FOREIGN KEY (LOCALIDAD_ID) REFERENCES localidad(LOCALIDAD_ID);

-- INSERTAR REGISTROS EN LA TABLA LOCALIDAD

INSERT INTO LOCALIDAD (NOMBRE, CP, PROVINCIA) VALUES
('CABA', 1000, 'Buenos Aires'),
('Rosario', 2000, 'Santa Fe'),
('Córdoba', 5000, 'Córdoba'),
('San Miguel de Tucumán', 4000, 'Tucumán'),
('Neuquén', 8300, 'Neuquén');


--INSERTAR REGISTROS EN LA TABLA CLIENTES

INSERT INTO CLIENTES (NOMBRE, APELLIDO, CUIT, DIRECCION, LOCALIDAD_ID, OBSERVACIONES) VALUES
('Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 3, NULL),
('Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 1, 'GBA'),
('Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 5, 'GBA'),
('Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 2, 'VIP'),
('Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 4, 'GBA');

-- INSERTAR ARTICULOS EN LA TABLA ARTICULOS
INSERT INTO articulos (ARTICULO_ID, NOMBRE, PRECIO, STOCK)
VALUES
(95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
(157, 'Apple AirPods Pro', 979.75, 152),
(335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
(411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);

--INSERTAR FACTURAS EN LA TABLA FACTURAS
INSERT INTO detalles (DETALLE_ID, ARTICULO_ID, FACTURA_ID, CANTIDAD) VALUES
(1, 95, 1, 2),
(2, 157, 1, 1),
(3, 335, 2, 3),
(4, 411, 2, 1),
(5, 95, 3, 1),
(6, 157, 3, 2),
(7, 335, 4, 1),
(8, 411, 4, 1),
(9, 95, 5, 2),
(10, 157, 5, 3),
(11, 335, 1, 1),
(12, 411, 2, 2),
(13, 95, 3, 1),
(14, 157, 4, 1),
(15, 335, 5, 1);

-- Para duplicar tablas
CREATE TABLE localidad_COPIA
SELECT * FROM localidad;

-- Para duplicar tablas APLICANDO algun fitro
 CREATE TABLE localidad_COPIA_DE_LA_COPIA
 SELECT * FROM localidad where LOCALIDAD_ID < 3;

 --Para actualizar registros existentes

 UPDATE clientes SET OBSERVACIONES = 'usando consulta update' WHERE CLIENTE_ID = 3;

 --Para eleiminar registros

 DELETE FROM clientes WHERE id = 11;

 DELETE FROM clientes WHERE fecha_nacimiento < '1980-01-01';

 DELETE FROM clientes;

-- Para agregar la tabla categoria en la base de datos tecno_prj

CREATE TABLE if NOT EXISTS CATEGORIA (
 categoria_id INT not NULL,
 nombre VARCHAR(50) NOT NULL,
 descripcion VARCHAR(255),
 PRIMARY KEY (categoria_id)
);

ALTER TABLE tecno_prj.categoria MODIFY COLUMN categoria_id int(11) auto_increment NOT NULL;


-- Insertar datos en la tabla categorias


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

-- Crear columna categoria id en articulos y se setea por defecto valor 1


ALTER TABLE tecno_prj.ARTICULOS
ADD COLUMN CATEGORIA_ID INT DEFAULT 1,
ADD CONSTRAINT fk_articulo_categoria
FOREIGN KEY (CATEGORIA_ID) REFERENCES CATEGORIA(CATEGORIA_ID);

--########################################################################################################
--1. FROM facturas f
--Se toma la tabla facturas como punto de partida, y se le da el alias f.
--
--2. JOIN detalles d ON f.FACTURA_ID = d.FACTURA_ID
--Se une la tabla facturas con la tabla detalles, relacionando cada factura con sus líneas de detalle (los productos comprados en esa factura).
--
--3. JOIN articulos a ON d.ARTICULO_ID = a.ARTICULO_ID
--Ahora se une la tabla detalles con articulos, para obtener información como el nombre y precio del producto comprado.
--
--4. WHERE f.CLIENTE_ID = 5
--Se filtra para considerar únicamente las facturas del cliente con CLIENTE_ID = 5.
--
--5. SELECT ...
--Se seleccionan los siguientes datos:
--
--a.ARTICULO_ID: el ID del artículo.
--
--a.NOMBRE: el nombre del artículo.
--
--SUM(d.CANTIDAD) AS cantidad: la cantidad total comprada de ese artículo por el cliente (sumando todas las facturas).
--
--(SUM(d.CANTIDAD) * a.PRECIO) AS total_gastado: el total gastado en ese producto por el cliente. Se multiplica la cantidad total comprada por el precio del producto.
--
--⚠️ Importante: Esto asume que el PRECIO del producto no cambió entre compras. Si el precio pudo haber variado entre facturas, esta fórmula podría no ser precisa. En ese caso deberías usar el precio registrado en el detalle de cada factura (si lo tenés, como d.PRECIO_UNITARIO por ejemplo).
--
--6. GROUP BY a.NOMBRE
--Agrupa los resultados por nombre del artículo, es decir, junta todas las compras del mismo producto para ese cliente.
--
--🔍 Lo ideal sería agrupar también por a.ARTICULO_ID, no solo por nombre, en caso de que existan artículos con nombres iguales. Podrías hacer:
--
--sql
--Copiar
--Editar
--GROUP BY a.ARTICULO_ID, a.NOMBRE;


SELECT a.ARTICULO_ID, a.NOMBRE, sum(d.CANTIDAD) as cantidad,  (sum(d.CANTIDAD) * a.precio)
 as total_gastado FROM facturas f
JOIN detalles d ON f.FACTURA_ID = d.FACTURA_ID
JOIN articulos a ON d.ARTICULO_ID = a.ARTICULO_ID
WHERE f.CLIENTE_ID = 5 GROUP by a.NOMBRE;
--########################################################################################################


SELECT DISTINCT c.CLIENTE_ID, c.NOMBRE, c.APELLIDO, c.LOCALIDAD_ID
FROM clientes c
JOIN facturas f ON c.CLIENTE_ID = f.CLIENTE_ID
WHERE f.FECHA >= CURDATE() - INTERVAL 1 YEAR;

--#########################################################
SELECT
    a.ARTICULO_ID,
    a.NOMBRE,
    SUM(d.CANTIDAD) AS total_unidades_vendidas,
    a.PRECIO,
    SUM(d.CANTIDAD * a.PRECIO) AS total_vendido
FROM
    detalles d
JOIN
    articulos a ON d.ARTICULO_ID = a.ARTICULO_ID
GROUP BY
    a.ARTICULO_ID
HAVING
    total_vendido < 50000;

    --##############################################
    select * FROM articulos a
    where a.precio > (select avg(a.PRECIO) from articulos a)

--################################################
SELECT DISTINCT c.CLIENTE_ID, c.NOMBRE, c.APELLIDO, c.CUIT, c.OBSERVACIONES, c.DIRECCION,
c.LOCALIDAD_ID, c.CREATION_DATE FROM clientes c
JOIN facturas f ON c.CLIENTE_ID = f.CLIENTE_ID
JOIN detalles d ON f.FACTURA_ID = d.FACTURA_ID
where d.ARTICULO_ID in
(select a.ARTICULO_ID FROM articulos a
    where a.precio > (select avg(a.PRECIO) from articulos a))

--######################################  INNER JOIN
SELECT * FROM facturas f INNER JOIN detalles d ON f.FACTURA_ID = d.FACTURA_ID;

--######################################  LEFT JOIN
SELECT * FROM facturas f LEFT JOIN detalles d ON f.FACTURA_ID = d.FACTURA_ID;

--######################################  RIGHT JOIN
SELECT * FROM facturas f RIGHT JOIN detalles d ON f.FACTURA_ID = d.FACTURA_ID;


--######################################  integrador etapa 4
----------------------------------------------------------------
select a.NOMBRE AS producto, c.nombre AS categoria from articulos a JOIN categoria c ON c.categoria_id = a.CATEGORIA_ID

----------------------------------------------------------------
select c.NOMBRE as cliente_nombre, c.APELLIDO as cliente_apellido, c.DIRECCION as cliente_direccion, l.NOMBRE as localidad from clientes c LEFT JOIN localidad l ON c.LOCALIDAD_ID = l.LOCALIDAD_ID;

----------------------------------------------------------------
select c.NOMBRE as cliente_nombre, c.APELLIDO as cliente_apellido, c.DIRECCION as cliente_direccion, l.NOMBRE as localidad from clientes c
LEFT JOIN localidad l ON c.LOCALIDAD_ID = l.LOCALIDAD_ID WHERE C.APELLIDO like 'G%' AND l.PROVINCIA LIKE 'Buenos Aires'

----------------------------------------------------------------
(
    SELECT
        a.ARTICULO_ID, a.NOMBRE,  a.STOCK, a.PRECIO, c.nombre AS categoria,  'Destacado' AS tipo
    FROM articulos a
    JOIN categoria c
        ON a.CATEGORIA_ID = c.categoria_id
    WHERE a.STOCK > 50
)
UNION ALL
(
    SELECT a.ARTICULO_ID, a.NOMBRE, a.STOCK, a.PRECIO, c.nombre AS categoria, 'Normal' AS tipo
    FROM articulos a
    JOIN categoria c
        ON a.CATEGORIA_ID = c.categoria_id
    WHERE a.STOCK <= 50
)
ORDER BY tipo ASC, nombre ASC;
----------------------------------------------------------------
SELECT * FROM facturas f
LEFT JOIN detalles d
    ON f.FACTURA_ID = d.FACTURA_ID;

---------------------------------------------------------------
SELECT f.FACTURA_ID, f.LETRA, f.NUMERO, f.FECHA, f.MONTO, d.CANTIDAD, d.ARTICULO_ID, a.NOMBRE
/*, COUNT(*) AS cantidad_items*/
FROM facturas f
LEFT JOIN detalles d
    ON f.FACTURA_ID = d.FACTURA_ID
INNER JOIN articulos a
    ON d.ARTICULO_ID = a.ARTICULO_ID
/*GROUP BY f.FACTURA_ID*/
order by f.FACTURA_ID;

----------------------------------------------------------------
select f.* from clientes c
LEFT JOIN facturas f
    ON f.CLIENTE_ID = c.CLIENTE_ID
where c.APELLIDO LIKE 'García'

----------------------------------------------------------------
select a.* from clientes c

LEFT JOIN facturas f
	ON f.CLIENTE_ID = c.CLIENTE_ID
INNER JOIN detalles d
	ON f.FACTURA_ID = d.FACTURA_ID
INNER JOIN articulos a
	ON d.ARTICULO_ID = a.ARTICULO_ID

where c.APELLIDO LIKE 'López'

--############################### TERMINO EL INTEGRADOR 4

SELECT * FROM articulos a WHERE a.ARTICULO_ID IN
(SELECT detalles.ARTICULO_ID FROM facturas
	INNER JOIN detalles
 		ON facturas.FACTURA_ID = detalles.FACTURA_ID
);

------------------------------------------------------------
SELECT NOMBRE, PRECIO,
CASE WHEN PRECIO < 20 THEN 'BARATO'
WHEN PRECIO BETWEEN 20 AND 40 THEN 'EQUILIBRADO'
ELSE 'CARO'
END as categoria
FROM articulos;

------------------------------------------------------------
SELECT CONCAT('Sr./a. ', NOMBRE, ' ', APELLIDO) as 'Nombre completo' FROM clientes;

SELECT CONCAT_WS(',', nombre, apellido, cuit, direccion) as 'Datos Completos' FROM clientes;

SELECT  UPPER(CONCAT_WS(',', nombre, apellido, cuit, direccion)) as 'Datos Completos' FROM clientes;

SELECT  LOWER(CONCAT_WS(',', nombre, apellido, cuit, direccion)) as 'Datos Completos' FROM clientes;

SELECT CONCAT(LEFT(nombre, 1), '.') As Inicial_nombre FROM clientes;

SELECT RIGHT(cuit, 1) as 'Dígito verificador' FROM clientes;

SELECT SUBSTRING(cuit, 4, 8) as 'DNI' FROM clientes;

SELECT direccion, CHAR_LENGTH(direccion) as 'Cantidad de caracteres' FROM clientes;

SELECT direccion, LOCATE('on',direccion) 'Posición' from clientes;

SELECT LTRIM(direccion) Direccion_Correcta from clientes;

SELECT RTRIM(direccion) Direccion_Correcta from clientes;

SELECT TRIM(direccion) Direccion_Correcta from clientes;

SELECT REPLACE(direccion, '7º', 'Septimo ') Direccion from clientes;

alter table facturas change FECHA FECHA timestamp

SELECT YEAR(fecha) as 'Año' FROM facturas;

SELECT MONTH(fecha) as 'Mes' FROM facturas;

SELECT DAY(fecha) as 'DIA' FROM facturas;

SELECT HOUR(fecha) as 'HORA' FROM facturas;

SELECT CURTIME() as 'HORA ACTUAL';  /*Obtener hora minutos y segundos actuales*/

SELECT DATEDIFF('2020-06-30','2020-01-01') as 'DIAS TRANSCURRIDOS'; /*calcula la diferencia de dias entre 2 fechas*/

SELECT DATEDIFF(CURDATE(), FECHA ) as 'DIAS TRANSCURRIDOS' FROM facturas;

SELECT TIMESTAMPDIFF(MONTH, '2020-01-01', '2020-06-30') as 'MESES TRANSCURRIDOS';

SELECT TIMESTAMPDIFF(MONTH, FECHA, CURDATE()) as 'MESES TRANSCURRIDOS' FROM facturas; /*Calcula la cantidad de meses de diferencia entre 2 fechas*/

SELECT TIMESTAMPDIFF(YEAR, FECHA, CURDATE()) as 'MESES TRANSCURRIDOS' FROM facturas;/*Calcula la cantidad de años de diferencia entre 2 fechas*/


SELECT
	case
		when DAYNAME(FECHA) like 'Monday' then 'Lunes'
		when DAYNAME(FECHA) like 'Tuesday' then 'Martes'
		when DAYNAME(FECHA) like 'Wednesday' then 'Miercoles'
		when DAYNAME(FECHA) like 'Thursday' then 'Jueves'
		when DAYNAME(FECHA) like 'Friday' then 'Viernes'
		when DAYNAME(FECHA) like 'Saturday' then 'Sabado'
		else 'Domingo'
end as 'Nombre del día'

 FROM facturas;