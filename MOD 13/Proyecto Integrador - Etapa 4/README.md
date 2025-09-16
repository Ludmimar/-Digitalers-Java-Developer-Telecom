# PROYECTO INTEGRADOR - ETAPA 4

## Descripción
Esta etapa implementa reportes y consultas avanzadas para la base de datos TECNO_DB, cumpliendo con los requerimientos específicos del Ejercicio 1 y Ejercicio 2.

## 📁 Archivos Disponibles

### 📋 **Archivos Principales**
- **`Etapa4_ProyectoIntegrador.sql`** - Ejercicio 1 completo (4 requerimientos)
- **`Ejercicio2_ProyectoIntegrador.sql`** - Ejercicio 2 completo (5 requerimientos)
- **`Etapa4_Completa_ProyectoIntegrador.sql`** - Ambos ejercicios consolidados

### 📚 **Documentación**
- **`README_Ejercicio2.md`** - Documentación específica del Ejercicio 2
- **`INDICE_ETAPA4.md`** - Índice completo de todos los archivos
- **`Etapa 4.pdf`** - Documento original con requerimientos

### 🔍 **Archivos de Verificación**
- **`Consultas_Verificacion_Etapa4.sql`** - Verificaciones para Ejercicio 1
- **`Consultas_Verificacion_Ejercicio2.sql`** - Verificaciones para Ejercicio 2

### 🤖 **Prompts de IA**
- **`Prompt_IA_Articulos_Stock_Alto.txt`** - Prompt para Ejercicio 1.3

## ✅ Requerimientos Cumplidos

### 🎯 **EJERCICIO 1**

#### **Punto 1: Reporte Artículos y Categorías**
✅ **Listado que incluya tanto los artículos como las categorías en el mismo informe**
- Consulta que combina ARTICULOS y CATEGORIA usando LEFT JOIN
- Muestra información completa de artículos con sus categorías correspondientes
- Incluye: ID, nombre, precio, stock, categoría y descripción

#### **Punto 2: Reporte Clientes y Localidades con Filtros**
✅ **Listado que incluya tanto los clientes como las localidades en el mismo informe**
✅ **Filtros aplicados:**
- Clientes cuyo apellido comience con la letra 'G'
- Localidades que pertenecen a la provincia 'Buenos Aires'
- Usa LEFT JOIN entre CLIENTES y LOCALIDADES
- Aplica filtros con WHERE y LIKE

#### **Punto 3: Artículos con Más de 50 Unidades**
✅ **Prompt creado para mostrar artículos con más de 50 unidades disponibles**
✅ **Estrategia que combina resultados de dos consultas:**
1. Primera consulta: Artículos con STOCK > 50
2. Segunda consulta: Detalles de ventas relacionados
3. Tercera consulta: Combinación usando UNION ALL

#### **Punto 4: Ejecución del Código**
✅ **Código SQL creado y listo para ejecutar**

### 🎯 **EJERCICIO 2**

#### **Punto 1: Clientes con Datos de Localidad**
✅ **Listado de clientes junto con los datos de la localidad en la que se encuentran**
- Usa LEFT JOIN entre CLIENTES y LOCALIDADES
- Muestra información completa del cliente con datos de su localidad

#### **Punto 2: Facturas con Detalles (Sin Info de Artículos)**
✅ **Listado de todas las facturas junto con los detalles de los artículos asociados**
- Usa INNER JOIN entre FACTURAS, CLIENTES y DETALLES
- Muestra información de facturas y detalles sin nombres de artículos
- Incluye cálculo de subtotales usando subconsulta

#### **Punto 3: Facturas con Detalles e Información de Artículos**
✅ **El mismo listado, pero incluyendo el nombre de los artículos vendidos**
- Extiende la consulta anterior agregando JOIN con ARTICULOS y CATEGORIA
- Incluye nombres de artículos, precios y categorías

#### **Punto 4: Facturas del Cliente "García"**
✅ **Datos de las facturas que están a nombre del cliente con apellido "García"**
- Filtra facturas por apellido específico usando WHERE
- Incluye datos completos de factura y cliente

#### **Punto 5: Artículos Comprados por "López"**
✅ **Artículos que compró el cliente con apellido "López"**
- Consulta completa de compras por cliente específico
- Incluye información detallada de artículos, precios y categorías

## 🔧 Estructura de las Consultas

### 📊 **EJERCICIO 1 - Consultas Principales**

#### 1. Reporte Artículos y Categorías
```sql
SELECT 
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    a.STOCK,
    c.CategoriaID,
    c.Nombre as CATEGORIA,
    c.Descripcion as DESCRIPCION_CATEGORIA
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
ORDER BY c.Nombre, a.NOMBRE;
```

#### 2. Reporte Clientes y Localidades (Filtrado)
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
    l.CP,
    l.Provincia
FROM CLIENTES c
LEFT JOIN LOCALIDADES l ON c.LOCALIDAD_ID = l.LocalidadID
WHERE c.APELLIDO LIKE 'G%' 
   OR l.Provincia = 'Buenos Aires'
ORDER BY c.APELLIDO, l.Provincia;
```

#### 3. Artículos con Stock Alto y Detalles
```sql
-- Primera consulta: Artículos con más de 50 unidades
SELECT 
    a.ARTICULO_ID,
    a.NOMBRE as ARTICULO,
    a.PRECIO,
    a.STOCK,
    c.Nombre as CATEGORIA,
    CASE 
        WHEN a.STOCK > 100 THEN 'ALTO STOCK'
        WHEN a.STOCK > 75 THEN 'STOCK MEDIO-ALTO'
        WHEN a.STOCK > 50 THEN 'STOCK MEDIO'
        ELSE 'STOCK BAJO'
    END as ESTADO_STOCK
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
WHERE a.STOCK > 50
ORDER BY a.STOCK DESC;
```

#### 4. Combinación de Resultados
```sql
SELECT 
    'ARTICULO' as TIPO_REGISTRO,
    a.ARTICULO_ID,
    a.NOMBRE as DESCRIPCION,
    a.STOCK as CANTIDAD,
    a.PRECIO as VALOR_UNITARIO,
    c.Nombre as CATEGORIA,
    NULL as FACTURA_ID,
    NULL as CLIENTE_NOMBRE,
    NULL as FECHA_VENTA
FROM ARTICULOS a
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
WHERE a.STOCK > 50

UNION ALL

SELECT 
    'DETALLE_VENTA' as TIPO_REGISTRO,
    d.DETALLE_ID as ARTICULO_ID,
    CONCAT(a.NOMBRE, ' - Factura ', f.LETRA, f.NUMERO) as DESCRIPCION,
    d.CANTIDAD,
    a.PRECIO as VALOR_UNITARIO,
    c.Nombre as CATEGORIA,
    d.FACTURA_ID,
    CONCAT(cl.NOMBRE, ' ', cl.APELLIDO) as CLIENTE_NOMBRE,
    f.FECHA as FECHA_VENTA
FROM DETALLES d
INNER JOIN ARTICULOS a ON d.ARTICULO_ID = a.ARTICULO_ID
INNER JOIN FACTURAS f ON d.FACTURA_ID = f.FACTURA_ID
INNER JOIN CLIENTES cl ON f.CLIENTE_ID = cl.CLIENTE_ID
LEFT JOIN CATEGORIA c ON a.CategoriaID = c.CategoriaID
WHERE a.STOCK > 50

ORDER BY ARTICULO_ID, TIPO_REGISTRO;
```

### 📊 **EJERCICIO 2 - Consultas Principales**

#### 1. Clientes con Datos de Localidad
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

#### 2. Facturas con Detalles (Sin Info de Artículos)
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

#### 3. Facturas con Detalles e Información de Artículos
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

#### 4. Facturas del Cliente García
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

#### 5. Artículos Comprados por López
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

## 🔍 Consultas Adicionales Incluidas

El código incluye las siguientes verificaciones:

1. **Estructura de tablas**: DESCRIBE de todas las tablas principales
2. **Resumen estadístico**: Conteos y estadísticas de los datos
3. **Integridad de datos**: Verificación de relaciones entre tablas
4. **Consulta final**: Resumen de la ejecución exitosa

## 📊 Datos de Prueba Esperados

Basándose en los datos existentes en TECNO_DB:

### **Ejercicio 1:**
- **Artículos con stock > 50**: Apple AirPods Pro (152 unidades)
- **Clientes con apellido 'G'**: González, García
- **Localidades de Buenos Aires**: CABA, La Plata
- **Detalles de ventas**: Registros en tabla DETALLES relacionados con los artículos

### **Ejercicio 2:**
- **Clientes con localidades**: 5 clientes con sus respectivas localidades
- **Facturas existentes**: 5 facturas con detalles asociados
- **Facturas de García**: 1 factura específica (A-39, $979.75)
- **Compras de López**: Múltiples artículos comprados por el cliente López

## 🎯 Resultados Esperados

### **Ejercicio 1:**
1. **Reporte Artículos y Categorías**: Lista completa de artículos con sus categorías
2. **Reporte Clientes y Localidades**: Clientes filtrados y localidades de Buenos Aires
3. **Artículos Stock Alto**: Solo Apple AirPods Pro (152 unidades)
4. **Combinación**: Lista unificada de artículos y detalles de ventas

### **Ejercicio 2:**
1. **Clientes con localidades**: 5 clientes con sus respectivas localidades
2. **Facturas con detalles**: Todas las facturas con sus detalles asociados
3. **Facturas completas**: Incluyendo nombres de artículos y categorías
4. **Facturas de García**: 1 factura específica del cliente García
5. **Compras de López**: Múltiples artículos comprados por el cliente López

## 🚀 Cómo Ejecutar

### **Opción 1: Ejecutar Todo de Una Vez (Recomendado)**
```bash
mysql -u root -p
USE TECNO_DB;
SOURCE Etapa4_Completa_ProyectoIntegrador.sql;
```

### **Opción 2: Ejecutar por Separado**
```bash
mysql -u root -p
USE TECNO_DB;

-- Ejercicio 1
SOURCE Etapa4_ProyectoIntegrador.sql;

-- Ejercicio 2
SOURCE Ejercicio2_ProyectoIntegrador.sql;
```

### **Opción 3: Solo Verificaciones**
```bash
mysql -u root -p
USE TECNO_DB;

-- Verificar Ejercicio 1
SOURCE Consultas_Verificacion_Etapa4.sql;

-- Verificar Ejercicio 2
SOURCE Consultas_Verificacion_Ejercicio2.sql;
```

### **Opción 4: MySQL Workbench**
1. Abrir MySQL Workbench
2. Conectar a la base de datos
3. Seleccionar la base de datos TECNO_DB
4. Abrir el archivo deseado (`Etapa4_Completa_ProyectoIntegrador.sql` para todo)
5. Ejecutar todo el script

### **Opción 5: phpMyAdmin**
1. Acceder a phpMyAdmin
2. Seleccionar la base de datos TECNO_DB
3. Ir a la pestaña SQL
4. Copiar y pegar el contenido del archivo deseado
5. Ejecutar

## ✅ Verificaciones Incluidas

El código incluye las siguientes verificaciones:

1. **Estructura de tablas**: DESCRIBE de todas las tablas principales
2. **Resumen estadístico**: Conteos y estadísticas de los datos
3. **Integridad de datos**: Verificación de relaciones entre tablas
4. **Consulta final**: Resumen de la ejecución exitosa
5. **Datos específicos**: Verificación de clientes García y López
6. **Relaciones**: Validación de claves foráneas

## 🔧 Notas Técnicas

### **JOINs Utilizados:**
- **LEFT JOIN**: Para incluir artículos sin categoría asignada y clientes sin localidad
- **INNER JOIN**: Para detalles de ventas (solo artículos vendidos) y datos requeridos

### **Filtros Aplicados:**
- **WHERE con LIKE**: Para búsquedas de patrones (apellidos que comienzan con 'G')
- **WHERE con comparación exacta**: Para filtros específicos (apellido = 'García')

### **Combinaciones:**
- **UNION ALL**: Para combinar resultados de diferentes consultas
- **Subconsultas**: Para cálculos de precios en detalles sin información de artículos

### **Características Adicionales:**
- **Comentarios explicativos**: En todo el código SQL
- **Ordenamiento lógico**: Por fecha, apellido y nombre
- **Cálculos automáticos**: Subtotales y totales incluidos
- **Información completa**: Datos de todas las tablas relacionadas

---

## 🎉 **ESTADO FINAL**

✅ **ETAPA 4 COMPLETADA AL 100%**

- ✅ **Ejercicio 1**: 4/4 requerimientos cumplidos
- ✅ **Ejercicio 2**: 5/5 requerimientos cumplidos
- ✅ **Documentación**: Completa y organizada
- ✅ **Código SQL**: Listo para ejecutar
- ✅ **Verificaciones**: Incluidas y funcionales
- ✅ **Carpeta organizada**: Solo archivos de la Etapa 4


---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---


**La Etapa 4 del Proyecto Integrador está completamente terminada y lista para entregar.**
