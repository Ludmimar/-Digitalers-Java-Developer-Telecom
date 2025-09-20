# Desafío 03 - Sistema de Gestión Completo (Dos Partes)

## Descripción

Este desafío está dividido en dos partes que implementan sistemas de gestión diferentes, demostrando la evolución y complejidad creciente en el uso de colecciones, mapas y patrones de diseño. La Parte 1 se enfoca en un sistema de turnos con PriorityQueue, mientras que la Parte 2 implementa un sistema bancario completo con HashMap para búsqueda de clientes.

## Estructura del Desafío

### 📋 Parte 1 - Sistema de Turnos
**Ubicación**: `parte 1/`

**Descripción**: Sistema de gestión de turnos que simula la atención de personas en una institución, utilizando PriorityQueue para manejar el orden de atención basado en prioridades.

#### Funcionalidades
- Gestión de turnos con prioridad por edad
- Simulación de tiempo de atención
- Cola de prioridad para ordenamiento automático
- Sistema de notificaciones de próximo en atención

#### Conceptos Aplicados
- **PriorityQueue**: Cola de prioridad para ordenamiento automático
- **Comparable/Comparator**: Ordenamiento por edad
- **Thread.sleep()**: Simulación de tiempo de procesamiento
- **Entidades**: Persona y Turno

### 🏦 Parte 2 - Sistema Bancario Avanzado
**Ubicación**: `parte 2/`

**Descripción**: Sistema bancario completo con búsqueda de clientes, gestión de productos financieros y manejo de fechas, utilizando HashMap para acceso eficiente a datos de clientes.

#### Funcionalidades
- Búsqueda de clientes por documento
- Gestión de múltiples productos por cliente
- Manejo de fechas con LocalDate
- Validación de entrada de datos
- Sistema de excepciones personalizadas

#### Conceptos Aplicados
- **HashMap**: Búsqueda eficiente de clientes por clave
- **List**: Gestión de múltiples productos por cliente
- **LocalDate**: Manejo moderno de fechas
- **Enumerados**: Tipos de documento y cuenta
- **Scanner**: Entrada interactiva de datos

## Comparación entre Partes

| Aspecto | Parte 1 | Parte 2 |
|---------|---------|---------|
| **Colección Principal** | PriorityQueue | HashMap |
| **Propósito** | Ordenamiento por prioridad | Búsqueda por clave |
| **Complejidad** | Básica | Avanzada |
| **Entrada de Datos** | Predefinida | Interactiva |
| **Persistencia** | No | No (en memoria) |
| **Manejo de Errores** | Básico | Avanzado con excepciones |

## Cómo Ejecutar

### Parte 1 - Sistema de Turnos
```bash
# Navegar al directorio
cd "parte 1"

# Compilar
mvn compile

# Ejecutar
mvn exec:java -Dexec.mainClass="com.educacionit.desafio01.App"
```

### Parte 2 - Sistema Bancario
```bash
# Navegar al directorio
cd "parte 2"

# Compilar
mvn compile

# Ejecutar
mvn exec:java -Dexec.mainClass="com.educacionit.desafio02.App"
```

## Ejemplos de Salida

### Parte 1 - Sistema de Turnos
```
Inicio de Sistema de turnos
Atendiendo a:  Turno [persona=Persona [documento=06, nombre=Nombre 06, apellido=Apellido 06, edad=89]]
Por Atender a: Turno [persona=Persona [documento=18, nombre=Nombre 18, apellido=Apellido 18, edad=80]]
Atendiendo a:  Turno [persona=Persona [documento=18, nombre=Nombre 18, apellido=Apellido 18, edad=80]]
Por Atender a: Turno [persona=Persona [documento=13, nombre=Nombre 13, apellido=Apellido 13, edad=87]]
...
Fin de Sistema de turnos
```

### Parte 2 - Sistema Bancario
```
Sistema de busqueda Bancario:
Ingrese el tipo de documento: CI
Ingrese el numero de documento: 01

Cliente 01
Documento [tipoDocumento=CI, numeroDocumento=01]
1983-03-15
Productos:
	Cuenta - Número: 15, Saldo: 2.0, Tipo: CC
	Cuenta - Número: 16, Saldo: 4.0, Tipo: CC
	Cuenta - Número: 125, Saldo: 9.0, Tipo: CA
	Tarjeta de Crédito - Número: 2, Límite: 15.0, Tasa: 8.0%
	Tarjeta de Crédito - Número: 87, Límite: 74.0, Tasa: 89.0%
```

## Análisis Técnico

### Parte 1 - PriorityQueue
```java
Queue<Turno> turnos = new PriorityQueue<>();
// Los turnos se ordenan automáticamente por prioridad
// (edad en este caso, implementado en la clase Turno)
```

**Ventajas**:
- Ordenamiento automático
- Acceso eficiente al elemento de mayor prioridad
- Simulación realista de colas de atención

### Parte 2 - HashMap
```java
Map<Documento, Cliente> clientes = new HashMap<>();
// Búsqueda O(1) por documento como clave
Cliente cliente = clientes.get(documento);
```

**Ventajas**:
- Búsqueda muy eficiente
- Asociación clave-valor natural
- Escalabilidad para grandes volúmenes de datos

## Puntos de Aprendizaje

### 1. Elección de Estructuras de Datos
- **PriorityQueue**: Para ordenamiento por prioridad
- **HashMap**: Para búsqueda rápida por clave
- **List**: Para colecciones ordenadas y acceso por índice

### 2. Manejo de Fechas
- **Date vs LocalDate**: Comparación entre APIs antigua y moderna
- **Formateo**: Conversión entre String y fechas
- **Validación**: Manejo de formatos de fecha

### 3. Patrones de Diseño
- **Entity Pattern**: Clases que representan entidades del dominio
- **Repository Pattern**: Acceso a datos (implícito en Parte 2)
- **Exception Handling**: Manejo consistente de errores

### 4. Interacción con Usuario
- **Scanner**: Entrada de datos desde consola
- **Validación**: Verificación de entrada del usuario
- **Feedback**: Mensajes claros y útiles

## Evaluación

Este desafío será evaluado considerando:

### Parte 1
- ✅ Comprensión de PriorityQueue
- ✅ Implementación correcta de Comparable/Comparator
- ✅ Manejo de tiempo y simulación
- ✅ Estructura de clases y relaciones

### Parte 2
- ✅ Uso efectivo de HashMap
- ✅ Manejo de fechas con LocalDate
- ✅ Validación de entrada de usuario
- ✅ Gestión de excepciones
- ✅ Arquitectura del sistema

### General
- ✅ Comparación y análisis de ambas implementaciones
- ✅ Comprensión de cuándo usar cada estructura de datos
- ✅ Calidad del código y documentación
- ✅ Capacidad de evolución y mantenimiento

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---


