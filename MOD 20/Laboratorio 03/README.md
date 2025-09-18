# Laboratorio 03 - Java SE

Este proyecto contiene ejercicios prácticos de Java SE que demuestran el uso de estructuras de control de flujo, entrada de datos por consola y manejo de bucles.

## 📋 Descripción del Proyecto

El Laboratorio 03 incluye tres programas principales que implementan diferentes escenarios de programación:

1. **AdivinarNumero**: Un juego de adivinanza de números
2. **CredencialesFor**: Sistema de autenticación usando bucle `for`
3. **CredencialesWhile**: Sistema de autenticación usando bucle `while`

## 🚀 Características

- **Programación orientada a objetos** con Java SE
- **Manejo de entrada de datos** usando `Scanner`
- **Generación de números aleatorios** con la clase `Random`
- **Estructuras de control de flujo** (if-else, do-while, for, while)
- **Validación de credenciales** con límite de intentos
- **Interfaz de consola** interactiva

## 🛠️ Tecnologías Utilizadas

- **Java SE 7**
- **Maven** (gestión de dependencias)
- **JUnit 4.11** (testing)

## 📁 Estructura del Proyecto

```
Laboratorio03/
├── pom.xml                                    # Configuración de Maven
├── src/
│   ├── main/java/com/educacionIT/javase/principal/
│   │   ├── AdivinarNumero.java               # Juego de adivinanza
│   │   ├── CredencialesFor.java             # Autenticación con for
│   │   └── CredencialesWhile.java           # Autenticación con while
│   └── test/java/com/educacionIT/javase/principal/
│       └── AppTest.java                      # Pruebas unitarias
└── target/                                   # Archivos compilados
```

## 🎮 Programas Incluidos

### 1. AdivinarNumero
**Descripción**: Juego interactivo donde el usuario debe adivinar un número aleatorio entre 1 y 10.

**Características**:
- Genera un número aleatorio usando `Random`
- Proporciona pistas ("mayor" o "menor")
- Continúa hasta que el usuario adivine correctamente
- Usa bucle `do-while` para garantizar al menos un intento

**Ejecución**:
```bash
java com.educacionIT.javase.principal.AdivinarNumero
```

### 2. CredencialesFor
**Descripción**: Sistema de autenticación que permite máximo 3 intentos usando bucle `for`.

**Credenciales**:
- Usuario: `Administrador` (case insensitive)
- Contraseña: `admin1234`

**Características**:
- Límite de 3 intentos
- Mensajes informativos
- Bloqueo del usuario después de agotar intentos
- Usa bucle `for` para control de intentos

**Ejecución**:
```bash
java com.educacionIT.javase.principal.CredencialesFor
```

### 3. CredencialesWhile
**Descripción**: Sistema de autenticación equivalente al anterior pero implementado con bucle `while`.

**Características**:
- Misma funcionalidad que `CredencialesFor`
- Implementación alternativa usando `while`
- Contador manual de intentos
- Demuestra diferentes enfoques para el mismo problema

**Ejecución**:
```bash
java com.educacionIT.javase.principal.CredencialesWhile
```

## 🔧 Requisitos del Sistema

- **Java Development Kit (JDK) 7** o superior
- **Maven 3.x** (opcional, para gestión de dependencias)
- **IDE** compatible con Java (Eclipse, IntelliJ IDEA, VS Code, etc.)

## 📦 Instalación y Compilación

### Opción 1: Compilación Manual
```bash
# Navegar al directorio del proyecto
cd Laboratorio03

# Compilar todos los archivos Java
javac -d target/classes src/main/java/com/educacionIT/javase/principal/*.java

# Ejecutar un programa específico
java -cp target/classes com.educacionIT.javase.principal.AdivinarNumero
```

### Opción 2: Usando Maven
```bash
# Compilar el proyecto
mvn compile

# Ejecutar las pruebas
mvn test

# Ejecutar un programa específico
mvn exec:java -Dexec.mainClass="com.educacionIT.javase.principal.AdivinarNumero"
```

## 🧪 Ejecución de Pruebas

```bash
# Ejecutar todas las pruebas
mvn test

# Ejecutar pruebas específicas
mvn test -Dtest=AppTest
```

## 📚 Conceptos de Programación Demostrados

- **Entrada de datos**: Uso de `Scanner` para lectura de consola
- **Generación de números aleatorios**: Clase `Random` y método `nextInt()`
- **Estructuras condicionales**: `if-else` para lógica de decisión
- **Bucles de control**:
  - `do-while`: Para garantizar al menos una ejecución
  - `for`: Para iteración controlada con contador
  - `while`: Para iteración basada en condición
- **Comparación de strings**: `equals()` y `equalsIgnoreCase()`
- **Manejo de recursos**: Cierre de `Scanner` con `close()`

## 🎯 Objetivos de Aprendizaje

1. **Familiarización** con estructuras de control de flujo en Java
2. **Práctica** en el manejo de entrada de datos por consola
3. **Comprensión** de diferentes tipos de bucles y sus casos de uso
4. **Implementación** de lógica de validación y autenticación
5. **Desarrollo** de interfaces de usuario básicas en consola

---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---

## 🔗 Enlaces Útiles

- [Documentación oficial de Java](https://docs.oracle.com/javase/)
- [Tutorial de Maven](https://maven.apache.org/guides/getting-started/)
- [Guía de JUnit](https://junit.org/junit4/)

---

*Proyecto desarrollado como parte del módulo de Java SE - Laboratorio 03*
