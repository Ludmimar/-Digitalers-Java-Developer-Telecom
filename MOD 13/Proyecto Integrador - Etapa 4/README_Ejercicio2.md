# PROYECTO INTEGRADOR - ETAPA 4 - EJERCICIO 2

## Descripción
Este ejercicio se enfoca en consultas específicas de reportes y relaciones entre tablas de la base de datos TECNO_DB.

## Archivo Creado
**`Ejercicio2_ProyectoIntegrador.sql`** - Contiene todas las consultas SQL requeridas para el Ejercicio 2.

## Requerimientos Cumplidos

### Ejercicio 2 - Punto 1: ✅
**Listado de clientes junto con los datos de la localidad en la que se encuentran**
- Usa LEFT JOIN entre CLIENTES y LOCALIDADES
- Muestra información completa del cliente con datos de su localidad
- Incluye: ID, nombre, apellido, CUIT, dirección, observaciones, localidad, CP y provincia

### Ejercicio 2 - Punto 2: ✅
**Listado de todas las facturas junto con los detalles de los artículos asociados (sin información de artículos)**
- Usa INNER JOIN entre FACTURAS, CLIENTES y DETALLES
- Muestra información de facturas y detalles sin nombres de artículos
- Incluye: datos de factura, cliente, detalle ID, artículo ID, cantidad y subtotal

### Ejercicio 2 - Punto 3: ✅
**El mismo listado, pero incluyendo el nombre de los artículos vendidos**
- Extiende la consulta anterior agregando JOIN con ARTICULOS y CATEGORIA
- Incluye nombres de artículos, precios y categorías
- Proporciona información completa de cada detalle de venta

### Ejercicio 2 - Punto 4: ✅
**Datos de las facturas que están a nombre del cliente con apellido "García"**
- Filtra facturas por apellido específico usando WHERE
- Incluye datos completos de factura y cliente
- Muestra información de localidad del cliente

### Ejercicio 2 - Punto 5: ✅
**Artículos que compró el cliente con apellido "López"**
- Consulta completa de compras por cliente específico
- Incluye información detallada de artículos, precios y categorías
- Muestra historial completo de compras del cliente

## Estructura de las Consultas

### 1. Clientes con Datos de Localidad
```sql
SELECT 
    c.CLIENTE_ID,
    c.NOMBRE,
    c.APELLIDO,
    c.CUIT,
    c.DIRECCION,
    c.OBSERVACIONES,
    l.LocalidadID,
    l.Nombre as LOCALIDAD,
    l.CP as CODIGO_POSTAL,
    l.Provincia
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
ORDER BY c.APELLIDO, c.NOMBRE;
```

### 2. Facturas con Detalles (Sin Info de Artículos)
```sql
SELECT 
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    f.MONTO as MONTO_TOTAL,
    c.NOMBRE as CLIENTE_NOMBRE,
    c.APELLIDO as CLIENTE_APELLIDO,
    d.DETALLE_ID,
    d.ARTICULO_ID,
    d.CANTIDAD,
    (d.CANTIDAD * (SELECT PRECIO FROM ARTICULOS WHERE ARTICULO_ID = d.ARTICULO_ID)) as SUBTOTAL_DETALLE
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
LEFT JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
ORDER BY f.FACTURA_ID, d.DETALLE_ID;
```

### 3. Facturas con Detalles e Información de Artículos
```sql
SELECT 
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    f.MONTO as MONTO_TOTAL,
    c.NOMBRE as CLIENTE_NOMBRE,
    c.APELLIDO as CLIENTE_APELLIDO,
    d.DETALLE_ID,
    d.ARTICULO_ID,
    a.NOMBRE as ARTICULO_NOMBRE,
    a.PRECIO as PRECIO_UNITARIO,
    d.CANTIDAD,
    (a.PRECIO * d.CANTIDAD) as SUBTOTAL_DETALLE,
    cat.Nombre as CATEGORIA
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
LEFT JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
LEFT JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
LEFT JOIN CATEGORIA cat ON a.CategoriaID = cat.CategoriaID
ORDER BY f.FACTURA_ID, d.DETALLE_ID;
```

### 4. Facturas del Cliente García
```sql
SELECT 
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    f.MONTO,
    c.CLIENTE_ID,
    c.NOMBRE as CLIENTE_NOMBRE,
    c.APELLIDO as CLIENTE_APELLIDO,
    c.CUIT,
    c.DIRECCION,
    c.OBSERVACIONES,
    l.Nombre as LOCALIDAD,
    l.Provincia
FROM FACTURAS f
INNER JOIN CLIENTES c ON f.CLIENTE_ID = c.CLIENTE_ID
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
WHERE c.APELLIDO = 'García'
ORDER BY f.FECHA DESC;
```

### 5. Artículos Comprados por López
```sql
SELECT 
    c.CLIENTE_ID,
    c.NOMBRE as CLIENTE_NOMBRE,
    c.APELLIDO as CLIENTE_APELLIDO,
    f.FACTURA_ID,
    f.LETRA,
    f.NUMERO,
    f.FECHA,
    d.DETALLE_ID,
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO_NOMBRE,
    a.PRECIO as PRECIO_UNITARIO,
    d.CANTIDAD as CANTIDAD_COMPRADA,
    (a.PRECIO * d.CANTIDAD) as SUBTOTAL,
    cat.Nombre as CATEGORIA,
    cat.Descripcion as DESCRIPCION_CATEGORIA
FROM CLIENTES c
INNER JOIN FACTURAS f ON c.CLIENTE_ID = f.CLIENTE_ID
INNER JOIN DETALLES d ON f.FACTURA_ID = d.FACTURA_ID
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
LEFT JOIN CATEGORIA cat ON a.CategoriaID = cat.CategoriaID
WHERE c.APELLIDO = 'López'
ORDER BY f.FECHA, a.NOMBRE;
```

## Consultas Adicionales Incluidas

### Resumen de Facturas por Cliente
- Muestra estadísticas de facturación por cliente
- Incluye cantidad de facturas, total facturado, promedio y fechas

### Resumen de Artículos Más Vendidos
- Lista artículos ordenados por unidades vendidas
- Incluye información de categorías y totales

### Verificación de Integridad
- Valida la integridad de los datos entre tablas
- Cuenta registros y relaciones

## Datos de Prueba Esperados

Basándose en los datos existentes en TECNO_DB:

### Clientes con Localidades:
- **Gloria Fernández**: CABA, Buenos Aires
- **Carlos García**: Rosario, Santa Fe
- **Gonzalo López**: Neuquén, Neuquén
- **Santiago González**: Córdoba, Córdoba
- **Micaela Altieri**: San Miguel de Tucumán, Tucumán

### Facturas del Cliente García:
- Factura A-39 del 2021-04-12 por $979.75

### Artículos Comprados por López:
- Webcam con Micrófono Plug & Play (Artículo ID: 95)
- Apple AirPods Pro (Artículo ID: 157)
- Gloria Trevi / Gloria / CD+DVD (Artículo ID: 411)

## Cómo Ejecutar

### MySQL Command Line:
```bash
mysql -u root -p
USE TECNO_DB;
SOURCE Ejercicio2_ProyectoIntegrador.sql;
```

### MySQL Workbench:
1. Abrir MySQL Workbench
2. Conectar a la base de datos
3. Seleccionar TECNO_DB
4. Abrir el archivo `Ejercicio2_ProyectoIntegrador.sql`
5. Ejecutar todo el script

### phpMyAdmin:
1. Acceder a phpMyAdmin
2. Seleccionar TECNO_DB
3. Ir a la pestaña SQL
4. Copiar y pegar el contenido del archivo
5. Ejecutar

## Características Técnicas

- **JOINs apropiados**: LEFT JOIN para datos opcionales, INNER JOIN para datos requeridos
- **Filtros específicos**: WHERE con comparación exacta para apellidos
- **Ordenamiento lógico**: Por fecha, apellido y nombre
- **Cálculos incluidos**: Subtotales y totales automáticos
- **Información completa**: Datos de todas las tablas relacionadas
- **Verificaciones**: Consultas de integridad y resumen estadístico

## Resultados Esperados

1. **Clientes con localidades**: 5 clientes con sus respectivas localidades
2. **Facturas con detalles**: Todas las facturas con sus detalles asociados
3. **Facturas completas**: Incluyendo nombres de artículos y categorías
4. **Facturas de García**: 1 factura específica del cliente García
5. **Compras de López**: Múltiples artículos comprados por el cliente López

El código está listo para ejecutar y cumple con todos los requerimientos del Ejercicio 2 de la Etapa 4.
