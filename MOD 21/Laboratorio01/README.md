# Laboratorio 01: Introducción a Clases y Objetos

Este laboratorio introduce los conceptos fundamentales de Programación Orientada a Objetos (POO) en Java, comenzando con la creación de clases simples y la manipulación de objetos.

## 🎯 Objetivos

- Comprender la diferencia entre clases y objetos
- Crear una clase simple con atributos y métodos
- Instanciar objetos y manipular sus atributos
- Implementar métodos básicos para mostrar información
- Trabajar con arrays de objetos

## 📋 Descripción del Ejercicio

El laboratorio consiste en crear un sistema para gestionar información de personas, donde cada persona tiene los siguientes atributos:
- Nombre
- Apellido  
- Tipo de documento
- Número de documento
- Edad

## 🏗️ Estructura del Proyecto

```
Laboratorio01/
├── src/main/java/com/educacionIT/javase/principal/
│   ├── App.java                    # Clase principal con lógica de entrada
│   └── Persona.java                # Clase Persona con atributos y métodos
├── src/test/java/com/educacionIT/javase/Laboratorio01/
│   └── AppTest.java               # Pruebas unitarias
├── pom.xml                        # Configuración Maven
└── target/                        # Archivos compilados
```

## 💻 Implementación

### Clase Persona
```java
class Persona {
    // Atributos públicos (sin encapsulación aún)
    String nombre;
    String apellido;
    String tipoDocumento;
    int numeroDocumento;
    byte edad;
    
    // Método para mostrar información
    void mostrarAtributos() {
        String mensaje = "nombre=" + nombre + ", apellido=" + apellido + 
                        ", tipoDocumento=" + tipoDocumento + 
                        ", numeroDocumento=" + numeroDocumento + 
                        ", edad=" + edad + " y es " + 
                        (edad >= 18 ? "mayor de edad" : "menor de edad");
        System.out.println(mensaje);
    }
}
```

### Clase Principal (App)
- Solicita al usuario la cantidad de personas a cargar
- Crea un array de objetos `Persona`
- Permite ingresar datos para cada persona
- Muestra la información de todas las personas cargadas

## 🔍 Conceptos Aplicados

### 1. **Clases y Objetos**
- Definición de una clase con atributos
- Instanciación de objetos usando `new`
- Acceso directo a atributos (sin encapsulación)

### 2. **Arrays de Objetos**
- Declaración: `Persona[] personas`
- Inicialización: `personas = new Persona[cantPersonas]`
- Asignación: `personas[i] = personaAuxiliar`

### 3. **Entrada de Datos**
- Uso de `Scanner` para entrada por consola
- Métodos: `next()`, `nextInt()`, `nextByte()`

### 4. **Métodos Básicos**
- Método `void` que no retorna valor
- Uso de operador ternario para lógica condicional
- Concatenación de strings

### 5. **Bucles y Control de Flujo**
- Bucle `for` para iterar sobre arrays
- Operador ternario: `(condición ? valorVerdadero : valorFalso)`

## 🚀 Cómo Ejecutar

### Prerrequisitos:
- Java JDK 8 o superior
- Maven 3.6 o superior

### Pasos:
1. Navegar al directorio del laboratorio
2. Compilar: `mvn compile`
3. Ejecutar: `mvn exec:java -Dexec.mainClass="com.educacionIT.javase.principal.App"`

### Ejemplo de Ejecución:
```
Ingreso de Datos de Personas Laboratorio 1

Ingrese la cantidad de Personas que cargara: 2
Ingrese el Nombre de la Persona [1]: Juan
Ingrese el Apellido de la Persona [1]: Pérez
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 12345678
Ingrese el Edad de la Persona [1]: 25

Ingrese el Nombre de la Persona [2]: María
Ingrese el Apellido de la Persona [2]: García
Ingrese el Tipo de Documento de la Persona [2]: LC
Ingrese el Numero de Documento de la Persona [2]: 87654321
Ingrese el Edad de la Persona [2]: 17

Datos de las Personas
nombre=Juan, apellido=Pérez, tipoDocumento=DNI, numeroDocumento=12345678, edad=25 y es mayor de edad
nombre=María, apellido=García, tipoDocumento=LC, numeroDocumento=87654321, edad=17 y es menor de edad
```

## 📚 Conceptos Teóricos

### Clases vs Objetos
- **Clase:** Plantilla o molde que define la estructura y comportamiento
- **Objeto:** Instancia específica de una clase con valores concretos

### Atributos
- Variables que almacenan el estado de un objeto
- En este laboratorio se usan atributos públicos (sin encapsulación)

### Métodos
- Funciones que definen el comportamiento de una clase
- Pueden acceder y modificar los atributos de la clase

## ⚠️ Limitaciones de esta Implementación

1. **Sin Encapsulación:** Los atributos son públicos, lo que permite acceso directo
2. **Sin Validación:** No hay validación de datos de entrada
3. **Sin Constructores:** Se usan constructores por defecto
4. **Método con Efecto Secundario:** `mostrarAtributos()` imprime directamente

## 🎓 Puntos de Aprendizaje Clave

1. **Comprensión de POO:** Entender la diferencia entre clases y objetos
2. **Manipulación de Objetos:** Crear, asignar y usar objetos
3. **Arrays de Objetos:** Gestión de colecciones de objetos
4. **Entrada de Datos:** Interacción con el usuario por consola
5. **Métodos Básicos:** Implementación de funcionalidad en clases

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---