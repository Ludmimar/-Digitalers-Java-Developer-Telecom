# Desafíos - MOD 23: Manejo de Excepciones en Java

Este directorio contiene los desafíos prácticos del Módulo 23, enfocados en la aplicación avanzada de conceptos de **manejo de excepciones** en Java, incluyendo try-with-resources, excepciones propias y gestión robusta de recursos.

## 📋 Contenido

### Desafío 01: Try-With-Resources con Impresoras
**Objetivo:** Implementar el patrón try-with-resources para gestión automática de recursos con la interfaz `AutoCloseable`.

#### Características:
- **AutoCloseable**: Implementación de la interfaz para cierre automático de recursos
- **Try-with-resources**: Manejo automático de recursos sin bloques `finally`
- **Validación de entrada**: Verificación de impresoras disponibles
- **Manejo de excepciones**: Captura y manejo de errores de I/O
- **Cierre automático**: Recursos se cierran automáticamente al salir del bloque

#### Estructura del Proyecto:
```
Desafio01/
├── src/main/java/com/educacionit/desafio01/
│   ├── App.java                    # Clase principal con try-with-resources
│   └── entidades/
│       └── Impresora.java         # Entidad con AutoCloseable
├── pom.xml                         # Configuración Maven
└── target/                        # Archivos compilados
```

#### Conceptos Aplicados:
- ✅ Try-with-resources para gestión automática
- ✅ Implementación de AutoCloseable
- ✅ Validación de recursos disponibles
- ✅ Manejo de excepciones de I/O
- ✅ Cierre automático de recursos
- ✅ Prevención de memory leaks

---

### Desafío 02: Sistema Bancario con Excepciones Propias
**Objetivo:** Crear un sistema bancario robusto con excepciones personalizadas y manejo avanzado de errores.

#### Características:
- **Excepciones propias**: `TipoProductoExcepcion` con códigos de error específicos
- **Sistema de códigos**: Identificación de errores bancarios específicos
- **Validación de productos**: Verificación de tipos de cuenta válidos
- **Gestión de errores**: Manejo robusto de errores del sistema bancario
- **Mensajes informativos**: Información específica para cada tipo de error

#### Estructura del Proyecto:
```
Desafio02/
├── src/main/java/com/educacionit/desafio02/
│   ├── App.java                    # Clase principal con sistema bancario
│   ├── entidades/
│   │   ├── Cuenta.java            # Entidad Cuenta bancaria
│   │   ├── TarjetaCredito.java    # Entidad Tarjeta de crédito
│   │   ├── Producto.java          # Entidad Producto bancario
│   │   └── ErrorBanco.java         # Entidad Error bancario
│   ├── excepciones/
│   │   └── TipoProductoExcepcion.java # Excepción personalizada
│   ├── interfaces/
│   │   └── NumeroProducto.java     # Interfaz para productos
│   └── utilidades/
│       └── Formatos.java           # Utilidades de formato
├── pom.xml                         # Configuración Maven
└── target/                        # Archivos compilados
```

#### Conceptos Aplicados:
- ✅ Excepciones propias con códigos de error
- ✅ Sistema de identificación de errores bancarios
- ✅ Validación de tipos de producto
- ✅ Manejo robusto de errores del sistema
- ✅ Mensajes informativos específicos
- ✅ Gestión de recursos bancarios

---

## 🎯 Objetivos de Aprendizaje

Al completar estos desafíos, el estudiante habrá desarrollado competencias en:

1. **Try-With-Resources:** Implementación de gestión automática de recursos
2. **AutoCloseable:** Creación de recursos que se cierran automáticamente
3. **Excepciones Propias:** Diseño de excepciones específicas del dominio
4. **Sistema de Códigos:** Implementación de identificación de errores
5. **Validación Robusta:** Manejo de errores en sistemas complejos
6. **Gestión de Recursos:** Prevención de memory leaks y recursos no cerrados

## 🚀 Cómo Ejecutar

### Prerrequisitos:
- Java JDK 8 o superior
- Maven 3.6 o superior
- Completar los laboratorios del MOD 23

### Pasos:
1. Navegar al directorio del desafío deseado
2. Compilar el proyecto: `mvn compile`
3. Ejecutar la aplicación: `mvn exec:java -Dexec.mainClass="com.educacionit.desafio0X.App"`

### Ejemplo:
```bash
cd "Desafio01"
mvn compile
mvn exec:java -Dexec.mainClass="com.educacionit.desafio01.App"
```

## 📚 Conceptos Teóricos Relacionados

### Try-With-Resources
- **AutoCloseable**: Interfaz que debe implementar cualquier recurso
- **Cierre automático**: Recursos se cierran automáticamente al salir del bloque
- **Múltiples recursos**: Manejo de varios recursos simultáneamente
- **Sin finally**: No necesita bloques finally para cerrar recursos

### Excepciones Propias
- **Herencia**: Extender de `Exception` o `RuntimeException`
- **Constructores**: Implementar constructores específicos
- **Códigos de error**: Sistema de identificación numérica
- **Mensajes personalizados**: Información específica del error

### Gestión de Recursos
- **Conexiones**: Gestión segura de conexiones a BD
- **Archivos**: Manejo seguro de operaciones de archivo
- **Memory leaks**: Prevención de pérdidas de memoria
- **Patrones**: Implementación de patrones de manejo de recursos

## 🔗 Enlaces Útiles

- [Oracle Java Tutorials - Try-With-Resources](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html)
- [Java AutoCloseable Interface](https://docs.oracle.com/javase/8/docs/api/java/lang/AutoCloseable.html)
- [Java Custom Exceptions](https://www.baeldung.com/java-new-custom-exception)
- [Java Exception Handling Best Practices](https://www.baeldung.com/java-exceptions)

## 💡 Consejos para Resolver los Desafíos

### Desafío 01 - Try-With-Resources
1. **Implementa AutoCloseable**: Crea la clase Impresora implementando AutoCloseable
2. **Método close()**: Implementa el método close() para limpiar recursos
3. **Try-with-resources**: Usa try-with-resources en la clase principal
4. **Validación**: Implementa validación de impresoras disponibles
5. **Manejo de excepciones**: Captura y maneja excepciones de I/O

### Desafío 02 - Sistema Bancario
1. **Excepciones propias**: Crea TipoProductoExcepcion con códigos de error
2. **Sistema de códigos**: Implementa identificación de errores específicos
3. **Validación**: Valida tipos de producto bancario
4. **Mensajes informativos**: Proporciona información específica para cada error
5. **Gestión robusta**: Implementa manejo robusto de errores del sistema

## 🎓 Puntos de Evaluación

### Criterios de Evaluación:
- ✅ **Try-with-resources**: Implementación correcta de AutoCloseable
- ✅ **Excepciones propias**: Creación de excepciones específicas del dominio
- ✅ **Sistema de códigos**: Implementación de identificación de errores
- ✅ **Validación robusta**: Manejo de errores en sistemas complejos
- ✅ **Gestión de recursos**: Prevención de memory leaks
- ✅ **Mensajes informativos**: Información específica para cada error

### Niveles de Complejidad:
- **Básico**: Implementación de try-with-resources simple
- **Intermedio**: Excepciones propias con códigos de error
- **Avanzado**: Sistema complejo con múltiples tipos de error
- **Experto**: Gestión robusta de recursos en sistemas empresariales

## 🔧 Herramientas de Desarrollo

### IDE Recomendado:
- **Eclipse**: Para desarrollo Java con soporte completo de excepciones
- **IntelliJ IDEA**: Alternativa con excelente soporte de debugging
- **VS Code**: Con extensiones de Java para desarrollo ligero

### Plugins Útiles:
- **Exception Analyzer**: Para analizar patrones de excepciones
- **Resource Management**: Para verificar gestión de recursos
- **Code Coverage**: Para verificar cobertura de manejo de excepciones

## 📈 Progresión de Aprendizaje

| Desafío | Conceptos Principales | Nivel |
|---------|----------------------|-------|
| **Desafío 01** | Try-with-resources, AutoCloseable | 🟡 Intermedio |
| **Desafío 02** | Excepciones propias, Sistema de códigos | 🟠 Avanzado |

## 🏆 Logros Alcanzados

Al completar estos desafíos habrás logrado:
- ✅ Dominar el manejo avanzado de excepciones en Java
- ✅ Implementar try-with-resources para gestión automática de recursos
- ✅ Crear excepciones propias específicas del dominio
- ✅ Diseñar sistemas robustos de manejo de errores
- ✅ Prevenir memory leaks y recursos no cerrados
- ✅ Aplicar mejores prácticas de manejo de excepciones

---

*Estos desafíos consolidan el aprendizaje del manejo robusto de excepciones, preparándote para el desarrollo de aplicaciones empresariales confiables y mantenibles.*

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
