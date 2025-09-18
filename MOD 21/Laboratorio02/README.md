# Laboratorio 02: Constructores y Composición de Objetos

Este laboratorio introduce los conceptos de constructores y composición de objetos, mejorando la estructura del código y la organización de las clases.

## 🎯 Objetivos

- Implementar constructores con parámetros
- Aplicar el concepto de composición (relación "tiene-un")
- Mejorar la modularidad del código
- Separar responsabilidades entre clases
- Implementar métodos que retornan valores

## 📋 Descripción del Ejercicio

El laboratorio evoluciona el sistema de gestión de personas del Laboratorio 01, introduciendo:
- Una clase `Documento` separada para manejar información de documentos
- Constructores con parámetros para inicializar objetos
- Composición: la clase `Persona` contiene un objeto `Documento`
- Métodos que retornan valores en lugar de solo imprimir

## 🏗️ Estructura del Proyecto

```
Laboratorio02/
├── src/main/java/com/educacionIT/javase/principal/
│   ├── App.java                    # Clase principal con lógica mejorada
│   ├── Persona.java               # Clase Persona con constructor y composición
│   └── Documento.java             # Nueva clase Documento
├── src/test/java/com/educacionIT/javase/Laboratorio02/
│   └── AppTest.java               # Pruebas unitarias
├── pom.xml                        # Configuración Maven
└── target/                        # Archivos compilados
```

## 💻 Implementación

### Clase Documento
```java
class Documento {
    String tipoDocumento;
    int numeroDocumento;
    
    // Constructor con parámetros
    Documento(String tipoDocumento, int numeroDocumento) {
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
    }
    
    // Método que retorna información
    String mostrarAtributos() {
        return "tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento;
    }
}
```

### Clase Persona (Mejorada)
```java
class Persona {
    String nombre;
    String apellido;
    Documento documento;  // Composición: Persona tiene un Documento
    byte edad;
    
    // Constructor con parámetros
    Persona(String nombre, String apellido, Documento documento, byte edad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.documento = documento;
        this.edad = edad;
    }
    
    // Método que retorna valor booleano
    boolean mayorEdad() {
        return edad >= 18;
    }
    
    // Método mejorado que retorna string
    String mostrarAtributos() {
        String mensaje = "nombre=" + nombre + ", apellido=" + apellido + 
                        ", " + documento.mostrarAtributos() + 
                        ", edad=" + edad + " y es " + 
                        (mayorEdad() ? "mayor de edad" : "menor de edad");
        return mensaje;
    }
}
```

## 🔍 Conceptos Aplicados

### 1. **Constructores con Parámetros**
- Inicialización de objetos con valores específicos
- Uso de `this` para referenciar atributos de la clase
- Asignación de parámetros a atributos

### 2. **Composición de Objetos**
- Relación "tiene-un": Persona tiene un Documento
- Creación de objetos anidados
- Delegación de responsabilidades

### 3. **Métodos con Retorno**
- Métodos que retornan valores (`String`, `boolean`)
- Separación de lógica de presentación
- Reutilización de métodos

### 4. **Modularidad**
- Separación de responsabilidades
- Clases más pequeñas y enfocadas
- Mejor organización del código

### 5. **Uso de Variables Locales**
- Variables temporales para mejorar legibilidad
- Reutilización de objetos creados

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
Ingreso de Datos de Personas Laboratorio 2

Ingrese la cantidad de Personas que cargara: 2
Ingrese el Nombre de la Persona [1]: Carlos
Ingrese el Apellido de la Persona [1]: López
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 11223344
Ingrese el Edad de la Persona [1]: 30

Ingrese el Nombre de la Persona [2]: Ana
Ingrese el Apellido de la Persona [2]: Martínez
Ingrese el Tipo de Documento de la Persona [2]: LC
Ingrese el Numero de Documento de la Persona [2]: 99887766
Ingrese el Edad de la Persona [2]: 16

Datos de las Personas
nombre=Carlos, apellido=López, tipoDocumento=DNI, numeroDocumento=11223344, edad=30 y es mayor de edad
nombre=Ana, apellido=Martínez, tipoDocumento=LC, numeroDocumento=99887766, edad=16 y es menor de edad
```

## 📚 Conceptos Teóricos

### Constructores
- **Propósito:** Inicializar objetos con valores específicos
- **Sintaxis:** `public Clase(parametros) { ... }`
- **Uso de `this`:** Referencia al objeto actual

### Composición
- **Definición:** Relación donde una clase contiene otra como parte de su estado
- **Ventajas:** 
  - Mejor organización del código
  - Reutilización de clases
  - Separación de responsabilidades

### Métodos con Retorno
- **Ventajas:** 
  - Flexibilidad en el uso del resultado
  - Separación de lógica y presentación
  - Reutilización de código

## 🔄 Mejoras Implementadas

### Comparación con Laboratorio 01:

| Aspecto | Laboratorio 01 | Laboratorio 02 |
|---------|----------------|----------------|
| **Constructores** | Por defecto | Con parámetros |
| **Estructura** | Una sola clase | Dos clases (composición) |
| **Métodos** | `void` (solo imprimen) | Retornan valores |
| **Organización** | Todo en Persona | Responsabilidades separadas |
| **Reutilización** | Limitada | Mayor modularidad |

## ⚠️ Limitaciones Actuales

1. **Sin Encapsulación:** Atributos aún son públicos
2. **Sin Validación:** No hay validación de datos de entrada
3. **Sin Paquetes:** Todas las clases están en el mismo paquete
4. **Sin Getters/Setters:** Acceso directo a atributos

## 🎓 Puntos de Aprendizaje Clave

1. **Constructores:** Inicialización adecuada de objetos
2. **Composición:** Relaciones entre objetos
3. **Modularidad:** Separación de responsabilidades
4. **Métodos con Retorno:** Flexibilidad en el diseño
5. **Organización:** Mejor estructura del código

## 💡 Buenas Prácticas Aplicadas

1. **Separación de Responsabilidades:** Cada clase tiene una función específica
2. **Constructores con Parámetros:** Inicialización explícita de objetos
3. **Métodos con Retorno:** Flexibilidad en el uso de resultados
4. **Composición:** Relaciones naturales entre objetos
5. **Código Limpio:** Mejor legibilidad y mantenibilidad


## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---