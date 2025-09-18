# Laboratorio 01: Try-Catch Básico y Validación de Fechas

Este laboratorio introduce el manejo básico de **excepciones** en Java, mostrando cómo usar `try-catch` para capturar y manejar errores, especialmente en la validación de entrada de datos del usuario.

## 🎯 Objetivos

- Comprender el concepto de excepciones y su manejo
- Implementar bloques `try-catch` para capturar excepciones
- Validar entrada de datos del usuario con manejo de errores
- Crear métodos robustos para entrada de fechas
- Aplicar validaciones específicas para diferentes tipos de datos

## 📋 Descripción del Ejercicio

El laboratorio evoluciona el sistema de gestión de personal educativo del MOD 22, introduciendo:
- **Try-catch básico**: Captura de excepciones en entrada de datos
- **Validación de fechas**: Método robusto para entrada de fechas válidas
- **Manejo de errores**: Mensajes informativos para el usuario
- **Recuperación de errores**: Estrategias para manejar datos inválidos
- **Validación de rangos**: Verificación de valores dentro de rangos válidos

## 🏗️ Estructura del Proyecto

```
Laboratorio 01/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Clase principal con manejo de excepciones
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
├── src/test/java/com/educacionIT/javase/Laboratorio01/
│   └── AppTest.java                   # Pruebas unitarias
├── pom.xml                            # Configuración Maven
└── target/                            # Archivos compilados
```

## 💻 Implementación

### Clase Principal (App) - Manejo de Excepciones
```java
package com.educacionIT.javase.principal;

import java.util.Date;
import java.util.Scanner;
import com.educacionIT.javase.entidades.*;

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
            
            System.out.print("Ingrese el Tipo de Documento de la Persona [" + (i + 1) + "]: ");
            tipo = teclado.next();
            
            System.out.print("Ingrese el Numero de Documento de la Persona [" + (i + 1) + "]: ");
            numero = teclado.nextInt();
            
            System.out.println("Ingrese la Fecha de Nacimiento de la Persona [" + (i + 1) + "]: ");
            fechaNacimiento = obtenerFecha(); // Método con manejo de excepciones

            // Creación de objetos según tipo
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

    // Método para obtener fecha con validación robusta
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

### 1. **Try-Catch Básico**
- **`try`**: Bloque de código que puede generar excepciones
- **`catch`**: Captura excepciones específicas o genéricas
- **`Exception e`**: Captura cualquier tipo de excepción
- **`e.getMessage()`**: Obtiene el mensaje de la excepción

### 2. **Validación de Entrada**
- **Entrada de usuario**: Validación de datos ingresados por teclado
- **Tipos de datos**: Verificación de que los datos sean del tipo correcto
- **Rangos válidos**: Validación de valores dentro de rangos específicos
- **Recuperación**: Estrategias para manejar datos inválidos

### 3. **Validación de Fechas**
- **Año**: Validación básica de entrada numérica
- **Mes**: Validación de rango 1-12
- **Día**: Validación específica según el mes
- **Lógica de calendario**: Reglas específicas para diferentes meses

### 4. **Manejo de Errores**
- **Mensajes informativos**: Errores claros para el usuario
- **Recuperación**: Bucles para reintentar entrada válida
- **Logging**: Uso de `System.err` para mensajes de error
- **Continuidad**: El programa continúa funcionando después de errores

### 5. **Robustez del Sistema**
- **Entrada segura**: Validación antes de procesar datos
- **Manejo de excepciones**: Captura de errores inesperados
- **Experiencia de usuario**: Mensajes claros y recuperación automática
- **Estabilidad**: El sistema no se detiene por errores de entrada

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
Ingrese el Nombre de la Persona [1]: Ana
Ingrese el Apellido de la Persona [1]: García
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 12345678
Ingrese la Fecha de Nacimiento de la Persona [1]: 
Ingrese el año: 1995
Ingrese el mes en número, ej: 1 que indica enero, 12 que indica diciembre: 13
Debe ingresar un dato válido: Los meses deben estar comprendidos entre 1 y 12
Ingrese el mes en número, ej: 1 que indica enero, 12 que indica diciembre: 6
Ingrese el día: 15
Ingrese la cantidad de cursos de la Persona [1]: 2
Ingrese el curso [1] : Matemáticas
Ingrese el curso [2] : Física

Alumno [toString()=Persona [id=0, nombre=Ana, apellido=García, documento=DNI: 12345678, fechaNacimiento=Thu Jun 15 00:00:00 ART 1995], cursos=[Matemáticas, Física]]
Ana García es Alumno
```

## 📚 Conceptos Teóricos

### Excepciones en Java
- **Definición**: Eventos anómalos que interrumpen el flujo normal del programa
- **Tipos**: Verificadas (checked) y no verificadas (unchecked)
- **Jerarquía**: Todas las excepciones heredan de `Throwable`
- **Propósito**: Manejo robusto de errores y condiciones excepcionales

### Try-Catch
- **`try`**: Bloque de código que puede generar excepciones
- **`catch`**: Captura y maneja excepciones específicas
- **Múltiples catch**: Manejo de diferentes tipos de excepciones
- **Orden**: Capturar excepciones más específicas antes que las genéricas

### Validación de Datos
- **Entrada de usuario**: Siempre validar datos ingresados
- **Tipos de datos**: Verificar que los datos sean del tipo correcto
- **Rangos**: Validar que los valores estén dentro de rangos válidos
- **Formato**: Verificar que los datos tengan el formato correcto

## 🔄 Mejoras Implementadas

### Comparación con MOD 22:

| Aspecto | MOD 22 | Laboratorio 01 |
|---------|--------|----------------|
| **Manejo de errores** | No implementado | Try-catch básico |
| **Validación de entrada** | Básica | Robusta con excepciones |
| **Recuperación de errores** | No disponible | Bucles de reintento |
| **Mensajes de error** | Limitados | Informativos y claros |
| **Robustez** | Media | Alta con manejo de excepciones |

## ⚠️ Consideraciones Importantes

1. **Captura específica**: Preferir capturar excepciones específicas sobre genéricas
2. **Mensajes informativos**: Proporcionar mensajes claros para el usuario
3. **Recuperación**: Implementar estrategias para manejar errores
4. **Validación temprana**: Validar datos lo antes posible

## 🎓 Puntos de Aprendizaje Clave

1. **Try-Catch**: Manejo básico de excepciones
2. **Validación**: Entrada segura de datos del usuario
3. **Recuperación**: Estrategias para manejar errores
4. **Robustez**: Creación de sistemas estables
5. **Experiencia de usuario**: Mensajes claros y recuperación automática

## 💡 Buenas Prácticas Aplicadas

1. **Validación temprana**: Verificar datos antes de procesarlos
2. **Mensajes claros**: Errores informativos para el usuario
3. **Recuperación automática**: Bucles para reintentar entrada válida
4. **Manejo específico**: Captura de excepciones específicas
5. **Continuidad**: El programa continúa funcionando después de errores

## 🔧 Aspectos Técnicos

### Estructura Try-Catch
```java
try {
    // Código que puede generar excepciones
    int valor = teclado.nextInt();
} catch (Exception e) {
    // Manejo de la excepción
    System.err.println("Error: " + e.getMessage());
}
```

### Validación con Recuperación
```java
while (true) {
    try {
        // Entrada de datos
        break; // Salir del bucle si es válido
    } catch (Exception e) {
        // Mostrar error y reintentar
    }
}
```

### Validación de Rangos
```java
if (mes < 1 || mes > 12) {
    throw new Exception("Los meses deben estar comprendidos entre 1 y 12");
}
```

Este laboratorio establece las bases del manejo de excepciones, preparando el terreno para conceptos más avanzados como excepciones propias y try-with-resources en el laboratorio siguiente.

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
