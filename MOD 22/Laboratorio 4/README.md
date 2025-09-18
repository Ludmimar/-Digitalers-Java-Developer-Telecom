# Laboratorio 4: Interfaces y Clases Abstractas

Este laboratorio introduce el concepto de **interfaces** en Java, mostrando cómo crear contratos que las clases deben cumplir y cómo implementar múltiples interfaces para lograr mayor flexibilidad en el diseño.

## 🎯 Objetivos

- Comprender el concepto de interfaces y su propósito
- Implementar interfaces usando `implements`
- Crear clases que implementen múltiples interfaces
- Diferenciar entre interfaces y clases abstractas
- Aplicar interfaces para definir contratos de comportamiento

## 📋 Descripción del Ejercicio

El laboratorio implementa un sistema de persistencia que demuestra:
- **Interfaces**: `Persistencia` como contrato de comportamiento
- **Implementación múltiple**: Clases que implementan interfaces
- **Contratos**: Definición de métodos que deben ser implementados
- **Flexibilidad**: Uso de interfaces para código más flexible
- **Polimorfismo**: Uso de referencias de interfaz

## 🏗️ Estructura del Proyecto

```
Laboratorio 4/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Clase principal con gestión de persistencia
│   ├── entidades/
│   │   ├── Persona.java               # Clase base del sistema
│   │   ├── Empleado.java              # Clase abstracta padre
│   │   ├── Profesor.java              # Clase hija concreta
│   │   ├── Administrativo.java        # Clase hija concreta
│   │   ├── Director.java              # Clase hija concreta
│   │   ├── Alumno.java                # Clase hija directa de Persona
│   │   └── Documento.java             # Clase de composición
│   └── interfaces/
│       └── Persistencia.java          # Interfaz de persistencia
├── src/test/java/com/educacionIT/javase/Laboratorio02/
│   └── AppTest.java                   # Pruebas unitarias
├── pom.xml                            # Configuración Maven
└── target/                            # Archivos compilados
```

## 💻 Implementación

### Interfaz - Persistencia
```java
package com.educacionIT.javase.interfaces;

public interface Persistencia {
    
    // Métodos que deben ser implementados por las clases que implementen esta interfaz
    void guardar();
    
    void eliminar();
    
    void modificar();
}
```

### Clase Base - Persona
```java
package com.educacionIT.javase.entidades;

import java.util.Date;

public class Persona {
    private int id;
    private String nombre;
    private String apellido;
    private Documento documento;
    private Date fechaNacimiento;
    
    // Constructor por defecto
    public Persona() {
    }
    
    // Constructor con parámetros
    public Persona(String nombre, String apellido, Documento documento, Date fechaNacimiento) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.documento = documento;
        this.fechaNacimiento = fechaNacimiento;
    }
    
    // Método que puede ser sobrescrito por las clases hijas
    public String mostrarTipoPersona() {
        return getNombre() + " " + getApellido() + " es una Persona";
    }
    
    // Método toString sobrescrito
    @Override
    public String toString() {
        return "Persona [id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + 
               ", documento=" + documento + ", fechaNacimiento=" + fechaNacimiento + "]";
    }
    
    // Getters y setters...
}
```

### Clase Abstracta - Empleado
```java
package com.educacionIT.javase.entidades;

import java.util.Date;

public abstract class Empleado extends Persona {
    private Date fechaCargo;
    private Float sueldo;
    
    // Constructor por defecto
    public Empleado() {
        super();
    }
    
    // Constructor con parámetros
    public Empleado(String nombre, String apellido, Documento documento, Date fechaNacimiento, 
                    Date fechaCargo, Float sueldo) {
        super(nombre, apellido, documento, fechaNacimiento);
        this.fechaCargo = fechaCargo;
        this.sueldo = sueldo;
    }
    
    // Método abstracto que debe ser implementado por las clases hijas
    public abstract String mostrarTipoPersona();
    
    // Método concreto que puede ser usado por todas las clases hijas
    public String mostrarDatosEmpleado() {
        return "Empleado desde: " + fechaCargo + ", Sueldo: $" + sueldo;
    }
    
    // Sobrescritura del método toString
    @Override
    public String toString() {
        return "Empleado [toString()=" + super.toString() + ", fechaCargo=" + fechaCargo + 
               ", sueldo=" + sueldo + "]";
    }
    
    // Getters y setters...
}
```

### Clase Concreta - Alumno (Implementa Persistencia)
```java
package com.educacionIT.javase.entidades;

import java.util.Arrays;
import java.util.Date;
import com.educacionIT.javase.interfaces.Persistencia;

public class Alumno extends Persona implements Persistencia {
    private String[] cursos;
    
    // Constructor por defecto
    public Alumno() {
        super();
    }
    
    // Constructor con parámetros
    public Alumno(String nombre, String apellido, Documento documento, Date fechaNacimiento, String[] cursos) {
        super(nombre, apellido, documento, fechaNacimiento);
        this.cursos = cursos;
    }
    
    // Sobrescritura del método de la clase padre
    @Override
    public String mostrarTipoPersona() {
        return getNombre() + " " + getApellido() + " es Alumno";
    }
    
    // Sobrescritura del método toString
    @Override
    public String toString() {
        return "Alumno [toString()=" + super.toString() + ", cursos=" + Arrays.toString(cursos) + "]";
    }
    
    // Método específico del alumno
    public String mostrarCursosInscriptos() {
        return "Cursos inscriptos: " + Arrays.toString(cursos);
    }
    
    // Implementación de métodos de la interfaz Persistencia
    @Override
    public void guardar() {
        System.out.println("Se ha guardado correctamente el Alumno");
    }
    
    @Override
    public void eliminar() {
        System.out.println("Se ha eliminado correctamente el Alumno");
    }
    
    @Override
    public void modificar() {
        System.out.println("Se ha modificado correctamente el Alumno");
    }
    
    // Getters y setters...
}
```

### Clase Concreta - Profesor (Implementa Persistencia)
```java
package com.educacionIT.javase.entidades;

import java.util.Arrays;
import java.util.Date;
import com.educacionIT.javase.interfaces.Persistencia;

public class Profesor extends Empleado implements Persistencia {
    private String[] cursos;
    
    // Constructor por defecto
    public Profesor() {
        super();
    }
    
    // Constructor con parámetros
    public Profesor(String nombre, String apellido, Documento documento, Date fechaNacimiento,
                    Date fechaCargo, Float sueldo, String[] cursos) {
        super(nombre, apellido, documento, fechaNacimiento, fechaCargo, sueldo);
        this.cursos = cursos;
    }
    
    // Implementación del método abstracto
    @Override
    public String mostrarTipoPersona() {
        return getNombre() + " " + getApellido() + " es Profesor";
    }
    
    // Sobrescritura del método toString
    @Override
    public String toString() {
        return "Profesor [toString()=" + super.toString() + ", cursos=" + Arrays.toString(cursos) + "]";
    }
    
    // Método específico del profesor
    public String mostrarCursos() {
        return "Cursos que dicta: " + Arrays.toString(cursos);
    }
    
    // Implementación de métodos de la interfaz Persistencia
    @Override
    public void guardar() {
        System.out.println("Se ha guardado correctamente el Profesor");
    }
    
    @Override
    public void eliminar() {
        System.out.println("Se ha eliminado correctamente el Profesor");
    }
    
    @Override
    public void modificar() {
        System.out.println("Se ha modificado correctamente el Profesor");
    }
    
    // Getters y setters...
}
```

### Clase Principal (App) - Demostración de Interfaces
```java
package com.educacionIT.javase.principal;

import java.util.Date;
import com.educacionIT.javase.entidades.*;
import com.educacionIT.javase.interfaces.Persistencia;

public class App {
    public static void main(String[] args) {
        // Crear objetos que implementan la interfaz Persistencia
        Alumno alumno1 = new Alumno("Carlos", "López", new Documento("DNI", "11223344"), 
                                   new Date(), new String[]{"Matemáticas", "Física", "Química"});
        
        Profesor profesor1 = new Profesor("María", "García", new Documento("DNI", "87654321"), 
                                        new Date(), new Date(), 50000.0f, 
                                        new String[]{"Java", "Python", "C++"});
        
        // Demostración de polimorfismo con interfaces
        Persistencia[] objetosPersistencia = {alumno1, profesor1};
        
        System.out.println("=== Demostración de Interfaces ===");
        for (Persistencia objeto : objetosPersistencia) {
            // Los métodos llamados dependen del tipo real del objeto
            objeto.guardar();
            objeto.modificar();
            objeto.eliminar();
            System.out.println("---");
        }
        
        // Acceso específico a métodos de clases concretas
        System.out.println("=== Métodos Específicos ===");
        System.out.println(alumno1.mostrarCursosInscriptos());
        System.out.println(profesor1.mostrarCursos());
        
        // Demostración de casting con interfaces
        System.out.println("=== Demostración de Casting ===");
        if (alumno1 instanceof Persistencia) {
            Persistencia persistencia = (Persistencia) alumno1;
            System.out.println("El alumno implementa Persistencia:");
            persistencia.guardar();
        }
        
        if (profesor1 instanceof Persistencia) {
            Persistencia persistencia = (Persistencia) profesor1;
            System.out.println("El profesor implementa Persistencia:");
            persistencia.modificar();
        }
        
        // Demostración de métodos de clase padre
        System.out.println("=== Métodos de Clase Padre ===");
        System.out.println(alumno1.mostrarTipoPersona());
        System.out.println(profesor1.mostrarTipoPersona());
        System.out.println(profesor1.mostrarDatosEmpleado());
    }
}
```

## 🔍 Conceptos Aplicados

### 1. **Interfaces**
- **`public interface Persistencia`**: Define un contrato que las clases deben cumplir
- **Métodos abstractos**: `void guardar()`, `void eliminar()`, `void modificar()`
- **Implementación obligatoria**: Las clases que implementan la interfaz deben implementar todos sus métodos
- **Contrato**: Define qué métodos debe tener una clase, no cómo implementarlos

### 2. **Implementación de Interfaces**
- **`implements Persistencia`**: Indica que la clase implementa la interfaz
- **Múltiples interfaces**: Una clase puede implementar varias interfaces
- **Implementación obligatoria**: Todos los métodos de la interfaz deben ser implementados
- **Flexibilidad**: Permite que diferentes clases implementen el mismo contrato

### 3. **Polimorfismo con Interfaces**
- **Referencias de interfaz**: `Persistencia[] objetosPersistencia`
- **Enlace dinámico**: El método llamado depende del tipo real del objeto
- **Flexibilidad**: Una referencia de interfaz puede apuntar a cualquier objeto que la implemente
- **Extensibilidad**: Fácil agregar nuevas implementaciones sin modificar código existente

### 4. **Diferencias con Clases Abstractas**
- **Interfaces**: Solo definen contratos, no pueden tener implementación
- **Clases Abstractas**: Pueden tener métodos concretos y abstractos
- **Herencia**: Interfaces permiten implementación múltiple
- **Propósito**: Interfaces para contratos, clases abstractas para estructuras base

### 5. **Casting con Interfaces**
- **`instanceof`**: Verificación de tipo antes del casting
- **Casting explícito**: `(Persistencia) objeto`
- **Acceso a métodos**: Uso de métodos definidos en la interfaz
- **Seguridad**: Verificación para evitar `ClassCastException`

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
=== Demostración de Interfaces ===
Se ha guardado correctamente el Alumno
Se ha modificado correctamente el Alumno
Se ha eliminado correctamente el Alumno
---
Se ha guardado correctamente el Profesor
Se ha modificado correctamente el Profesor
Se ha eliminado correctamente el Profesor
---

=== Métodos Específicos ===
Cursos inscriptos: [Matemáticas, Física, Química]
Cursos que dicta: [Java, Python, C++]

=== Demostración de Casting ===
El alumno implementa Persistencia:
Se ha guardado correctamente el Alumno
El profesor implementa Persistencia:
Se ha modificado correctamente el Profesor

=== Métodos de Clase Padre ===
Carlos López es Alumno
María García es Profesor
Empleado desde: ..., Sueldo: $50000.0
```

## 📚 Conceptos Teóricos

### Interfaces
- **Definición**: Contratos que definen qué métodos debe implementar una clase
- **Propósito**: Establecer comportamientos comunes entre clases no relacionadas
- **Implementación múltiple**: Una clase puede implementar varias interfaces
- **Flexibilidad**: Permite código más flexible y extensible

### Implementación de Interfaces
- **`implements`**: Palabra clave para implementar interfaces
- **Múltiples interfaces**: `implements Interfaz1, Interfaz2`
- **Implementación obligatoria**: Todos los métodos deben ser implementados
- **Sobrescritura**: Los métodos implementados pueden ser sobrescritos

### Polimorfismo con Interfaces
- **Referencias de interfaz**: Pueden apuntar a cualquier objeto que implemente la interfaz
- **Enlace dinámico**: El método llamado depende del tipo real del objeto
- **Flexibilidad**: Permite tratar objetos diferentes de manera uniforme
- **Extensibilidad**: Fácil agregar nuevas implementaciones

## 🔄 Mejoras Implementadas

### Comparación con Laboratorio 3:

| Aspecto | Laboratorio 3 | Laboratorio 4 |
|---------|---------------|---------------|
| **Interfaces** | No implementadas | Persistencia implementada |
| **Contratos** | Solo herencia | Contratos de interfaz |
| **Flexibilidad** | Limitada | Alta con interfaces |
| **Implementación múltiple** | No disponible | Múltiples interfaces |
| **Extensibilidad** | Media | Alta con contratos |

## ⚠️ Consideraciones Importantes

1. **Implementación obligatoria**: Todos los métodos de la interfaz deben ser implementados
2. **Múltiples interfaces**: Una clase puede implementar varias interfaces
3. **Polimorfismo**: El método llamado depende del tipo real del objeto
4. **Diseño**: Usar interfaces para definir contratos de comportamiento

## 🎓 Puntos de Aprendizaje Clave

1. **Interfaces**: Contratos que las clases deben cumplir
2. **Implementación múltiple**: Una clase puede implementar varias interfaces
3. **Polimorfismo**: Comportamiento flexible basado en interfaces
4. **Contratos**: Definición de comportamientos esperados
5. **Flexibilidad**: Diseño extensible con interfaces

## 💡 Buenas Prácticas Aplicadas

1. **Contratos claros**: Interfaces bien definidas con métodos específicos
2. **Implementación completa**: Todos los métodos de la interfaz implementados
3. **Polimorfismo**: Uso de referencias de interfaz para flexibilidad
4. **Verificación de tipos**: Uso de `instanceof` antes del casting
5. **Documentación**: Comentarios explicativos en el código

## 🔧 Aspectos Técnicos

### Definición de Interfaz
```java
public interface Persistencia {
    void guardar();
    void eliminar();
    void modificar();
}
```

### Implementación de Interfaz
```java
public class Alumno extends Persona implements Persistencia {
    @Override
    public void guardar() { ... }
    @Override
    public void eliminar() { ... }
    @Override
    public void modificar() { ... }
}
```

### Polimorfismo con Interfaces
```java
Persistencia[] objetos = {alumno1, profesor1};
for (Persistencia objeto : objetos) {
    objeto.guardar();  // Enlace dinámico
}
```

### Implementación Múltiple
```java
public class Clase implements Interfaz1, Interfaz2, Interfaz3 {
    // Implementa todos los métodos de las tres interfaces
}
```

Este laboratorio completa la introducción a los conceptos avanzados de POO, estableciendo las bases para el desarrollo de aplicaciones complejas y el uso de frameworks modernos de Java.

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
