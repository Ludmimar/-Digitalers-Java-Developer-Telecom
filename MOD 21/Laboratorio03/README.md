# Laboratorio 03: Encapsulación y Organización en Paquetes

Este laboratorio introduce los conceptos de encapsulación y organización de código en paquetes, aplicando modificadores de acceso y mejorando la estructura del proyecto.

## 🎯 Objetivos

- Implementar encapsulación usando modificadores de acceso (`public`, `private`)
- Organizar el código en paquetes lógicos
- Separar entidades del código principal
- Implementar métodos públicos para acceso controlado
- Aplicar el principio de ocultación de información

## 📋 Descripción del Ejercicio

El laboratorio evoluciona el sistema de gestión de personas, introduciendo:
- **Encapsulación:** Atributos privados con métodos públicos de acceso
- **Organización en Paquetes:** Separación entre entidades y lógica principal
- **Modificadores de Acceso:** Control de visibilidad de clases y métodos
- **Generación Automática:** Uso de `Random` para asignar edades automáticamente

## 🏗️ Estructura del Proyecto

```
Laboratorio03/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Clase principal con lógica de entrada
│   └── entidades/
│       ├── Persona.java               # Entidad Persona con encapsulación
│       └── Documento.java             # Entidad Documento con encapsulación
├── src/test/java/com/educacionIT/javase/Laboratorio03/
│   └── AppTest.java                   # Pruebas unitarias
├── pom.xml                            # Configuración Maven
└── target/                            # Archivos compilados
```

## 💻 Implementación

### Clase Documento (Encapsulada)
```java
package com.educacionIT.javase.entidades;

public class Documento {
    String tipoDocumento;        // Package-private (sin modificador)
    int numeroDocumento;         // Package-private (sin modificador)
    
    // Constructor público
    public Documento(String tipoDocumento, int numeroDocumento) {
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
    }
    
    // Método público para mostrar información
    public String mostrarAtributos() {
        return "tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento;
    }
}
```

### Clase Persona (Encapsulada)
```java
package com.educacionIT.javase.entidades;

import java.util.Random;

public class Persona {
    // Atributos con diferentes niveles de acceso
    public String nombre;        // Público
    public String apellido;      // Público
    public Documento documento;  // Público
    private byte edad;           // Privado - encapsulado
    
    // Constructor público
    public Persona(String nombre, String apellido, Documento documento) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.documento = documento;
        this.edad = asignarEdad();  // Asignación automática
    }
    
    // Método público para verificar mayoría de edad
    public boolean mayorEdad() {
        return edad >= 18;
    }
    
    // Método público para mostrar información
    public String mostrarAtributos() {
        String mensaje = "nombre=" + nombre + ", apellido=" + apellido + 
                        ", " + documento.mostrarAtributos() + 
                        ", edad=" + edad + " y es " + 
                        (mayorEdad() ? "mayor de edad" : "menor de edad");
        return mensaje;
    }
    
    // Método privado para asignar edad aleatoria
    public byte asignarEdad() {
        Random nuevaEdad = new Random();
        return (byte) nuevaEdad.nextInt(127);  // Casting explícito
    }
}
```

### Clase Principal (App)
```java
package com.educacionIT.javase.principal;

import java.util.Scanner;
import com.educacionIT.javase.entidades.Documento;
import com.educacionIT.javase.entidades.Persona;

public class App {
    public static void main(String[] args) {
        // Lógica simplificada - no se solicita edad al usuario
        // La edad se asigna automáticamente usando Random
    }
}
```

## 🔍 Conceptos Aplicados

### 1. **Encapsulación**
- **Atributos Privados:** `private byte edad` - solo accesible desde la misma clase
- **Atributos Públicos:** `public String nombre` - accesible desde cualquier clase
- **Atributos Package-Private:** Sin modificador - accesible desde el mismo paquete

### 2. **Organización en Paquetes**
- **Paquete `entidades`:** Contiene las clases de dominio (Persona, Documento)
- **Paquete `principal`:** Contiene la lógica de aplicación (App)
- **Importaciones:** Uso de `import` para acceder a clases de otros paquetes

### 3. **Modificadores de Acceso**
- **`public`:** Accesible desde cualquier lugar
- **`private`:** Solo accesible desde la misma clase
- **Sin modificador:** Accesible desde el mismo paquete (package-private)

### 4. **Generación Automática de Datos**
- **Clase Random:** Generación de números aleatorios
- **Casting:** Conversión de `int` a `byte`
- **Método Privado:** `asignarEdad()` encapsula la lógica de generación

### 5. **Separación de Responsabilidades**
- **Entidades:** Representan el dominio del problema
- **Principal:** Maneja la lógica de aplicación
- **Importaciones:** Facilitan el acceso entre paquetes

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
Ingreso de Datos de Personas Laboratorio 3

Ingrese la cantidad de Personas que cargara: 2
Ingrese el Nombre de la Persona [1]: Roberto
Ingrese el Apellido de la Persona [1]: Silva
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 55667788

Ingrese el Nombre de la Persona [2]: Laura
Ingrese el Apellido de la Persona [2]: Fernández
Ingrese el Tipo de Documento de la Persona [2]: LC
Ingrese el Numero de Documento de la Persona [2]: 33445566

Datos de las Personas
nombre=Roberto, apellido=Silva, tipoDocumento=DNI, numeroDocumento=55667788, edad=45 y es mayor de edad
nombre=Laura, apellido=Fernández, tipoDocumento=LC, numeroDocumento=33445566, edad=12 y es menor de edad
```

## 📚 Conceptos Teóricos

### Encapsulación
- **Definición:** Principio de ocultar la implementación interna de una clase
- **Beneficios:**
  - Control de acceso a datos
  - Validación de datos
  - Flexibilidad en la implementación
  - Reducción de acoplamiento

### Modificadores de Acceso
- **`public`:** Acceso desde cualquier lugar
- **`private`:** Acceso solo desde la misma clase
- **`protected`:** Acceso desde la misma clase y subclases
- **Package-private:** Acceso desde el mismo paquete

### Paquetes
- **Propósito:** Organizar clases relacionadas
- **Convención:** Nombres en minúsculas con puntos
- **Estructura:** Refleja la estructura de directorios

## 🔄 Mejoras Implementadas

### Comparación con Laboratorio 02:

| Aspecto | Laboratorio 02 | Laboratorio 03 |
|---------|----------------|----------------|
| **Encapsulación** | Atributos públicos | Mezcla de públicos/privados |
| **Organización** | Un solo paquete | Múltiples paquetes |
| **Edad** | Ingresada por usuario | Generada automáticamente |
| **Importaciones** | No necesarias | Requeridas entre paquetes |
| **Estructura** | Clases juntas | Separación por responsabilidad |

## ⚠️ Limitaciones Actuales

1. **Encapsulación Incompleta:** Algunos atributos aún son públicos
2. **Sin Getters/Setters:** No hay métodos de acceso controlado
3. **Sin Validación:** No hay validación de datos
4. **Edad Aleatoria:** No hay control sobre la edad generada


## 🎓 Puntos de Aprendizaje Clave

1. **Encapsulación:** Control de acceso a datos
2. **Paquetes:** Organización del código
3. **Modificadores de Acceso:** Control de visibilidad
4. **Importaciones:** Acceso entre paquetes
5. **Separación de Responsabilidades:** Organización lógica del código

## 💡 Buenas Prácticas Aplicadas

1. **Organización en Paquetes:** Separación lógica de clases
2. **Encapsulación Parcial:** Control de acceso a datos sensibles
3. **Importaciones Explícitas:** Claridad en las dependencias
4. **Separación de Responsabilidades:** Entidades vs lógica de aplicación
5. **Generación Automática:** Simplificación de entrada de datos

## 🔧 Aspectos Técnicos

### Casting en Java
```java
return (byte) nuevaEdad.nextInt(127);
```
- **Propósito:** Convertir `int` a `byte`
- **Riesgo:** Pérdida de datos si el valor excede el rango de `byte`
- **Rango de byte:** -128 a 127

### Clase Random
```java
Random nuevaEdad = new Random();
return (byte) nuevaEdad.nextInt(127);
```
- **Método `nextInt(127)`:** Genera números de 0 a 126
- **Casting:** Convierte a `byte` para el atributo `edad`


## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
