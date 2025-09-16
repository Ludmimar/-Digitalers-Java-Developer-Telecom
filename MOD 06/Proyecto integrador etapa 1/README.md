# Fintech - Proyecto Integrador Etapa 1

## 📋 Descripción del Proyecto

Este es un proyecto demo de una aplicación Fintech desarrollada con tecnologías web frontend. La aplicación simula un sistema bancario básico donde los usuarios pueden registrarse, crear cuentas bancarias y realizar operaciones de depósito y retiro.

## 🚀 Características Principales

### 🔐 Sistema de Autenticación
- **Registro de usuarios**: Los usuarios pueden crear una cuenta con nombre, apellido, DNI, email y contraseña
- **Inicio de sesión**: Autenticación mediante email y contraseña
- **Gestión de sesión**: Sistema de login/logout con persistencia en localStorage

### 💳 Gestión de Cuentas Bancarias
- **Creación de cuentas**: Los usuarios pueden crear múltiples cuentas bancarias
- **Códigos únicos**: Cada cuenta recibe un código único con formato `C-YYYYMMDD-XXXX`
- **Saldo inicial**: Posibilidad de establecer un saldo inicial al crear la cuenta
- **Visualización**: Lista de cuentas con saldos actualizados

### 💰 Operaciones Financieras
- **Depósitos**: Los usuarios pueden depositar dinero en sus cuentas
- **Retiros**: Sistema de retiro con validación de saldo suficiente
- **Historial**: Registro de los últimos 10 movimientos por cuenta
- **Validaciones**: Control de montos positivos y saldo disponible

### 💾 Persistencia de Datos
- **localStorage**: Todos los datos se almacenan localmente en el navegador
- **Datos demo**: Se crea automáticamente un usuario demo para facilitar las pruebas

## 🛠️ Tecnologías Utilizadas

- **HTML5**: Estructura semántica de la aplicación
- **CSS3**: Estilos modernos con tema oscuro y diseño responsivo
- **JavaScript ES6+**: Lógica de la aplicación con clases y programación orientada a objetos
- **localStorage API**: Persistencia de datos del lado del cliente

## 📁 Estructura del Proyecto

```
Proyecto integrador etapa 1/
├── index.html          # Página principal de la aplicación
├── app.js             # Lógica JavaScript con clases POO
├── style.css          # Estilos CSS con tema oscuro
├── README.md          # Documentación del proyecto
└── Proyecto Integrador Etapa 1.pdf  # Especificaciones del proyecto
```

## 🏗️ Arquitectura del Código

### Clases Principales

#### `Movimiento`
- Representa una transacción bancaria (depósito o retiro)
- Propiedades: id, tipo, monto, fecha, descripción
- Genera IDs únicos automáticamente

#### `Cuenta`
- Modela una cuenta bancaria
- Propiedades: código único, clienteId, saldo, movimientos
- Métodos: `depositar()`, `retirar()`, `agregarMovimiento()`

#### `Cliente`
- Representa un usuario del sistema
- Propiedades: id, datos personales, email, contraseña, cuentas
- Genera IDs únicos automáticamente

#### `SistemaFintech`
- Clase principal que gestiona toda la lógica del negocio
- Métodos para: registro, login, creación de cuentas, operaciones bancarias
- Maneja la persistencia en localStorage

## 🎨 Diseño y UX

- **Tema oscuro**: Interfaz moderna con colores oscuros y acentos azules
- **Responsive**: Adaptable a dispositivos móviles y desktop
- **Navegación intuitiva**: Sistema de tabs para login/registro
- **Feedback visual**: Mensajes de confirmación y error
- **Formularios dinámicos**: Se ocultan automáticamente después de las acciones

## 🚀 Cómo Ejecutar el Proyecto

1. **Clonar o descargar** el proyecto
2. **Abrir** el archivo `index.html` en cualquier navegador web moderno
3. **¡Listo!** La aplicación se ejecutará automáticamente

### Usuario Demo
La aplicación incluye un usuario demo creado automáticamente:
- **Email**: `demo@fintech.test`
- **Contraseña**: `demo123`
- **Cuentas**: 2 cuentas con saldos de $500 y $1500

## 📱 Funcionalidades Detalladas

### Pantalla de Autenticación
- Alternancia entre formularios de login y registro
- Validación de campos requeridos
- Mensajes de error descriptivos

### Dashboard Principal
- **Resumen del usuario**: Email, número de cuentas, saldo total
- **Gestión de cuentas**: Lista de cuentas con opción de visualizar detalles
- **Creación de cuentas**: Formulario para nuevas cuentas con saldo inicial
- **Operaciones**: Formularios para depósitos y retiros

### Historial de Movimientos
- Últimos 10 movimientos por cuenta
- Información detallada: tipo, monto, fecha y hora
- Actualización automática después de cada operación

## 🔒 Consideraciones de Seguridad

⚠️ **Nota importante**: Esta es una aplicación demo. En un entorno de producción se requerirían:
- Hash de contraseñas
- Validación del lado del servidor
- HTTPS obligatorio
- Autenticación JWT
- Base de datos segura

## 🎯 Objetivos del Proyecto

Este proyecto demuestra:
- **Programación Orientada a Objetos** en JavaScript
- **Manejo del DOM** y eventos
- **Persistencia local** con localStorage
- **Diseño responsivo** con CSS moderno
- **Arquitectura MVC** simplificada
- **Validaciones** y manejo de errores

## 📝 Notas de Desarrollo

- El código está comentado en español para facilitar el entendimiento
- Se utiliza localStorage para simular una base de datos
- Los IDs y códigos se generan automáticamente
- La interfaz se actualiza dinámicamente sin recargar la página
- Compatible con navegadores modernos que soporten ES6+

## 🔮 Posibles Mejoras Futuras

- Implementación de transferencias entre cuentas
- Sistema de categorización de movimientos
- Exportación de historial a PDF/Excel
- Gráficos de análisis financiero
- Notificaciones push
- Modo offline con Service Workers

---

## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos
- **Proyecto**: Sistema de Gestión Fintech - Proyecto Integrador
- **Etapa**: 2 - Desarrollo de Clase Cliente

## 📞 Contacto

-  [Email](ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---

**Desarrollado como parte del Proyecto Integrador Etapa 1**  
*Demo de aplicación Fintech con tecnologías web frontend*

