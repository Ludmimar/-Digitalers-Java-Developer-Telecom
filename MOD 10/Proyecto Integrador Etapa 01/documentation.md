# Documentación Completa - Proyecto Integrador Etapa 01

## TECNO_PRJ - Base de Datos para Empresa de Tecnología

### Índice
1. [Descripción del Proyecto](#descripción-del-proyecto)
2. [Estructura de la Base de Datos](#estructura-de-la-base-de-datos)
3. [Instalación y Configuración](#instalación-y-configuración)
4. [Guía de Uso](#guía-de-uso)
5. [Ejemplos Prácticos](#ejemplos-prácticos)
6. [Funciones y Procedimientos](#funciones-y-procedimientos)
7. [Consultas Avanzadas](#consultas-avanzadas)
8. [Mantenimiento](#mantenimiento)

---

## Descripción del Proyecto

Este proyecto implementa una base de datos completa para una empresa de tecnología que comercializa artículos electrónicos. El sistema permite gestionar:

- **Clientes**: Información personal y comercial
- **Artículos**: Catálogo de productos con precios y stock
- **Facturas**: Documentos de venta con diferentes tipos (A, B, C)
- **Detalles**: Items específicos de cada factura

### Características Principales:
- Integridad referencial automática
- Cálculo automático de montos de facturas
- Control de stock en tiempo real
- Triggers para mantener consistencia de datos
- Funciones y procedimientos almacenados
- Vistas para reportes frecuentes

---

## Estructura de la Base de Datos

### Diagrama Entidad-Relación

```
CLIENTES (1) -----> (N) FACTURAS
    |                    |
    |                    |
    |                    v
    |                DETALLE (N) <----- (1) ARTÍCULOS
    |                    |
    |                    |
    v                    v
ClienteID            ArticuloID
                    FacturaID
```

### Tablas Principales

#### CLIENTES
- `ClienteID` (PK): Identificador único
- `Nombre`: Nombre del cliente (VARCHAR(25))
- `Apellido`: Apellido del cliente (VARCHAR(25))
- `CUIT`: Código Único de Identificación Tributaria (CHAR(16))
- `Direccion`: Dirección del cliente (VARCHAR(50))
- `Comentarios`: Observaciones adicionales (VARCHAR(50))

#### ARTÍCULOS
- `ArticuloID` (PK): Identificador único
- `Nombre`: Nombre del artículo (VARCHAR(50))
- `Precio`: Precio unitario (DECIMAL(10,2))
- `Stock`: Cantidad disponible (INT)

#### FACTURAS
- `FacturaID` (PK): Identificador único
- `Letra`: Tipo de factura (CHAR(1) - A, B, C)
- `Numero`: Número de factura (INT)
- `ClienteID` (FK): Referencia al cliente
- `Fecha`: Fecha de emisión (DATE)
- `Monto`: Monto total calculado automáticamente (DECIMAL(12,2))

#### DETALLE
- `DetalleID` (PK): Identificador único
- `ArticuloID` (FK): Referencia al artículo
- `FacturaID` (FK): Referencia a la factura
- `Cantidad`: Cantidad vendida (INT)

---

## Instalación y Configuración

### Requisitos Previos
- MySQL Server 8.0 o superior
- Cliente MySQL (MySQL Workbench, phpMyAdmin, o línea de comandos)

### Pasos de Instalación

1. **Crear la base de datos:**
```sql
-- Ejecutar database_structure.sql
SOURCE database_structure.sql;
```

2. **Cargar datos de ejemplo:**
```sql
-- Ejecutar sample_data.sql
SOURCE sample_data.sql;
```

3. **Verificar la instalación:**
```sql
USE TECNO_PRJ;
SHOW TABLES;
SELECT COUNT(*) FROM CLIENTES;
SELECT COUNT(*) FROM ARTICULOS;
SELECT COUNT(*) FROM FACTURAS;
SELECT COUNT(*) FROM DETALLE;
```

---

## Guía de Uso

### Operaciones Básicas

#### Insertar un Nuevo Cliente
```sql
INSERT INTO CLIENTES (Nombre, Apellido, CUIT, Direccion, Comentarios)
VALUES ('Nuevo', 'Cliente', '20-12345678-9', 'Dirección 123', 'Cliente nuevo');
```

#### Insertar un Nuevo Artículo
```sql
INSERT INTO ARTICULOS (Nombre, Precio, Stock)
VALUES ('Nuevo Producto', 50000.00, 10);
```

#### Crear una Nueva Factura
```sql
-- 1. Crear la factura
INSERT INTO FACTURAS (Letra, Numero, ClienteID, Fecha)
VALUES ('A', 9, 1, '2024-02-01');

-- 2. Agregar detalles (el monto se calcula automáticamente)
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad)
VALUES (1, 16, 1), (2, 16, 2);
```

### Consultas Frecuentes

#### Ver Todas las Facturas de un Cliente
```sql
SELECT f.*, CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente
FROM FACTURAS f
JOIN CLIENTES c ON f.ClienteID = c.ClienteID
WHERE c.ClienteID = 1;
```

#### Ver Detalles de una Factura
```sql
SELECT 
    a.Nombre AS Articulo,
    d.Cantidad,
    a.Precio,
    (d.Cantidad * a.Precio) AS Subtotal
FROM DETALLE d
JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
WHERE d.FacturaID = 1;
```

#### Ver Artículos con Stock Bajo
```sql
SELECT ArticuloID, Nombre, Stock
FROM ARTICULOS
WHERE Stock < 15;
```

---

## Ejemplos Prácticos

### Ejemplo 1: Proceso Completo de Venta

```sql
-- 1. Verificar stock disponible
SELECT Nombre, Stock FROM ARTICULOS WHERE ArticuloID IN (1, 2);

-- 2. Crear la factura
INSERT INTO FACTURAS (Letra, Numero, ClienteID, Fecha)
VALUES ('A', 9, 1, '2024-02-01');

-- 3. Agregar detalles de venta
INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad)
VALUES (1, 16, 1), (2, 16, 2);

-- 4. Verificar el resultado
SELECT 
    f.Letra,
    f.Numero,
    f.Monto,
    COUNT(d.DetalleID) AS ItemsVendidos
FROM FACTURAS f
LEFT JOIN DETALLE d ON f.FacturaID = d.FacturaID
WHERE f.FacturaID = 16;
```

### Ejemplo 2: Reporte de Ventas por Cliente

```sql
SELECT 
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    COUNT(f.FacturaID) AS TotalFacturas,
    SUM(f.Monto) AS TotalVentas,
    AVG(f.Monto) AS PromedioFactura
FROM CLIENTES c
LEFT JOIN FACTURAS f ON c.ClienteID = f.ClienteID
GROUP BY c.ClienteID, c.Nombre, c.Apellido
ORDER BY TotalVentas DESC;
```

### Ejemplo 3: Análisis de Inventario

```sql
SELECT 
    Nombre,
    Precio,
    Stock,
    (Precio * Stock) AS ValorInventario,
    CASE 
        WHEN Stock = 0 THEN 'Sin Stock'
        WHEN Stock < 10 THEN 'Stock Bajo'
        WHEN Stock BETWEEN 10 AND 30 THEN 'Stock Medio'
        ELSE 'Stock Alto'
    END AS EstadoStock
FROM ARTICULOS
ORDER BY ValorInventario DESC;
```

---

## Funciones y Procedimientos

### Funciones Disponibles

#### `fn_calcular_total_factura(factura_id)`
Calcula el total de una factura basado en sus detalles.

```sql
SELECT fn_calcular_total_factura(1) AS TotalFactura;
```

#### `fn_verificar_stock(articulo_id, cantidad)`
Verifica si hay stock suficiente para una cantidad específica.

```sql
SELECT fn_verificar_stock(1, 5) AS StockSuficiente;
```

#### `fn_proximo_numero_factura(letra)`
Obtiene el próximo número de factura para un tipo específico.

```sql
SELECT fn_proximo_numero_factura('A') AS ProximoNumero;
```

### Procedimientos Disponibles

#### `sp_actualizar_precio_articulo`
Actualiza el precio de un artículo y recalcula las facturas afectadas.

```sql
CALL sp_actualizar_precio_articulo(1, 90000.00, @resultado);
SELECT @resultado;
```

#### `sp_actualizar_stock_articulo`
Actualiza el stock de un artículo.

```sql
CALL sp_actualizar_stock_articulo(1, 20, @resultado);
SELECT @resultado;
```

#### `sp_crear_venta`
Crea una venta completa con validaciones automáticas.

```sql
CALL sp_crear_venta(
    1, 
    'A', 
    '2024-02-01', 
    '[{"articulo_id": 1, "cantidad": 1}, {"articulo_id": 2, "cantidad": 2}]', 
    @factura_id, 
    @resultado
);
SELECT @factura_id, @resultado;
```

---

## Consultas Avanzadas

### Consultas con Operadores Lógicos

#### Clientes con Facturas Altas o Bajas
```sql
SELECT DISTINCT c.Nombre, c.Apellido, f.Monto
FROM CLIENTES c
JOIN FACTURAS f ON c.ClienteID = f.ClienteID
WHERE f.Monto > 100000 OR f.Monto < 50000;
```

#### Artículos Caros Y Con Stock Bajo
```sql
SELECT Nombre, Precio, Stock
FROM ARTICULOS
WHERE Precio > 80000 AND Stock < 15;
```

### Consultas con Subconsultas

#### Clientes que Compraron Laptops
```sql
SELECT ClienteID, Nombre, Apellido
FROM CLIENTES
WHERE ClienteID IN (
    SELECT DISTINCT f.ClienteID
    FROM FACTURAS f
    JOIN DETALLE d ON f.FacturaID = d.FacturaID
    JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
    WHERE a.Nombre LIKE '%Laptop%'
);
```

#### Facturas con Monto Superior al Promedio
```sql
SELECT FacturaID, Letra, Numero, Monto
FROM FACTURAS
WHERE Monto > (
    SELECT AVG(Monto) FROM FACTURAS
);
```

### Consultas con Agregaciones

#### Top 5 Artículos Más Vendidos
```sql
SELECT 
    a.Nombre,
    SUM(d.Cantidad) AS TotalVendido,
    COUNT(DISTINCT d.FacturaID) AS Facturas
FROM ARTICULOS a
JOIN DETALLE d ON a.ArticuloID = d.ArticuloID
GROUP BY a.ArticuloID, a.Nombre
ORDER BY TotalVendido DESC
LIMIT 5;
```

#### Ventas por Mes
```sql
SELECT 
    YEAR(Fecha) AS Año,
    MONTH(Fecha) AS Mes,
    COUNT(*) AS TotalFacturas,
    SUM(Monto) AS TotalVentas
FROM FACTURAS
GROUP BY YEAR(Fecha), MONTH(Fecha)
ORDER BY Año, Mes;
```

---

## Mantenimiento

### Procedimientos de Mantenimiento

#### Recalcular Montos de Facturas
```sql
CALL sp_recalcular_montos_facturas();
```

#### Verificar Integridad de Datos
```sql
CALL sp_verificar_integridad();
```

### Tareas de Mantenimiento Recomendadas

1. **Diario:**
   - Verificar stock de artículos críticos
   - Revisar facturas del día

2. **Semanal:**
   - Ejecutar verificación de integridad
   - Generar reportes de ventas

3. **Mensual:**
   - Recalcular montos de facturas
   - Análisis de inventario
   - Reportes de clientes

### Backup y Restauración

#### Crear Backup Completo
```bash
mysqldump -u usuario -p TECNO_PRJ > backup_tecno_prj.sql
```

#### Restaurar desde Backup
```bash
mysql -u usuario -p TECNO_PRJ < backup_tecno_prj.sql
```

---

## Solución de Problemas

### Problemas Comunes

#### Error: "Stock insuficiente"
- **Causa:** Intentar vender más cantidad de la disponible
- **Solución:** Verificar stock antes de crear detalles

#### Error: "Cliente no existe"
- **Causa:** Referencia a ClienteID inexistente
- **Solución:** Verificar que el cliente esté registrado

#### Montos Incorrectos en Facturas
- **Causa:** Cambios manuales en precios sin recalcular
- **Solución:** Ejecutar `sp_recalcular_montos_facturas()`

### Consultas de Diagnóstico

#### Verificar Consistencia de Datos
```sql
-- Facturas sin detalles
SELECT f.* FROM FACTURAS f
LEFT JOIN DETALLE d ON f.FacturaID = d.FacturaID
WHERE d.FacturaID IS NULL;

-- Artículos con stock negativo
SELECT * FROM ARTICULOS WHERE Stock < 0;

-- Montos incorrectos
SELECT f.* FROM FACTURAS f
WHERE f.Monto != fn_calcular_total_factura(f.FacturaID);
```

---

## Conclusión

Este proyecto integrador demuestra la implementación completa de una base de datos empresarial con:

- ✅ Estructura normalizada y relaciones apropiadas
- ✅ Integridad referencial automática
- ✅ Triggers para mantener consistencia
- ✅ Funciones y procedimientos almacenados
- ✅ Consultas avanzadas con operadores lógicos
- ✅ Sistema de mantenimiento automatizado
- ✅ Documentación completa y ejemplos prácticos

La base de datos está lista para uso en producción y puede escalarse según las necesidades de la empresa.
