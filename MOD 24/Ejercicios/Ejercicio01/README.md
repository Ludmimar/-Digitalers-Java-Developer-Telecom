# Sistema de Estado de Pedidos

Este proyecto implementa un sistema simple para gestionar el estado de pedidos en Java.

## Descripción

El sistema permite crear pedidos y rastrear su estado a través de diferentes fases del proceso de entrega.

## Estados de Pedidos

- **NUEVO** → El pedido recién fue creado
- **PROCESANDO** → El pedido está siendo preparado
- **ENVIADO** → El pedido salió del depósito
- **ENTREGADO** → El pedido llegó al cliente
- **CANCELADO** → El pedido fue cancelado

## Estructura del Proyecto

```
src/
├── EstadoPedido.java    # Enum que define los estados posibles
├── Pedido.java          # Clase principal que representa un pedido
└── Main.java            # Clase principal con ejemplos de uso
```

## Clases

### EstadoPedido (Enum)
Define los posibles estados de un pedido:
- `NUEVO`
- `PROCESANDO`
- `ENVIADO`
- `ENTREGADO`
- `CANCELADO`

### Pedido (Clase)
Representa un pedido con las siguientes características:

**Atributos:**
- `id` (int): Identificador único del pedido
- `estado` (EstadoPedido): Estado actual del pedido
- `cliente` (String): Nombre del cliente

**Métodos:**
- `Pedido(int id, EstadoPedido estado, String cliente)`: Constructor
- `mostrarInfo()`: Muestra la información completa del pedido
- `avanzarEstado()`: Avanza al siguiente estado en la secuencia (NUEVO → PROCESANDO → ENVIADO → ENTREGADO)
- Getters y setters para todos los atributos

## Ejemplo de Uso

```java
// Crear un nuevo pedido
Pedido pedido = new Pedido(1, EstadoPedido.NUEVO, "Juan Pérez");

// Mostrar información del pedido
pedido.mostrarInfo();

// Avanzar al siguiente estado automáticamente
pedido.avanzarEstado(); // NUEVO → PROCESANDO
pedido.mostrarInfo();

pedido.avanzarEstado(); // PROCESANDO → ENVIADO
pedido.mostrarInfo();

pedido.avanzarEstado(); // ENVIADO → ENTREGADO
pedido.mostrarInfo();

// Intentar avanzar cuando ya está entregado (no hace nada)
pedido.avanzarEstado(); // ENTREGADO → no cambia
```

## Compilación y Ejecución

Para compilar y ejecutar el proyecto:

```bash
# Compilar todas las clases
javac *.java

# Ejecutar el programa principal
java Main
```

## Salida Esperada

```
=== Información del Pedido ===
ID: 1
Estado: NUEVO
Cliente: Juan Pérez
==============================
=== Información del Pedido ===
ID: 2
Estado: PROCESANDO
Cliente: María García
==============================
=== Información del Pedido ===
ID: 3
Estado: ENTREGADO
Cliente: Carlos López
==============================

--- Cambiando estado del pedido 1 ---
=== Información del Pedido ===
ID: 1
Estado: PROCESANDO
Cliente: Juan Pérez
==============================
```

## Características

- ✅ Enum para estados de pedidos
- ✅ Clase Pedido con constructor
- ✅ Método para mostrar información
- ✅ Método para avanzar estados automáticamente
- ✅ Protección contra avance en estados finales (ENTREGADO/CANCELADO)
- ✅ Getters y setters para modificación
- ✅ Ejemplos de uso en Main.java
- ✅ Código compilable y ejecutable

## Requisitos

- Java JDK 8 o superior
- Compilador javac
- Terminal o IDE compatible con Java
---

## 👨‍💻 Autor

**Desarrollador**: Ludmila Martos

## 📞 Contacto

- **Email**: [ludmilamartos@gmail.com](mailto:ludmilamartos@gmail.com)
- **LinkedIn**: [ludmimar89](https://www.linkedin.com/in/ludmimar89/)
- **GitHub**: [Ludmimar](https://github.com/Ludmimar)
