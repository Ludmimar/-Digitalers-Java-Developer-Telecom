# Laboratorio 02 - Sistema de Gestión de Personas con PriorityQueue

## Descripción

Este laboratorio extiende el sistema de gestión de personas del Laboratorio 01, agregando funcionalidad de cola de atención utilizando PriorityQueue. El sistema mantiene todas las funcionalidades anteriores y añade un sistema de cola de asistencia que prioriza personas por edad (descendente) para simular atención preferencial.

## Funcionalidades

### 👥 Gestión de Personas (Heredada del Lab 01)
- **Registro interactivo** de diferentes tipos de personas
- **Tipos soportados**: Alumno, Director, Profesor, Administrativo
- **Validación de datos** con manejo de excepciones
- **Manejo de fechas** con SimpleDateFormat
- **Gestión de cursos** para alumnos y profesores

### 🎯 Sistema de Cola de Atención (Nuevo)
- **PriorityQueue** para manejo de cola de asistencia
- **Ordenamiento por edad** (descendente - personas mayores primero)
- **Simulación de atención** con peek() y poll()
- **Comparador personalizado** OrdenEdadDesc
- **Notificaciones** de próximo en atención

### 📊 Mejoras en Manejo de Fechas
- **SimpleDateFormat** para entrada de fechas más intuitiva
- **Patrón dd/MM/yyyy** para formato estándar
- **Manejo de ParseException** para validación robusta
- **Conversión automática** de String a Date

## Conceptos Técnicos Aplicados

### PriorityQueue y Colas de Prioridad
- **PriorityQueue**: Cola que mantiene elementos ordenados por prioridad
- **Comparador OrdenEdadDesc**: Ordenamiento por edad descendente
- **Métodos peek() y poll()**: Consulta y extracción de elementos
- **Simulación**: Proceso de atención paso a paso

### Manejo Avanzado de Fechas
- **SimpleDateFormat**: Formateo y parsing de fechas
- **Patrones de fecha**: Formato estándar dd/MM/yyyy
- **ParseException**: Manejo de errores de formato
- **Validación robusta**: Entrada de fechas más amigable

### Comparadores Avanzados
- **OrdenDocumento**: Para ordenamiento inicial de personas
- **OrdenEdadDesc**: Para cola de atención por edad
- **Múltiples criterios**: Diferentes ordenamientos según necesidad
- **Reutilización**: Comparadores aplicables a diferentes contextos

### Herencia y Polimorfismo (Extendido)
- **Misma estructura** del Laboratorio 01
- **Métodos adicionales** para manejo de cola
- **Flexibilidad**: Fácil extensión de funcionalidades
- **Consistencia**: Mantiene la arquitectura original

## Estructura del Proyecto

```
Laboratorio 02/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Aplicación principal con cola
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
│   │   ├── OrdenDocumento.java        # Comparador para ordenamiento inicial
│   │   └── OrdenEdadDesc.java         # Comparador para cola de atención
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
cd "Laboratorio 02"

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

Ingrese la cantidad de Personas que cargara: 3

Ingreso tipo de Persona:
1 - Alumno.
2 - Director.
3 - Profesor.
4 - Administrativo.

1
Ingrese el Nombre de la Persona [1]: Ana
Ingrese el Apellido de la Persona [1]: López
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 11111111
Formato Fecha[dd/mm/aaaa]: 15/03/1985
Ingrese la cantidad de cursos de la Persona [1]: 1
Ingrese el curso [1] : Programación

Ingreso tipo de Persona:
1 - Alumno.
2 - Director.
3 - Profesor.
4 - Administrativo.

2
Ingrese el Nombre de la Persona [2]: Carlos
Ingrese el Apellido de la Persona [2]: Ruiz
Ingrese el Tipo de Documento de la Persona [2]: DNI
Ingrese el Numero de Documento de la Persona [2]: 22222222
Formato Fecha[dd/mm/aaaa]: 10/07/1970
Ingrese la Fecha de inicio del Cargo de la Persona [2]: 
Formato Fecha[dd/mm/aaaa]: 01/01/2020
Ingrese la Carrera encargada de la Persona [2]: Sistemas
Ingrese el Sueldo de la Persona [2]: 60000

Ingreso tipo de Persona:
1 - Alumno.
2 - Director.
3 - Profesor.
4 - Administrativo.

1
Ingrese el Nombre de la Persona [3]: Pedro
Ingrese el Apellido de la Persona [3]: García
Ingrese el Tipo de Documento de la Persona [3]: DNI
Ingrese el Numero de Documento de la Persona [3]: 33333333
Formato Fecha[dd/mm/aaaa]: 20/12/1995
Ingrese la cantidad de cursos de la Persona [3]: 2
Ingrese el curso [1] : Matemáticas
Ingrese el curso [2] : Física

Personas:
Alumno [nombre=Ana, apellido=López, documento=Documento [tipo=DNI, numero=11111111], fechaNacimiento=Fri Mar 15 00:00:00 ART 1985]
Soy un Alumno
Director [nombre=Carlos, apellido=Ruiz, documento=Documento [tipo=DNI, numero=22222222], fechaNacimiento=Fri Jul 10 00:00:00 ART 1970, fechaCargo=Wed Jan 01 00:00:00 ART 2020, sueldo=60000.0, carrera=Sistemas]
Soy un Director
Alumno [nombre=Pedro, apellido=García, documento=Documento [tipo=DNI, numero=33333333], fechaNacimiento=Wed Dec 20 00:00:00 ART 1995]
Soy un Alumno

Personas Ordenadas:
Alumno [nombre=Ana, apellido=López, documento=Documento [tipo=DNI, numero=11111111], fechaNacimiento=Fri Mar 15 00:00:00 ART 1985]
Director [nombre=Carlos, apellido=Ruiz, documento=Documento [tipo=DNI, numero=22222222], fechaNacimiento=Fri Jul 10 00:00:00 ART 1970, fechaCargo=Wed Jan 01 00:00:00 ART 2020, sueldo=60000.0, carrera=Sistemas]
Alumno [nombre=Pedro, apellido=García, documento=Documento [tipo=DNI, numero=33333333], fechaNacimiento=Wed Dec 20 00:00:00 ART 1995]

COLA DE ASISTENCIA
Por atender a: Director [nombre=Carlos, apellido=Ruiz, documento=Documento [tipo=DNI, numero=22222222], fechaNacimiento=Fri Jul 10 00:00:00 ART 1970, fechaCargo=Wed Jan 01 00:00:00 ART 2020, sueldo=60000.0, carrera=Sistemas]
Atendiendo a: Director [nombre=Carlos, apellido=Ruiz, documento=Documento [tipo=DNI, numero=22222222], fechaNacimiento=Fri Jul 10 00:00:00 ART 1970, fechaCargo=Wed Jan 01 00:00:00 ART 2020, sueldo=60000.0, carrera=Sistemas]
Por atender a: Alumno [nombre=Ana, apellido=López, documento=Documento [tipo=DNI, numero=11111111], fechaNacimiento=Fri Mar 15 00:00:00 ART 1985]
Atendiendo a: Alumno [nombre=Ana, apellido=López, documento=Documento [tipo=DNI, numero=11111111], fechaNacimiento=Fri Mar 15 00:00:00 ART 1985]
Por atender a: Alumno [nombre=Pedro, apellido=García, documento=Documento [tipo=DNI, numero=33333333], fechaNacimiento=Wed Dec 20 00:00:00 ART 1995]
Atendiendo a: Alumno [nombre=Pedro, apellido=García, documento=Documento [tipo=DNI, numero=33333333], fechaNacimiento=Wed Dec 20 00:00:00 ART 1995]
```

## Análisis del Código

### Comparador OrdenEdadDesc
```java
public class OrdenEdadDesc implements Comparator<Persona> {
    @Override
    public int compare(Persona p1, Persona p2) {
        // Ordenamiento por edad descendente (mayores primero)
        return Integer.compare(p2.calcularEdad(), p1.calcularEdad());
    }
}
```

### Manejo de Fechas con SimpleDateFormat
```java
private static Date obtenerFecha() {
    final String PATRON = "dd/MM/yyyy";
    final SimpleDateFormat FORMATO_FECHA = new SimpleDateFormat(PATRON);
    
    while (true) {
        try {
            System.out.print("Formato Fecha[dd/mm/aaaa]: ");
            String fechaUsuario = teclado.next();
            Date fecha = FORMATO_FECHA.parse(fechaUsuario);
            return fecha;
        } catch (ParseException e) {
            System.err.println("debe ingresar un dato valido: " + e.getMessage());
        }
    }
}
```

### Sistema de Cola de Atención
```java
private static void asistenacia(Collection<Persona> personas) {
    Queue<Persona> colaPersonas = new PriorityQueue<Persona>(new OrdenEdadDesc());
    colaPersonas.addAll(personas);
    
    System.out.println("COLA DE ASISTENCIA");
    while(!colaPersonas.isEmpty()) {
        System.out.println("Por atender a: " + colaPersonas.peek());
        System.out.println("Atendiendo a: " + colaPersonas.poll());
    }
}
```

## Puntos de Aprendizaje

### 1. PriorityQueue
- **Cola de prioridad**: Elementos ordenados automáticamente
- **Comparadores**: Criterios de ordenamiento personalizados
- **Operaciones**: peek() para consulta, poll() para extracción
- **Eficiencia**: Acceso O(1) al elemento de mayor prioridad

### 2. Manejo de Fechas Avanzado
- **SimpleDateFormat**: API más amigable que Date manual
- **Patrones**: Formato estándar y legible
- **Validación**: Manejo robusto de errores de formato
- **Usabilidad**: Entrada de fechas más intuitiva para el usuario

### 3. Comparadores Múltiples
- **Flexibilidad**: Diferentes criterios según el contexto
- **Reutilización**: Un comparador puede usarse en múltiples colecciones
- **Especialización**: Comparadores específicos para diferentes necesidades
- **Mantenibilidad**: Código más organizado y fácil de mantener

### 4. Simulación de Procesos
- **Colas de atención**: Simulación de sistemas reales
- **Priorización**: Lógica de negocio aplicada a estructuras de datos
- **Feedback**: Información clara del estado del proceso
- **Escalabilidad**: Fácil adaptación a diferentes criterios de prioridad

## Diferencias con Laboratorio 01

| Aspecto | Laboratorio 01 | Laboratorio 02 |
|---------|----------------|----------------|
| **Entrada de fechas** | Manual (año, mes, día) | SimpleDateFormat (dd/MM/yyyy) |
| **Cola de atención** | No implementada | PriorityQueue con OrdenEdadDesc |
| **Comparadores** | Solo OrdenDocumento | OrdenDocumento + OrdenEdadDesc |
| **Simulación** | Solo ordenamiento | Proceso de atención completo |
| **Complejidad** | Básica | Intermedia |


## Evaluación

Este laboratorio será evaluado considerando:
- ✅ Comprensión de PriorityQueue y colas de prioridad
- ✅ Implementación correcta de comparadores múltiples
- ✅ Mejora en el manejo de fechas con SimpleDateFormat
- ✅ Simulación efectiva del proceso de atención
- ✅ Integración correcta con funcionalidades del Laboratorio 01
- ✅ Manejo de casos límite y validaciones
- ✅ Calidad del código y documentación
- ✅ Comprensión de la evolución del sistema


## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---


