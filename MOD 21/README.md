# 🏗️ Módulo 21: Fundamentos de Programación Orientada a Objetos

En este módulo te adentrarás en el **paradigma de Programación Orientada a Objetos (POO)**, aprendiendo los conceptos fundamentales que revolucionaron la forma de desarrollar software y que son la base de Java.

---

## 📚 Contenido del módulo  

1. **Paradigma Orientado a Objetos**  
   - Introducción al paradigma POO y sus principios fundamentales.  
   - Diferencias con la programación estructurada.  
   - Ventajas y beneficios del enfoque orientado a objetos.  

2. **Clase, Objeto e Instancia**  
   - Definición y comprensión de qué es una clase.  
   - Diferenciación entre objeto e instancia.  
   - Relación entre clases y objetos en el mundo real.  

3. **Atributos y Métodos**  
   - Atributos: características o propiedades de una clase.  
   - Métodos: comportamientos o acciones que puede realizar una clase.  
   - Declaración y uso de atributos y métodos en Java.  

4. **Sobrecarga**  
   - Concepto de sobrecarga de métodos (method overloading).  
   - Cómo crear múltiples versiones de un método con diferentes parámetros.  
   - Reglas y buenas prácticas para la sobrecarga.  

5. **Constructores**  
   - Qué son los constructores y su propósito.  
   - Constructor por defecto vs constructores personalizados.  
   - Uso de `this` para referenciar atributos de la clase.  

6. **Modificadores de Acceso**  
   - `public`, `private`, `protected` y package-private.  
   - Control de visibilidad de clases, atributos y métodos.  
   - Principios de encapsulación y ocultación de información.  

7. **Encapsulamiento**  
   - Principio fundamental de la POO.  
   - Implementación de getters y setters.  
   - Ventajas del encapsulamiento en el diseño de software.  

## 🎯 Objetivo
Al finalizar este módulo podrás:  
✅ Comprender el **paradigma de Programación Orientada a Objetos** y sus principios.  
✅ Crear **clases** con atributos y métodos apropiados.  
✅ Implementar **constructores** y **sobrecarga de métodos**.  
✅ Aplicar **modificadores de acceso** y **encapsulamiento** correctamente.  
✅ Diseñar clases que sigan las **buenas prácticas** de POO.

---

## 🛠️ Tecnologías Utilizadas

- **Java 8+**: Lenguaje de programación principal
- **Eclipse IDE**: Entorno de desarrollo integrado
- **Maven**: Herramienta de gestión de proyectos y dependencias
- **POO**: Paradigma de Programación Orientada a Objetos

---

## 📁 Estructura del Módulo

```
MOD 21/
├── 📄 README.md                    # Este archivo
├── 📁 Laboratorio01/               # Introducción a clases y objetos
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Laboratorio02/               # Constructores y composición
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Laboratorio03/               # Encapsulación y paquetes
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 LaboratorioFinal/            # Encapsulación completa
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Desafío/                     # Retos prácticos
│   ├── 📄 README.md               # Documentación de desafíos
│   ├── 📁 Desafío 01/             # Validación de usuario
│   └── 📁 Desafío 02/             # Sistema de gestión de personas
├── 📁 DOCS/                       # Documentación teórica
│   ├── 📄 Introducción a clases y objetos.pdf
│   ├── 📄 Métodos- conceptos básicos.pdf
│   ├── 📄 Encapsulamiento- Introducción y usos.pdf
│   └── 📄 Paquetes y Modificadores de Acceso.pdf
└── 📁 Material Adicional/         # Ejemplos adicionales
    ├── 📁 Encapsulamiento/
    ├── 📁 FundamentosPOO/
    ├── 📁 Metodos/
    └── 📁 Paquetes/
```

---

## 🚀 Cómo Empezar

### Prerrequisitos
- Completar MOD 20 (Introducción a Java)
- Conocimientos básicos de Java y Eclipse
- Comprensión de variables y estructuras de control

### Pasos Recomendados
1. **Lee la documentación teórica** en la carpeta `DOCS/`
2. **Comienza con Laboratorio01** para entender los conceptos básicos
3. **Progresivamente avanza** por cada laboratorio
4. **Practica con los desafíos** para consolidar conocimientos
5. **Explora el material adicional** para profundizar

### Comandos Útiles
```bash
# Compilar un proyecto Maven
mvn compile

# Ejecutar la aplicación principal
mvn exec:java -Dexec.mainClass="com.educacionIT.javase.principal.App"

# Limpiar archivos compilados
mvn clean
```

---

## 🎓 Conceptos Clave

### 🔹 **Paradigma POO**
- **Abstracción**: Representar conceptos del mundo real
- **Encapsulación**: Ocultar detalles de implementación
- **Herencia**: Reutilizar código (próximo módulo)
- **Polimorfismo**: Comportamiento flexible (próximo módulo)

### 🔹 **Elementos Fundamentales**
- **Clase**: Plantilla o molde que define estructura y comportamiento
- **Objeto**: Instancia específica de una clase con valores concretos
- **Atributo**: Característica o propiedad de una clase
- **Método**: Comportamiento o acción que puede realizar una clase

### 🔹 **Modificadores de Acceso**
- **`public`**: Accesible desde cualquier lugar
- **`private`**: Solo accesible desde la misma clase
- **`protected`**: Accesible desde la misma clase y subclases
- **Package-private**: Accesible desde el mismo paquete

---

## 📈 Progresión de Aprendizaje

| Laboratorio | Conceptos Principales | Nivel |
|-------------|----------------------|-------|
| **Lab 01** | Clases básicas, objetos, arrays | 🟢 Básico |
| **Lab 02** | Constructores, composición | 🟡 Intermedio |
| **Lab 03** | Encapsulación, paquetes | 🟠 Avanzado |
| **Lab Final** | Encapsulación completa, buenas prácticas | 🔴 Experto |

---

## 💡 Buenas Prácticas

### ✅ **Diseño de Clases**
- Usar nombres descriptivos para clases, atributos y métodos
- Aplicar encapsulación desde el inicio
- Separar responsabilidades entre clases
- Documentar el código con comentarios

### ✅ **Encapsulación**
- Hacer atributos privados por defecto
- Proporcionar getters/setters cuando sea necesario
- Validar datos en los setters
- Usar métodos para acceder a datos sensibles

### ✅ **Organización**
- Organizar clases en paquetes lógicos
- Usar importaciones explícitas
- Mantener una estructura de proyecto clara
- Seguir convenciones de Java

---

## 🔗 Enlaces Útiles

- [Oracle Java Tutorials - Classes and Objects](https://docs.oracle.com/javase/tutorial/java/concepts/)
- [Java Encapsulation](https://www.w3schools.com/java/java_encapsulation.asp)
- [Maven Getting Started Guide](https://maven.apache.org/guides/getting-started/)
- [Eclipse IDE Documentation](https://www.eclipse.org/documentation/)

---

*Este módulo establece las bases sólidas de la Programación Orientada a Objetos, preparándote para conceptos más avanzados como herencia, polimorfismo e interfaces en los próximos módulos.*

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
