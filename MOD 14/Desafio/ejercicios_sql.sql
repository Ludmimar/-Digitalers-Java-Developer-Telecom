-- EJERCICIOS SQL - TOP SPOTIFY
-- Ejercicio 1: Lista de artistas y canciones usando CONCAT

-- Ejercicio 1.1: Consulta con CONCAT
SELECT 
    CONCAT(ARTISTA, ' - ', CANCION) AS CANCION,
    GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION ASC;

-- Ejercicio 1.2: Modificar para usar CONCAT_WS
SELECT 
    CONCAT_WS(' - ', ARTISTA, CANCION) AS CANCION,
    GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION ASC;

-- Ejercicio 1.3: Mostrar géneros en mayúsculas
SELECT 
    CONCAT_WS(' - ', ARTISTA, CANCION) AS CANCION,
    UPPER(GENERO) AS GENERO
FROM TOP_SPOTIFY
ORDER BY CANCION ASC;

-- Ejercicio 1.4: Agregar columna AÑOS calculando años transcurridos
SELECT 
    CONCAT_WS(' - ', ARTISTA, CANCION) AS CANCION,
    UPPER(GENERO) AS GENERO,
    YEAR(CURDATE()) - YEAR(FECHA_LANZAMIENTO) AS AÑOS
FROM TOP_SPOTIFY
ORDER BY CANCION ASC;

-- Ejercicio 1.5: Contar cantidad de registros en la tabla
SELECT 
    COUNT(*) AS CANCIONES
FROM TOP_SPOTIFY;

-- Ejercicio 1.6: Cantidad de canciones lanzadas por año
SELECT 
    YEAR(FECHA_LANZAMIENTO) AS AÑO,
    COUNT(*) AS CANTIDAD_CANCIONES
FROM TOP_SPOTIFY
GROUP BY YEAR(FECHA_LANZAMIENTO)
ORDER BY AÑO ASC;

-- Ejercicio 1.7: Cantidad de canciones por año (excluyendo años con menos de 50 canciones)
SELECT 
    YEAR(FECHA_LANZAMIENTO) AS AÑO,
    COUNT(*) AS CANTIDAD_CANCIONES
FROM TOP_SPOTIFY
GROUP BY YEAR(FECHA_LANZAMIENTO)
HAVING COUNT(*) >= 50
ORDER BY AÑO ASC;

-- ========================================
-- EJERCICIO 2 - BASE DE DATOS LIBRERIA
-- ========================================

-- Ejercicio 2.1: Lista de autores y provincias usando CONCAT
SELECT 
    CONCAT(APELLIDO, ', ', NOMBRE) AS AUTOR,
    PROVINCIA
FROM AUTORES
ORDER BY APELLIDO ASC;

-- Ejercicio 2.2: Modificar para usar CONCAT_WS
SELECT 
    CONCAT_WS(', ', APELLIDO, NOMBRE) AS AUTOR,
    PROVINCIA
FROM AUTORES
ORDER BY APELLIDO ASC;

-- Ejercicio 2.3: Mostrar nombres de autores en mayúsculas
SELECT 
    CONCAT_WS(', ', UPPER(APELLIDO), UPPER(NOMBRE)) AS AUTOR,
    PROVINCIA
FROM AUTORES
ORDER BY APELLIDO ASC;

-- Ejercicio 2.4: Mostrar solo inicial del nombre y apellido completo
SELECT 
    CONCAT_WS(', ', APELLIDO, CONCAT(LEFT(NOMBRE, 1), '.')) AS AUTOR,
    PROVINCIA
FROM AUTORES
ORDER BY APELLIDO ASC;

-- EJEMPLO DE ESTRUCTURA DE TABLA AUTORES (para referencia):
/*
CREATE TABLE AUTORES (
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    APELLIDO VARCHAR(50),
    PROVINCIA VARCHAR(50),
    FECHA_NACIMIENTO DATE
);

-- Datos de ejemplo:
INSERT INTO AUTORES VALUES 
(1, 'Gabriel', 'García Márquez', 'Magdalena', '1927-03-06'),
(2, 'Mario', 'Vargas Llosa', 'Arequipa', '1936-03-28'),
(3, 'Julio', 'Cortázar', 'Bruselas', '1914-08-26'),
(4, 'Jorge Luis', 'Borges', 'Buenos Aires', '1899-08-24'),
(5, 'Pablo', 'Neruda', 'Parral', '1904-07-12');
*/

-- ========================================
-- EJEMPLO DE ESTRUCTURA DE TABLA TOP_SPOTIFY (para referencia):
/*
CREATE TABLE TOP_SPOTIFY (
    ID INT PRIMARY KEY,
    ARTISTA VARCHAR(100),
    CANCION VARCHAR(100),
    GENERO VARCHAR(50),
    FECHA_LANZAMIENTO DATE
);

-- Datos de ejemplo:
INSERT INTO TOP_SPOTIFY VALUES 
(1, 'Bad Bunny', 'Tití Me Preguntó', 'Reggaeton', '2022-05-06'),
(2, 'Taylor Swift', 'Anti-Hero', 'Pop', '2022-10-21'),
(3, 'The Weeknd', 'Blinding Lights', 'Pop', '2019-11-29'),
(4, 'Ed Sheeran', 'Shape of You', 'Pop', '2017-01-06'),
(5, 'Billie Eilish', 'Bad Guy', 'Alternative', '2019-03-29');
*/
