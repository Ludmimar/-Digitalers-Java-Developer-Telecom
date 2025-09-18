# Laboratorio 01 - Java SE

## Descripción

Este proyecto es un laboratorio de Java SE que demuestra conceptos fundamentales de programación en Java, incluyendo operaciones matemáticas básicas, manejo de variables y cálculo de promedios.

## Características

- **Operaciones Matemáticas**: Implementación de las cuatro operaciones básicas (suma, resta, multiplicación, división)
- **Cálculo de Promedio**: Demostración del cálculo de promedio de múltiples valores
- **Manejo de Variables**: Ejemplos de declaración e inicialización de variables con diferentes tipos de datos
- **Convenciones de Nomenclatura**: Demostración del uso de símbolos especiales en nombres de variables

## Estructura del Proyecto

```
Laboratorio01/
├── pom.xml                                    # Configuración de Maven
├── src/
│   ├── main/java/com/educacionIT/javase/principal/
│   │   ├── OperacionMatematica.java          # Clase principal para operaciones matemáticas
│   │   └── Promedio.java                     # Clase para cálculo de promedio
│   └── test/java/com/educacionIT/javase/Laboratorio01/
│       └── AppTest.java                       # Pruebas unitarias con JUnit
└── target/                                    # Archivos compilados
```

## Clases Principales

### OperacionMatematica.java
Demuestra las operaciones matemáticas básicas:
- Suma
- Resta
- Multiplicación
- División

**Variables utilizadas:**
- `numero1`: Valor flotante inicializado en 5.0f
- `numero2`: Valor flotante inicializado en 6.3f
- `total`: Variable para almacenar resultados

### Promedio.java
Calcula el promedio de cuatro números:
- Demuestra el uso de variables con símbolos especiales (`$numero_1`, `$numero_2`, etc.)
- Implementa la fórmula: `(suma de valores) / cantidad de valores`

**Variables utilizadas:**
- `$numero_1`: Valor 5
- `$numero_2`: Valor 7
- `$numero_3`: Valor 4.6f
- `$numero_4`: Valor 9.1f
- `$total`: Variable para almacenar el resultado del promedio

## Requisitos del Sistema

- **Java**: Versión 1.7 o superior
- **Maven**: Para gestión de dependencias y construcción del proyecto
- **JUnit**: Versión 4.11 (incluida como dependencia)

## Instalación y Ejecución

### Prerrequisitos
Asegúrate de tener instalado:
- Java JDK 1.7 o superior
- Maven 3.x

### Pasos para ejecutar

1. **Clonar o descargar el proyecto**
   ```bash
   git clone [URL_DEL_REPOSITORIO]
   cd "Laboratorio 01/Laboratorio01"
   ```

2. **Compilar el proyecto**
   ```bash
   mvn compile
   ```

3. **Ejecutar las clases principales**

   Para ejecutar OperacionMatematica:
   ```bash
   mvn exec:java -Dexec.mainClass="com.educacionIT.javase.principal.OperacionMatematica"
   ```

   Para ejecutar Promedio:
   ```bash
   mvn exec:java -Dexec.mainClass="com.educacionIT.javase.principal.Promedio"
   ```

4. **Ejecutar las pruebas**
   ```bash
   mvn test
   ```

5. **Empaquetar el proyecto**
   ```bash
   mvn package
   ```

## Salida Esperada

### OperacionMatematica
```
Operaciones matematicas basicas

El valor de la variable numero 1 es: 5.0
El valor de la variable numero 2 es: 6.3

La suma da: 11.3
La resta da: -1.3
La multiplicacion da: 31.5
La division da: 0.7936508
```

### Promedio
```
Promedio

El valor de la variable numero 1 es: 5.0
El valor de la variable numero 2 es: 7.0
El valor de la variable numero 3 es: 4.6
El valor de la variable numero 4 es: 9.1

El promedio de las 4 variables es: 6.425
```

## Tecnologías Utilizadas

- **Java SE**: Lenguaje de programación principal
- **Maven**: Herramienta de gestión de proyectos y dependencias
- **JUnit 4**: Framework de pruebas unitarias

## Autor

**EducacionIT**
- Fecha: 10 de junio de 2020

## Propósito Educativo

Este laboratorio está diseñado para:
- Introducir conceptos básicos de Java SE
- Demostrar operaciones matemáticas fundamentales
- Mostrar diferentes formas de declarar variables
- Practicar la estructura básica de un proyecto Java con Maven
- Familiarizarse con el entorno de desarrollo Java

## Notas Adicionales

- El proyecto utiliza Java 1.7 como versión objetivo
- Las variables se declaran como `float` para manejar divisiones con decimales
- Se demuestra el uso de símbolos especiales (`$`) en nombres de variables
- El proyecto incluye una estructura estándar de Maven con separación de código fuente y pruebas

---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---
