# 🚨 Módulo 23: Manejo de Excepciones en Java

En este módulo aprenderás el manejo robusto de **excepciones** en Java, un concepto fundamental para crear aplicaciones estables y confiables. Dominarás las técnicas de captura, propagación y creación de excepciones personalizadas.

---

## 📚 Contenido del módulo  

1. **Try-Catch-Finally**  
   - Bloque `try` para código que puede generar excepciones.  
   - Bloque `catch` para capturar y manejar excepciones específicas.  
   - Bloque `finally` para código de limpieza que siempre se ejecuta.  
   - Manejo de múltiples tipos de excepciones.  

2. **Throws y Propagación**  
   - Palabra clave `throws` para declarar excepciones que un método puede lanzar.  
   - Propagación de excepciones hacia niveles superiores.  
   - Diferencias entre `throws` y `throw`.  
   - Manejo de excepciones verificadas vs no verificadas.  

3. **Excepciones Propias**  
   - Creación de clases de excepciones personalizadas.  
   - Herencia de `Exception` y `RuntimeException`.  
   - Implementación de constructores específicos.  
   - Uso de códigos de error y mensajes personalizados.  

4. **Try-With-Resources**  
   - Manejo automático de recursos con `AutoCloseable`.  
   - Implementación de la interfaz `AutoCloseable`.  
   - Cierre automático de recursos sin bloques `finally`.  
   - Mejores prácticas para gestión de recursos.  

5. **Validación de Datos**  
   - Validación de entrada de usuario con excepciones.  
   - Manejo de errores de formato y tipo de datos.  
   - Implementación de reglas de negocio con excepciones.  
   - Mensajes de error informativos para el usuario.  

6. **Manejo de Recursos**  
   - Gestión segura de conexiones y archivos.  
   - Patrón try-with-resources para recursos múltiples.  
   - Manejo de excepciones en operaciones de I/O.  
   - Prevención de memory leaks.  

## 🎯 Objetivo
Al finalizar este módulo podrás:  
✅ Implementar **try-catch-finally** para manejo robusto de errores.  
✅ Usar **throws** para propagar excepciones apropiadamente.  
✅ Crear **excepciones personalizadas** para casos específicos.  
✅ Aplicar **try-with-resources** para gestión automática de recursos.  
✅ Validar **datos de entrada** con manejo de excepciones.  
✅ Implementar **patrones de manejo de errores** profesionales.

---

## 🛠️ Tecnologías Utilizadas

- **Java 8+**: Lenguaje de programación principal
- **Eclipse IDE**: Entorno de desarrollo integrado
- **Maven**: Herramienta de gestión de proyectos y dependencias
- **Manejo de Excepciones**: Try-catch, throws, excepciones propias, try-with-resources

---

## 📁 Estructura del Módulo

```
MOD 23/
├── 📄 README.md                    # Este archivo
├── 📁 Laboratorio 01/               # Try-catch básico y validación de fechas
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 Laboratorio.pdf         # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Laboratorio 02/               # Excepciones propias y validación avanzada
│   ├── 📄 README.md               # Documentación del laboratorio
│   ├── 📄 16 - Laboratorio.pdf    # Material teórico
│   └── 📁 src/                    # Código fuente
├── 📁 Desafío/                     # Retos prácticos
│   ├── 📄 README.md               # Documentación de desafíos
│   ├── 📁 Desafio01/              # Try-with-resources con impresoras
│   └── 📁 Desafio02/              # Sistema bancario con excepciones propias
├── 📁 DOCS/                       # Documentación teórica
│   ├── 📄 Excepciones Propias.pdf
│   ├── 📄 Throws conceptos básicos.pdf
│   ├── 📄 Try Catch Finally.pdf
│   └── 📄 Try with Resources.pdf
└── 📁 Material Adicional/         # Ejemplos adicionales
    ├── 📁 Excepciones/
    └── 📁 Throws/
```

---

## 🚀 Cómo Empezar

### Prerrequisitos
- Completar MOD 22 (POO Avanzada)
- Conocimientos sólidos de herencia y polimorfismo
- Comprensión de interfaces y clases abstractas

### Pasos Recomendados
1. **Lee la documentación teórica** en la carpeta `DOCS/`
2. **Comienza con Laboratorio 01** para entender try-catch básico
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

### 🔹 **Try-Catch-Finally**
- **`try`**: Bloque de código que puede generar excepciones
- **`catch`**: Captura y maneja excepciones específicas
- **`finally`**: Código que siempre se ejecuta (limpieza)
- **Múltiples catch**: Manejo de diferentes tipos de excepciones

### 🔹 **Throws y Propagación**
- **`throws`**: Declara excepciones que un método puede lanzar
- **Propagación**: Pasar excepciones a niveles superiores
- **`throw`**: Lanzar excepciones manualmente
- **Excepciones verificadas**: Deben ser declaradas o capturadas

### 🔹 **Excepciones Propias**
- **Herencia**: Extender de `Exception` o `RuntimeException`
- **Constructores**: Implementar constructores específicos
- **Códigos de error**: Sistema de códigos para identificar errores
- **Mensajes personalizados**: Información específica del error

### 🔹 **Try-With-Resources**
- **`AutoCloseable`**: Interfaz para recursos que se pueden cerrar
- **Cierre automático**: Recursos se cierran automáticamente
- **Múltiples recursos**: Manejo de varios recursos simultáneamente
- **Sin finally**: No necesita bloques finally para cerrar recursos

### 🔹 **Validación de Datos**
- **Entrada de usuario**: Validación de datos ingresados
- **Reglas de negocio**: Implementación de validaciones específicas
- **Mensajes informativos**: Errores claros para el usuario
- **Recuperación**: Estrategias para manejar errores de validación

### 🔹 **Manejo de Recursos**
- **Conexiones**: Gestión segura de conexiones a BD
- **Archivos**: Manejo seguro de operaciones de archivo
- **Memory leaks**: Prevención de pérdidas de memoria
- **Patrones**: Implementación de patrones de manejo de recursos

---

## 📈 Progresión de Aprendizaje

| Laboratorio | Conceptos Principales | Nivel |
|-------------|----------------------|-------|
| **Lab 01** | Try-catch básico, validación de fechas | 🟢 Básico |
| **Lab 02** | Excepciones propias, validación avanzada | 🟡 Intermedio |

---

## 💡 Buenas Prácticas

### ✅ **Manejo de Excepciones**
- Capturar excepciones específicas, no genéricas
- Usar mensajes de error informativos
- Implementar logging apropiado
- No ignorar excepciones silenciosamente

### ✅ **Try-With-Resources**
- Usar para todos los recursos que implementen `AutoCloseable`
- Preferir sobre try-catch-finally manual
- Manejar múltiples recursos en un solo try
- Verificar que los recursos implementen `AutoCloseable`

### ✅ **Excepciones Propias**
- Crear jerarquías lógicas de excepciones
- Usar códigos de error para identificación
- Implementar constructores apropiados
- Documentar cuándo y por qué lanzar cada excepción

### ✅ **Validación de Datos**
- Validar entrada lo antes posible
- Proporcionar mensajes de error claros
- Implementar reglas de negocio consistentes
- Permitir recuperación cuando sea posible

---

## 🔗 Enlaces Útiles

- [Oracle Java Tutorials - Exceptions](https://docs.oracle.com/javase/tutorial/essential/exceptions/)
- [Java Exception Handling](https://www.w3schools.com/java/java_try_catch.asp)
- [Java Try-With-Resources](https://docs.oracle.com/javase/tutorial/essential/exceptions/tryResourceClose.html)
- [Java Custom Exceptions](https://www.baeldung.com/java-new-custom-exception)

---

*Este módulo establece las bases para el manejo robusto de errores en Java, preparándote para el desarrollo de aplicaciones empresariales confiables y mantenibles.*

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
