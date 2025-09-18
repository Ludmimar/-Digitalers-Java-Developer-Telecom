# Desafíos de Programación Java - Módulo 20

Este repositorio contiene dos desafíos de programación en Java desarrollados como parte del Módulo 20 del curso de Educación IT.

## 📋 Descripción General

Los desafíos implementan algoritmos clásicos de programación utilizando Java con Maven como herramienta de construcción.

## 🚀 Desafíos Incluidos

### Desafío 1: FizzBuzz con Números Aleatorios
**Ubicación:** `Desafío 1/`

**Descripción:** Implementación del clásico algoritmo FizzBuzz aplicado a un conjunto de números aleatorios generados dinámicamente.

**Funcionalidades:**
- Genera un arreglo de números aleatorios según la cantidad especificada por el usuario
- Aplica las reglas de FizzBuzz:
  - Si el número es divisible por 3: muestra "Fizz"
  - Si el número es divisible por 5: muestra "Buzz"
  - Si el número es divisible por ambos: muestra "FizzBuzz"
  - Si no cumple ninguna condición: muestra el número original

**Ejemplo de uso:**
```
Indique la cantidad de numeros aleatorios a generar: 10
[5, 2, 8, 1, 9, 3, 7, 4, 6, 10]
Buzz
2
8
1
Fizz
Fizz
7
4
Fizz
Buzz
```

### Desafío 2: Multiplicación sin Operador *
**Ubicación:** `Desafío 2/`

**Descripción:** Implementación de una multiplicación utilizando únicamente sumas repetidas, sin usar el operador de multiplicación (*).

**Funcionalidades:**
- Permite multiplicar números enteros largos (long)
- Maneja números positivos y negativos correctamente
- Aplica la ley de signos para determinar el resultado final
- Optimiza el proceso usando valores absolutos para evitar cálculos innecesarios

**Ejemplo de uso:**
```
Indique el numero a multiplicar: 5
Indique por cuanto multiplicar: 3
El resultado es: 15
```

## 🛠️ Tecnologías Utilizadas

- **Java 8** - Lenguaje de programación
- **Maven** - Herramienta de construcción y gestión de dependencias
- **JUnit 4.11** - Framework de testing (configurado pero no utilizado en estos desafíos)

## 📁 Estructura del Proyecto

```
Desafío/
├── Desafío 1/
│   ├── pom.xml
│   ├── src/
│   │   ├── main/java/com/educacionit/desafio01/
│   │   │   └── App.java
│   │   └── test/java/
│   └── target/
├── Desafío 2/
│   ├── pom.xml
│   ├── src/
│   │   ├── main/java/com/educacionit/desafio02/
│   │   │   └── App.java
│   │   └── test/java/
│   └── target/
└── Desafío.pdf
```

## 🚀 Cómo Ejecutar

### Prerrequisitos
- Java 8 o superior instalado
- Maven instalado

### Compilación y Ejecución

#### Desafío 1:
```bash
cd "Desafío 1"
mvn compile
mvn exec:java -Dexec.mainClass="com.educacionit.desafio01.App"
```

#### Desafío 2:
```bash
cd "Desafío 2"
mvn compile
mvn exec:java -Dexec.mainClass="com.educacionit.desafio02.App"
```

### Alternativa con java directamente:
```bash
# Desafío 1
cd "Desafío 1"
mvn compile
java -cp target/classes com.educacionit.desafio01.App

# Desafío 2
cd "Desafío 2"
mvn compile
java -cp target/classes com.educacionit.desafio02.App
```

## 🧪 Testing

Ambos proyectos están configurados con JUnit 4.11 para testing, aunque en esta implementación inicial no se incluyen casos de prueba.

Para ejecutar los tests (cuando estén disponibles):
```bash
mvn test
```

## 📝 Características Técnicas

### Desafío 1:
- Uso de `Scanner` para entrada de usuario
- Generación de números aleatorios con `Math.random()`
- Manipulación de arreglos
- Lógica condicional para FizzBuzz
- Uso de `Arrays.toString()` para mostrar arreglos

### Desafío 2:
- Manejo de tipos de datos `long` para números grandes
- Uso de `Math.abs()` para valores absolutos
- Implementación de multiplicación mediante sumas repetidas
- Aplicación de la ley de signos en matemáticas
- Optimización evitando cálculos innecesarios

---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---
Este proyecto es parte de un curso educativo y está destinado únicamente para fines de aprendizaje.
