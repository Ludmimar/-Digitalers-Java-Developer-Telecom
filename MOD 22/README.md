# 🏗️ Módulo 22: Programación Orientada a Objetos Avanzada

En este módulo profundizarás en los conceptos avanzados de **Programación Orientada a Objetos (POO)**, explorando herencia, polimorfismo, interfaces, miembros estáticos y otros principios fundamentales que hacen de Java un lenguaje robusto y flexible.

---

## 📚 Contenido del módulo  

1. **Miembros Estáticos (Static)**  
   - Variables y métodos de clase vs instancia.  
   - Uso de `static` para atributos y métodos compartidos.  
   - Contadores de instancias y utilidades de clase.  

2. **Herencia**  
   - Concepto de herencia y relación "es-un".  
   - Palabra clave `extends` y jerarquías de clases.  
   - Constructores en herencia y uso de `super()`.  
   - Sobrescritura de métodos con `@Override`.  

3. **Polimorfismo**  
   - Definición y tipos de polimorfismo.  
   - Polimorfismo de tiempo de ejecución.  
   - Uso de referencias de clase padre para objetos hijos.  
   - Métodos virtuales y enlace dinámico.  

4. **Clases Abstractas**  
   - Concepto de abstracción y clases abstractas.  
   - Palabra clave `abstract` para clases y métodos.  
   - Diferencias entre clases abstractas e interfaces.  
   - Implementación de métodos abstractos.  

5. **Interfaces**  
   - Definición y propósito de las interfaces.  
   - Implementación de interfaces con `implements`.  
   - Métodos por defecto y constantes en interfaces.  
   - Múltiples implementaciones de interfaces.  

6. **Casteo (Casting)**  
   - Casteo implícito y explícito en herencia.  
   - Operador `instanceof` para verificación de tipos.  
   - Casteo seguro y manejo de errores.  
   - Diferencias entre casteo de objetos y tipos primitivos.  

7. **For Each y Arrays**  
   - Bucle `for-each` para iteración simplificada.  
   - Manejo de arrays de objetos con herencia.  
   - Polimorfismo en colecciones de objetos.  

## 🎯 Objetivo
Al finalizar este módulo podrás:  
✅ Implementar **miembros estáticos** para funcionalidad compartida.  
✅ Diseñar **jerarquías de herencia** apropiadas y eficientes.  
✅ Aplicar **polimorfismo** para código flexible y extensible.  
✅ Crear **clases abstractas** e **interfaces** bien diseñadas.  
✅ Manejar **casteo** de objetos de forma segura.  
✅ Utilizar **for-each** y trabajar con arrays polimórficos.

---

## 🛠️ Tecnologías Utilizadas

- **Java 8+**: Lenguaje de programación principal
- **Eclipse IDE**: Entorno de desarrollo integrado
- **Maven**: Herramienta de gestión de proyectos y dependencias
- **POO Avanzada**: Herencia, Polimorfismo, Interfaces, Clases Abstractas

---

## 📁 Estructura del Módulo

```
MOD 22/
├── 📄 README.md                    # Este archivo
├── 📁 Laboratorio 1/               # Miembros estáticos y contadores
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Laboratorio 2/               # Herencia básica
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Laboratorio 3/               # Herencia avanzada y polimorfismo
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Laboratorio 4/               # Interfaces y clases abstractas
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Desafío/                     # Retos prácticos
│   ├── 📄 README.md               # Documentación de desafíos
│   ├── 📁 Desafío 01/             # Sistema de productos perecederos
│   └── 📁 Desafío 2/              # Sistema bancario con herencia
├── 📁 DOCS/                       # Documentación teórica
│   ├── 📄 Abstracción- usos y conceptos básicos.pdf
│   ├── 📄 Casteo-conceptos y usos.pdf
│   ├── 📄 For Each.pdf
│   ├── 📄 Herencia.pdf
│   ├── 📄 Interfaces- conceptos básicos.pdf
│   ├── 📄 Miembros de Clase.pdf
│   ├── 📄 Miembros- Conceptos básicos.pdf
│   └── 📄 Polimorfismo usos y casos.pdf
└── 📁 Material Adicional/         # Ejemplos adicionales
    ├── 📁 ForEach/
    ├── 📁 Interfaces/
    └── 📁 Polimorfismo/
```

---

## 🚀 Cómo Empezar

### Prerrequisitos
- Completar MOD 21 (Fundamentos de POO)
- Conocimientos sólidos de encapsulación y constructores
- Comprensión de clases, objetos y métodos

### Pasos Recomendados
1. **Lee la documentación teórica** en la carpeta `DOCS/`
2. **Comienza con Laboratorio 1** para entender miembros estáticos
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

### 🔹 **Miembros Estáticos**
- **Variables estáticas**: Compartidas entre todas las instancias
- **Métodos estáticos**: Invocados sin crear instancias
- **Contadores**: Seguimiento de número de objetos creados
- **Utilidades**: Métodos de clase para operaciones comunes

### 🔹 **Herencia**
- **Clase padre/superclase**: Clase base que se extiende
- **Clase hija/subclase**: Clase que hereda de otra
- **`extends`**: Palabra clave para establecer herencia
- **`super()`**: Llamada al constructor de la clase padre

### 🔹 **Polimorfismo**
- **Tiempo de compilación**: Sobrecarga de métodos
- **Tiempo de ejecución**: Sobrescritura de métodos
- **Enlace dinámico**: Resolución de métodos en tiempo de ejecución
- **Referencias polimórficas**: Una referencia puede apuntar a diferentes tipos

### 🔹 **Clases Abstractas**
- **`abstract`**: Palabra clave para clases y métodos abstractos
- **No instanciables**: No se pueden crear objetos directamente
- **Métodos abstractos**: Deben ser implementados por las subclases
- **Implementación parcial**: Pueden tener métodos concretos y abstractos

### 🔹 **Interfaces**
- **`interface`**: Define un contrato que las clases deben cumplir
- **`implements`**: Palabra clave para implementar interfaces
- **Múltiples interfaces**: Una clase puede implementar varias interfaces
- **Métodos por defecto**: Implementación por defecto en interfaces

### 🔹 **Casteo**
- **Implícito**: Automático (hijo a padre)
- **Explícito**: Manual con `(Tipo) objeto`
- **`instanceof`**: Verificación de tipo antes del casteo
- **Seguridad**: Verificación para evitar `ClassCastException`

---

## 📈 Progresión de Aprendizaje

| Laboratorio | Conceptos Principales | Nivel |
|-------------|----------------------|-------|
| **Lab 1** | Miembros estáticos, contadores | 🟢 Básico |
| **Lab 2** | Herencia básica, constructores | 🟡 Intermedio |
| **Lab 3** | Herencia avanzada, polimorfismo | 🟠 Avanzado |
| **Lab 4** | Interfaces, clases abstractas | 🔴 Experto |

---

## 💡 Buenas Prácticas

### ✅ **Diseño de Herencia**
- Usar herencia solo cuando existe relación "es-un"
- Evitar herencia profunda (más de 3-4 niveles)
- Preferir composición sobre herencia cuando sea apropiado
- Documentar jerarquías de herencia claramente

### ✅ **Polimorfismo**
- Usar referencias de clase padre cuando sea posible
- Implementar métodos virtuales correctamente
- Aprovechar el enlace dinámico para flexibilidad
- Mantener consistencia en la interfaz de métodos

### ✅ **Interfaces**
- Diseñar interfaces cohesivas y específicas
- Usar interfaces para definir contratos claros
- Implementar múltiples interfaces cuando sea apropiado
- Documentar el comportamiento esperado

### ✅ **Miembros Estáticos**
- Usar solo para funcionalidad verdaderamente compartida
- Evitar estado mutable en variables estáticas
- Documentar el propósito de métodos estáticos
- Considerar thread-safety en aplicaciones concurrentes

---

## 🔗 Enlaces Útiles

- [Oracle Java Tutorials - Inheritance](https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html)
- [Java Polymorphism](https://www.w3schools.com/java/java_polymorphism.asp)
- [Java Interfaces](https://docs.oracle.com/javase/tutorial/java/IandI/createinterface.html)
- [Java Abstract Classes](https://docs.oracle.com/javase/tutorial/java/IandI/abstract.html)

---

*Este módulo establece las bases avanzadas de la Programación Orientada a Objetos, preparándote para el desarrollo de aplicaciones complejas y el uso de frameworks modernos de Java.*

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
