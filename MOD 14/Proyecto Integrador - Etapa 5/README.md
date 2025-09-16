# 📊 Proyecto Integrador - Etapa 5
## Funciones de Cadena, Matemáticas y Fecha en SQL

### 📋 Descripción del Proyecto

Este proyecto implementa consultas SQL avanzadas utilizando funciones de cadena, matemáticas y fecha para el análisis de datos de una base de datos de facturación tecnológica. El proyecto está dividido en dos ejercicios principales que demuestran el uso práctico de diferentes tipos de funciones SQL.

---

## 🗂️ Estructura del Proyecto

```
Proyecto Integrador - Etapa 5/
├── README.md                                    # Este archivo
├── Etapa 5.pdf                                 # Documento de requisitos original
├── Etapa5_Ejercicio1_ProyectoIntegrador.sql    # Funciones de cadena y matemáticas
└── Etapa5_Ejercicio2_ProyectoIntegrador.sql    # Funciones de fecha y tiempo
```

---

## 🎯 Objetivos de Aprendizaje

- **Funciones de Cadena**: Concatenación, manipulación y formateo de texto
- **Funciones Matemáticas**: Cálculos aritméticos, redondeo y operaciones numéricas
- **Funciones de Fecha**: Manipulación de fechas, cálculos temporales y formateo
- **Consultas Avanzadas**: Combinación de múltiples funciones en consultas complejas

---

## 📚 Ejercicios Implementados

### 🔤 **Ejercicio 1: Funciones de Cadena y Matemáticas**

**Archivo**: `Etapa5_Ejercicio1_ProyectoIntegrador.sql`

#### Ejercicios incluidos:

1. **CONCAT con guión** - Concatenación de apellido y nombre con separador
2. **CONCAT_WS con guión** - Concatenación con separador usando CONCAT_WS
3. **CONCAT_WS con UPPER** - Concatenación con nombre en mayúsculas
4. **Inicial del nombre** - Extracción de la primera letra del nombre
5. **Cálculo de IVA (21%)** - Cálculo del impuesto sobre el valor agregado
6. **Cálculo de NETO** - Total más IVA con precisión decimal
7. **Redondeo a favor del cliente** - Aplicación de FLOOR para favorecer al cliente

#### Funciones SQL utilizadas:
- `CONCAT()` - Concatenación de cadenas
- `CONCAT_WS()` - Concatenación con separador
- `UPPER()` - Conversión a mayúsculas
- `LEFT()` - Extracción de caracteres desde la izquierda
- `ROUND()` - Redondeo con precisión decimal
- `FLOOR()` - Redondeo hacia abajo

---

### 📅 **Ejercicio 2: Funciones de Fecha y Tiempo**

**Archivo**: `Etapa5_Ejercicio2_ProyectoIntegrador.sql`

#### Ejercicios incluidos:

1. **Facturas del año 2021** - Filtrado por año específico
2. **Facturas de marzo y septiembre 2021** - Filtrado por meses específicos
3. **Facturas del primer día del mes** - Filtrado por día específico
4. **Días transcurridos** - Cálculo de días desde la fecha de factura
5. **Nombre del día** - Obtención del día de la semana
6. **Día del año** - Número del día dentro del año
7. **Nombre del mes** - Obtención del nombre del mes
8. **Primer vencimiento** - Cálculo de vencimiento a 30 días
9. **Segundo vencimiento** - Cálculo de vencimiento a 2 meses

#### Funciones SQL utilizadas:
- `YEAR()` - Extracción del año
- `MONTH()` - Extracción del mes
- `DAY()` - Extracción del día
- `DAYNAME()` - Nombre del día de la semana
- `MONTHNAME()` - Nombre del mes
- `DAYOFYEAR()` - Día del año
- `DATEDIFF()` - Diferencia entre fechas
- `DATE_ADD()` - Suma de intervalos a fechas
- `CURDATE()` - Fecha actual

---

## 🚀 Instalación y Uso

### Prerrequisitos
- MySQL Server 5.7 o superior
- Base de datos `TECNO_DB` con las tablas:
  - `Clientes`
  - `Facturas`
  - `Articulos`
  - `Detalles`
  - `Categoria`
  - `Localidades`

### Ejecución
1. **Conectar a MySQL**:
   ```sql
   mysql -u tu_usuario -p
   ```

2. **Seleccionar la base de datos**:
   ```sql
   USE TECNO_DB;
   ```

3. **Ejecutar los ejercicios**:
   ```bash
   # Ejercicio 1 - Funciones de cadena y matemáticas
   mysql -u tu_usuario -p TECNO_DB < Etapa5_Ejercicio1_ProyectoIntegrador.sql
   
   # Ejercicio 2 - Funciones de fecha y tiempo
   mysql -u tu_usuario -p TECNO_DB < Etapa5_Ejercicio2_ProyectoIntegrador.sql
   ```

### Ejecución Individual
También puedes ejecutar cada archivo directamente en tu cliente MySQL preferido (MySQL Workbench, phpMyAdmin, etc.).

---

## 📊 Resultados Esperados

### Ejercicio 1 - Ejemplos de Salida:
```
ClienteID | Dirección        | Nombre completo
----------|------------------|----------------
1         | Av. Corrientes   | García-JUAN
2         | Av. Santa Fe     | López-MARÍA
```

### Ejercicio 2 - Ejemplos de Salida:
```
FacturaID | Fecha       | DIAS TRANSCURRIDOS | DIA      | PRIMER VENCIMIENTO
----------|-------------|-------------------|----------|------------------
1         | 2021-03-15  | 850               | Lunes    | 2021-04-14
2         | 2021-09-10  | 670               | Viernes  | 2021-10-10
```

---

## 🔧 Características Técnicas

### Optimizaciones Implementadas:
- **Índices sugeridos** en columnas de fecha para mejor rendimiento
- **Consultas progresivas** que construyen sobre resultados anteriores
- **Validación de datos** con consultas de verificación
- **Documentación inline** con comentarios explicativos

### Buenas Prácticas Aplicadas:
- Uso de alias descriptivos para columnas calculadas
- Ordenamiento consistente de resultados
- Separación clara entre ejercicios con comentarios
- Consultas de resumen y verificación incluidas

---

## 📈 Análisis y Estadísticas

Cada archivo incluye consultas adicionales que proporcionan:
- **Estadísticas de ejecución** por ejercicio
- **Análisis de datos** (totales, promedios, conteos)
- **Verificación de integridad** de los resultados
- **Resúmenes por período** (año, mes, día de la semana)

---

## 🎓 Conceptos de SQL Aprendidos

### Funciones de Cadena:
- Manipulación y formateo de texto
- Concatenación con y sin separadores
- Extracción de caracteres específicos
- Conversión de casos (mayúsculas/minúsculas)

### Funciones Matemáticas:
- Cálculos porcentuales
- Redondeo con precisión decimal
- Operaciones aritméticas básicas
- Funciones de redondeo (FLOOR, CEIL, ROUND)

### Funciones de Fecha:
- Extracción de componentes de fecha
- Cálculos de diferencia temporal
- Suma de intervalos de tiempo
- Formateo de fechas y nombres

---

## 📝 Notas de Desarrollo

- **Base de datos**: TECNO_DB
- **Motor**: MySQL
- **Codificación**: UTF-8
- **Formato**: SQL estándar compatible con MySQL 5.7+

### Consideraciones Especiales:
- Las consultas están optimizadas para rendimiento
- Se incluyen consultas de verificación para validar resultados
- El código es compatible con diferentes versiones de MySQL
- Se mantiene consistencia en el estilo de nomenclatura

---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
-  [GitHub](https://github.com/Ludmimar)

---


**Desarrollado con ❤️ para el aprendizaje de SQL avanzado**
