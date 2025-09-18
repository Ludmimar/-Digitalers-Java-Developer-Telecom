# Laboratorio 3: Herencia Avanzada y Polimorfismo

Este laboratorio profundiza en los conceptos de **herencia avanzada** y **polimorfismo**, mostrando cómo crear jerarquías complejas de clases y aprovechar el comportamiento polimórfico para crear código flexible y extensible.

## 🎯 Objetivos

- Implementar jerarquías complejas de herencia
- Aplicar el concepto de polimorfismo en tiempo de ejecución
- Crear clases abstractas y métodos abstractos
- Implementar sobrescritura de métodos con `@Override`
- Demostrar el uso de referencias polimórficas

## 📋 Descripción del Ejercicio

El laboratorio implementa un sistema de gestión de personal educativo que demuestra:
- **Jerarquía compleja**: `Persona` → `Empleado` → `Profesor`/`Administrativo`/`Director`
- **Clases abstractas**: `Empleado` como clase abstracta
- **Polimorfismo**: Uso de referencias de clase padre para objetos hijos
- **Sobrescritura**: Implementación de métodos específicos en cada clase
- **Métodos abstractos**: Definición de comportamiento que debe ser implementado

## 🏗️ Estructura del Proyecto

```
Laboratorio 3/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Clase principal con gestión de personal
│   └── entidades/
│       ├── Persona.java               # Clase base del sistema
│       ├── Empleado.java              # Clase abstracta padre
│       ├── Profesor.java              # Clase hija concreta
│       ├── Administrativo.java        # Clase hija concreta
│       ├── Director.java              # Clase hija concreta
│       ├── Alumno.java                # Clase hija directa de Persona
│       └── Documento.java             # Clase de composición
├── src/test/java/com/educacionIT/javase/Laboratorio01/
│   └── AppTest.java                   # Pruebas unitarias
├── pom.xml                            # Configuración Maven
└── target/                            # Archivos compilados
```

## 💻 Implementación

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

### Clase Concreta - Profesor
```java
package com.educacionIT.javase.entidades;

import java.util.Arrays;
import java.util.Date;

public class Profesor extends Empleado {
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
    
    // Getters y setters...
}
```

### Clase Concreta - Alumno
```java
package com.educacionIT.javase.entidades;

import java.util.Arrays;
import java.util.Date;

public class Alumno extends Persona {
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
    
    // Getters y setters...
}
```

### Clase Principal (App) - Demostración de Polimorfismo
```java
package com.educacionIT.javase.principal;

import java.util.Date;
import com.educacionIT.javase.entidades.*;

public class App {
    public static void main(String[] args) {
        // Crear objetos de diferentes tipos
        Persona persona1 = new Persona("Juan", "Pérez", new Documento("DNI", "12345678"), new Date());
        
        Profesor profesor1 = new Profesor("María", "García", new Documento("DNI", "87654321"), 
                                        new Date(), new Date(), 50000.0f, 
                                        new String[]{"Java", "Python", "C++"});
        
        Alumno alumno1 = new Alumno("Carlos", "López", new Documento("DNI", "11223344"), 
                                   new Date(), new String[]{"Matemáticas", "Física", "Química"});
        
        // Demostración de polimorfismo
        Persona[] personas = {persona1, profesor1, alumno1};
        
        System.out.println("=== Demostración de Polimorfismo ===");
        for (Persona persona : personas) {
            // El método llamado depende del tipo real del objeto (enlace dinámico)
            System.out.println(persona.mostrarTipoPersona());
            System.out.println(persona.toString());
            System.out.println("---");
        }
        
        // Acceso específico a métodos de clases hijas
        System.out.println("=== Métodos Específicos ===");
        System.out.println(profesor1.mostrarCursos());
        System.out.println(alumno1.mostrarCursosInscriptos());
        
        // Demostración de casting
        System.out.println("=== Demostración de Casting ===");
        if (profesor1 instanceof Empleado) {
            Empleado empleado = (Empleado) profesor1;
            System.out.println("El profesor es un empleado:");
            System.out.println(empleado.mostrarDatosEmpleado());
        }
        
        if (alumno1 instanceof Alumno) {
            Alumno alumno = (Alumno) alumno1;
            System.out.println("Información del alumno:");
            System.out.println(alumno.mostrarCursosInscriptos());
        }
    }
}
```

## 🔍 Conceptos Aplicados

### 1. **Clases Abstractas**
- **`public abstract class Empleado`**: Clase que no puede ser instanciada directamente
- **Métodos abstractos**: `public abstract String mostrarTipoPersona()`
- **Implementación obligatoria**: Las clases hijas deben implementar métodos abstractos
- **Métodos concretos**: Pueden tener métodos implementados que las hijas pueden usar

### 2. **Polimorfismo**
- **Referencias polimórficas**: `Persona[] personas = {persona1, profesor1, alumno1}`
- **Enlace dinámico**: El método llamado depende del tipo real del objeto
- **Flexibilidad**: Una referencia puede apuntar a diferentes tipos de objetos
- **Extensibilidad**: Fácil agregar nuevos tipos sin modificar código existente

### 3. **Sobrescritura de Métodos**
- **`@Override`**: Anotación que indica sobrescritura de método
- **Método `toString()`**: Sobrescrito en todas las clases para mostrar información específica
- **Método `mostrarTipoPersona()`**: Implementado específicamente en cada clase
- **Comportamiento específico**: Cada clase define su propio comportamiento

### 4. **Jerarquías Complejas**
- **Múltiples niveles**: `Persona` → `Empleado` → `Profesor`
- **Herencia múltiple**: `Persona` → `Alumno` (herencia directa)
- **Especialización**: Cada nivel agrega características específicas
- **Reutilización**: Código compartido en toda la jerarquía

### 5. **Casting y Verificación de Tipos**
- **`instanceof`**: Verificación de tipo antes del casting
- **Casting explícito**: `(Empleado) profesor1`
- **Seguridad**: Verificación para evitar `ClassCastException`
- **Acceso específico**: Uso de métodos específicos de clases hijas

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
=== Demostración de Polimorfismo ===
Juan Pérez es una Persona
Persona [id=0, nombre=Juan, apellido=Pérez, documento=DNI: 12345678, fechaNacimiento=...]
---
María García es Profesor
Profesor [toString()=Empleado [toString()=Persona [id=0, nombre=María, apellido=García, ...], fechaCargo=..., sueldo=50000.0], cursos=[Java, Python, C++]]
---
Carlos López es Alumno
Alumno [toString()=Persona [id=0, nombre=Carlos, apellido=López, ...], cursos=[Matemáticas, Física, Química]]
---

=== Métodos Específicos ===
Cursos que dicta: [Java, Python, C++]
Cursos inscriptos: [Matemáticas, Física, Química]

=== Demostración de Casting ===
El profesor es un empleado:
Empleado desde: ..., Sueldo: $50000.0
Información del alumno:
Cursos inscriptos: [Matemáticas, Física, Química]
```

## 📚 Conceptos Teóricos

### Clases Abstractas
- **Definición**: Clases que no pueden ser instanciadas directamente
- **Propósito**: Proporcionar una estructura base para clases hijas
- **Métodos abstractos**: Deben ser implementados por las clases hijas
- **Métodos concretos**: Pueden tener implementación que las hijas heredan

### Polimorfismo
- **Definición**: Capacidad de un objeto de tomar diferentes formas
- **Tiempo de ejecución**: Resolución de métodos en tiempo de ejecución
- **Enlace dinámico**: El método llamado depende del tipo real del objeto
- **Flexibilidad**: Permite código más flexible y extensible

### Sobrescritura de Métodos
- **`@Override`**: Anotación que indica sobrescritura
- **Firma**: Debe mantener la misma firma que el método padre
- **Comportamiento**: Implementa comportamiento específico de la clase hija
- **Acceso**: No puede reducir la visibilidad del método padre

## 🔄 Mejoras Implementadas

### Comparación con Laboratorio 2:

| Aspecto | Laboratorio 2 | Laboratorio 3 |
|---------|---------------|---------------|
| **Herencia** | Simple (2 niveles) | Compleja (3+ niveles) |
| **Clases Abstractas** | No implementadas | Empleado abstracto |
| **Polimorfismo** | Básico | Avanzado con arrays |
| **Sobrescritura** | Limitada | Completa con @Override |
| **Flexibilidad** | Media | Alta con polimorfismo |

## ⚠️ Consideraciones Importantes

1. **Clases Abstractas**: No se pueden instanciar directamente
2. **Métodos Abstractos**: Deben ser implementados por todas las clases hijas
3. **Polimorfismo**: El método llamado depende del tipo real del objeto
4. **Casting**: Siempre verificar con `instanceof` antes de hacer casting

## 🎓 Puntos de Aprendizaje Clave

1. **Clases Abstractas**: Diseño de estructuras base no instanciables
2. **Polimorfismo**: Comportamiento flexible basado en tipo real
3. **Sobrescritura**: Implementación específica de métodos heredados
4. **Jerarquías**: Diseño de relaciones complejas entre clases
5. **Casting**: Acceso seguro a métodos específicos de clases hijas

## 💡 Buenas Prácticas Aplicadas

1. **Anotación @Override**: Indicación clara de sobrescritura
2. **Verificación de tipos**: Uso de `instanceof` antes del casting
3. **Diseño abstracto**: Clases abstractas para estructuras base
4. **Polimorfismo**: Uso de referencias de clase padre
5. **Documentación**: Comentarios explicativos en el código

## 🔧 Aspectos Técnicos

### Clase Abstracta
```java
public abstract class Empleado {
    public abstract String mostrarTipoPersona();  // Método abstracto
    public String mostrarDatosEmpleado() { ... }  // Método concreto
}
```

### Polimorfismo
```java
Persona[] personas = {persona1, profesor1, alumno1};
for (Persona persona : personas) {
    persona.mostrarTipoPersona();  // Enlace dinámico
}
```

### Casting Seguro
```java
if (objeto instanceof ClaseHija) {
    ClaseHija hija = (ClaseHija) objeto;
    hija.metodoEspecifico();
}
```

Este laboratorio establece las bases avanzadas de la herencia y polimorfismo, preparando el terreno para el uso de interfaces en el laboratorio siguiente.

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
