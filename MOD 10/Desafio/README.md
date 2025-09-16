# Sistema de Gestión de Base de Datos

Este proyecto contiene la implementación de un sistema de gestión de base de datos con cinco tablas principales y sus respectivas consultas SQL.

## 📋 Descripción del Proyecto

El sistema está diseñado para gestionar información de clientes, localidades, provincias, movimientos e items, estableciendo relaciones jerárquicas entre las entidades para mantener la integridad referencial de los datos.

## 🗂️ Estructura del Proyecto

```
Desafio/
├── README.md                 # Este archivo
├── crear_tablas.sql         # Script para crear las tablas
├── consultas_sql.sql        # Consultas SQL del ejercicio
├── datos_ejemplo.sql        # Datos de prueba
├── relaciones_tablas.md      # Documentación de relaciones
└── Desafío.pdf              # Documento original del desafío
```

## 🗄️ Estructura de la Base de Datos

### Tablas Principales

1. **Provincia**
   - `id` (INTEGER, PRIMARY KEY)
   - `Nombre` (VARCHAR)
   - `Pais` (VARCHAR)

2. **Localidad**
   - `id` (INTEGER, PRIMARY KEY)
   - `Nombre` (VARCHAR)
   - `CP` (VARCHAR) - Código Postal
   - `Provincia` (INTEGER, FOREIGN KEY)

3. **Cliente**
   - `id` (INTEGER, PRIMARY KEY)
   - `Nombre` (VARCHAR)
   - `Apellido` (VARCHAR)
   - `Fecha_nacimiento` (DATE)
   - `Direccion` (VARCHAR)
   - `Localidad` (INTEGER, FOREIGN KEY)
   - `Telefono` (VARCHAR)

4. **Movimiento**
   - `id` (INTEGER, PRIMARY KEY)
   - `Letra` (VARCHAR)
   - `Fecha` (DATE)
   - `Cliente` (INTEGER, FOREIGN KEY)

5. **Item**
   - `id` (INTEGER, PRIMARY KEY)
   - `Detalle` (VARCHAR)
   - `Cantidad` (INTEGER)
   - `Valor` (DECIMAL)
   - `Movimiento` (INTEGER, FOREIGN KEY)

6. **Transportistas** (Tabla adicional)
   - `id` (INTEGER, PRIMARY KEY)
   - `Nombre` (VARCHAR)
   - `Telefono` (VARCHAR)
   - `Email` (VARCHAR)
   - `Direccion` (VARCHAR)

## 🔗 Relaciones entre Tablas

Todas las relaciones son de tipo **1:N (Uno a Muchos)**:

- **Provincia** → **Localidad**: Una provincia tiene muchas localidades
- **Localidad** → **Cliente**: Una localidad tiene muchos clientes
- **Cliente** → **Movimiento**: Un cliente tiene muchos movimientos
- **Movimiento** → **Item**: Un movimiento tiene muchos items

## 📁 Archivos del Proyecto

### `crear_tablas.sql`
Script SQL que contiene la creación de todas las tablas con sus respectivas claves primarias y foráneas. Incluye:
- Definición de estructura de tablas
- Claves primarias e índices
- Claves foráneas para integridad referencial
- Comentarios explicativos

### `consultas_sql.sql`
Contiene todas las consultas SQL solicitadas en el ejercicio:

#### Consultas para Tabla Cliente:
1. **Clientes de Madrid**: Detalle completo de clientes cuya ciudad es "Madrid"
2. **Clientes específicos**: Nombre y dirección de clientes de Madrid con CP 28034
3. **Clientes argentinos**: Nombre y ciudad de clientes de Argentina

#### Consultas para Tabla Item (Productos):
4. **Productos caros**: Productos cuyo precio sea mayor a 39
5. **Productos específicos**: Detalle de productos "24 - 4 oz tins"

#### Consultas para Tabla Transportistas:
6. **Listado completo**: Nombre y teléfono de todos los transportistas

#### Consultas para Tabla Movimiento/Item:
7. **Órdenes específicas**: ID de orden y detalle para producto ID 42

### `datos_ejemplo.sql`
Archivo con datos de prueba que incluye:
- Provincias de España y Argentina
- Localidades con códigos postales
- Clientes de diferentes ciudades
- Movimientos y items de ejemplo
- Transportistas de prueba

### `relaciones_tablas.md`
Documentación detallada que incluye:
- Análisis de relaciones entre tablas
- Cardinalidades identificadas
- Diagrama de relaciones en texto
- Validación del código SQL
- Recomendaciones adicionales

## 🚀 Instalación y Uso

### Prerrequisitos
- Sistema de gestión de base de datos compatible con SQL (MySQL, PostgreSQL, SQL Server, etc.)
- Cliente SQL para ejecutar los scripts

### Pasos de Instalación

1. **Crear las tablas**:
   ```sql
   -- Ejecutar el archivo crear_tablas.sql
   ```

2. **Insertar datos de prueba**:
   ```sql
   -- Ejecutar el archivo datos_ejemplo.sql
   ```

3. **Probar las consultas**:
   ```sql
   -- Ejecutar las consultas del archivo consultas_sql.sql
   ```

## 📊 Ejemplos de Consultas

### Clientes de Madrid
```sql
SELECT 
    c.id,
    c.Nombre,
    c.Apellido,
    c.Direccion,
    l.Nombre AS Ciudad,
    p.Pais
FROM Cliente c
INNER JOIN Localidad l ON c.Localidad = l.id
INNER JOIN Provincia p ON l.Provincia = p.id
WHERE l.Nombre = 'Madrid';
```

### Productos caros
```sql
SELECT 
    i.id,
    i.Detalle AS Nombre_Producto,
    i.Valor AS Precio
FROM Item i
WHERE i.Valor > 39;
```

## 🔍 Características Técnicas

- **Integridad Referencial**: Todas las claves foráneas están correctamente definidas
- **Tipos de Datos Apropiados**: VARCHAR para textos, INTEGER para IDs, DECIMAL para valores monetarios
- **Consultas Optimizadas**: Uso de JOINs apropiados para relacionar datos
- **Datos de Prueba**: Incluye ejemplos realistas para testing

## 📝 Notas Importantes

- Las consultas están adaptadas al esquema de tablas creado
- Se incluyen datos de ejemplo con ciudades como "Madrid" y países como "Argentina"
- Todas las relaciones son obligatorias (NOT NULL en claves foráneas)
- El sistema mantiene una jerarquía lógica: Provincia → Localidad → Cliente → Movimiento → Item

## 🛠️ Mejoras Futuras

- Agregar índices en claves foráneas para mejorar rendimiento
- Implementar reglas de cascada (ON DELETE/UPDATE)
- Agregar campos de auditoría (fecha creación/modificación)
- Crear vistas para consultas frecuentes
- Implementar procedimientos almacenados

## 📄 Licencia

Este proyecto es parte de un ejercicio académico y está disponible para fines educativos.

---

**Desarrollado como parte del Módulo 10 - Desafío de Base de Datos**
