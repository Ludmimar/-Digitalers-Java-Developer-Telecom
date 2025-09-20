# Desafío 02 - Sistema Bancario con Colecciones y Comparadores

## Descripción

Este desafío implementa un sistema bancario simplificado que maneja diferentes tipos de productos financieros (cuentas bancarias y tarjetas de crédito) utilizando colecciones, comparadores personalizados, enumerados y manejo de excepciones. El objetivo es demostrar el uso de patrones de diseño, ordenamiento personalizado y manejo de errores en un contexto real.

## Funcionalidades

### 🏦 Gestión de Productos Financieros
- **Cuentas Bancarias**: Cuentas Corrientes (CC) y Cuentas de Ahorro (CA)
- **Tarjetas de Crédito**: Con límite de crédito y tasa de interés
- **Ordenamiento**: Por número de producto en orden descendente
- **Manejo de Errores**: Excepciones personalizadas para productos inexistentes

## Conceptos Técnicos Aplicados

### Herencia y Polimorfismo
- **Clase Producto**: Clase base abstracta para todos los productos financieros
- **Herencia**: `Cuenta` y `TarjetaCredito` extienden de `Producto`
- **Polimorfismo**: Uso de la clase base para manejar diferentes tipos de productos

### Enumerados
- **TipoCuenta**: Define tipos de cuenta (CC, CA)
- **ErrorBanco**: Define códigos de error del sistema bancario
- **Type Safety**: Previene errores de tipo en tiempo de compilación

### Comparadores Personalizados
- **OrdenProductoNumeroDesc**: Ordena productos por número en orden descendente
- **Comparator Interface**: Implementación de criterios de ordenamiento personalizados

### Manejo de Excepciones
- **TipoProductoExcepcion**: Excepción personalizada para errores de productos
- **Try-Catch**: Manejo seguro de errores en tiempo de ejecución

## Estructura del Proyecto

```
Desafio02/
├── src/main/java/com/educacionit/desafio02/
│   ├── App.java                    # Aplicación principal
│   ├── comparadores/
│   │   └── OrdenProductoNumeroDesc.java
│   ├── entidades/
│   │   ├── Producto.java           # Clase base abstracta
│   │   ├── Cuenta.java             # Implementación de cuenta bancaria
│   │   └── TarjetaCredito.java     # Implementación de tarjeta de crédito
│   ├── enumerados/
│   │   ├── TipoCuenta.java         # Tipos de cuenta
│   │   └── ErrorBanco.java         # Códigos de error
│   ├── excepciones/
│   │   └── TipoProductoExcepcion.java
│   ├── interfaces/
│   │   └── NumeroProducto.java     # Interface para productos numerados
│   └── utilidades/
│       └── Formatos.java           # Utilidades de formato
├── pom.xml
└── README.md
```

## Cómo Ejecutar

### Usando Maven
```bash
# Navegar al directorio
cd Desafio02

# Compilar
mvn compile

# Ejecutar la aplicación
mvn exec:java -Dexec.mainClass="com.educacionit.desafio02.App"
```

### Compilación Manual
```bash
# Compilar todas las clases
javac -d target/classes src/main/java/com/educacionit/desafio02/**/*.java

# Ejecutar
java -cp target/classes com.educacionit.desafio02.App
```

## Ejemplo de Salida

```
Antes de ordenar:

Cuenta - Número: 15, Saldo: 2.0, Tipo: CC
Cuenta - Número: 14, Saldo: 3.0, Tipo: CC
Cuenta - Número: 16, Saldo: 4.0, Tipo: CC
Cuenta - Número: 105, Saldo: 42.0, Tipo: CA
Cuenta - Número: 150, Saldo: 33.0, Tipo: CA
Cuenta - Número: 125, Saldo: 9.0, Tipo: CA
Tarjeta de Crédito - Número: 2, Límite: 15.0, Tasa: 8.0%
Tarjeta de Crédito - Número: 65, Límite: 52.0, Tasa: 9.0%
Tarjeta de Crédito - Número: 87, Límite: 74.0, Tasa: 89.0%

Después de ordenar:

Cuenta - Número: 150, Saldo: 33.0, Tipo: CA
Cuenta - Número: 125, Saldo: 9.0, Tipo: CA
Cuenta - Número: 105, Saldo: 42.0, Tipo: CA
Tarjeta de Crédito - Número: 87, Límite: 74.0, Tasa: 89.0%
Cuenta - Número: 16, Saldo: 4.0, Tipo: CC
Cuenta - Número: 15, Saldo: 2.0, Tipo: CC
Cuenta - Número: 14, Saldo: 3.0, Tipo: CC
Tarjeta de Crédito - Número: 65, Límite: 52.0, Tasa: 9.0%
Tarjeta de Crédito - Número: 2, Límite: 15.0, Tasa: 8.0%
```

## Análisis del Código

### Clase Producto (Abstracta)
```java
public abstract class Producto {
    protected int numero;
    protected double saldo;
    
    public Producto(int numero, double saldo) {
        this.numero = numero;
        this.saldo = saldo;
    }
    
    public abstract String mostrarInformacion();
}
```

### Enumerado TipoCuenta
```java
public enum TipoCuenta {
    CC("Cuenta Corriente"),
    CA("Cuenta de Ahorro");
    
    private final String descripcion;
    
    TipoCuenta(String descripcion) {
        this.descripcion = descripcion;
    }
}
```

### Comparador Personalizado
```java
public class OrdenProductoNumeroDesc implements Comparator<Producto> {
    @Override
    public int compare(Producto p1, Producto p2) {
        return Integer.compare(p2.getNumero(), p1.getNumero()); // Descendente
    }
}
```

## Puntos de Aprendizaje

### 1. Diseño Orientado a Objetos
- **Abstracción**: Clase Producto define comportamiento común
- **Herencia**: Reutilización de código entre Cuenta y TarjetaCredito
- **Polimorfismo**: Lista de Producto puede contener diferentes tipos

### 2. Enumerados
- **Type Safety**: Previene valores inválidos
- **Legibilidad**: Código más claro y mantenible
- **Constantes**: Valores predefinidos y consistentes

### 3. Comparadores
- **Ordenamiento Personalizado**: Criterios específicos de ordenación
- **Flexibilidad**: Diferentes criterios para diferentes necesidades
- **Reutilización**: Un comparador puede usarse en múltiples contextos

### 4. Manejo de Excepciones
- **Excepciones Personalizadas**: Errores específicos del dominio
- **Try-Catch**: Manejo seguro de situaciones de error
- **Propagación**: Re-lanzamiento de excepciones cuando es apropiado

## Evaluación

Este desafío será evaluado considerando:
- ✅ Comprensión de herencia y polimorfismo
- ✅ Uso correcto de enumerados
- ✅ Implementación de comparadores personalizados
- ✅ Manejo apropiado de excepciones
- ✅ Diseño de clases y interfaces
- ✅ Calidad del código y documentación
- ✅ Comprensión de patrones de diseño aplicados

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)

---


