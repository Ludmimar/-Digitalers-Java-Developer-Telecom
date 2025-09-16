-- =====================================================
-- PROYECTO INTEGRADOR - ETAPA 3
-- Organización de ARTICULOS por CATEGORIA
-- Base de datos: TECNO_DB
-- =====================================================

-- Asegurar que estamos usando la base de datos correcta
USE TECNO_DB;

-- =====================================================
-- PASO 1: CREAR TABLA CATEGORIA (OPTIMIZADA)
-- =====================================================

-- Tabla CATEGORIA corregida y optimizada
-- Errores corregidos:
-- 1. IF EXISTS -> IF NOT EXISTS
-- 2. INT NOT -> INT NOT NULL
-- 3. Agregado AUTO_INCREMENT para la clave primaria
-- 4. Nombres de columnas en mayúsculas para consistencia

CREATE TABLE IF NOT EXISTS CATEGORIA (
    CategoriaID INT AUTO_INCREMENT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255),
    PRIMARY KEY (CategoriaID)
);

-- =====================================================
-- PASO 2: INSERTAR 10 REGISTROS DE CATEGORÍAS PARA EMPRESA DE TECNOLOGÍA
-- =====================================================

-- Limpiar tabla CATEGORIA para empezar desde cero
TRUNCATE TABLE CATEGORIA;

-- Insertar 10 categorías para una empresa de tecnología
INSERT INTO CATEGORIA (Nombre, Descripcion) VALUES
('Componentes de PC', 'Procesadores, memorias RAM, placas madre, tarjetas gráficas y otros componentes internos de computadoras'),
('Periféricos', 'Teclados, mouse, cámaras web, auriculares y dispositivos de entrada/salida'),
('Software', 'Aplicaciones, sistemas operativos, licencias de software y herramientas de desarrollo'),
('Redes y Conectividad', 'Routers, switches, cables de red, adaptadores WiFi y equipos de conectividad'),
('Almacenamiento', 'Discos duros, SSD, memorias USB, tarjetas SD y soluciones de backup'),
('Impresión y Escaneo', 'Impresoras láser, inyección de tinta, escáneres, multifuncionales y consumibles'),
('Monitores y Pantallas', 'Pantallas LED, monitores gamer, pantallas profesionales y proyectores'),
('Gaming', 'Accesorios para gaming como auriculares, sillas gamer, teclados mecánicos y consolas'),
('Movilidad', 'Laptops, notebooks, tablets, smartphones y accesorios móviles'),
('Energía y Protección', 'UPS, baterías externas, estabilizadores, protectores de tensión y cargadores');

-- =====================================================
-- PASO 3: MODIFICAR TABLA ARTICULOS AGREGANDO CAMPO CATEGORIA
-- =====================================================

-- Agregar campo CategoriaID a la tabla ARTICULOS con valor por defecto 1
-- y crear relación con la tabla CATEGORIA
ALTER TABLE ARTICULOS 
ADD COLUMN CategoriaID INT DEFAULT 1,
ADD CONSTRAINT fk_articulos_categoria 
FOREIGN KEY (CategoriaID) REFERENCES CATEGORIA(CategoriaID);

-- =====================================================
-- CONSULTAS DE VERIFICACIÓN
-- =====================================================

-- Verificar estructura de la tabla CATEGORIA
DESCRIBE CATEGORIA;

-- Verificar estructura de la tabla ARTICULOS modificada
DESCRIBE ARTICULOS;

-- Mostrar todas las categorías creadas
SELECT '=== CATEGORÍAS CREADAS ===' as INFO;
SELECT * FROM CATEGORIA ORDER BY CategoriaID;

-- Mostrar artículos con sus categorías
SELECT '=== ARTICULOS CON SUS CATEGORÍAS ===' as INFO;
SELECT 
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    a.STOCK,
    c.Nombre as CATEGORIA,
    c.Descripcion as DESCRIPCION_CATEGORIA
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
ORDER BY a.ARTICULO_ID;

-- Verificar las relaciones de claves foráneas
SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_SCHEMA = 'TECNO_DB' 
AND REFERENCED_TABLE_NAME = 'CATEGORIA'
ORDER BY TABLE_NAME;

-- =====================================================
-- RESUMEN FINAL
-- =====================================================

SELECT 
    'ETAPA 3 COMPLETADA' as ESTADO,
    (SELECT COUNT(*) FROM CATEGORIA) as CATEGORIAS_CREADAS,
    (SELECT COUNT(*) FROM ARTICULOS) as ARTICULOS_TOTALES,
    (SELECT COUNT(DISTINCT CategoriaID) FROM ARTICULOS) as CATEGORIAS_EN_USO;
