# Laboratorio 2: Herencia Básica

Este laboratorio introduce el concepto de **herencia** en Java, mostrando cómo crear jerarquías de clases donde las clases hijas heredan características y comportamientos de las clases padre.

## 🎯 Objetivos

- Comprender el concepto de herencia y la relación "es-un"
- Implementar jerarquías de clases usando `extends`
- Crear constructores en clases hijas usando `super()`
- Aplicar la herencia en el diseño de sistemas de vehículos
- Entender la reutilización de código a través de herencia

## 📋 Descripción del Ejercicio

El laboratorio implementa un sistema de gestión de vehículos que demuestra:
- **Clase padre**: `Auto` como clase base
- **Clases hijas**: `Compacto` y `Camion` que extienden `Auto`
- **Herencia de atributos**: Color, marca, patente, estado de encendido
- **Herencia de métodos**: Métodos compartidos entre todas las clases
- **Atributos específicos**: Características únicas de cada tipo de vehículo

## 🏗️ Estructura del Proyecto

```
Laboratorio 2/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Clase principal con gestión de vehículos
│   └── entidades/
│       ├── Auto.java                  # Clase padre - vehículo base
│       ├── Compacto.java              # Clase hija - auto compacto
│       ├── Camion.java                # Clase hija - camión
│       └── Patente.java               # Clase de composición
├── src/test/java/com/educacionIT/javase/Herencia/
│   └── AppTest.java                   # Pruebas unitarias
├── pom.xml                            # Configuración Maven
└── target/                            # Archivos compilados
```

## 💻 Implementación

### Clase Padre - Auto
```java
package com.educacionIT.javase.entidades;

public class Auto {
    // Atributos compartidos por todos los vehículos
    private String color;
    private String marca;
    private Patente patente;
    private boolean encendido;
    
    // Variable estática compartida por toda la jerarquía
    public static String concesionaria = "Autos EducacionIT";
    
    // Constructor por defecto
    public Auto() {
    }
    
    // Constructor con parámetros
    public Auto(String color, String marca, Patente patente, boolean encendido) {
        this.color = color;
        this.marca = marca;
        this.patente = patente;
        this.encendido = encendido;
    }
    
    // Método compartido por todos los vehículos
    public String mostrarDatos() {
        String mensaje = "El Auto de la concesionaria " + concesionaria + 
                        " es de color " + color + ", marca " + marca +
                        ", patente " + patente + " y se encuentra " + 
                        ((encendido) ? "encendido" : "apagado");
        return mensaje;
    }
    
    // Getters y setters para todos los atributos
    public String getColor() { return color; }
    public void setColor(String color) { this.color = color; }
    
    public String getMarca() { return marca; }
    public void setMarca(String marca) { this.marca = marca; }
    
    public Patente getPatente() { return patente; }
    public void setPatente(Patente patente) { this.patente = patente; }
    
    public boolean isEncendido() { return encendido; }
    public void setEncendido(boolean encendido) { this.encendido = encendido; }
    
    // Método estático para cambiar la concesionaria
    public static void setConcesionaria(String concesionaria) {
        Auto.concesionaria = concesionaria;
    }
}
```

### Clase Hija - Compacto
```java
package com.educacionIT.javase.entidades;

public class Compacto extends Auto {
    // Atributo específico del compacto
    private int puestos;
    
    // Constructor por defecto
    public Compacto() {
        super();  // Llama al constructor de la clase padre
    }
    
    // Constructor con parámetros
    public Compacto(String color, String marca, Patente patente, boolean encendido, int puestos) {
        super(color, marca, patente, encendido);  // Llama al constructor padre
        this.puestos = puestos;  // Inicializa atributo específico
    }
    
    // Getters y setters específicos
    public int getPuestos() {
        return puestos;
    }
    
    public void setPuestos(int puestos) {
        this.puestos = puestos;
    }
}
```

### Clase Hija - Camion
```java
package com.educacionIT.javase.entidades;

public class Camion extends Auto {
    // Atributos específicos del camión
    private int ejes;
    private boolean disponible;
    
    // Constructor por defecto
    public Camion() {
        super();  // Llama al constructor de la clase padre
    }
    
    // Constructor con parámetros
    public Camion(String color, String marca, Patente patente, boolean encendido, int ejes, boolean disponible) {
        super(color, marca, patente, encendido);  // Llama al constructor padre
        this.ejes = ejes;  // Inicializa atributos específicos
        this.disponible = disponible;
    }
    
    // Getters y setters específicos
    public int getEjes() {
        return ejes;
    }
    
    public void setEjes(int ejes) {
        this.ejes = ejes;
    }
    
    public boolean isDisponible() {
        return disponible;
    }
    
    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }
}
```

### Clase Principal (App) - Demostración de Herencia
```java
package com.educacionIT.javase.principal;

import com.educacionIT.javase.entidades.Auto;
import com.educacionIT.javase.entidades.Camion;
import com.educacionIT.javase.entidades.Compacto;
import com.educacionIT.javase.entidades.Patente;

public class App {
    public static void main(String[] args) {
        // Crear objetos usando constructores por defecto
        Auto auto1 = new Auto();
        Camion camion1 = new Camion();
        Compacto compacto1 = new Compacto();
        
        // Crear objetos usando constructores con parámetros
        Auto auto2 = new Auto("Plateado", "Audi", new Patente("ZBG-999", true), true);
        Compacto compacto2 = new Compacto("Azul", "Ford", new Patente("ANZ-963", true), true, 3);
        Camion camion2 = new Camion("Verde", "Mercedes Benz", new Patente("CAM-7896", true), false, 16, true);
        
        // Configurar objetos usando setters
        auto1.setColor("Rojo");
        auto1.setMarca("Ferrari");
        auto1.setPatente(new Patente("ABC-188", true));
        auto1.setEncendido(true);
        
        compacto1.setColor("Azul");
        compacto1.setMarca("Mercedes Benz");
        compacto1.setPatente(new Patente("COM-89655", false));
        compacto1.setPuestos(8);  // Método específico de Compacto
        
        camion1.setColor("Negro");
        camion1.setMarca("Tata");
        camion1.setPatente(new Patente("ARG-32169", false));
        camion1.setEjes(16);  // Método específico de Camion
        camion1.setDisponible(true);
        
        // Mostrar información usando método heredado
        System.out.println(auto1.mostrarDatos());
        System.out.println(auto2.mostrarDatos());
        System.out.println(compacto1.mostrarDatos());
        System.out.println(compacto2.mostrarDatos());
        System.out.println(camion1.mostrarDatos());
        System.out.println(camion2.mostrarDatos());
        
        // Cambiar concesionaria usando método estático
        Auto.setConcesionaria("Autos Argentina S.A");
        
        // Mostrar información actualizada
        System.out.println("\n--- Después del cambio de concesionaria ---");
        System.out.println(auto1.mostrarDatos());
        System.out.println(compacto1.mostrarDatos());
        System.out.println(camion1.mostrarDatos());
    }
}
```

## 🔍 Conceptos Aplicados

### 1. **Herencia con `extends`**
- **`public class Compacto extends Auto`**: Compacto hereda de Auto
- **Relación "es-un"**: Un Compacto ES-UN Auto
- **Reutilización**: Compacto hereda todos los atributos y métodos de Auto
- **Extensión**: Compacto puede agregar sus propios atributos y métodos

### 2. **Constructores en Herencia**
- **`super()`**: Llama al constructor de la clase padre
- **Primera línea**: `super()` debe ser la primera línea en constructores de clase hija
- **Parámetros**: `super(color, marca, patente, encendido)` pasa parámetros al padre
- **Inicialización**: Primero se inicializa el padre, luego la clase hija

### 3. **Herencia de Atributos**
- **Atributos heredados**: `color`, `marca`, `patente`, `encendido`
- **Acceso**: Las clases hijas pueden acceder a atributos protegidos o públicos
- **Encapsulación**: Atributos privados no son accesibles directamente
- **Getters/Setters**: Acceso controlado a través de métodos heredados

### 4. **Herencia de Métodos**
- **Métodos heredados**: `mostrarDatos()`, `getColor()`, `setColor()`, etc.
- **Reutilización**: Todas las clases hijas pueden usar métodos del padre
- **Especialización**: Las clases hijas pueden agregar métodos específicos
- **Polimorfismo**: Preparación para sobrescritura de métodos

### 5. **Variables Estáticas en Herencia**
- **`public static String concesionaria`**: Compartida por toda la jerarquía
- **Acceso**: `Auto.concesionaria` o `Compacto.concesionaria`
- **Modificación**: `Auto.setConcesionaria()` afecta a toda la jerarquía
- **Persistencia**: Mantiene el valor para todos los objetos

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
El Auto de la concesionaria Autos EducacionIT es de color Rojo, marca Ferrari, patente ABC-188 y se encuentra encendido
El Auto de la concesionaria Autos EducacionIT es de color Plateado, marca Audi, patente ZBG-999 y se encuentra encendido
El Auto de la concesionaria Autos EducacionIT es de color Azul, marca Mercedes Benz, patente COM-89655 y se encuentra apagado
El Auto de la concesionaria Autos EducacionIT es de color Azul, marca Ford, patente ANZ-963 y se encuentra encendido
El Auto de la concesionaria Autos EducacionIT es de color Negro, marca Tata, patente ARG-32169 y se encuentra apagado
El Auto de la concesionaria Autos EducacionIT es de color Verde, marca Mercedes Benz, patente CAM-7896 y se encuentra apagado

--- Después del cambio de concesionaria ---
El Auto de la concesionaria Autos Argentina S.A es de color Rojo, marca Ferrari, patente ABC-188 y se encuentra encendido
El Auto de la concesionaria Autos Argentina S.A es de color Azul, marca Mercedes Benz, patente COM-89655 y se encuentra apagado
El Auto de la concesionaria Autos Argentina S.A es de color Negro, marca Tata, patente ARG-32169 y se encuentra apagado
```

## 📚 Conceptos Teóricos

### Herencia
- **Definición**: Mecanismo que permite crear nuevas clases basadas en clases existentes
- **Relación "es-un"**: La clase hija es un tipo especializado de la clase padre
- **Reutilización**: Evita duplicación de código
- **Jerarquía**: Establece relaciones padre-hijo entre clases

### Palabra Clave `extends`
- **Sintaxis**: `public class Hijo extends Padre`
- **Herencia simple**: Java solo permite herencia simple (una clase padre)
- **Jerarquía**: Establece la relación de herencia
- **Acceso**: Permite acceso a miembros protegidos y públicos del padre

### Constructor `super()`
- **Propósito**: Llama al constructor de la clase padre
- **Posición**: Debe ser la primera línea en constructores de clase hija
- **Parámetros**: Puede pasar parámetros al constructor padre
- **Inicialización**: Garantiza la inicialización correcta de la jerarquía

## 🔄 Mejoras Implementadas

### Comparación con Laboratorio 1:

| Aspecto | Laboratorio 1 | Laboratorio 2 |
|---------|---------------|---------------|
| **Estructura** | Una clase principal | Jerarquía de clases |
| **Reutilización** | Limitada | Alta con herencia |
| **Especialización** | No implementada | Clases especializadas |
| **Extensibilidad** | Baja | Alta con herencia |
| **Mantenimiento** | Complejo | Simplificado |

## ⚠️ Consideraciones Importantes

1. **Herencia Simple**: Java solo permite herencia de una clase padre
2. **Constructor Padre**: Siempre se debe llamar al constructor padre
3. **Acceso a Atributos**: Solo atributos protegidos o públicos son accesibles
4. **Diseño**: Usar herencia solo cuando existe relación "es-un"

## 🎓 Puntos de Aprendizaje Clave

1. **Herencia**: Concepto fundamental de POO
2. **Jerarquías**: Diseño de relaciones padre-hijo
3. **Constructores**: Uso de `super()` en herencia
4. **Reutilización**: Aprovechamiento de código existente
5. **Especialización**: Extensión de funcionalidad base

## 💡 Buenas Prácticas Aplicadas

1. **Relación "es-un"**: Herencia solo cuando es apropiada
2. **Constructores**: Llamada correcta a `super()`
3. **Encapsulación**: Uso de getters/setters para acceso controlado
4. **Documentación**: Comentarios explicativos en el código
5. **Diseño**: Separación clara de responsabilidades

## 🔧 Aspectos Técnicos

### Herencia Simple en Java
```java
public class Hijo extends Padre {
    // Solo puede extender de una clase padre
}
```

### Llamada a Constructor Padre
```java
public Hijo(String parametro) {
    super(parametro);  // Primera línea obligatoria
    // Resto del constructor
}
```

### Acceso a Miembros Heredados
```java
// Acceso a método heredado
hijo.metodoHeredado();

// Acceso a atributo heredado (si es protegido o público)
hijo.atributoHeredado = valor;
```

Este laboratorio establece las bases de la herencia, preparando el terreno para conceptos más avanzados como polimorfismo y sobrescritura de métodos en los laboratorios siguientes.

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
