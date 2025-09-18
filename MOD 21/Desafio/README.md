# Desafíos - MOD 21: Fundamentos de Programación Orientada a Objetos

Este directorio contiene los desafíos prácticos del Módulo 21, enfocados en la aplicación de conceptos fundamentales de Programación Orientada a Objetos (POO) en Java.

## 📋 Contenido

### Desafío 01: Validación de Usuario
**Objetivo:** Implementar un sistema de validación de credenciales de usuario con validaciones específicas.

#### Características:
- **Validación de Email:** Verificación de formato de correo electrónico con dominio específico (`@educacionit.com`)
- **Validación de Contraseña:** 
  - Debe comenzar con mayúscula
  - Debe contener al menos uno de los símbolos: `*`, `.`, `-`, `_`
- **Clase Usuario:** Implementación con encapsulación completa (getters/setters)
- **Manejo de Entrada:** Uso de `Scanner` para entrada de datos por consola

#### Estructura del Proyecto:
```
Desafío 01/
├── src/main/java/com/educacionit/desafio01/
│   ├── App.java                    # Clase principal con lógica de validación
│   └── dentidades/
│       └── Usuario.java            # Entidad Usuario con encapsulación
├── pom.xml                         # Configuración Maven
└── target/                        # Archivos compilados
```

#### Conceptos Aplicados:
- ✅ Encapsulación (atributos privados, getters/setters)
- ✅ Validación de entrada de datos
- ✅ Manejo de strings y métodos de validación
- ✅ Bucles de validación con `do-while`
- ✅ Arrays para almacenar símbolos válidos

---

### Desafío 02: Sistema de Gestión de Personas
**Objetivo:** Crear un sistema para gestionar múltiples personas con validación de documentos únicos.

#### Características:
- **Gestión de Múltiples Personas:** Array dinámico de objetos Persona
- **Validación de Documentos:** 
  - Tipos válidos: DNI, LC, LE, PAS, CI
  - Verificación de unicidad (no duplicados)
- **Composición de Objetos:** Clase Persona contiene objeto Documento
- **Interfaz de Usuario:** Menú interactivo para selección de tipo de documento

#### Estructura del Proyecto:
```
Desafío 02/
├── src/main/java/com/educacionit/desafio02/
│   ├── App.java                    # Clase principal con gestión de personas
│   └── entidades/
│       ├── Persona.java           # Entidad Persona con encapsulación
│       └── Documento.java         # Entidad Documento
├── pom.xml                         # Configuración Maven
└── target/                        # Archivos compilados
```

#### Conceptos Aplicados:
- ✅ Composición de objetos (Persona-Documento)
- ✅ Encapsulación completa
- ✅ Validación de datos únicos
- ✅ Arrays de objetos
- ✅ Manejo de entrada de datos
- ✅ Menús interactivos

---

## 🎯 Objetivos de Aprendizaje

Al completar estos desafíos, el estudiante habrá desarrollado competencias en:

1. **Encapsulación:** Implementación correcta de atributos privados con métodos de acceso
2. **Composición:** Relación entre objetos donde una clase contiene otra
3. **Validación de Datos:** Implementación de reglas de negocio para entrada de datos
4. **Manejo de Arrays:** Gestión de colecciones de objetos
5. **Interfaz de Usuario:** Creación de aplicaciones interactivas por consola
6. **Estructura de Proyectos:** Organización de código en paquetes y clases

## 🚀 Cómo Ejecutar

### Prerrequisitos:
- Java JDK 8 o superior
- Maven 3.6 o superior

### Pasos:
1. Navegar al directorio del desafío deseado
2. Compilar el proyecto: `mvn compile`
3. Ejecutar la aplicación: `mvn exec:java -Dexec.mainClass="com.educacionit.desafio0X.App"`

### Ejemplo:
```bash
cd "Desafío 01"
mvn compile
mvn exec:java -Dexec.mainClass="com.educacionit.desafio01.App"
```

## 📚 Conceptos Teóricos Relacionados

- **Encapsulación:** Principio de ocultar la implementación interna de una clase
- **Composición:** Relación "tiene-un" entre objetos
- **Validación de Datos:** Verificación de entrada según reglas de negocio
- **Arrays de Objetos:** Almacenamiento de múltiples instancias de una clase
- **Métodos de Acceso:** Getters y setters para controlar el acceso a atributos

## 🔗 Enlaces Útiles

- [Documentación Java - Encapsulación](https://docs.oracle.com/javase/tutorial/java/concepts/object.html)
- [Maven - Guía de Inicio](https://maven.apache.org/guides/getting-started/)
- [Java Scanner Class](https://docs.oracle.com/javase/8/docs/api/java/util/Scanner.html)

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---