-- =====================================================
-- EJERCICIO 5 - CONSULTAS SOBRE TABLA TOP_SPOTIFY
-- =====================================================

-- Usar la base de datos BONUS_TRACK
USE BONUS_TRACK;

-- =====================================================
-- AGREGAR DATOS ADICIONALES PARA LAS CONSULTAS
-- =====================================================

-- Agregar canciones de Madonna para la consulta 3
INSERT INTO TOP_SPOTIFY (ARTISTA, TITULO, GENERO, AÑO, REPRODUCCIONES, DURACION, ALBUM, FECHA_LANZAMIENTO) VALUES
('Madonna', 'Like a Prayer', 'Pop', 1989, 500000000, 339, 'Like a Prayer', '1989-03-03'),
('Madonna', 'Vogue', 'Dance Pop', 1990, 400000000, 320, 'I''m Breathless', '1990-04-27'),
('Madonna', 'Material Girl', 'Pop', 1985, 350000000, 240, 'Like a Virgin', '1984-11-12'),
('Madonna', 'Hung Up', 'Dance Pop', 2005, 300000000, 336, 'Confessions on a Dance Floor', '2005-10-17'),
('Madonna', 'Papa Don''t Preach', 'Pop', 1986, 250000000, 280, 'True Blue', '1986-06-11');

-- Agregar más canciones Pop para tener más datos
INSERT INTO TOP_SPOTIFY (ARTISTA, TITULO, GENERO, AÑO, REPRODUCCIONES, DURACION, ALBUM, FECHA_LANZAMIENTO) VALUES
('Taylor Swift', 'Shake It Off', 'Pop', 2014, 2000000000, 219, '1989', '2014-08-18'),
('Katy Perry', 'Roar', 'Pop', 2013, 1800000000, 224, 'Prism', '2013-08-10'),
('Bruno Mars', 'Uptown Funk', 'Pop', 2014, 1600000000, 269, 'Uptown Special', '2014-11-10'),
('Rihanna', 'We Found Love', 'Pop', 2011, 1400000000, 213, 'Talk That Talk', '2011-09-22'),
('Lady Gaga', 'Poker Face', 'Pop', 2008, 1200000000, 237, 'The Fame', '2008-09-26'),
('Justin Bieber', 'Sorry', 'Pop', 2015, 1000000000, 200, 'Purpose', '2015-10-23'),
('Selena Gomez', 'Lose You to Love Me', 'Pop', 2019, 800000000, 181, 'Rare', '2019-10-23'),
('Adele', 'Hello', 'Pop', 2015, 600000000, 295, '25', '2015-10-23'),
('Miley Cyrus', 'Wrecking Ball', 'Pop', 2013, 400000000, 223, 'Bangerz', '2013-08-25'),
('Kesha', 'Tik Tok', 'Dance Pop', 2009, 300000000, 200, 'Animal', '2009-08-07'),
('Britney Spears', 'Toxic', 'Dance Pop', 2003, 250000000, 198, 'In the Zone', '2003-11-12'),
('Lady Gaga', 'Bad Romance', 'Dance Pop', 2009, 200000000, 294, 'The Fame Monster', '2009-10-26');

-- =====================================================
-- CONSULTAS SOLICITADAS
-- =====================================================

-- 1. Mostrar todos los registros de la tabla TOP_SPOTIFY
-- En el resultado solo se deben observar las columnas ARTISTA, TÍTULO y GÉNERO
-- Ordenar el resultado alfabéticamente según los nombres de los artistas y el nombre de las canciones
-- Mostrar únicamente las 10 primeras canciones
SELECT 'CONSULTA 1: Primeras 10 canciones ordenadas por artista y título:' as info;
SELECT ARTISTA, TITULO, GENERO 
FROM TOP_SPOTIFY 
ORDER BY ARTISTA, TITULO 
LIMIT 10;

-- 2. Modificar la consulta anterior para mostrar únicamente las canciones ubicadas desde la posición 11 hasta la 15 inclusive
SELECT 'CONSULTA 2: Canciones de la posición 11 a la 15:' as info;
SELECT ARTISTA, TITULO, GENERO 
FROM TOP_SPOTIFY 
ORDER BY ARTISTA, TITULO 
LIMIT 5 OFFSET 10;

-- 3. Dada la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones pertenecientes a la cantante Madonna
-- Debes mostrar todos los campos de la tabla en el resultado de la consulta
SELECT 'CONSULTA 3: Todas las canciones de Madonna:' as info;
SELECT * 
FROM TOP_SPOTIFY 
WHERE ARTISTA = 'Madonna';

-- 4. A partir de la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones pertenecientes al género Pop
-- Mostrar todos los campos de la tabla en el resultado de la consulta y ordenar alfabéticamente el resultado según el nombre de las canciones
SELECT 'CONSULTA 4: Todas las canciones del género Pop ordenadas por título:' as info;
SELECT * 
FROM TOP_SPOTIFY 
WHERE GENERO = 'Pop' 
ORDER BY TITULO;

-- 5. De la tabla TOP_SPOTIFY, obtener una lista de todas las canciones pertenecientes al género Pop lanzadas durante el año 2015
-- Mostrar todos los campos de la tabla en el resultado de la consulta y ordenar dicho resultado alfabéticamente según los nombres de los artistas y los nombres de las canciones
SELECT 'CONSULTA 5: Canciones Pop del año 2015 ordenadas por artista y título:' as info;
SELECT * 
FROM TOP_SPOTIFY 
WHERE GENERO = 'Pop' AND AÑO = 2015 
ORDER BY ARTISTA, TITULO;

-- 6. A partir de la tabla TOP_SPOTIFY, obtener una lista de todas aquellas canciones lanzadas antes del año 2011 y que pertenezcan al género Dance Pop
-- Mostrar todos los campos de la tabla en el resultado de la consulta y ordenar dicho resultado alfabéticamente según los nombres de las canciones
SELECT 'CONSULTA 6: Canciones Dance Pop antes de 2011 ordenadas por título:' as info;
SELECT * 
FROM TOP_SPOTIFY 
WHERE GENERO = 'Dance Pop' AND AÑO < 2011 
ORDER BY TITULO;

-- =====================================================
-- CONSULTAS ADICIONALES DE VERIFICACIÓN
-- =====================================================

-- Mostrar el conteo total de registros
SELECT 'TOTAL DE REGISTROS EN LA TABLA:' as info;
SELECT COUNT(*) as total_registros FROM TOP_SPOTIFY;

-- Mostrar conteo por género
SELECT 'CONTEO DE CANCIONES POR GÉNERO:' as info;
SELECT GENERO, COUNT(*) as cantidad 
FROM TOP_SPOTIFY 
GROUP BY GENERO 
ORDER BY cantidad DESC;

-- Mostrar conteo por año
SELECT 'CONTEO DE CANCIONES POR AÑO:' as info;
SELECT AÑO, COUNT(*) as cantidad 
FROM TOP_SPOTIFY 
GROUP BY AÑO 
ORDER BY AÑO DESC;

-- Mostrar todos los artistas únicos
SELECT 'ARTISTAS ÚNICOS EN LA BASE DE DATOS:' as info;
SELECT DISTINCT ARTISTA 
FROM TOP_SPOTIFY 
ORDER BY ARTISTA;

-- Mostrar todos los géneros únicos
SELECT 'GÉNEROS ÚNICOS EN LA BASE DE DATOS:' as info;
SELECT DISTINCT GENERO 
FROM TOP_SPOTIFY 
ORDER BY GENERO;

-- =====================================================
-- RESUMEN DE RESULTADOS ESPERADOS
-- =====================================================

SELECT 'RESUMEN DE CONSULTAS EJECUTADAS:' as info;
SELECT 
    'Consulta 1' as consulta, 
    'Primeras 10 canciones por artista y título' as descripcion,
    '10 registros' as registros_esperados
UNION ALL
SELECT 'Consulta 2', 'Canciones 11-15 por artista y título', '5 registros'
UNION ALL
SELECT 'Consulta 3', 'Todas las canciones de Madonna', '5 registros'
UNION ALL
SELECT 'Consulta 4', 'Canciones Pop ordenadas por título', 'Variable'
UNION ALL
SELECT 'Consulta 5', 'Canciones Pop de 2015 por artista y título', 'Variable'
UNION ALL
SELECT 'Consulta 6', 'Dance Pop antes de 2011 por título', 'Variable';
