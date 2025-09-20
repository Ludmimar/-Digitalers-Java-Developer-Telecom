# Desafío 01 - Manejo de Colecciones con Genéricos

## Descripción

Este desafío implementa un sistema para manejar documentos y códigos de teléfono utilizando colecciones HashSet y TreeSet con tipos genéricos. El objetivo es demostrar el uso de genéricos, la diferencia entre colecciones no ordenadas y ordenadas, y el manejo de elementos únicos.

## Funcionalidades

### 📄 Gestión de Documentos (AppDocumento.java)
- Permite al usuario ingresar documentos interactivamente
- Utiliza HashSet para garantizar que no se dupliquen documentos
- Muestra si un documento fue agregado exitosamente o ya existía
- Lista todos los documentos ingresados

### 📞 Gestión de Códigos de País (AppTelefono.java)
- Carga predefinida de códigos de país
- Utiliza TreeSet para mantener los códigos ordenados automáticamente
- Demuestra el ordenamiento natural de elementos
- Maneja duplicados (el mismo código aparece dos veces pero solo se almacena una)

## Conceptos Técnicos Aplicados

### Genéricos
- **Clase Parametros**: Implementa una clase genérica para manejar pares clave-valor
- **Tipos parametrizados**: `<String, String>` para documentos, `<Integer, String>` para teléfonos
- **Reutilización de código**: La misma clase funciona para diferentes tipos de datos

### Colecciones
- **HashSet**: Para documentos (no permite duplicados, sin orden específico)
- **TreeSet**: Para códigos de país (no permite duplicados, ordenamiento automático)
- **Iterator**: Para recorrer las colecciones de forma segura

### Entrada de Datos
- **Scanner**: Para entrada interactiva desde consola
- **Validación**: Manejo de entrada de usuario con bucles de validación

## Estructura del Proyecto

```
Desafio01/
├── src/main/java/com/educacionit/desafio01/
│   ├── AppDocumento.java          # Aplicación para manejo de documentos
│   ├── AppTelefono.java           # Aplicación para códigos de país
│   └── entidades/
│       └── Parametros.java        # Clase genérica para pares clave-valor
├── pom.xml                        # Configuración Maven
└── README.md                      # Este archivo
```

## Cómo Ejecutar

### Opción 1: Usando Maven
```bash
# Navegar al directorio
cd Desafio01

# Compilar
mvn compile

# Ejecutar AppDocumento
mvn exec:java -Dexec.mainClass="com.educacionit.desafio01.AppDocumento"

# Ejecutar AppTelefono
mvn exec:java -Dexec.mainClass="com.educacionit.desafio01.AppTelefono"
```

### Opción 2: Compilación manual
```bash
# Compilar
javac -d target/classes src/main/java/com/educacionit/desafio01/entidades/Parametros.java
javac -cp target/classes -d target/classes src/main/java/com/educacionit/desafio01/AppDocumento.java
javac -cp target/classes -d target/classes src/main/java/com/educacionit/desafio01/AppTelefono.java

# Ejecutar
java -cp target/classes com.educacionit.desafio01.AppDocumento
java -cp target/classes com.educacionit.desafio01.AppTelefono
```

## Ejemplo de Uso

### AppDocumento
```
Indique el tipo de documento: DNI
Indique la descripcion del DNI: 12345678
Se agrego el documento: Parametros [clave=DNI, valor=12345678]
¿desea agregar mas documentos? (S/N): S

Indique el tipo de documento: PASAPORTE
Indique la descripcion del PASAPORTE: AB123456
Se agrego el documento: Parametros [clave=PASAPORTE, valor=AB123456]
¿desea agregar mas documentos? (S/N): N

Lista de Documentos:
Parametros [clave=DNI, valor=12345678]
Parametros [clave=PASAPORTE, valor=AB123456]
```

### AppTelefono
```
Lista de Documentos:
Parametros [clave=34, valor=España]
Parametros [clave=54, valor=Argentina]
Parametros [clave=56, valor=Chile]
Parametros [clave=57, valor=Colombia]
Parametros [clave=58, valor=Venezuela]
```

## Puntos de Aprendizaje

### 1. Diferencias entre HashSet y TreeSet
- **HashSet**: Más rápido para operaciones básicas, sin orden garantizado
- **TreeSet**: Más lento pero mantiene elementos ordenados automáticamente

### 2. Uso de Genéricos
- Permite crear código reutilizable y type-safe
- La clase `Parametros` funciona con cualquier tipo de datos
- Evita casting explícito y errores de tipo en tiempo de ejecución

### 3. Manejo de Duplicados
- HashSet y TreeSet automáticamente previenen duplicados
- El método `add()` retorna `false` si el elemento ya existe

### 4. Iterator Pattern
- Forma segura de recorrer colecciones
- Permite modificar la colección durante la iteración (en algunos casos)


## Evaluación

Este desafío será evaluado considerando:
- ✅ Comprensión del uso de genéricos
- ✅ Diferenciación entre HashSet y TreeSet
- ✅ Manejo correcto de entrada de datos
- ✅ Implementación de la clase genérica Parametros
- ✅ Uso apropiado del Iterator
- ✅ Calidad del código y comentarios

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---


