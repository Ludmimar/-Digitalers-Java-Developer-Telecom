# Desafíos - MOD 24

## Descripción General

Esta carpeta contiene una serie de desafíos prácticos diseñados para reforzar y aplicar los conceptos avanzados de Java SE aprendidos en el módulo. Cada desafío presenta un problema específico que requiere el uso de colecciones, enumerados, genéricos y otras características avanzadas del lenguaje.

## Lista de Desafíos

### 🎯 Desafío 01 - Manejo de Colecciones con Genéricos
**Ubicación**: `Desafio01/`

**Descripción**: Implementación de un sistema para manejar documentos y teléfonos utilizando HashSet y TreeSet con tipos genéricos.

**Conceptos aplicados**:
- Genéricos con tipos parametrizados
- HashSet para elementos únicos
- TreeSet para elementos ordenados
- Iterator para recorrer colecciones
- Entrada de datos por consola

**Archivos principales**:
- `AppDocumento.java`: Manejo de documentos con HashSet
- `AppTelefono.java`: Manejo de códigos de país con TreeSet
- `Parametros.java`: Clase genérica para pares clave-valor

### 🏦 Desafío 02 - Sistema Bancario
**Ubicación**: `Desafio02/`

**Descripción**: Implementación de un sistema bancario que maneja diferentes tipos de productos financieros (cuentas y tarjetas de crédito) con ordenamiento personalizado.

**Conceptos aplicados**:
- Listas y ordenamiento
- Comparadores personalizados
- Enumerados para tipos de cuenta
- Manejo de excepciones personalizadas
- Herencia y polimorfismo

**Archivos principales**:
- `App.java`: Aplicación principal del sistema bancario
- `Producto.java`: Clase base para productos financieros
- `Cuenta.java`: Implementación de cuentas bancarias
- `TarjetaCredito.java`: Implementación de tarjetas de crédito
- `OrdenProductoNumeroDesc.java`: Comparador para ordenamiento

### 🔧 Desafío 03 - Implementación en Dos Partes
**Ubicación**: `Desafio03/`

**Descripción**: Desafío dividido en dos partes que presenta diferentes enfoques de implementación para resolver problemas complejos.

**Parte 1**: `parte 1/`
- Implementación básica de conceptos fundamentales

**Parte 2**: `parte 2/`
- Implementación avanzada con características adicionales

## Cómo Ejecutar los Desafíos

### Requisitos
- Java JDK 8 o superior
- Maven 3.6 o superior

### Pasos para ejecutar

1. **Navegar al desafío deseado**:
   ```bash
   cd Desafio01  # o Desafio02, Desafio03
   ```

2. **Compilar el proyecto**:
   ```bash
   mvn compile
   ```

3. **Ejecutar la aplicación**:
   ```bash
   mvn exec:java -Dexec.mainClass="com.educacionit.desafio01.AppDocumento"
   ```

4. **Ejecutar pruebas** (si están disponibles):
   ```bash
   mvn test
   ```

## Estructura Común

Cada desafío sigue una estructura Maven estándar:

```
DesafioXX/
├── src/
│   ├── main/
│   │   └── java/
│   │       └── com/
│   │           └── educacionit/
│   │               └── desafioXX/
│   │                   ├── App.java
│   │                   ├── entidades/
│   │                   ├── enumerados/
│   │                   ├── interfaces/
│   │                   ├── comparadores/
│   │                   └── utilidades/
│   └── test/
│       └── java/
├── target/
└── pom.xml
```

## Objetivos de Aprendizaje

Al completar estos desafíos, los estudiantes desarrollarán:

1. **Competencia en genéricos**: Uso efectivo de tipos parametrizados
2. **Manejo de colecciones**: Implementación de diferentes tipos de colecciones
3. **Diseño de comparadores**: Creación de criterios de ordenamiento personalizados
4. **Uso de enumerados**: Implementación de tipos seguros y legibles
5. **Manejo de excepciones**: Implementación de excepciones personalizadas
6. **Arquitectura de software**: Diseño de sistemas modulares y extensibles

## Consejos para Resolver los Desafíos

1. **Lee completamente** el código antes de ejecutarlo
2. **Identifica los patrones** de diseño utilizados
3. **Experimenta** modificando parámetros y estructuras
4. **Documenta** tus observaciones sobre el comportamiento
5. **Prueba casos límite** para entender mejor el funcionamiento

## Evaluación

Cada desafío será evaluado considerando:
- ✅ Comprensión de los conceptos aplicados
- ✅ Calidad del código implementado
- ✅ Uso correcto de las estructuras de datos
- ✅ Manejo apropiado de excepciones
- ✅ Documentación y comentarios

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---

