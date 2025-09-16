# Ejercicios SQL - Base de Datos

Este repositorio contiene ejercicios prácticos de SQL utilizando las bases de datos TOP_SPOTIFY y LIBRERIA.

## 📋 Contenido

### Ejercicio 1 - Base de Datos TOP_SPOTIFY
Ejercicios enfocados en el manejo de datos musicales utilizando funciones de concatenación y agregación.

### Ejercicio 2 - Base de Datos LIBRERIA  
Ejercicios enfocados en el manejo de datos de autores utilizando funciones de concatenación y manipulación de texto.

## 🗂️ Estructura del Proyecto

```
Desafio/
├── README.md                 # Este archivo
├── ejercicios_sql.sql        # Todas las consultas SQL
└── Desafío.pdf              # Documento original con los ejercicios
```

## 🚀 Cómo usar

1. **Clona o descarga este repositorio**
2. **Abre el archivo `ejercicios_sql.sql`** en tu gestor de base de datos preferido (MySQL, PostgreSQL, SQL Server, etc.)
3. **Ejecuta las consultas** según tus necesidades

## 📊 Ejercicios Incluidos

### Ejercicio 1 - TOP_SPOTIFY

1. **Concatenación básica**: Lista de artistas y canciones usando CONCAT
2. **Concatenación con separador**: Uso de CONCAT_WS
3. **Texto en mayúsculas**: Géneros en mayúsculas
4. **Cálculo de años**: Años transcurridos desde el lanzamiento
5. **Conteo de registros**: Cantidad total de canciones
6. **Agrupación por año**: Canciones lanzadas por año
7. **Filtro de agrupación**: Años con 50+ canciones

### Ejercicio 2 - LIBRERIA

1. **Concatenación básica**: Lista de autores usando CONCAT
2. **Concatenación con separador**: Uso de CONCAT_WS
3. **Texto en mayúsculas**: Nombres de autores en mayúsculas
4. **Iniciales**: Solo inicial del nombre y apellido completo

## 🛠️ Funciones SQL Utilizadas

- **CONCAT()**: Concatenación de strings
- **CONCAT_WS()**: Concatenación con separador
- **UPPER()**: Conversión a mayúsculas
- **LEFT()**: Extracción de caracteres del inicio
- **YEAR()**: Extracción del año de una fecha
- **CURDATE()**: Fecha actual
- **COUNT()**: Conteo de registros
- **GROUP BY**: Agrupación de datos
- **HAVING**: Filtro de grupos
- **ORDER BY**: Ordenamiento de resultados

## 📋 Estructura de Tablas

### TOP_SPOTIFY
```sql
CREATE TABLE TOP_SPOTIFY (
    ID INT PRIMARY KEY,
    ARTISTA VARCHAR(100),
    CANCION VARCHAR(100),
    GENERO VARCHAR(50),
    FECHA_LANZAMIENTO DATE
);
```

### AUTORES
```sql
CREATE TABLE AUTORES (
    ID INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    APELLIDO VARCHAR(50),
    PROVINCIA VARCHAR(50),
    FECHA_NACIMIENTO DATE
);
```

## 📝 Ejemplos de Resultados

### Ejercicio 1.1
```
CANCIÓN                           | GENERO
----------------------------------|----------
Bad Bunny - Tití Me Preguntó      | Reggaeton
Taylor Swift - Anti-Hero           | Pop
```

### Ejercicio 2.4
```
AUTOR                    | PROVINCIA
-------------------------|----------
García Márquez, G.       | Magdalena
Vargas Llosa, M.         | Arequipa
```

## 🔧 Requisitos

- Gestor de base de datos SQL (MySQL, PostgreSQL, SQL Server, etc.)
- Datos de prueba (incluidos en el archivo SQL)

## 📚 Conceptos Aprendidos

- Concatenación de strings
- Manipulación de texto
- Funciones de fecha
- Agregación de datos
- Agrupación y filtrado
- Ordenamiento de resultados


---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---

**Desarrollado como parte del Módulo 14 - Desafío SQL**
