# Consultas SQL - Base de Datos Laboratorio y Spotify

Este repositorio contiene una colección de consultas SQL para diferentes bases de datos, incluyendo ejercicios de laboratorio y análisis de datos musicales de Spotify.

## 📁 Estructura del Proyecto

```
├── queries_laboratorio_db.sql      # Ejercicio 1 - Consultas Laboratorio_db
├── ejercicio2_spotify_queries.sql  # Ejercicio 2 - Consultas Spotify
├── ejercicio3_break_songs.sql      # Ejercicio 3 - Consulta Combinada
└── README.md                       # Este archivo
```

## 🗄️ Ejercicio 1 - Base de Datos Laboratorio_db

### Descripción
Consultas para la base de datos `Laboratorio_db` utilizando la tabla `artículos` y tablas relacionadas.

### Archivo
`queries_laboratorio_db.sql`

### Consultas Incluidas

#### 1. Lista de Clientes
```sql
SELECT 
    c.nombre,
    c.apellido,
    l.nombre AS localidad,
    p.nombre AS provincia
FROM clientes c
INNER JOIN localidades l ON c.id_localidad = l.id
INNER JOIN provincias p ON l.id_provincia = p.id
ORDER BY c.apellido, c.nombre;
```

#### 2. Movimientos con Detalles
```sql
SELECT 
    m.letra,
    m.fecha,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    a.nombre AS nombre_articulo,
    md.cantidad,
    md.valor
FROM movimientos m
INNER JOIN clientes c ON m.id_cliente = c.id
INNER JOIN movimientos_detalle md ON m.id = md.id_movimiento
INNER JOIN articulos a ON md.id_articulo = a.id
ORDER BY m.fecha DESC, m.id;
```

#### 3. Localidades y Provincias
```sql
SELECT 
    l.nombre AS localidad,
    p.nombre AS provincia
FROM localidades l
INNER JOIN provincias p ON l.id_provincia = p.id
ORDER BY p.nombre, l.nombre;
```

#### 4. Clientes con Movimientos
```sql
SELECT 
    c.nombre,
    c.apellido,
    m.id AS id_movimiento,
    m.letra,
    m.fecha,
    m.total
FROM clientes c
LEFT JOIN movimientos m ON c.id = m.id_cliente
ORDER BY c.apellido, c.nombre, m.fecha DESC;
```

#### 5. Artículos en Movimiento Específico (ID = 1)
```sql
SELECT 
    a.nombre AS nombre_articulo,
    a.descripcion,
    md.cantidad,
    md.valor_unitario,
    md.valor_total,
    md.id AS id_detalle
FROM movimientos_detalle md
INNER JOIN articulos a ON md.id_articulo = a.id
WHERE md.id_movimiento = 1
ORDER BY a.nombre;
```

### Estructura de Tablas Asumida
- **clientes**: id, nombre, apellido, id_localidad
- **localidades**: id, nombre, id_provincia  
- **provincias**: id, nombre
- **movimientos**: id, letra, fecha, id_cliente, total
- **movimientos_detalle**: id, id_movimiento, id_articulo, cantidad, valor_unitario, valor_total
- **articulos**: id, nombre, descripcion, codigo, precio_unitario, stock_actual, stock_minimo

---

## 🎵 Ejercicio 2 - Base de Datos Spotify

### Descripción
Consultas para análisis de datos musicales utilizando las tablas `TOP SPOTIFY` y `ÚLTIMOS LANZAMIENTOS`.

### Archivo
`ejercicio2_spotify_queries.sql`

### Consultas Incluidas

#### 1. Últimos Lanzamientos del Año Más Alto
```sql
SELECT 
    ARTISTA,
    TITULO
FROM "ÚLTIMOS LANZAMIENTOS"
WHERE AÑO = (
    SELECT MAX(AÑO) 
    FROM "ÚLTIMOS LANZAMIENTOS"
)
ORDER BY ARTISTA, TITULO;
```

#### 2. LADY GAGA con Mayor Permanencia
```sql
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
```

#### 3. Clasificación por Tipo de Género
```sql
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
```

### Estructura de Tablas Asumida
- **ÚLTIMOS LANZAMIENTOS**: ARTISTA, TITULO, AÑO
- **TOP SPOTIFY**: ARTISTA, TITULO, GENERO, PERMANENCIA

---

## 🔍 Ejercicio 3 - Consulta Combinada

### Descripción
Consulta que combina datos de ambas tablas de Spotify para encontrar canciones con "BREAK" en el título.

### Archivo
`ejercicio3_break_songs.sql`

### Consulta Principal
```sql
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

ORDER BY TITULO;
```

### Características
- **UNION ALL**: Combina datos de ambas tablas
- **Filtrado**: Busca canciones con "BREAK" en el título
- **Columna ESTADO**: 
  - `ANTERIOR` para registros de TOP SPOTIFY
  - `ÚLTIMO` para registros de ÚLTIMOS LANZAMIENTOS
- **Ordenamiento**: Alfabético por título

---

## 🚀 Cómo Usar

### Prerrequisitos
- Sistema de gestión de base de datos compatible con SQL (MySQL, PostgreSQL, SQL Server, etc.)
- Acceso a las bases de datos mencionadas

### Instrucciones
1. Clona o descarga este repositorio
2. Abre el archivo SQL correspondiente al ejercicio que desees ejecutar
3. Ejecuta las consultas en tu sistema de base de datos
4. Ajusta los nombres de tablas y campos según tu esquema específico

### Notas Importantes
- Los nombres de tablas y campos pueden variar según tu implementación específica
- Algunas consultas incluyen versiones alternativas con CTEs para mayor claridad
- Se incluyen consultas adicionales útiles para análisis y verificación

---

## 📊 Consultas Adicionales

Cada archivo incluye consultas adicionales útiles:

### Laboratorio_db
- Consulta alternativa para movimientos con información detallada
- Verificación de estructura de tabla artículos
- Estadísticas de movimientos por cliente

### Spotify
- Estadísticas por tipo de música
- Top artistas por número de lanzamientos
- Verificación de géneros únicos

### Break Songs
- Conteo de canciones por estado
- Artistas con más canciones que contienen "BREAK"
- Verificación de búsqueda con ejemplos

---

## 🛠️ Tecnologías Utilizadas

- **SQL**: Lenguaje de consulta estructurado
- **JOINs**: Para relacionar datos entre tablas
- **UNION**: Para combinar resultados de múltiples consultas
- **CASE**: Para lógica condicional
- **Subconsultas**: Para cálculos complejos
- **CTEs**: Para consultas más legibles


---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---


*Última actualización: Diciembre 2024*
