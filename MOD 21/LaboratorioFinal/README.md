# Laboratorio Final: Encapsulación Completa y Buenas Prácticas

Este laboratorio representa la culminación de los conceptos fundamentales de POO, implementando encapsulación completa con getters/setters y aplicando las mejores prácticas de programación orientada a objetos.

## 🎯 Objetivos

- Implementar encapsulación completa con getters/setters
- Aplicar el principio de ocultación de información
- Demostrar el uso correcto de modificadores de acceso
- Implementar constructores por defecto y con parámetros
- Aplicar buenas prácticas de diseño de clases

## 📋 Descripción del Ejercicio

El laboratorio final integra todos los conceptos aprendidos:
- **Encapsulación Completa:** Todos los atributos son privados
- **Getters/Setters:** Métodos de acceso controlado
- **Constructores Múltiples:** Por defecto y con parámetros
- **Organización en Paquetes:** Separación clara de responsabilidades
- **Acceso Controlado:** Uso de métodos para manipular datos

## 🏗️ Estructura del Proyecto

```
LaboratorioFinal/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Clase principal con lógica completa
│   └── entidades/
│       ├── Persona.java               # Entidad Persona con encapsulación completa
│       └── Documento.java             # Entidad Documento con encapsulación completa
├── src/test/java/com/educacionIT/javase/LaboratorioFinal/
│   └── AppTest.java                   # Pruebas unitarias
├── pom.xml                            # Configuración Maven
└── target/                            # Archivos compilados
```

## 💻 Implementación

### Clase Documento (Encapsulación Completa)
```java
package com.educacionIT.javase.entidades;

public class Documento {
    private String tipoDocumento;      // Privado
    private int numeroDocumento;       // Privado
    
    // Constructor por defecto
    public Documento() {
    }
    
    // Constructor con parámetros
    public Documento(String tipoDocumento, int numeroDocumento) {
        this.tipoDocumento = tipoDocumento;
        this.numeroDocumento = numeroDocumento;
    }
    
    // Getter para tipoDocumento
    public String getTipoDocumento() {
        return tipoDocumento;
    }
    
    // Setter para tipoDocumento
    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }
    
    // Getter para numeroDocumento
    public int getNumeroDocumento() {
        return numeroDocumento;
    }
    
    // Setter para numeroDocumento
    public void setNumeroDocumento(int numeroDocumento) {
        this.numeroDocumento = numeroDocumento;
    }
    
    // Método para mostrar información
    public String mostrarAtributos() {
        return "tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento;
    }
}
```

### Clase Persona (Encapsulación Completa)
```java
package com.educacionIT.javase.entidades;

import java.util.Random;

public class Persona {
    // Todos los atributos son privados
    private String nombre;
    private String apellido;
    private Documento documento;
    private byte edad;
    
    // Constructor por defecto
    public Persona() {
    }
    
    // Constructor con parámetros
    public Persona(String nombre, String apellido, Documento documento) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.documento = documento;
        this.edad = asignarEdad();
    }
    
    // Getters y Setters para todos los atributos
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getApellido() {
        return apellido;
    }
    
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    
    public Documento getDocumento() {
        return documento;
    }
    
    public void setDocumento(Documento documento) {
        this.documento = documento;
    }
    
    public byte getEdad() {
        return edad;
    }
    
    public void setEdad(byte edad) {
        this.edad = edad;
    }
    
    // Métodos de negocio
    public boolean mayorEdad() {
        return edad >= 18;
    }
    
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
        return (byte) nuevaEdad.nextInt(127);
    }
}
```

### Clase Principal (App) - Uso de Getters/Setters
```java
package com.educacionIT.javase.principal;

import java.util.Scanner;
import com.educacionIT.javase.entidades.Documento;
import com.educacionIT.javase.entidades.Persona;

public class App {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        Persona[] personas;
        int cantPersonas;
        
        System.out.println("Ingreso de Datos de Personas Laboratorio Final");
        
        System.out.print("Ingrese la cantidad de Personas que cargara: ");
        cantPersonas = teclado.nextInt();
        personas = new Persona[cantPersonas];
        
        for (int i = 0; i < personas.length; i++) {
            // Crear objetos usando constructores por defecto
            Persona personaAuxiliar = new Persona();
            Documento documento = new Documento();
            
            // Usar setters para asignar valores
            System.out.print("Ingrese el Nombre de la Persona [" + (i + 1) + "]: ");
            personaAuxiliar.setNombre(teclado.next());
            
            System.out.print("Ingrese el Apellido de la Persona [" + (i + 1) + "]: ");
            personaAuxiliar.setApellido(teclado.next());
            
            System.out.print("Ingrese el Tipo de Documento de la Persona [" + (i + 1) + "]: ");
            documento.setTipoDocumento(teclado.next());
            
            System.out.print("Ingrese el Numero de Documento de la Persona [" + (i + 1) + "]: ");
            documento.setNumeroDocumento(teclado.nextInt());
            
            // Asignar documento a persona
            personaAuxiliar.setDocumento(documento);
            
            System.out.print("Ingrese la Edad de la Persona [" + (i + 1) + "]: ");
            personaAuxiliar.setEdad(teclado.nextByte());
            
            personas[i] = personaAuxiliar;
        }
        
        // Mostrar datos usando getters
        System.out.println("Datos de las Personas");
        for (int i = 0; i < personas.length; i++) {
            String atributosPersona = "nombre=" + personas[i].getNombre() + 
                                    ", apellido=" + personas[i].getApellido() +
                                    ", tipoDocumento=" + personas[i].getDocumento().getTipoDocumento() + 
                                    ", numeroDocumento=" + personas[i].getDocumento().getNumeroDocumento() + 
                                    ", edad=" + personas[i].getEdad() + " y es " +
                                    (personas[i].mayorEdad() ? "mayor de edad" : "menor de edad");
            System.out.println(atributosPersona);
        }
        
        teclado.close();
    }
}
```

## 🔍 Conceptos Aplicados

### 1. **Encapsulación Completa**
- **Atributos Privados:** Todos los atributos son `private`
- **Acceso Controlado:** Solo a través de getters/setters
- **Ocultación de Información:** Implementación interna no visible

### 2. **Getters y Setters**
- **Getters:** Métodos para obtener valores (`getNombre()`)
- **Setters:** Métodos para asignar valores (`setNombre()`)
- **Convención:** `get` + nombre del atributo (capitalizado)

### 3. **Constructores Múltiples**
- **Constructor por Defecto:** `public Persona()`
- **Constructor con Parámetros:** `public Persona(String nombre, ...)`
- **Flexibilidad:** Diferentes formas de crear objetos

### 4. **Acceso Controlado a Datos**
- **No Acceso Directo:** `persona.nombre` no es posible
- **Acceso Mediado:** `persona.getNombre()` y `persona.setNombre()`
- **Control de Estado:** Validación posible en setters

### 5. **Separación de Responsabilidades**
- **Entidades:** Representan el dominio
- **Principal:** Maneja la lógica de aplicación
- **Encapsulación:** Cada clase controla su estado

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
Ingreso de Datos de Personas Laboratorio Final

Ingrese la cantidad de Personas que cargara: 2
Ingrese el Nombre de la Persona [1]: Diego
Ingrese el Apellido de la Persona [1]: Rodríguez
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 12345678
Ingrese la Edad de la Persona [1]: 28

Ingrese el Nombre de la Persona [2]: Carmen
Ingrese el Apellido de la Persona [2]: Morales
Ingrese el Tipo de Documento de la Persona [2]: LC
Ingrese el Numero de Documento de la Persona [2]: 87654321
Ingrese la Edad de la Persona [2]: 15

Datos de las Personas
nombre=Diego, apellido=Rodríguez, tipoDocumento=DNI, numeroDocumento=12345678, edad=28 y es mayor de edad
nombre=Carmen, apellido=Morales, tipoDocumento=LC, numeroDocumento=87654321, edad=15 y es menor de edad
```

## 📚 Conceptos Teóricos

### Encapsulación Completa
- **Definición:** Ocultación total de la implementación interna
- **Beneficios:**
  - Control total del acceso a datos
  - Validación de datos en setters
  - Flexibilidad en la implementación
  - Mantenibilidad del código

### Getters y Setters
- **Getter:** Método que retorna el valor de un atributo
- **Setter:** Método que asigna un valor a un atributo
- **Convención JavaBean:** `get`/`set` + nombre del atributo

### Constructores Múltiples
- **Sobrecarga:** Múltiples constructores con diferentes parámetros
- **Flexibilidad:** Diferentes formas de inicializar objetos
- **Constructor por Defecto:** Sin parámetros

## 🔄 Evolución Completa

### Comparación con Laboratorios Anteriores:

| Aspecto | Lab 01 | Lab 02 | Lab 03 | Lab Final |
|---------|--------|--------|--------|-----------|
| **Encapsulación** | Ninguna | Parcial | Parcial | Completa |
| **Constructores** | Por defecto | Con parámetros | Con parámetros | Múltiples |
| **Acceso a Datos** | Directo | Directo | Mixto | Mediado |
| **Organización** | Una clase | Dos clases | Paquetes | Paquetes + Encapsulación |
| **Getters/Setters** | No | No | No | Sí |

## ✅ Buenas Prácticas Implementadas

### 1. **Encapsulación Completa**
- Todos los atributos son privados
- Acceso solo a través de métodos públicos
- Control total del estado interno

### 2. **Convenciones JavaBean**
- Getters: `get` + nombre del atributo
- Setters: `set` + nombre del atributo
- Constructores por defecto disponibles

### 3. **Separación de Responsabilidades**
- Entidades en paquete `entidades`
- Lógica de aplicación en paquete `principal`
- Importaciones explícitas

### 4. **Flexibilidad en la Creación**
- Constructores múltiples
- Inicialización flexible de objetos
- Uso de constructores por defecto

### 5. **Acceso Controlado**
- No acceso directo a atributos
- Validación posible en setters
- Control de estado interno

## 🎓 Puntos de Aprendizaje Clave

1. **Encapsulación Completa:** Control total del acceso a datos
2. **Getters/Setters:** Métodos de acceso controlado
3. **Constructores Múltiples:** Flexibilidad en la creación
4. **Buenas Prácticas:** Convenciones estándar de Java
5. **Diseño de Clases:** Principios de POO aplicados

## 💡 Ventajas de la Implementación Final

### 1. **Mantenibilidad**
- Cambios internos no afectan código externo
- Validación centralizada en setters
- Código más robusto y confiable

### 2. **Flexibilidad**
- Múltiples formas de crear objetos
- Validación personalizable en setters
- Extensibilidad futura

### 3. **Estándares**
- Cumple convenciones JavaBean
- Compatible con frameworks Java
- Código profesional y estándar

### 4. **Seguridad**
- Control de acceso a datos
- Validación de entrada
- Estado consistente de objetos

## 🔧 Aspectos Técnicos Avanzados

### Uso de Getters/Setters en la Clase Principal
```java
// En lugar de acceso directo:
// persona.nombre = teclado.next();

// Se usa acceso mediado:
persona.setNombre(teclado.next());
```

### Acceso a Objetos Anidados
```java
// Acceso a documento a través de persona:
personas[i].getDocumento().getTipoDocumento()
```

### Constructores por Defecto
```java
// Permite crear objetos vacíos para llenar después:
Persona persona = new Persona();
Documento documento = new Documento();
```

Este laboratorio final demuestra la aplicación completa de los principios fundamentales de POO en Java, preparando al estudiante para el desarrollo de aplicaciones más complejas y profesionales.


## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---