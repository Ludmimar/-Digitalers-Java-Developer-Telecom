# Proyecto Integrador Etapa 01 - TECNO_PRJ

## Descripción del Proyecto
Una empresa de tecnología utiliza SQL para generar una base de datos que almacena información sobre:
- Clientes
- Artículos que comercializa
- Ventas que realiza

## Estructura de la Base de Datos

### Tablas Principales:
1. **CLIENTES** - Información de clientes
2. **ARTÍCULOS** - Catálogo de productos
3. **FACTURAS** - Encabezados de ventas
4. **DETALLE** - Detalles de cada factura

### Relaciones:
- **CLIENTES ↔ FACTURAS**: Uno a muchos (un cliente puede tener muchas facturas)
- **FACTURAS ↔ DETALLE**: Uno a muchos (una factura puede tener varios detalles)
- **ARTÍCULOS ↔ DETALLE**: Uno a muchos (un artículo puede estar en varios detalles)

## Archivos del Proyecto:
- `database_structure.sql` - Estructura de la base de datos
- `sample_data.sql` - Datos de ejemplo
- `queries.sql` - Consultas diversas
- `functions.sql` - Funciones y procedimientos
- `ER_diagram.md` - Diagrama Entidad-Relación

## Tecnología:
- MySQL Database
- SQL para consultas y manipulación de datos
