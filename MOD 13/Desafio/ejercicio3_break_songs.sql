-- Ejercicio 3 - Consulta combinada para canciones con "BREAK" en el título
-- Combinando datos de las tablas TOP SPOTIFY y ÚLTIMOS LANZAMIENTOS

-- 1. Obtener una lista de todos aquellas canciones que contengan en su título la palabra BREAK.
-- La lista resultante debe mostrar las canciones de las tablas TOP SPOTIFY y ÚLTIMOS LANZAMIENTOS.
-- En el resultado de la consulta, mostrar todos los campos de ambas tablas.
-- Ordenar alfabéticamente el resultado por los nombres de las canciones.
-- Por último, agregar a la consulta una columna con el nombre ESTADO en la que figure la palabra
-- ANTERIOR para todos aquellos registros que provienen de la tabla TOP SPOTIFY y la palabra
-- ÚLTIMO para todos aquellos que provienen de la tabla ÚLTIMOS LANZAMIENTOS.

-- Consulta principal usando UNION ALL para combinar ambas tablas
SELECT 
    ARTISTA,
    TITULO,
    GENERO,
    PERMANENCIA,
    NULL AS AÑO,  -- Campo AÑO no existe en TOP SPOTIFY
    'ANTERIOR' AS ESTADO
FROM "TOP SPOTIFY"
WHERE UPPER(TITULO) LIKE '%BREAK%'

UNION ALL

SELECT 
    ARTISTA,
    TITULO,
    NULL AS GENERO,  -- Campo GENERO no existe en ÚLTIMOS LANZAMIENTOS
    NULL AS PERMANENCIA,  -- Campo PERMANENCIA no existe en ÚLTIMOS LANZAMIENTOS
    AÑO,
    'ÚLTIMO' AS ESTADO
FROM "ÚLTIMOS LANZAMIENTOS"
WHERE UPPER(TITULO) LIKE '%BREAK%'

ORDER BY TITULO;

-- Consulta alternativa más detallada con información adicional
SELECT 
    ARTISTA,
    TITULO,
    GENERO,
    PERMANENCIA,
    AÑO,
    ESTADO,
    'TOP SPOTIFY' AS TABLA_ORIGEN
FROM (
    SELECT 
        ARTISTA,
        TITULO,
        GENERO,
        PERMANENCIA,
        NULL AS AÑO,
        'ANTERIOR' AS ESTADO
    FROM "TOP SPOTIFY"
    WHERE UPPER(TITULO) LIKE '%BREAK%'
    
    UNION ALL
    
    SELECT 
        ARTISTA,
        TITULO,
        NULL AS GENERO,
        NULL AS PERMANENCIA,
        AÑO,
        'ÚLTIMO' AS ESTADO
    FROM "ÚLTIMOS LANZAMIENTOS"
    WHERE UPPER(TITULO) LIKE '%BREAK%'
) AS canciones_break
ORDER BY TITULO;

-- Consulta con estadísticas adicionales
SELECT 
    ARTISTA,
    TITULO,
    GENERO,
    PERMANENCIA,
    AÑO,
    ESTADO,
    CASE 
        WHEN ESTADO = 'ANTERIOR' THEN 'Canción histórica en Spotify'
        WHEN ESTADO = 'ÚLTIMO' THEN 'Lanzamiento reciente'
    END AS DESCRIPCION_ESTADO
FROM (
    SELECT 
        ARTISTA,
        TITULO,
        GENERO,
        PERMANENCIA,
        NULL AS AÑO,
        'ANTERIOR' AS ESTADO
    FROM "TOP SPOTIFY"
    WHERE UPPER(TITULO) LIKE '%BREAK%'
    
    UNION ALL
    
    SELECT 
        ARTISTA,
        TITULO,
        NULL AS GENERO,
        NULL AS PERMANENCIA,
        AÑO,
        'ÚLTIMO' AS ESTADO
    FROM "ÚLTIMOS LANZAMIENTOS"
    WHERE UPPER(TITULO) LIKE '%BREAK%'
) AS canciones_break
ORDER BY TITULO;

-- Consultas adicionales útiles:

-- Conteo de canciones con "BREAK" por estado
SELECT 
    ESTADO,
    COUNT(*) AS cantidad_canciones
FROM (
    SELECT 'ANTERIOR' AS ESTADO
    FROM "TOP SPOTIFY"
    WHERE UPPER(TITULO) LIKE '%BREAK%'
    
    UNION ALL
    
    SELECT 'ÚLTIMO' AS ESTADO
    FROM "ÚLTIMOS LANZAMIENTOS"
    WHERE UPPER(TITULO) LIKE '%BREAK%'
) AS conteo_break
GROUP BY ESTADO;

-- Artistas con más canciones que contienen "BREAK"
SELECT 
    ARTISTA,
    COUNT(*) AS canciones_con_break
FROM (
    SELECT ARTISTA, TITULO
    FROM "TOP SPOTIFY"
    WHERE UPPER(TITULO) LIKE '%BREAK%'
    
    UNION ALL
    
    SELECT ARTISTA, TITULO
    FROM "ÚLTIMOS LANZAMIENTOS"
    WHERE UPPER(TITULO) LIKE '%BREAK%'
) AS artistas_break
GROUP BY ARTISTA
ORDER BY canciones_con_break DESC, ARTISTA;

-- Verificación de la búsqueda (muestra algunos ejemplos de títulos que contienen "BREAK")
SELECT 
    'TOP SPOTIFY' AS tabla,
    ARTISTA,
    TITULO,
    GENERO
FROM "TOP SPOTIFY"
WHERE UPPER(TITULO) LIKE '%BREAK%'
ORDER BY TITULO
LIMIT 5;

SELECT 
    'ÚLTIMOS LANZAMIENTOS' AS tabla,
    ARTISTA,
    TITULO,
    AÑO
FROM "ÚLTIMOS LANZAMIENTOS"
WHERE UPPER(TITULO) LIKE '%BREAK%'
ORDER BY TITULO
LIMIT 5;
