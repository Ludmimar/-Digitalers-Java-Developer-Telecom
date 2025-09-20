# Laboratorio 03 - Sistema de Gestión de Personas con Mapas y Utilidades

## Descripción

Este laboratorio representa la evolución final del sistema de gestión de personas, incorporando mapas para gestión de cursos, utilidades avanzadas para manejo de fechas, y constantes para validación de datos. El sistema mantiene todas las funcionalidades anteriores y añade capacidades avanzadas de gestión de datos y validación.

## Funcionalidades

### 👥 Gestión de Personas (Heredada de Labs anteriores)
- **Registro interactivo** de diferentes tipos de personas
- **Tipos soportados**: Alumno, Director, Profesor, Administrativo
- **Validación de datos** con manejo de excepciones
- **Manejo de fechas** con utilidades personalizadas
- **Gestión de cursos** con validación por mapa de constantes

### 🗺️ Sistema de Mapas y Constantes (Nuevo)
- **Mapa de cursos** para validación de cursos válidos
- **Constantes centralizadas** para gestión de datos
- **Validación de cursos** contra mapa de constantes
- **Búsqueda eficiente** de cursos por ID o nombre
- **Utilidades de fecha** para manejo consistente

### 🎯 Cola de Atención Avanzada (Mejorada)
- **PriorityQueue** con ordenamiento por edad
- **Integración con utilidades** para cálculo de edad
- **Manejo de fechas moderno** con LocalDate
- **Validación robusta** de entrada de datos

## Conceptos Técnicos Aplicados

### Mapas y Estructuras Asociativas
- **HashMap**: Para mapeo de cursos (ID → Nombre)
- **Búsqueda eficiente**: O(1) para encontrar cursos por ID
- **Validación**: Verificación contra mapa de constantes
- **Iteración**: Recorrido de mapas con Entry

### Utilidades y Constantes
- **Interface Constantes**: Centralización de datos del sistema
- **UtilidadesFecha**: Manejo consistente de fechas
- **Métodos estáticos**: Funciones reutilizables
- **Separación de responsabilidades**: Lógica de negocio vs utilidades

### Manejo Avanzado de Fechas
- **LocalDate**: API moderna de Java 8+
- **UtilidadesFecha**: Conversión String ↔ LocalDate
- **Consistencia**: Manejo uniforme en todo el sistema
- **Validación**: Formato estándar y robusto

### Validación de Datos
- **Mapas de validación**: Cursos válidos definidos centralmente
- **Búsqueda bidireccional**: Por ID o por nombre
- **Manejo de errores**: Mensajes informativos para el usuario
- **Extensibilidad**: Fácil agregar nuevos cursos

## Estructura del Proyecto

```
laboratorio 03/
├── src/main/java/com/educacionIT/javase/
│   ├── principal/
│   │   └── App.java                    # Aplicación principal con mapas
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
│   │   ├── Constantes.java            # Interface con constantes y mapas
│   │   ├── Persistencia.java          # Interface para persistencia
│   │   └── UtilidadesFecha.java       # Interface para utilidades de fecha
│   └── excepciones/
│       └── ExcepcionPersona.java      # Excepción personalizada
├── pom.xml
└── README.md
```

## Cómo Ejecutar

### Usando Maven
```bash
# Navegar al directorio
cd "laboratorio 03"

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
Ingrese el Nombre de la Persona [1]: Laura
Ingrese el Apellido de la Persona [1]: Martínez
Ingrese el Tipo de Documento de la Persona [1]: DNI
Ingrese el Numero de Documento de la Persona [1]: 44444444
Formato Fecha[dd/mm/aaaa]: 12/05/1990
Ingrese la cantidad de cursos de la Persona [1]: 2
Ingrese el curso [1] : Programación
Ingrese el curso [2] : Base de Datos

Ingreso tipo de Persona:
1 - Alumno.
2 - Director.
3 - Profesor.
4 - Administrativo.

3
Ingrese el Nombre de la Persona [2]: Roberto
Ingrese el Apellido de la Persona [2]: Silva
Ingrese el Tipo de Documento de la Persona [2]: DNI
Ingrese el Numero de Documento de la Persona [2]: 55555555
Formato Fecha[dd/mm/aaaa]: 03/09/1980
Ingrese la Fecha de inicio del Cargo de la Persona [2]: 
Formato Fecha[dd/mm/aaaa]: 15/08/2015
Ingrese el Sueldo de la Persona [2]: 70000
Ingrese la cantidad de cursos de la Persona [2]: 1
Ingrese el curso [1] : Algoritmos

Personas:
Alumno [nombre=Laura, apellido=Martínez, documento=Documento [tipo=DNI, numero=44444444], fechaNacimiento=Sat May 12 00:00:00 ART 1990, cursos=[1, 2]]
Soy un Alumno
Profesor [nombre=Roberto, apellido=Silva, documento=Documento [tipo=DNI, numero=55555555], fechaNacimiento=Wed Sep 03 00:00:00 ART 1980, fechaCargo=Sat Aug 15 00:00:00 ART 2015, sueldo=70000.0, cursos=[5]]
Soy un Profesor

Personas Ordenadas:
Alumno [nombre=Laura, apellido=Martínez, documento=Documento [tipo=DNI, numero=44444444], fechaNacimiento=Sat May 12 00:00:00 ART 1990, cursos=[1, 2]]
Profesor [nombre=Roberto, apellido=Silva, documento=Documento [tipo=DNI, numero=55555555], fechaNacimiento=Wed Sep 03 00:00:00 ART 1980, fechaCargo=Sat Aug 15 00:00:00 ART 2015, sueldo=70000.0, cursos=[5]]

COLA DE ASISTENCIA
Por atender a: Profesor [nombre=Roberto, apellido=Silva, documento=Documento [tipo=DNI, numero=55555555], fechaNacimiento=Wed Sep 03 00:00:00 ART 1980, fechaCargo=Sat Aug 15 00:00:00 ART 2015, sueldo=70000.0, cursos=[5]]
Atendiendo a: Profesor [nombre=Roberto, apellido=Silva, documento=Documento [tipo=DNI, numero=55555555], fechaNacimiento=Wed Sep 03 00:00:00 ART 1980, fechaCargo=Sat Aug 15 00:00:00 ART 2015, sueldo=70000.0, cursos=[5]]
Por atender a: Alumno [nombre=Laura, apellido=Martínez, documento=Documento [tipo=DNI, numero=44444444], fechaNacimiento=Sat May 12 00:00:00 ART 1990, cursos=[1, 2]]
Atendiendo a: Alumno [nombre=Laura, apellido=Martínez, documento=Documento [tipo=DNI, numero=44444444], fechaNacimiento=Sat May 12 00:00:00 ART 1990, cursos=[1, 2]]
```

## Análisis del Código

### Interface Constantes con Mapas
```java
public interface Constantes {
    Map<Integer, String> getCursos();
    
    default Map<Integer, String> getCursos() {
        Map<Integer, String> cursos = new HashMap<>();
        cursos.put(1, "Programación");
        cursos.put(2, "Base de Datos");
        cursos.put(3, "Redes");
        cursos.put(4, "Sistemas Operativos");
        cursos.put(5, "Algoritmos");
        return cursos;
    }
}
```

### Utilidades de Fecha
```java
public interface UtilidadesFecha {
    static LocalDate getStringAFecha(String fecha) throws ParseException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return LocalDate.parse(fecha, formatter);
    }
    
    static String getStringLocalDate(LocalDate fecha) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return fecha.format(formatter);
    }
}
```

### Validación de Cursos con Mapas
```java
private static int validarCurso(String curso) {
    Map<Integer, String> cursos = Constantes.getCursos();
    
    if (cursos.containsValue(curso)) {
        for (Entry<Integer, String> cursoAuxiliar : cursos.entrySet()) {
            if (cursoAuxiliar.getValue().equalsIgnoreCase(curso)) {
                return cursoAuxiliar.getKey();
            }
        }
    }
    return -1; // Curso no encontrado
}
```

### Gestión de Cursos con Arrays
```java
private static int[] agregarCursos(int cantidad) {
    int[] cursos = new int[cantidad];
    
    for (int i = 0; i < cursos.length; i++) {
        while (true) {
            System.out.print("Ingrese el curso [" + (i + 1) + "] : ");
            String curso = teclado.next();
            int idCurso = validarCurso(curso);
            if (idCurso != -1) {
                cursos[i] = idCurso;
                break;
            }
            System.err.println("debe ingresar un curso valido: " + 
                Constantes.getCursos().values());
        }
    }
    return cursos;
}
```

## Puntos de Aprendizaje

### 1. Mapas y Estructuras Asociativas
- **HashMap**: Búsqueda eficiente por clave
- **Entry**: Iteración sobre pares clave-valor
- **Búsqueda bidireccional**: Por clave y por valor
- **Validación**: Verificación contra estructuras predefinidas

### 2. Utilidades y Constantes
- **Centralización**: Datos compartidos en un lugar
- **Reutilización**: Funciones comunes para múltiples clases
- **Mantenibilidad**: Cambios centralizados se propagan automáticamente
- **Separación de responsabilidades**: Lógica de negocio vs utilidades

### 3. Manejo Moderno de Fechas
- **LocalDate**: API moderna y más segura
- **DateTimeFormatter**: Formateo consistente
- **Inmutabilidad**: Fechas no se pueden modificar accidentalmente
- **Mejor rendimiento**: Menos overhead que Date

### 4. Validación Robusta
- **Mapas de validación**: Cursos válidos definidos centralmente
- **Mensajes informativos**: Errores claros para el usuario
- **Extensibilidad**: Fácil agregar nuevos elementos válidos
- **Consistencia**: Misma validación en todo el sistema

## Evolución del Sistema

| Aspecto | Lab 01 | Lab 02 | Lab 03 |
|---------|--------|--------|--------|
| **Entrada de fechas** | Manual | SimpleDateFormat | UtilidadesFecha |
| **Cursos** | String[] | String[] | int[] con validación |
| **Constantes** | Hardcoded | Hardcoded | Interface centralizada |
| **Validación** | Básica | Mejorada | Robusta con mapas |
| **Utilidades** | Inline | Inline | Centralizadas |
| **API de fechas** | Date | Date | LocalDate |

## Evaluación

Este laboratorio será evaluado considerando:
- ✅ Comprensión de mapas y estructuras asociativas
- ✅ Implementación correcta de utilidades centralizadas
- ✅ Uso efectivo de LocalDate y DateTimeFormatter
- ✅ Validación robusta con mapas de constantes
- ✅ Integración correcta con funcionalidades anteriores
- ✅ Separación apropiada de responsabilidades
- ✅ Extensibilidad y mantenibilidad del código
- ✅ Calidad del código y documentación
- ✅ Comprensión de la evolución completa del sistema

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---


