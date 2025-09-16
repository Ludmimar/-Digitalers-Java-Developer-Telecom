-- =====================================================
-- EJERCICIO 4 - IMPORTACIÓN CSV TOP_SPOTIFY A BONUS_TRACK
-- =====================================================

-- 1. Usar la base de datos BONUS_TRACK creada en el Ejercicio 1
USE BONUS_TRACK;

-- =====================================================
-- IMPORTACIÓN DEL ARCHIVO CSV TOP_SPOTIFY*
-- =====================================================

-- 1a. Eliminar la tabla TOP_SPOTIFY si ya existe dentro de la base de datos
DROP TABLE IF EXISTS TOP_SPOTIFY;

-- 1b. Crear la tabla TOP_SPOTIFY con estructura apropiada para datos de Spotify
-- (Los tipos de datos se mantienen según la importación automática)
CREATE TABLE TOP_SPOTIFY (
    ARTISTA VARCHAR(100),
    TITULO VARCHAR(200),
    GENERO VARCHAR(50),
    AÑO INT,
    REPRODUCCIONES BIGINT,
    DURACION INT,
    ALBUM VARCHAR(200),
    FECHA_LANZAMIENTO DATE
);

-- =====================================================
-- IMPORTACIÓN DEL CSV (INSTRUCCIONES PARA MYSQL WORKBENCH)
-- =====================================================

/*
INSTRUCCIONES PARA IMPORTAR EL ARCHIVO CSV TOP_SPOTIFY*:

1. En MySQL Workbench:
   - Click derecho en la tabla TOP_SPOTIFY
   - Seleccionar "Table Data Import Wizard"
   - Seleccionar el archivo CSV TOP_SPOTIFY*
   - Configurar las opciones:
     * Delimiter: Coma (,)
     * Encoding: UTF-8
     * Skip first row: Sí (si tiene encabezados)
   - Mapear las columnas del CSV a las columnas de la tabla
   - Ejecutar la importación

2. Alternativamente, usar el comando LOAD DATA INFILE:
   LOAD DATA INFILE 'ruta/al/archivo/TOP_SPOTIFY.csv'
   INTO TABLE TOP_SPOTIFY
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   IGNORE 1 ROWS;
*/

-- =====================================================
-- DATOS DE EJEMPLO PARA DEMOSTRACIÓN
-- =====================================================

-- Insertar datos de ejemplo que simulan el contenido del CSV TOP_SPOTIFY*
INSERT INTO TOP_SPOTIFY (ARTISTA, TITULO, GENERO, AÑO, REPRODUCCIONES, DURACION, ALBUM, FECHA_LANZAMIENTO) VALUES
('Bad Bunny', 'Un Coco', 'Reggaeton', 2023, 1500000000, 180, 'Un Verano Sin Ti', '2022-05-06'),
('The Weeknd', 'Blinding Lights', 'Pop', 2020, 3200000000, 200, 'After Hours', '2020-03-20'),
('Ed Sheeran', 'Shape of You', 'Pop', 2017, 3500000000, 233, '÷ (Divide)', '2017-01-06'),
('Post Malone', 'Circles', 'Hip-Hop', 2019, 2000000000, 215, 'Hollywood''s Bleeding', '2019-08-30'),
('Dua Lipa', 'Levitating', 'Pop', 2020, 1800000000, 203, 'Future Nostalgia', '2020-03-27'),
('Drake', 'God''s Plan', 'Hip-Hop', 2018, 2500000000, 198, 'Scorpion', '2018-06-29'),
('Ariana Grande', '7 rings', 'Pop', 2019, 2200000000, 179, 'Thank U, Next', '2019-02-08'),
('Billie Eilish', 'bad guy', 'Alternative', 2019, 2100000000, 194, 'When We All Fall Asleep, Where Do We Go?', '2019-03-29'),
('Lewis Capaldi', 'Someone You Loved', 'Pop', 2019, 1900000000, 201, 'Divinely Uninspired to a Hellish Extent', '2019-05-17'),
('Tones and I', 'Dance Monkey', 'Pop', 2019, 1700000000, 210, 'The Kids Are Coming', '2019-05-10'),
('Travis Scott', 'SICKO MODE', 'Hip-Hop', 2018, 1600000000, 312, 'ASTROWORLD', '2018-08-03'),
('Lil Nas X', 'Old Town Road', 'Country', 2019, 1400000000, 157, '7', '2019-06-21'),
('Roddy Ricch', 'The Box', 'Hip-Hop', 2020, 1300000000, 196, 'Please Excuse Me for Being Antisocial', '2019-12-06'),
('Harry Styles', 'Watermelon Sugar', 'Pop', 2020, 1200000000, 174, 'Fine Line', '2019-12-13'),
('Doja Cat', 'Say So', 'Pop', 2020, 1100000000, 238, 'Hot Pink', '2019-11-07'),
('The Kid LAROI', 'STAY', 'Pop', 2021, 1000000000, 141, 'F*CK LOVE 3: OVER YOU', '2021-07-09'),
('Olivia Rodrigo', 'drivers license', 'Pop', 2021, 900000000, 242, 'SOUR', '2021-01-08'),
('Glass Animals', 'Heat Waves', 'Alternative', 2020, 800000000, 238, 'Dreamland', '2020-08-07'),
('Måneskin', 'Beggin''', 'Rock', 2021, 700000000, 211, 'Chosen', '2021-05-21'),
('Imagine Dragons', 'Believer', 'Rock', 2017, 600000000, 204, 'Evolve', '2017-06-23');

-- =====================================================
-- CONSULTAS SOLICITADAS
-- =====================================================

-- 2. Mostrar todo el contenido de la tabla TOP_SPOTIFY importada
SELECT 'CONTENIDO COMPLETO DE LA TABLA TOP_SPOTIFY:' as info;
SELECT * FROM TOP_SPOTIFY;

-- 3. Mostrar solo las columnas ARTISTA, TÍTULO y GÉNERO
SELECT 'SOLO COLUMNAS ARTISTA, TÍTULO Y GÉNERO:' as info;
SELECT ARTISTA, TITULO, GENERO 
FROM TOP_SPOTIFY;

-- 4. Ordenar alfabéticamente según los géneros musicales
SELECT 'ORDENADO ALFABÉTICAMENTE POR GÉNERO:' as info;
SELECT ARTISTA, TITULO, GENERO 
FROM TOP_SPOTIFY 
ORDER BY GENERO;

-- 5. Para géneros que se repiten, ordenar alfabéticamente los nombres de los artistas
SELECT 'ORDENADO POR GÉNERO Y LUEGO POR ARTISTA:' as info;
SELECT ARTISTA, TITULO, GENERO 
FROM TOP_SPOTIFY 
ORDER BY GENERO, ARTISTA;

-- =====================================================
-- CONSULTAS ADICIONALES DE VERIFICACIÓN
-- =====================================================

-- Mostrar la estructura de la tabla
DESCRIBE TOP_SPOTIFY;

-- Contar registros por género
SELECT 'CONTEO DE REGISTROS POR GÉNERO:' as info;
SELECT GENERO, COUNT(*) as cantidad_canciones
FROM TOP_SPOTIFY 
GROUP BY GENERO 
ORDER BY cantidad_canciones DESC;

-- Mostrar géneros únicos
SELECT 'GÉNEROS ÚNICOS EN LA BASE DE DATOS:' as info;
SELECT DISTINCT GENERO 
FROM TOP_SPOTIFY 
ORDER BY GENERO;

-- Mostrar artistas únicos
SELECT 'ARTISTAS ÚNICOS EN LA BASE DE DATOS:' as info;
SELECT DISTINCT ARTISTA 
FROM TOP_SPOTIFY 
ORDER BY ARTISTA;

-- =====================================================
-- CONSULTA FINAL SOLICITADA (RESULTADO ESPERADO)
-- =====================================================

SELECT 'RESULTADO FINAL - ARTISTA, TÍTULO, GÉNERO ORDENADO POR GÉNERO Y ARTISTA:' as info;
SELECT ARTISTA, TITULO, GENERO 
FROM TOP_SPOTIFY 
ORDER BY GENERO, ARTISTA;
