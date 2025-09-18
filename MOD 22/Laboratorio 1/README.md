# Laboratorio 1: Miembros Estáticos y Contadores

Este laboratorio introduce el concepto de **miembros estáticos** en Java, mostrando cómo crear variables y métodos que pertenecen a la clase en lugar de a las instancias individuales.

## 🎯 Objetivos

- Comprender la diferencia entre miembros de instancia y miembros de clase
- Implementar variables estáticas para contadores de objetos
- Crear métodos estáticos para funcionalidad compartida
- Aplicar el concepto de contadores automáticos de instancias
- Entender el ciclo de vida de variables estáticas

## 📋 Descripción del Ejercicio

El laboratorio evoluciona el sistema de gestión de personas del MOD 21, introduciendo:
- **Variables estáticas**: Para contadores y datos compartidos
- **Métodos estáticos**: Para funcionalidad de clase
- **Contador automático**: Asignación automática de IDs únicos
- **Gestión de instancias**: Seguimiento del número de objetos creados

## 🏗️ Estructura del Proyecto

```
Laboratorio 1/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Clase principal con gestión de personas
│   └── entidades/
│       ├── Persona.java               # Entidad Persona con miembros estáticos
│       └── Documento.java             # Entidad Documento
├── src/test/java/com/educacionIT/javase/principal/
│   └── AppTest.java                   # Pruebas unitarias
├── pom.xml                            # Configuración Maven
└── target/                            # Archivos compilados
```

## 💻 Implementación

### Clase Persona (Con Miembros Estáticos)
```java
package com.educacionIT.javase.entidades;

import java.util.Random;

public class Persona {
    // Variable estática - compartida por todas las instancias
    private static int contador = 0;
    
    // Atributos de instancia
    private int id;                    // ID único asignado automáticamente
    private String nombre;
    private String apellido;
    private Documento documento;
    private byte edad;
    
    // Constructor por defecto
    public Persona() {
        contador++;                    // Incrementa contador estático
        id = contador;                 // Asigna ID único
    }
    
    // Constructor con parámetros
    public Persona(String nombre, String apellido, Documento documento) {
        contador++;                    // Incrementa contador estático
        id = contador;                 // Asigna ID único
        this.nombre = nombre;
        this.apellido = apellido;
        this.documento = documento;
        this.edad = asignarEdad();
    }
    
    // Método de instancia
    public String mostrarAtributos() {
        String mensaje = "id=" + id + ", nombre=" + nombre + ", apellido=" + apellido + 
                        ", " + documento.mostrarAtributos() + ", edad=" + edad + " y es " +
                        (mayorEdad() ? "mayor de edad" : "menor de edad");
        return mensaje;
    }
    
    // Método estático - accesible sin crear instancia
    public static int getContador() {
        return contador;
    }
    
    // Getters y setters...
}
```

### Clase Principal (App) - Uso de Miembros Estáticos
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
        
        System.out.println("Ingreso de Datos de Personas Laboratorio01");
        
        System.out.print("Ingrese la cantidad de Personas que cargara: ");
        cantPersonas = teclado.nextInt();
        personas = new Persona[cantPersonas];
        
        // Crear personas con IDs automáticos
        for (int i = 0; i < personas.length; i++) {
            Persona personaAuxiliar = new Persona();
            Documento documento = new Documento();
            
            // Asignar datos usando setters
            System.out.print("Ingrese el Nombre de la Persona [" + (i + 1) + "]: ");
            personaAuxiliar.setNombre(teclado.next());
            
            System.out.print("Ingrese el Apellido de la Persona [" + (i + 1) + "]: ");
            personaAuxiliar.setApellido(teclado.next());
            
            System.out.print("Ingrese el Tipo de Documento de la Persona [" + (i + 1) + "]: ");
            documento.setTipoDocumento(teclado.next());
            
            System.out.print("Ingrese el Numero de Documento de la Persona [" + (i + 1) + "]: ");
            documento.setNumeroDocumento(teclado.nextInt());
            
            personaAuxiliar.setDocumento(documento);
            
            System.out.print("Ingrese la Edad de la Persona [" + (i + 1) + "]: ");
            personaAuxiliar.setEdad(teclado.nextByte());
            
            personas[i] = personaAuxiliar;
        }
        
        // Mostrar datos de todas las personas
        System.out.println("Datos de las Personas");
        for (int i = 0; i < personas.length; i++) {
            System.out.println(personas[i].mostrarAtributos());
        }
        
        // Usar método estático para mostrar contador
        System.out.println("Cantidad de Personas " + Persona.getContador());
        
        teclado.close();
    }
}
```

## 🔍 Conceptos Aplicados

### 1. **Variables Estáticas**
- **`private static int contador`**: Variable compartida por todas las instancias
- **Inicialización**: Se inicializa una sola vez cuando se carga la clase
- **Acceso**: Accesible desde cualquier método de la clase
- **Persistencia**: Mantiene su valor durante toda la ejecución del programa

### 2. **Métodos Estáticos**
- **`public static int getContador()`**: Método accesible sin crear instancia
- **Invocación**: `Persona.getContador()` (no requiere objeto)
- **Restricciones**: No pueden acceder a variables de instancia directamente
- **Utilidad**: Ideales para funciones de clase o utilidades

### 3. **Contadores Automáticos**
- **Incremento**: `contador++` en cada constructor
- **Asignación**: `id = contador` para ID único
- **Thread-safety**: En aplicaciones simples, en aplicaciones concurrentes requiere sincronización
- **Persistencia**: El contador se mantiene entre creaciones de objetos

### 4. **Gestión de Instancias**
- **Seguimiento**: Conocer cuántos objetos se han creado
- **Identificación**: Cada objeto tiene un ID único
- **Control**: Monitoreo del uso de memoria y objetos
- **Debugging**: Facilitar la identificación de objetos en logs

### 5. **Diferencias Clave**
- **Miembros de Instancia**: Cada objeto tiene su propia copia
- **Miembros Estáticos**: Una sola copia compartida por toda la clase
- **Acceso**: Estáticos accesibles sin instancia, de instancia requieren objeto
- **Memoria**: Estáticos en memoria de clase, de instancia en memoria de objeto

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
Ingreso de Datos de Personas Laboratorio01

Ingrese la cantidad de Personas que cargara: 2
Ingrese el Nombre de la Persona [1]: Ana
Ingrese el Apellido de la Persona [1]: García
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 12345678
Ingrese la Edad de la Persona [1]: 25

Ingrese el Nombre de la Persona [2]: Carlos
Ingrese el Apellido de la Persona [2]: López
Ingrese el Tipo de Documento de la Persona [2]: LC
Ingrese el Numero de Documento de la Persona [2]: 87654321
Ingrese la Edad de la Persona [2]: 30

Datos de las Personas
id=1, nombre=Ana, apellido=García, tipoDocumento=DNI, numeroDocumento=12345678, edad=25 y es mayor de edad
id=2, nombre=Carlos, apellido=López, tipoDocumento=LC, numeroDocumento=87654321, edad=30 y es mayor de edad

Cantidad de Personas 2
```

## 📚 Conceptos Teóricos

### Miembros Estáticos
- **Definición**: Variables y métodos que pertenecen a la clase, no a las instancias
- **Memoria**: Se almacenan en la memoria de clase (Method Area)
- **Inicialización**: Se inicializan cuando se carga la clase por primera vez
- **Acceso**: Accesibles sin crear instancias de la clase

### Variables Estáticas
- **Compartidas**: Una sola copia para todas las instancias
- **Persistencia**: Mantienen su valor durante toda la ejecución
- **Inicialización**: Se inicializan con valores por defecto o valores explícitos
- **Thread-safety**: Requieren sincronización en aplicaciones concurrentes

### Métodos Estáticos
- **Utilidades**: Ideales para funciones que no requieren estado de instancia
- **Acceso**: Invocados directamente desde la clase
- **Restricciones**: No pueden acceder a variables de instancia directamente
- **Ejemplos**: `Math.max()`, `System.out.println()`

## 🔄 Mejoras Implementadas

### Comparación con MOD 21:

| Aspecto | MOD 21 | Laboratorio 1 |
|---------|--------|---------------|
| **IDs** | No implementados | Automáticos con contador |
| **Miembros Estáticos** | No utilizados | Contador y método getContador() |
| **Gestión de Instancias** | Manual | Automática con contador |
| **Funcionalidad Compartida** | No disponible | Métodos estáticos |
| **Seguimiento** | No implementado | Contador de objetos creados |

## ⚠️ Consideraciones Importantes

1. **Thread-safety**: En aplicaciones concurrentes, el contador necesita sincronización
2. **Inicialización**: Las variables estáticas se inicializan cuando se carga la clase
3. **Memoria**: Los miembros estáticos permanecen en memoria durante toda la ejecución
4. **Acceso**: Los métodos estáticos no pueden acceder a variables de instancia directamente

## 🎓 Puntos de Aprendizaje Clave

1. **Miembros Estáticos**: Diferencias con miembros de instancia
2. **Contadores**: Implementación de contadores automáticos
3. **Gestión de Memoria**: Comprensión del ciclo de vida de variables estáticas
4. **Diseño de Clases**: Cuándo usar miembros estáticos vs de instancia
5. **Utilidades**: Creación de métodos estáticos para funcionalidad compartida

## 💡 Buenas Prácticas Aplicadas

1. **Contadores Automáticos**: Asignación automática de IDs únicos
2. **Encapsulación**: Variables estáticas privadas con métodos de acceso
3. **Documentación**: Comentarios explicativos en el código
4. **Consistencia**: Uso consistente de miembros estáticos
5. **Simplicidad**: Implementación clara y fácil de entender

## 🔧 Aspectos Técnicos

### Inicialización de Variables Estáticas
```java
private static int contador = 0;  // Inicialización explícita
```

### Uso de Métodos Estáticos
```java
Persona.getContador();  // Acceso directo sin instancia
```

### Contador Thread-Safe (Para Aplicaciones Concurrentes)
```java
private static AtomicInteger contador = new AtomicInteger(0);

public Persona() {
    this.id = contador.incrementAndGet();
}
```

Este laboratorio establece las bases para el uso de miembros estáticos, preparando el terreno para conceptos más avanzados como herencia y polimorfismo en los laboratorios siguientes.

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
