# Laboratorio 02: Excepciones Propias y Validación Avanzada

Este laboratorio profundiza en el manejo de excepciones, introduciendo la creación de **excepciones personalizadas** y técnicas avanzadas de validación de datos con manejo robusto de errores.

## 🎯 Objetivos

- Crear excepciones personalizadas heredando de `Exception`
- Implementar sistemas de códigos de error para identificación
- Aplicar validación avanzada con excepciones propias
- Usar interfaces para constantes y validaciones
- Implementar mensajes de error personalizados y informativos

## 📋 Descripción del Ejercicio

El laboratorio evoluciona el sistema de gestión de personal educativo, introduciendo:
- **Excepciones propias**: `ExcepcionPersona` con códigos de error específicos
- **Validación avanzada**: Verificación de tipos de documento válidos
- **Interfaces de constantes**: `Constantes` para valores válidos
- **Sistema de códigos**: Identificación de errores específicos
- **Mensajes personalizados**: Información detallada sobre errores

## 🏗️ Estructura del Proyecto

```
Laboratorio 02/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Clase principal con excepciones propias
│   ├── entidades/
│   │   ├── Persona.java               # Clase base del sistema
│   │   ├── Empleado.java              # Clase abstracta padre
│   │   ├── Profesor.java              # Clase hija concreta
│   │   ├── Administrativo.java        # Clase hija concreta
│   │   ├── Director.java              # Clase hija concreta
│   │   ├── Alumno.java                # Clase hija directa de Persona
│   │   └── Documento.java             # Clase de composición
│   ├── excepciones/
│   │   └── ExcepcionPersona.java      # Excepción personalizada
│   └── interfaces/
│       ├── Constantes.java            # Interface con constantes
│       └── Persistencia.java         # Interfaz de persistencia
├── src/test/java/com/educacionIT/javase/Laboratorio02/
│   └── AppTest.java                   # Pruebas unitarias
├── pom.xml                            # Configuración Maven
└── target/                            # Archivos compilados
```

## 💻 Implementación

### Excepción Personalizada - ExcepcionPersona
```java
package com.educacionIT.javase.excepciones;

import java.util.Arrays;
import com.educacionIT.javase.interfaces.Constantes;

public class ExcepcionPersona extends Exception {
    private static final long serialVersionUID = 1L;
    private Integer codigo;

    // Constructor con código de error
    public ExcepcionPersona(Integer codigo) {
        super();
        this.codigo = codigo;
    }

    // Constructor con mensaje personalizado
    public ExcepcionPersona(String message) {
        super(message);
    }

    // Sobrescritura del método getMessage para mensajes personalizados
    @Override
    public String getMessage() {
        switch (codigo) {
            case 1:
                return "Los Documentos válidos son: " + Arrays.toString(Constantes.tipoDocumento);
            default:
                return super.getMessage();
        }
    }
}
```

### Interface de Constantes - Constantes
```java
package com.educacionIT.javase.interfaces;

public interface Constantes {
    // Array de tipos de documento válidos
    String[] tipoDocumento = { "DNI", "PAS", "LE", "CI" };
}
```

### Clase Principal (App) - Validación Avanzada
```java
package com.educacionIT.javase.principal;

import java.util.Date;
import java.util.Scanner;
import com.educacionIT.javase.entidades.*;
import com.educacionIT.javase.excepciones.ExcepcionPersona;
import com.educacionIT.javase.interfaces.Constantes;

public class App {
    private static Scanner teclado = new Scanner(System.in);

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        Persona[] personas;

        System.out.println("Ingreso de Datos de Personas Laboratorio02");
        
        System.out.print("Ingrese la cantidad de Personas que cargara: ");
        int cantidadPersonas = teclado.nextInt();
        personas = new Persona[cantidadPersonas];

        for (int i = 0; i < personas.length; i++) {
            String nombre, apellido, tipo, carrera;
            Integer numero;
            Date fechaNacimiento, fechaCargo;
            int cantidadCursos;
            Float sueldo;

            System.out.println("Ingreso tipo de Persona:");
            System.out.println("1 - Alumno.");
            System.out.println("2 - Director.");
            System.out.println("3 - Profesor.");
            System.out.println("4 - Administrativo.");
            
            int tipoPersona = teclado.nextInt();
            Persona persona = null;

            // Entrada de datos comunes
            System.out.print("Ingrese el Nombre de la Persona [" + (i + 1) + "]: ");
            nombre = teclado.next();
            
            System.out.print("Ingrese el Apellido de la Persona [" + (i + 1) + "]: ");
            apellido = teclado.next();

            // Validación avanzada del tipo de documento
            while (true) {
                System.out.print("Ingrese el Tipo de Documento de la Persona [" + (i + 1) + "]: ");
                tipo = teclado.next();
                try {
                    boolean documentoCorrecto = false;
                    // Verificar si el tipo de documento está en la lista de válidos
                    for (int j = 0; j < Constantes.tipoDocumento.length; j++) {
                        if (tipo.equalsIgnoreCase(Constantes.tipoDocumento[j])) {
                            documentoCorrecto = true;
                            break;
                        }
                    }
                    if (!documentoCorrecto)
                        throw new ExcepcionPersona(1); // Lanzar excepción personalizada
                    else
                        break;
                } catch (Exception e) {
                    System.out.println(e.getMessage()); // Mostrar mensaje personalizado
                }
            }
            
            System.out.print("Ingrese el Numero de Documento de la Persona [" + (i + 1) + "]: ");
            numero = teclado.nextInt();
            
            System.out.println("Ingrese la Fecha de Nacimiento de la Persona [" + (i + 1) + "]: ");
            fechaNacimiento = obtenerFecha();

            // Creación de objetos según tipo (igual que Laboratorio 01)
            switch (tipoPersona) {
                case 1: // Alumno
                    System.out.print("Ingrese la cantidad de cursos de la Persona [" + (i + 1) + "]: ");
                    cantidadCursos = teclado.nextInt();
                    persona = new Alumno(nombre, apellido, new Documento(tipo, numero), 
                                       fechaNacimiento, agregarCursos(cantidadCursos));
                    break;
                    
                case 2: // Director
                    System.out.println("Ingrese la Fecha de inicio del Cargo de la Persona [" + (i + 1) + "]: ");
                    fechaCargo = obtenerFecha();
                    System.out.println("Ingrese la Carrera encargada de la Persona [" + (i + 1) + "]: ");
                    carrera = teclado.next();
                    System.out.print("Ingrese el Sueldo de la Persona [" + (i + 1) + "]: ");
                    sueldo = teclado.nextFloat();
                    persona = new Director(nombre, apellido, new Documento(tipo, numero), 
                                         fechaNacimiento, fechaCargo, sueldo, carrera);
                    break;
                    
                case 3: // Profesor
                    System.out.println("Ingrese la Fecha de inicio del Cargo de la Persona [" + (i + 1) + "]: ");
                    fechaCargo = obtenerFecha();
                    System.out.print("Ingrese el Sueldo de la Persona [" + (i + 1) + "]: ");
                    sueldo = teclado.nextFloat();
                    System.out.print("Ingrese la cantidad de cursos de la Persona [" + (i + 1) + "]: ");
                    cantidadCursos = teclado.nextInt();
                    persona = new Profesor(nombre, apellido, new Documento(tipo, numero), 
                                         fechaNacimiento, fechaCargo, sueldo, 
                                         agregarCursos(cantidadCursos));
                    break;
                    
                case 4: // Administrativo
                    System.out.println("Ingrese la Fecha de inicio del Cargo de la Persona [" + (i + 1) + "]: ");
                    fechaCargo = obtenerFecha();
                    System.out.print("Ingrese el Sueldo de la Persona [" + (i + 1) + "]: ");
                    sueldo = teclado.nextFloat();
                    persona = new Administrativo(nombre, apellido, new Documento(tipo, numero), 
                                               fechaNacimiento, fechaCargo, sueldo);
                    break;
            }

            personas[i] = persona;
        }

        // Mostrar información usando foreach
        for (Persona persona : personas) {
            System.out.println(persona);
            System.out.println(persona.mostrarTipoPersona());
        }

        teclado.close();
    }

    // Método para obtener fecha con validación robusta (igual que Laboratorio 01)
    private static Date obtenerFecha() {
        int anio = 0, mes = 0, dia = 0;
        
        // Validación del año
        while (true) {
            try {
                System.out.print("Ingrese el año: ");
                anio = teclado.nextInt();
                break;
            } catch (Exception e) {
                System.err.println("Debe ingresar un dato válido: " + e.getMessage());
            }
        }

        // Validación del mes
        while (true) {
            try {
                System.out.print("Ingrese el mes en número, ej: 1 que indica enero, 12 que indica diciembre: ");
                mes = teclado.nextInt();
                if (mes < 1 || mes > 12) {
                    throw new Exception("Los meses deben estar comprendidos entre 1 y 12");
                }
                break;
            } catch (Exception e) {
                System.err.println("Debe ingresar un dato válido: " + e.getMessage());
            }
        }

        // Validación del día
        while (true) {
            try {
                System.out.print("Ingrese el día: ");
                dia = teclado.nextInt();
                if (dia < 1) {
                    throw new Exception("Los días deben ser un número positivo");
                } else {
                    if (mes == 2) {
                        if (dia > 28) {
                            throw new Exception("El mes 2 posee un máximo de 28 días");
                        }
                    } else if ((dia > 30) && (mes == 4 || mes == 6 || mes == 9 || mes == 11)) {
                        throw new Exception("Los días para estos meses debe estar comprendidos entre 1 y 30");
                    } else if (dia > 31) {
                        throw new Exception("Los días para estos meses debe estar comprendidos entre 1 y 31");
                    }
                }
                break;
            } catch (Exception e) {
                System.err.println("Debe ingresar un dato válido: " + e.getMessage());
            }
        }

        return new Date(anio - 1900, mes - 1, dia);
    }

    // Método para agregar cursos
    private static String[] agregarCursos(int cantidad) {
        String[] cursos = new String[cantidad];
        for (int i = 0; i < cursos.length; i++) {
            System.out.print("Ingrese el curso [" + (i + 1) + "] : ");
            cursos[i] = teclado.next();
        }
        return cursos;
    }
}
```

## 🔍 Conceptos Aplicados

### 1. **Excepciones Propias**
- **Herencia**: `ExcepcionPersona extends Exception`
- **Constructores**: Múltiples constructores para diferentes casos
- **Códigos de error**: Sistema de identificación numérica
- **Mensajes personalizados**: Información específica según el código

### 2. **Sistema de Códigos de Error**
- **Identificación**: Códigos numéricos para diferentes tipos de error
- **Switch**: Estructura para manejar diferentes códigos
- **Mensajes específicos**: Información detallada para cada tipo de error
- **Extensibilidad**: Fácil agregar nuevos tipos de error

### 3. **Interfaces de Constantes**
- **Centralización**: Valores válidos en un lugar centralizado
- **Reutilización**: Uso en múltiples clases
- **Mantenimiento**: Fácil modificación de valores válidos
- **Consistencia**: Valores consistentes en toda la aplicación

### 4. **Validación Avanzada**
- **Verificación de lista**: Comprobar si un valor está en una lista válida
- **Comparación insensible**: `equalsIgnoreCase` para flexibilidad
- **Excepciones específicas**: Lanzar excepciones propias para casos específicos
- **Recuperación**: Bucles para reintentar entrada válida

### 5. **Mensajes Personalizados**
- **Información específica**: Mensajes detallados sobre el error
- **Valores válidos**: Mostrar opciones válidas al usuario
- **Contexto**: Información relevante para resolver el error
- **Usabilidad**: Mensajes que ayudan al usuario a corregir el error

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
Ingreso de Datos de Personas Laboratorio02

Ingrese la cantidad de Personas que cargara: 1
Ingreso tipo de Persona:
1 - Alumno.
2 - Director.
3 - Profesor.
4 - Administrativo.

1
Ingrese el Nombre de la Persona [1]: Carlos
Ingrese el Apellido de la Persona [1]: López
Ingrese el Tipo de Documento de la Persona [1]: RFC
Los Documentos válidos son: [DNI, PAS, LE, CI]
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 87654321
Ingrese la Fecha de Nacimiento de la Persona [1]: 
Ingrese el año: 1990
Ingrese el mes en número, ej: 1 que indica enero, 12 que indica diciembre: 8
Ingrese el día: 20
Ingrese la cantidad de cursos de la Persona [1]: 3
Ingrese el curso [1] : Java
Ingrese el curso [2] : Python
Ingrese el curso [3] : C++

Alumno [toString()=Persona [id=0, nombre=Carlos, apellido=López, documento=DNI: 87654321, fechaNacimiento=Mon Aug 20 00:00:00 ART 1990], cursos=[Java, Python, C++]]
Carlos López es Alumno
```

## 📚 Conceptos Teóricos

### Excepciones Propias
- **Herencia**: Extender de `Exception` o `RuntimeException`
- **Constructores**: Implementar constructores apropiados
- **Serialización**: Incluir `serialVersionUID` para compatibilidad
- **Mensajes**: Sobrescribir `getMessage()` para mensajes personalizados

### Sistema de Códigos de Error
- **Identificación**: Códigos numéricos para diferentes errores
- **Mantenimiento**: Fácil agregar nuevos tipos de error
- **Documentación**: Códigos documentados para referencia
- **Consistencia**: Uso consistente de códigos en toda la aplicación

### Interfaces de Constantes
- **Centralización**: Valores válidos en un lugar centralizado
- **Reutilización**: Uso en múltiples clases
- **Mantenimiento**: Fácil modificación de valores
- **Consistencia**: Valores consistentes en toda la aplicación

## 🔄 Mejoras Implementadas

### Comparación con Laboratorio 01:

| Aspecto | Laboratorio 01 | Laboratorio 02 |
|---------|----------------|----------------|
| **Excepciones** | Genéricas | Propias con códigos |
| **Validación** | Básica | Avanzada con listas |
| **Mensajes** | Genéricos | Personalizados e informativos |
| **Constantes** | Hardcodeadas | Centralizadas en interfaz |
| **Mantenibilidad** | Media | Alta con excepciones propias |

## ⚠️ Consideraciones Importantes

1. **Códigos de error**: Documentar todos los códigos utilizados
2. **Mensajes informativos**: Proporcionar información útil para resolver errores
3. **Constantes**: Centralizar valores válidos para fácil mantenimiento
4. **Extensibilidad**: Diseñar para fácil agregar nuevos tipos de error

## 🎓 Puntos de Aprendizaje Clave

1. **Excepciones propias**: Creación de excepciones personalizadas
2. **Sistema de códigos**: Identificación de errores específicos
3. **Validación avanzada**: Verificación contra listas de valores válidos
4. **Interfaces de constantes**: Centralización de valores válidos
5. **Mensajes personalizados**: Información específica para cada error

## 💡 Buenas Prácticas Aplicadas

1. **Excepciones específicas**: Crear excepciones para casos específicos
2. **Códigos de error**: Sistema de identificación numérica
3. **Constantes centralizadas**: Valores válidos en interfaces
4. **Mensajes informativos**: Información útil para resolver errores
5. **Validación robusta**: Verificación contra listas de valores válidos

## 🔧 Aspectos Técnicos

### Excepción Personalizada
```java
public class ExcepcionPersona extends Exception {
    private Integer codigo;
    
    public ExcepcionPersona(Integer codigo) {
        this.codigo = codigo;
    }
    
    @Override
    public String getMessage() {
        switch (codigo) {
            case 1: return "Mensaje específico";
            default: return super.getMessage();
        }
    }
}
```

### Validación con Excepciones Propias
```java
if (!documentoCorrecto) {
    throw new ExcepcionPersona(1);
}
```

### Interface de Constantes
```java
public interface Constantes {
    String[] tipoDocumento = { "DNI", "PAS", "LE", "CI" };
}
```

Este laboratorio establece las bases para el manejo avanzado de excepciones, preparando el terreno para conceptos más avanzados como try-with-resources en los desafíos.

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
