# Lab Adicional 01 - Sistema de Navegación FinTech

## Descripción
Este laboratorio implementa un sistema de navegación entre componentes para una aplicación fintech utilizando las clases `Router` y `ApplicationComponent`.

## Clases Implementadas

### 1. Component (Interface)
- Define la estructura estándar para todos los componentes navegables
- Métodos: `initialize()`, `render()`, `cleanup()`, `getComponentName()`

### 2. Router
- **Propósito**: Facilita la transición fluida entre diferentes secciones de la aplicación sin acoplar directamente los componentes
- **Características**:
  - Registro de componentes con rutas
  - Navegación hacia rutas específicas
  - Historial de navegación con función "back"
  - Gestión del ciclo de vida de componentes
  - Validación de rutas

### 3. ApplicationComponent
- **Propósito**: Inicializa la aplicación fintech y utiliza el Router para gestionar la navegación
- **Funcionalidades**:
  - Inicialización del modelo de aplicación fintech
  - Configuración del Router
  - Registro automático de componentes fintech
  - Gestión del estado de la aplicación
  - Métodos de navegación simplificados

### 4. Componentes FinTech
- **DashboardComponent**: Panel principal con resumen financiero
- **TransactionsComponent**: Historial de transacciones
- **ProfileComponent**: Perfil de usuario y configuraciones
- **InvestmentsComponent**: Portafolio de inversiones

### 5. Main
- Demostración interactiva del sistema de navegación
- Comandos disponibles: dashboard, transactions, profile, investments, back, status, quit

## Cómo Ejecutar

```bash
# Compilar
javac src/*.java

# Ejecutar
java -cp src Main
```

## Comandos de Navegación
- `dashboard` - Ir al panel principal
- `transactions` - Ver historial de transacciones
- `profile` - Acceder al perfil de usuario
- `investments` - Ver portafolio de inversiones
- `back` - Regresar al componente anterior
- `status` - Mostrar estado de la aplicación
- `quit` - Salir del programa

## Características del Sistema

### Router
- ✅ Registro de componentes con rutas únicas
- ✅ Navegación fluida entre componentes
- ✅ Historial de navegación
- ✅ Limpieza automática de recursos
- ✅ Validación de rutas
- ✅ Gestión del ciclo de vida de componentes

### ApplicationComponent
- ✅ Inicialización completa de la aplicación
- ✅ Configuración automática del Router
- ✅ Registro de componentes fintech
- ✅ Gestión del estado de la aplicación
- ✅ Métodos de navegación simplificados
- ✅ Shutdown controlado

### Componentes FinTech
- ✅ Interfaz consistente (Component)
- ✅ Inicialización, renderizado y limpieza
- ✅ Datos simulados realistas
- ✅ Interfaz visual atractiva

## Arquitectura

```
Main
├── ApplicationComponent
│   ├── Router
│   │   ├── DashboardComponent
│   │   ├── TransactionsComponent
│   │   ├── ProfileComponent
│   │   └── InvestmentsComponent
│   └── Component (Interface)
```

El sistema demuestra cómo la gestión inteligente de componentes puede mejorar la estructura y usabilidad de las aplicaciones fintech, proporcionando una navegación fluida y desacoplada entre diferentes secciones de la aplicación.
