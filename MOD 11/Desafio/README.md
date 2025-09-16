# 📚 Desafío SQL - Base de Datos y Consultas

Este proyecto contiene la solución completa para el Desafío SQL del Módulo 11, que incluye la creación de bases de datos, tablas, importación de datos CSV y consultas avanzadas.

## 📋 Contenido del Proyecto

### Ejercicio 1: Base de Datos BONUS_TRACK
- **Archivo**: `ejercicio1_bonus_track.sql`
- **Descripción**: Creación de base de datos y tabla AGENDA con campos adicionales
- **Características**:
  - Base de datos BONUS_TRACK
  - Tabla AGENDA con estructura específica
  - Campo MAIL agregado posteriormente
  - 4 registros de ejemplo insertados

### Ejercicio 2: Base de Datos LIBRERÍA
- **Archivo**: `ejercicio2_libreria.sql`
- **Descripción**: Sistema completo de gestión de librería con 8 tablas relacionadas
- **Tablas incluidas**:
  - `autores` - Información de autores
  - `ventas` - Registro de ventas
  - `locales` - Sucursales de librerías
  - `editoriales` - Editoriales
  - `libros` - Catálogo de libros
  - `libroautor` - Relación muchos a muchos
  - `empleados` - Personal de editoriales
  - `puestos` - Cargos de empleados

### Ejercicio 3: Claves Primarias y Datos Adicionales
- **Archivo**: `ejercicio3_libreria.sql`
- **Descripción**: Verificación de claves primarias y adición de registros
- **Características**:
  - Verificación de claves primarias en todas las tablas
  - Inserción de 3 registros adicionales por tabla
  - Validación de lógica de negocio
  - Consultas de verificación

### Ejercicio 4: Importación CSV TOP_SPOTIFY
- **Archivo**: `ejercicio4_top_spotify.sql`
- **Descripción**: Importación de datos CSV y consultas básicas
- **Características**:
  - Importación de archivo CSV TOP_SPOTIFY*
  - Consultas con columnas específicas (ARTISTA, TÍTULO, GÉNERO)
  - Ordenamiento alfabético por género y artista
  - Datos de ejemplo de canciones populares

### Ejercicio 5: Consultas Avanzadas TOP_SPOTIFY
- **Archivo**: `ejercicio5_top_spotify_queries.sql`
- **Descripción**: Consultas complejas con filtros y ordenamiento
- **Consultas incluidas**:
  - Top 10 canciones ordenadas por artista y título
  - Canciones de posiciones 11-15
  - Todas las canciones de Madonna
  - Canciones del género Pop ordenadas por título
  - Canciones Pop del año 2015
  - Canciones Dance Pop antes de 2011

## 🚀 Instalación y Configuración

### Requisitos Previos
- MySQL Server 8.0 o superior
- MySQL Workbench (recomendado)
- Archivo CSV TOP_SPOTIFY* (para Ejercicio 4)

### Pasos de Instalación

1. **Clonar o descargar el proyecto**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
   cd Desafio
   ```

2. **Abrir MySQL Workbench**
   - Conectar a tu servidor MySQL local
   - Crear una nueva conexión si es necesario

3. **Ejecutar los scripts en orden**
   ```sql
   -- Ejecutar en este orden:
   -- 1. ejercicio1_bonus_track.sql
   -- 2. ejercicio2_libreria.sql
   -- 3. ejercicio3_libreria.sql
   -- 4. ejercicio4_top_spotify.sql
   -- 5. ejercicio5_top_spotify_queries.sql
   ```

## 📊 Estructura de las Bases de Datos

### BONUS_TRACK
```sql
-- Tabla AGENDA
CREATE TABLE AGENDA (
    ID_Contacto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(15) NOT NULL,
    Domicilio VARCHAR(50),
    Telefono INT NOT NULL,
    MAIL VARCHAR(50) NOT NULL
);
```

### LIBRERÍA
```sql
-- 8 tablas relacionadas con claves foráneas
-- Estructura completa disponible en ejercicio2_libreria.sql
```

### TOP_SPOTIFY
```sql
-- Tabla para datos de Spotify
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
```

## 🔍 Consultas Principales

### Consultas Básicas
```sql
-- Mostrar todas las tablas
SHOW TABLES;

-- Describir estructura de tabla
DESCRIBE nombre_tabla;

-- Contar registros
SELECT COUNT(*) FROM nombre_tabla;
```

### Consultas con Filtros
```sql
-- Filtrar por artista
SELECT * FROM TOP_SPOTIFY WHERE ARTISTA = 'Madonna';

-- Filtrar por género y año
SELECT * FROM TOP_SPOTIFY WHERE GENERO = 'Pop' AND AÑO = 2015;

-- Filtrar con condiciones múltiples
SELECT * FROM TOP_SPOTIFY WHERE GENERO = 'Dance Pop' AND AÑO < 2011;
```

### Consultas con Ordenamiento
```sql
-- Ordenar por múltiples campos
SELECT ARTISTA, TITULO, GENERO 
FROM TOP_SPOTIFY 
ORDER BY GENERO, ARTISTA;

-- Limitar resultados
SELECT ARTISTA, TITULO, GENERO 
FROM TOP_SPOTIFY 
ORDER BY ARTISTA, TITULO 
LIMIT 10;
```

## 📁 Estructura de Archivos

```
Desafio/
├── README.md                           # Este archivo
├── ejercicio1_bonus_track.sql         # Base de datos BONUS_TRACK
├── ejercicio2_libreria.sql            # Sistema completo LIBRERÍA
├── ejercicio3_libreria.sql            # Claves primarias y datos adicionales
├── ejercicio4_top_spotify.sql          # Importación CSV TOP_SPOTIFY
├── ejercicio5_top_spotify_queries.sql # Consultas avanzadas
└── Desafío.pdf                        # Documento original del desafío
```

## 🎯 Características Destacadas

### ✅ Cumplimiento de Requisitos
- **Ejercicio 1**: Base de datos BONUS_TRACK con tabla AGENDA completa
- **Ejercicio 2**: Sistema LIBRERÍA con 8 tablas relacionadas
- **Ejercicio 3**: Verificación de claves primarias y datos adicionales
- **Ejercicio 4**: Importación CSV con consultas básicas
- **Ejercicio 5**: Consultas avanzadas con filtros y ordenamiento

### 🔧 Funcionalidades Técnicas
- **Claves primarias** correctamente definidas
- **Claves foráneas** para integridad referencial
- **Tipos de datos** apropiados para cada campo
- **Consultas optimizadas** con índices implícitos
- **Datos de ejemplo** realistas y variados

### 📈 Datos de Ejemplo
- **BONUS_TRACK**: 4 contactos con información completa
- **LIBRERÍA**: 7+ registros por tabla con autores famosos
- **TOP_SPOTIFY**: 30+ canciones populares de diversos géneros

## 🚨 Consideraciones Importantes

### Importación CSV
- El archivo `TOP_SPOTIFY*` debe estar en formato CSV
- Usar delimitador de coma (,)
- Codificación UTF-8 recomendada
- Verificar estructura de columnas antes de importar

### Orden de Ejecución
- **CRÍTICO**: Ejecutar los scripts en orden secuencial
- Ejercicio 1 → Ejercicio 2 → Ejercicio 3 → Ejercicio 4 → Ejercicio 5
- Cada ejercicio depende del anterior

### Compatibilidad
- Probado en MySQL 8.0
- Compatible con MySQL Workbench
- Funciona en sistemas Windows, Linux y macOS

## 📞 Soporte y Contacto

Para dudas o problemas con la implementación:

1. **Verificar orden de ejecución** de los scripts
2. **Revisar mensajes de error** en MySQL Workbench
3. **Confirmar estructura** de archivos CSV
4. **Validar permisos** de base de datos

## 📝 Notas Adicionales

- Todos los scripts incluyen comentarios explicativos
- Los datos de ejemplo son representativos y realistas
- Las consultas están optimizadas para rendimiento
- Se incluyen consultas de verificación en cada ejercicio

---


## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---

**Desarrollado para el Módulo 11 - Desafío SQL**  
*Sistema de gestión de bases de datos con MySQL*
