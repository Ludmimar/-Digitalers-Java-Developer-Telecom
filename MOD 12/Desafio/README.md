# Desafío Base de Datos - Módulo 12

Este proyecto contiene los ejercicios de base de datos para el Módulo 12, incluyendo las bases de datos BONUS_TRACK y LIBRERÍA con sus respectivas tablas y ejercicios de manipulación de datos.

## 📁 Estructura del Proyecto

```
Desafío/
├── README.md                           # Este archivo
├── crear_tablas.sql                   # Script para crear las bases de datos y tablas
├── datos_ejemplo.sql                  # Datos de ejemplo para poblar las tablas
├── ejercicio1_bonus_track.sql         # Solución del Ejercicio 1
├── ejercicio2_libreria.sql            # Solución del Ejercicio 2
└── Desafío.pdf                        # Documento original del desafío
```

## 🗄️ Bases de Datos

### BONUS_TRACK
- **AUTORES**: Información de autores (ID, nombre, apellido, nacionalidad, fecha de nacimiento)
- **EMPLEADOS**: Información de empleados (ID, nombre, apellido, puesto, fecha de ingreso, salario, permanencia)

### LIBRERÍA
- **LIBROS**: Catálogo de libros (ID, título, autor, editorial, precio, stock, fecha de publicación, precio público)

## 🚀 Instalación y Configuración

### Prerrequisitos
- MySQL Server instalado y ejecutándose
- Cliente MySQL (MySQL Workbench, phpMyAdmin, o línea de comandos)

### Pasos de Instalación

1. **Crear las bases de datos y tablas:**
   ```sql
   SOURCE crear_tablas.sql;
   ```

2. **Insertar datos de ejemplo:**
   ```sql
   SOURCE datos_ejemplo.sql;
   ```

## 📋 Ejercicios

### Ejercicio 1 - BONUS_TRACK

**Objetivo:** Realizar operaciones de actualización y modificación de estructura en las bases de datos.

#### Tareas:
1. **Actualización de Autor**
   - Modificar el nombre del autor de apellido "ECHEVERRÍA" por "Esteban"
   - Solo cambiar el nombre, mantener el apellido

2. **Nueva Columna en EMPLEADOS**
   - Agregar columna "PERMANENCIA" a la tabla EMPLEADOS
   - Completar con valor 2 para todos los empleados

3. **Nueva Columna en LIBROS**
   - Agregar columna "PRECIO_PÚBLICO" a la tabla LIBROS
   - Calcular precio público agregando 21% de IVA al precio original

#### Ejecución:
```sql
SOURCE ejercicio1_bonus_track.sql;
```

### Ejercicio 2 - LIBRERÍA

**Objetivo:** Crear nueva tabla y realizar operaciones de transferencia de datos.

#### Tareas:
1. **Crear Tabla EMPLEADOS_ANTERIORES**
   - Crear tabla con misma estructura que EMPLEADOS
   - Transferir empleados con apellidos: THOMAS, PEREIRA, DEVO
   - Eliminar estos empleados de la tabla original

2. **Transferir Empleado CRUZ**
   - Copiar empleado de apellido CRUZ a EMPLEADOS_ANTERIORES
   - Eliminar CRUZ de la tabla EMPLEADOS original

#### Ejecución:
```sql
SOURCE ejercicio2_libreria.sql;
```

## 🔍 Verificación de Resultados

Cada ejercicio incluye consultas de verificación para confirmar que las operaciones se realizaron correctamente:

- **Ejercicio 1:** Verificación de cambios en nombres, nuevas columnas y cálculos de precios
- **Ejercicio 2:** Verificación del estado final de ambas tablas (EMPLEADOS y EMPLEADOS_ANTERIORES)

## 📊 Datos de Ejemplo

### Autores
- José ECHEVERRÍA (Argentina)
- María González (España)
- Carlos López (México)
- Ana Martínez (Colombia)

### Empleados
- Juan Pérez (Gerente)
- Laura Rodríguez (Vendedor)
- Pedro Sánchez (Administrativo)
- Carmen Torres (Vendedor)
- Roberto THOMAS (Supervisor)
- María PEREIRA (Contadora)
- Carlos DEVO (Técnico)
- Ana CRUZ (Asistente)

### Libros
- El Quijote - Miguel de Cervantes
- Cien años de soledad - Gabriel García Márquez
- Don Juan Tenorio - José Zorrilla
- La casa de los espíritus - Isabel Allende

## 🛠️ Tecnologías Utilizadas

- **MySQL** - Sistema de gestión de bases de datos relacionales
- **SQL** - Lenguaje de consulta estructurado para manipulación de datos

## 📝 Notas Importantes

- Todos los scripts están diseñados para ser ejecutados en orden secuencial
- Las consultas de verificación están incluidas en cada ejercicio
- Los datos de ejemplo se pueden modificar según las necesidades del ejercicio
- Se recomienda hacer backup de las bases de datos antes de ejecutar los ejercicios

## 🎯 Objetivos de Aprendizaje

- Manipulación de estructura de tablas (ALTER TABLE)
- Operaciones de actualización de datos (UPDATE)
- Creación de nuevas tablas basadas en estructuras existentes
- Transferencia de datos entre tablas
- Eliminación selectiva de registros
- Cálculos matemáticos en consultas SQL

## 📞 Soporte

Para dudas o problemas con la implementación, revisar:
1. La sintaxis SQL utilizada
2. Los datos de ejemplo insertados
3. El orden de ejecución de los scripts
4. Los mensajes de verificación incluidos en cada ejercicio

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---

