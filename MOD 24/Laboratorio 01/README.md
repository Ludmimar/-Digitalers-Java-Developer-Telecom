# Laboratorio 01 - Sistema de Gestión de Personas con HashSet

## Descripción

Este laboratorio implementa un sistema completo de gestión de personas para una institución educativa, permitiendo el registro de diferentes tipos de personas (alumnos, directores, profesores y administrativos) utilizando HashSet para evitar duplicados y ArrayList para ordenamiento personalizado.

## Funcionalidades

### 👥 Gestión de Personas
- **Registro interactivo** de diferentes tipos de personas
- **Tipos soportados**: Alumno, Director, Profesor, Administrativo
- **Validación de datos** con manejo de excepciones
- **Entrada de fechas** con validación de formato
- **Gestión de cursos** para alumnos y profesores

### 📊 Visualización y Ordenamiento
- **Visualización completa** de todas las personas registradas
- **Ordenamiento personalizado** por documento usando Comparator
- **Manejo de colecciones** HashSet y ArrayList
- **Información detallada** de cada tipo de persona

## Conceptos Técnicos Aplicados

### Herencia y Polimorfismo
- **Clase Persona**: Clase base abstracta para todas las personas
- **Herencia**: Alumno, Director, Profesor, Administrativo extienden Persona
- **Polimorfismo**: Uso de la clase base para manejar diferentes tipos
- **Métodos abstractos**: `mostrarTipoPersona()` implementado en cada subclase

### Colecciones
- **HashSet**: Para almacenar personas sin duplicados
- **ArrayList**: Para ordenamiento y procesamiento adicional
- **Conversión**: De Set a List para aplicar ordenamiento
- **Iterator**: Para recorrer colecciones de forma segura

### Comparadores
- **OrdenDocumento**: Comparador personalizado para ordenar por documento
- **Comparator Interface**: Implementación de criterios de ordenamiento
- **Método sort()**: Aplicación del comparador a la lista

### Manejo de Fechas
- **Date**: API clásica de Java para fechas
- **Validación personalizada**: Método `obtenerFecha()` con validación completa
- **Validación de días**: Consideración de días por mes y año bisiesto

### Enumerados
- **TiposDocumento**: Enum para tipos de documento (DNI, PASAPORTE, etc.)
- **Type Safety**: Previene errores de tipo en tiempo de compilación
- **Validación**: Uso de `valueOf()` con manejo de excepciones

## Estructura del Proyecto

```
Laboratorio 01/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Aplicación principal
│   ├── entidades/
│   │   ├── Persona.java               # Clase base abstracta
│   │   ├── Alumno.java                # Implementación de alumno
│   │   ├── Director.java              # Implementación de director
│   │   ├── Profesor.java              # Implementación de profesor
│   │   ├── Administrativo.java        # Implementación de administrativo
│   │   └── Documento.java             # Clase para documentos
│   ├── enumerados/
│   │   └── TiposDocumento.java        # Tipos de documento
│   ├── comparadores/
│   │   └── OrdenDocumento.java        # Comparador para ordenamiento
│   ├── interfaces/
│   │   ├── Constantes.java            # Interface con constantes
│   │   └── Persistencia.java          # Interface para persistencia
│   └── excepciones/
│       └── ExcepcionPersona.java      # Excepción personalizada
├── pom.xml
└── README.md
```

## Cómo Ejecutar

### Usando Maven
```bash
# Navegar al directorio
cd "Laboratorio 01"

# Compilar
mvn compile

# Ejecutar la aplicación
mvn exec:java -Dexec.mainClass="com.educacionIT.javase.principal.App"
```

### Compilación Manual
```bash
# Compilar todas las clases
javac -d target/classes src/main/java/com/educacionIT/javase/**/*.java

# Ejecutar
java -cp target/classes com.educacionIT.javase.principal.App
```

## Ejemplo de Uso

```
Ingreso de Datos de Personas Laboratorio01

Ingrese la cantidad de Personas que cargara: 2

Ingreso tipo de Persona:
1 - Alumno.
2 - Director.
3 - Profesor.
4 - Administrativo.

1
Ingrese el Nombre de la Persona [1]: Juan
Ingrese el Apellido de la Persona [1]: Pérez
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 12345678
Ingrese la Fecha de Nacimiento de la Persona [1]: 
Ingrese el año: 1990
Ingrese el mes en numero, ej: 1 que indica enero, 12 que indica diciembre: 5
Ingrese el dia: 15
Ingrese la cantidad de cursos de la Persona [1]: 2
Ingrese el curso [1] : Matemáticas
Ingrese el curso [2] : Física

Ingreso tipo de Persona:
1 - Alumno.
2 - Director.
3 - Profesor.
4 - Administrativo.

2
Ingrese el Nombre de la Persona [2]: María
Ingrese el Apellido de la Persona [2]: García
Ingrese el Tipo de Documento de la Persona [2]: DNI
Ingrese el Numero de Documento de la Persona [2]: 87654321
Ingrese la Fecha de Nacimiento de la Persona [2]: 
Ingrese el año: 1975
Ingrese el mes en numero, ej: 1 que indica enero, 12 que indica diciembre: 8
Ingrese el dia: 20
Ingrese la Fecha de inicio del Cargo de la Persona [2]: 
Ingrese el año: 2020
Ingrese el mes en numero, ej: 1 que indica enero, 12 que indica diciembre: 1
Ingrese el dia: 1
Ingrese la Carrera encargada de la Persona [2]: Ingeniería
Ingrese el Sueldo de la Persona [2]: 50000

Personas:
Alumno [nombre=Juan, apellido=Pérez, documento=Documento [tipo=DNI, numero=12345678], fechaNacimiento=Thu May 15 00:00:00 ART 1990]
Soy un Alumno
Director [nombre=María, apellido=García, documento=Documento [tipo=DNI, numero=87654321], fechaNacimiento=Tue Aug 20 00:00:00 ART 1975, fechaCargo=Wed Jan 01 00:00:00 ART 2020, sueldo=50000.0, carrera=Ingeniería]
Soy un Director

Personas Ordenadas:
Alumno [nombre=Juan, apellido=Pérez, documento=Documento [tipo=DNI, numero=12345678], fechaNacimiento=Thu May 15 00:00:00 ART 1990]
Director [nombre=María, apellido=García, documento=Documento [tipo=DNI, numero=87654321], fechaNacimiento=Tue Aug 20 00:00:00 ART 1975, fechaCargo=Wed Jan 01 00:00:00 ART 2020, sueldo=50000.0, carrera=Ingeniería]
```

## Análisis del Código

### Clase Persona (Abstracta)
```java
public abstract class Persona {
    protected String nombre;
    protected String apellido;
    protected Documento documento;
    protected Date fechaNacimiento;
    
    public abstract String mostrarTipoPersona();
    
    @Override
    public boolean equals(Object obj) {
        // Implementación para HashSet
    }
    
    @Override
    public int hashCode() {
        // Implementación para HashSet
    }
}
```

### Comparador Personalizado
```java
public class OrdenDocumento implements Comparator<Persona> {
    @Override
    public int compare(Persona p1, Persona p2) {
        return p1.getDocumento().compareTo(p2.getDocumento());
    }
}
```

### Validación de Fechas
```java
private static Date obtenerFecha() {
    // Validación completa de año, mes y día
    // Consideración de días por mes
    // Manejo de años bisiestos
    // Validación de rangos válidos
}
```

## Puntos de Aprendizaje

### 1. Diseño Orientado a Objetos
- **Abstracción**: Clase Persona define comportamiento común
- **Herencia**: Especialización en tipos específicos de persona
- **Polimorfismo**: Tratamiento uniforme de diferentes tipos
- **Encapsulación**: Protección de datos internos

### 2. Manejo de Colecciones
- **HashSet**: Para elementos únicos basado en equals/hashCode
- **ArrayList**: Para ordenamiento y procesamiento
- **Conversión**: Técnicas para cambiar entre tipos de colección
- **Iteración**: Diferentes formas de recorrer colecciones

### 3. Validación de Datos
- **Entrada de usuario**: Manejo de datos desde consola
- **Validación de rangos**: Años, meses, días válidos
- **Manejo de excepciones**: Try-catch para errores de entrada
- **Enumerados**: Validación de tipos predefinidos

### 4. Comparadores y Ordenamiento
- **Comparator Interface**: Criterios de ordenamiento personalizados
- **Comparación**: Lógica de comparación entre objetos
- **Ordenamiento**: Aplicación de comparadores a listas
- **Flexibilidad**: Múltiples criterios de ordenamiento


## Evaluación

Este laboratorio será evaluado considerando:
- ✅ Comprensión de herencia y polimorfismo
- ✅ Uso correcto de HashSet y ArrayList
- ✅ Implementación de comparadores personalizados
- ✅ Validación apropiada de entrada de datos
- ✅ Manejo de fechas y enumerados
- ✅ Diseño de clases y relaciones
- ✅ Calidad del código y documentación
- ✅ Manejo de excepciones y casos límite


## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---


