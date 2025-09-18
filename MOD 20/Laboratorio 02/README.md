# Laboratorio 02 - Java SE

## 📋 Descripción

Este proyecto contiene ejercicios prácticos de Java SE desarrollados como parte del Laboratorio 02 de EducaciónIT. El laboratorio se enfoca en el uso de estructuras de control condicionales y operaciones matemáticas básicas en Java.

## 🎯 Objetivos

- Practicar el uso de estructuras condicionales (`if-else` y `switch`)
- Implementar operaciones matemáticas básicas
- Aprender a comparar números y encontrar valores mayores
- Familiarizarse con el manejo de variables de diferentes tipos de datos

## 📁 Estructura del Proyecto

```
Laboratorio02/
├── pom.xml                                    # Configuración de Maven
├── src/
│   ├── main/
│   │   └── java/
│   │       └── com/
│   │           └── educacionIT/
│   │               └── javase/
│   │                   └── principal/
│   │                       ├── NumeroMayor.java                           # Ejercicio 1
│   │                       ├── OperacionMatematicaConIFAnidados.java     # Ejercicio 2
│   │                       └── OperacionMatematicaConSwitch.java          # Ejercicio 3
│   └── test/
│       └── java/
│           └── com/
│               └── educacionIT/
│                   └── javase/
│                       └── Laboratorio02/
│                           └── AppTest.java                               # Tests unitarios
└── target/                                  # Archivos compilados
```

## 🚀 Ejercicios Incluidos

### 1. NumeroMayor.java
**Descripción:** Programa que encuentra el número mayor entre tres variables enteras.

**Características:**
- Compara tres números usando estructuras `if-else`
- Utiliza operadores lógicos (`&&`)
- Muestra los valores iniciales y el resultado

**Variables:**
- `numero_1 = 5`
- `numero_2 = 7` 
- `numero_3 = 9`

### 2. OperacionMatematicaConIFAnidados.java
**Descripción:** Calculadora básica que realiza operaciones matemáticas usando estructuras `if-else` anidadas.

**Características:**
- Soporta operaciones: suma (+), resta (-), multiplicación (*), división (/)
- Usa variables de tipo `float` para manejar decimales
- Implementa validación de operaciones inválidas

**Variables:**
- `numero1 = 5.0f`
- `numero2 = 6.3f`
- `operacion = '+'`

### 3. OperacionMatematicaConSwitch.java
**Descripción:** Calculadora mejorada que utiliza la estructura `switch` para las operaciones matemáticas.

**Características:**
- Soporta múltiples formas de representar cada operación:
  - **Suma:** `s`, `S`, `+`
  - **Resta:** `r`, `R`, `-`
  - **Multiplicación:** `m`, `M`, `*`
  - **División:** `d`, `D`, `/`
- Implementa casos múltiples en el `switch`
- Maneja operaciones inválidas con `default`

**Variables:**
- `numero1 = 8.9f`
- `numero2 = 4f`
- `operacion = 'p'` (operación inválida para demostrar el caso default)

## 🛠️ Tecnologías Utilizadas

- **Java SE 7** - Lenguaje de programación
- **Maven** - Herramienta de gestión de dependencias y construcción
- **JUnit 4.11** - Framework de testing
- **UTF-8** - Codificación de caracteres

## 📦 Requisitos del Sistema

- Java Development Kit (JDK) 7 o superior
- Apache Maven 3.6 o superior
- IDE compatible con Java (IntelliJ IDEA, Eclipse, VS Code, etc.)

## 🏃‍♂️ Cómo Ejecutar

### Opción 1: Desde el IDE
1. Importa el proyecto en tu IDE favorito
2. Navega a cada clase Java en `src/main/java/com/educacionIT/javase/principal/`
3. Ejecuta el método `main` de cada clase

### Opción 2: Desde la línea de comandos

```bash
# Compilar el proyecto
mvn compile

# Ejecutar cada ejercicio individualmente
cd target/classes
java com.educacionIT.javase.principal.NumeroMayor
java com.educacionIT.javase.principal.OperacionMatematicaConIFAnidados
java com.educacionIT.javase.principal.OperacionMatematicaConSwitch
```

### Opción 3: Ejecutar tests

```bash
# Ejecutar todos los tests
mvn test

# Ejecutar tests con reporte detallado
mvn test -Dtest=AppTest
```

## 📚 Conceptos Aprendidos

### Estructuras de Control
- **If-Else:** Condicionales simples y anidados
- **Switch:** Estructura de selección múltiple
- **Operadores lógicos:** `&&` (AND lógico)

### Tipos de Datos
- **int:** Números enteros
- **float:** Números decimales
- **char:** Caracteres individuales

### Operadores
- **Aritméticos:** `+`, `-`, `*`, `/`
- **Comparación:** `>`, `<`, `==`
- **Lógicos:** `&&`

## 🧪 Testing

El proyecto incluye un test básico en `AppTest.java` que utiliza JUnit 4.11. Para ejecutar las pruebas:

```bash
mvn test
```

---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---


*Este README fue generado para documentar el Laboratorio 02 de Java SE de EducaciónIT.*
