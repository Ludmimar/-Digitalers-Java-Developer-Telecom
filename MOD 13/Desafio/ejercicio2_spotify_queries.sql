-- Ejercicio 2 - Consultas para base de datos de música/Spotify
-- Utilizando las tablas ÚLTIMOS LANZAMIENTOS y TOP SPOTIFY

-- 1. A través del uso de la tabla ÚLTIMOS LANZAMIENTOS, obtener una lista de
-- todos aquellos temas lanzados durante el último año (año más alto que figure en la tabla).
-- En el resultado de la consulta, mostrar solo las columnas ARTISTA y TÍTULO.
-- Ordenar alfabéticamente el resultado por los nombres de los artistas; en el caso de que
-- un mismo artista haya tenido más de un lanzamiento, organizar el resultado por los títulos.

SELECT 
    ARTISTA,
    TITULO
FROM "ÚLTIMOS LANZAMIENTOS"
WHERE AÑO = (
    SELECT MAX(AÑO) 
    FROM "ÚLTIMOS LANZAMIENTOS"
)
ORDER BY ARTISTA, TITULO;

-- Consulta alternativa usando CTE para mayor claridad
WITH UltimoAño AS (
    SELECT MAX(AÑO) AS año_maximo
    FROM "ÚLTIMOS LANZAMIENTOS"
)
SELECT 
    ul.ARTISTA,
    ul.TITULO
FROM "ÚLTIMOS LANZAMIENTOS" ul
CROSS JOIN UltimoAño ua
WHERE ul.AÑO = ua.año_maximo
ORDER BY ul.ARTISTA, ul.TITULO;

-- 2. A través del uso de la tabla TOP SPOTIFY, obtener una lista de todos aquellos
-- lanzamientos correspondientes a LADY GAGA con mayor permanencia en la plataforma digital.
-- En el resultado de la consulta, solo mostrar los títulos de las canciones de la artista.
-- Ordenar el resultado alfabéticamente por los títulos de las canciones.

SELECT 
    TITULO
FROM "TOP SPOTIFY"
WHERE ARTISTA = 'LADY GAGA'
  AND PERMANENCIA = (
      SELECT MAX(PERMANENCIA) 
      FROM "TOP SPOTIFY" 
      WHERE ARTISTA = 'LADY GAGA'
  )
ORDER BY TITULO;

-- Consulta alternativa usando CTE
WITH MaxPermanenciaLadyGaga AS (
    SELECT MAX(PERMANENCIA) AS max_permanencia
    FROM "TOP SPOTIFY"
    WHERE ARTISTA = 'LADY GAGA'
)
SELECT 
    ts.TITULO
FROM "TOP SPOTIFY" ts
CROSS JOIN MaxPermanenciaLadyGaga mp
WHERE ts.ARTISTA = 'LADY GAGA'
  AND ts.PERMANENCIA = mp.max_permanencia
ORDER BY ts.TITULO;

-- 3. Utiliza la tabla TOP SPOTIFY y genera una consulta que muestre los campos ARTISTA y TÍTULO.
-- Agregar una columna con el nombre TIPO en la que se muestren los siguientes valores:
-- ● Pop si la canción pertenece a un género que contenga la palabra POP.
-- ● Electrónica si la canción pertenece a un género que contenga las palabras ELECTRO o HOUSE.
-- ● Otro si no se cumple ninguna de las condiciones anteriores.
-- Ordena el resultado alfabéticamente por nombres de los artistas. En el caso de que
-- haya un artista con más de una canción en el listado, mostrar ordenados alfabéticamente
-- los nombres de las canciones.

SELECT 
    ARTISTA,
    TITULO,
    CASE 
        WHEN UPPER(GENERO) LIKE '%POP%' THEN 'Pop'
        WHEN UPPER(GENERO) LIKE '%ELECTRO%' OR UPPER(GENERO) LIKE '%HOUSE%' THEN 'Electrónica'
        ELSE 'Otro'
    END AS TIPO
FROM "TOP SPOTIFY"
ORDER BY ARTISTA, TITULO;

-- Consulta alternativa con más detalles para verificar la clasificación
SELECT 
    ARTISTA,
    TITULO,
    GENERO,
    CASE 
        WHEN UPPER(GENERO) LIKE '%POP%' THEN 'Pop'
        WHEN UPPER(GENERO) LIKE '%ELECTRO%' OR UPPER(GENERO) LIKE '%HOUSE%' THEN 'Electrónica'
        ELSE 'Otro'
    END AS TIPO
FROM "TOP SPOTIFY"
ORDER BY ARTISTA, TITULO;

-- Consultas adicionales útiles:

-- Estadísticas por tipo de música
SELECT 
    CASE 
        WHEN UPPER(GENERO) LIKE '%POP%' THEN 'Pop'
        WHEN UPPER(GENERO) LIKE '%ELECTRO%' OR UPPER(GENERO) LIKE '%HOUSE%' THEN 'Electrónica'
        ELSE 'Otro'
    END AS TIPO,
    COUNT(*) AS cantidad_canciones,
    AVG(PERMANENCIA) AS permanencia_promedio
FROM "TOP SPOTIFY"
GROUP BY 
    CASE 
        WHEN UPPER(GENERO) LIKE '%POP%' THEN 'Pop'
        WHEN UPPER(GENERO) LIKE '%ELECTRO%' OR UPPER(GENERO) LIKE '%HOUSE%' THEN 'Electrónica'
        ELSE 'Otro'
    END
ORDER BY cantidad_canciones DESC;

-- Top artistas por número de canciones en el último año
SELECT 
    ARTISTA,
    COUNT(*) AS cantidad_lanzamientos
FROM "ÚLTIMOS LANZAMIENTOS"
WHERE AÑO = (
    SELECT MAX(AÑO) 
    FROM "ÚLTIMOS LANZAMIENTOS"
)
GROUP BY ARTISTA
ORDER BY cantidad_lanzamientos DESC, ARTISTA;

-- Verificación de géneros únicos en la tabla TOP SPOTIFY
SELECT DISTINCT GENERO
FROM "TOP SPOTIFY"
ORDER BY GENERO;
