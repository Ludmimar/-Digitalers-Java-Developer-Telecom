# Desafíos - MOD 22: Programación Orientada a Objetos Avanzada

Este directorio contiene los desafíos prácticos del Módulo 22, enfocados en la aplicación de conceptos avanzados de Programación Orientada a Objetos (POO) en Java, incluyendo herencia, polimorfismo, interfaces y miembros estáticos.

## 📋 Contenido

### Desafío 01: Sistema de Productos Perecederos
**Objetivo:** Implementar un sistema de gestión de productos perecederos con herencia y polimorfismo.

#### Características:
- **Herencia**: Clase `ProductoPerecedero` que extiende de una clase base
- **Polimorfismo**: Uso de referencias de clase padre para objetos hijos
- **Miembros estáticos**: Contadores y utilidades compartidas
- **Gestión de clientes**: Array de objetos `Cliente` con información personal
- **Sistema de ofertas**: Lógica de negocio para productos próximos a vencer

#### Estructura del Proyecto:
```
Desafío 01/
├── src/main/java/com/educacionit/desafio01/
│   ├── App.java                    # Clase principal con lógica de ofertas
│   ├── dentidades/
│   │   ├── Cliente.java           # Entidad Cliente con encapsulación
│   │   ├── Documento.java         # Entidad Documento
│   │   └── ProductoPerecedero.java # Entidad Producto con herencia
│   └── utilidades/
│       └── Mensajes.java           # Clase de utilidades estáticas
├── pom.xml                         # Configuración Maven
└── target/                        # Archivos compilados
```

#### Conceptos Aplicados:
- ✅ Herencia (ProductoPerecedero extiende Producto)
- ✅ Polimorfismo con arrays de objetos
- ✅ Miembros estáticos para utilidades
- ✅ Encapsulación completa
- ✅ Composición de objetos (Cliente-Documento)
- ✅ Lógica de negocio con herencia

---

### Desafío 02: Sistema Bancario con Herencia
**Objetivo:** Crear un sistema bancario que demuestre herencia y polimorfismo con diferentes tipos de cuentas.

#### Características:
- **Herencia múltiple**: Jerarquía de clases para diferentes tipos de cuentas
- **Polimorfismo**: Uso de referencias de clase padre para objetos hijos
- **Tipos de cuenta**: Cuenta Corriente (CC) y Cuenta Ahorro (CA)
- **Tarjetas de crédito**: Sistema de tarjetas con herencia
- **Gestión de saldos**: Lógica específica para cada tipo de cuenta

#### Estructura del Proyecto:
```
Desafío 02/
├── src/main/java/com/educacionit/desafio02/
│   ├── App.java                    # Clase principal con gestión bancaria
│   └── entidades/
│       ├── Cuenta.java            # Clase base para cuentas bancarias
│       ├── TarjetaCredito.java    # Entidad Tarjeta con herencia
│       └── Cliente.java           # Entidad Cliente
├── pom.xml                         # Configuración Maven
└── target/                        # Archivos compilados
```

#### Conceptos Aplicados:
- ✅ Herencia compleja (Cuenta → CC/CA)
- ✅ Polimorfismo con diferentes tipos de cuenta
- ✅ Sobrescritura de métodos (@Override)
- ✅ Encapsulación completa
- ✅ Lógica específica por tipo de cuenta
- ✅ Gestión de saldos y transacciones

---

## 🎯 Objetivos de Aprendizaje

Al completar estos desafíos, el estudiante habrá desarrollado competencias en:

1. **Herencia Avanzada:** Implementación de jerarquías complejas de clases
2. **Polimorfismo:** Uso de referencias de clase padre para objetos hijos
3. **Interfaces:** Implementación de contratos de comportamiento
4. **Miembros Estáticos:** Uso de variables y métodos de clase
5. **Sobrescritura:** Implementación de métodos específicos con @Override
6. **Diseño de Sistemas:** Aplicación de principios de POO en sistemas reales

## 🚀 Cómo Ejecutar

### Prerrequisitos:
- Java JDK 8 o superior
- Maven 3.6 o superior
- Completar los laboratorios del MOD 22

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

### Herencia Avanzada
- **Jerarquías complejas:** Múltiples niveles de herencia
- **Relaciones "es-un":** Establecimiento de relaciones naturales
- **Reutilización de código:** Aprovechamiento de funcionalidad base
- **Especialización:** Extensión de funcionalidad en clases hijas

### Polimorfismo
- **Enlace dinámico:** Resolución de métodos en tiempo de ejecución
- **Referencias polimórficas:** Una referencia puede apuntar a diferentes tipos
- **Flexibilidad:** Código que puede trabajar con diferentes tipos de objetos
- **Extensibilidad:** Fácil agregar nuevos tipos sin modificar código existente

### Interfaces
- **Contratos:** Definición de comportamientos que las clases deben cumplir
- **Implementación múltiple:** Una clase puede implementar varias interfaces
- **Flexibilidad:** Permite que clases no relacionadas compartan comportamientos
- **Diseño:** Separación de interfaz de implementación

### Miembros Estáticos
- **Variables de clase:** Compartidas por todas las instancias
- **Métodos de clase:** Accesibles sin crear instancias
- **Utilidades:** Funciones que no requieren estado de instancia
- **Contadores:** Seguimiento de número de objetos creados

## 🔗 Enlaces Útiles

- [Oracle Java Tutorials - Inheritance](https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html)
- [Java Polymorphism](https://www.w3schools.com/java/java_polymorphism.asp)
- [Java Interfaces](https://docs.oracle.com/javase/tutorial/java/IandI/createinterface.html)
- [Java Abstract Classes](https://docs.oracle.com/javase/tutorial/java/IandI/abstract.html)

## 💡 Consejos para Resolver los Desafíos

### Desafío 01 - Productos Perecederos
1. **Analiza la jerarquía:** Identifica la relación entre Producto y ProductoPerecedero
2. **Implementa herencia:** Usa `extends` para establecer la relación padre-hijo
3. **Aplica polimorfismo:** Usa referencias de clase padre para arrays de objetos
4. **Utiliza miembros estáticos:** Para contadores y utilidades compartidas
5. **Implementa lógica de negocio:** Para determinar productos próximos a vencer

### Desafío 02 - Sistema Bancario
1. **Diseña la jerarquía:** Identifica las relaciones entre Cuenta, CC, CA y TarjetaCredito
2. **Implementa herencia:** Usa `extends` para crear la jerarquía de clases
3. **Aplica polimorfismo:** Usa referencias de clase padre para diferentes tipos de cuenta
4. **Sobrescribe métodos:** Implementa comportamientos específicos con `@Override`
5. **Maneja saldos:** Implementa lógica específica para cada tipo de cuenta

## 🎓 Puntos de Evaluación

### Criterios de Evaluación:
- ✅ **Herencia correcta:** Uso apropiado de `extends` y `super()`
- ✅ **Polimorfismo:** Uso de referencias de clase padre
- ✅ **Encapsulación:** Implementación correcta de getters/setters
- ✅ **Sobrescritura:** Uso de `@Override` para métodos específicos
- ✅ **Miembros estáticos:** Implementación de variables y métodos de clase
- ✅ **Lógica de negocio:** Implementación correcta de la funcionalidad requerida

### Niveles de Complejidad:
- **Básico:** Implementación de herencia simple
- **Intermedio:** Aplicación de polimorfismo con arrays
- **Avanzado:** Implementación de interfaces y miembros estáticos
- **Experto:** Diseño de sistemas complejos con múltiples niveles de herencia

## 🔧 Herramientas de Desarrollo

### IDE Recomendado:
- **Eclipse:** Para desarrollo Java con soporte completo de POO
- **IntelliJ IDEA:** Alternativa con excelente soporte de refactoring
- **VS Code:** Con extensiones de Java para desarrollo ligero

### Plugins Útiles:
- **Java Decompiler:** Para analizar código compilado
- **UML Plugins:** Para visualizar jerarquías de herencia
- **Code Coverage:** Para verificar cobertura de pruebas

## 📈 Progresión de Aprendizaje

| Desafío | Conceptos Principales | Nivel |
|---------|----------------------|-------|
| **Desafío 01** | Herencia, Polimorfismo, Miembros estáticos | 🟡 Intermedio |
| **Desafío 02** | Herencia compleja, Polimorfismo avanzado | 🟠 Avanzado |

## 🏆 Logros Alcanzados

Al completar estos desafíos habrás logrado:
- ✅ Dominar los conceptos avanzados de POO en Java
- ✅ Implementar jerarquías complejas de herencia
- ✅ Aplicar polimorfismo en sistemas reales
- ✅ Diseñar interfaces y contratos de comportamiento
- ✅ Crear sistemas extensibles y mantenibles
- ✅ Aplicar buenas prácticas de diseño orientado a objetos

---

*Estos desafíos consolidan el aprendizaje de los conceptos avanzados de POO, preparándote para el desarrollo de aplicaciones empresariales y el uso de frameworks modernos de Java.*

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---
