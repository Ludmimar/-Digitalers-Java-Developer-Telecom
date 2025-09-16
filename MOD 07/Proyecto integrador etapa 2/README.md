# 🏦 Sistema de Gestión Fintech

## Proyecto Integrador - Etapa 2

Un sistema completo de gestión financiera desarrollado con JavaScript vanilla, que incluye gestión de clientes, cuentas bancarias, movimientos financieros y una interfaz web moderna.

![Fintech System](https://img.shields.io/badge/Fintech-System-blue?style=for-the-badge&logo=bank)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6+-yellow?style=for-the-badge&logo=javascript)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

## 📋 Tabla de Contenidos

- [Características](#-características)
- [Tecnologías Utilizadas](#-tecnologías-utilizadas)
- [Estructura del Proyecto](#-estructura-del-proyecto)
- [Instalación y Uso](#-instalación-y-uso)
- [Clase Cliente](#-clase-cliente)
- [Pruebas Unitarias](#-pruebas-unitarias)
- [Capturas de Pantalla](#-capturas-de-pantalla)
- [API y Documentación](#-api-y-documentación)

## 🚀 Características

### ✨ Funcionalidades Principales
- **👤 Gestión de Clientes**: Registro, login y gestión completa de datos personales
- **🏦 Cuentas Bancarias**: Creación y gestión de múltiples cuentas por cliente
- **💰 Movimientos Financieros**: Depósitos y retiros con historial completo
- **💾 Persistencia Local**: Almacenamiento en localStorage del navegador
- **🔐 Validaciones Robustas**: Validación completa de todos los datos de entrada
- **🧪 Pruebas Unitarias**: Suite completa de pruebas para garantizar calidad

### 🎨 Interfaz de Usuario
- **🌙 Tema Oscuro**: Diseño moderno con tema oscuro profesional
- **📱 Responsive**: Adaptable a dispositivos móviles y desktop
- **⚡ Interfaz Intuitiva**: Navegación simple y clara
- **📊 Dashboard**: Resumen completo de cuentas y saldos
- **📈 Historial**: Visualización de movimientos financieros

## 🛠️ Tecnologías Utilizadas

- **Frontend**: HTML5, CSS3, JavaScript ES6+
- **Almacenamiento**: LocalStorage API
- **Testing**: Framework de pruebas personalizado
- **Arquitectura**: Programación Orientada a Objetos (POO)
- **Validación**: Expresiones regulares y validaciones personalizadas

## 📁 Estructura del Proyecto

```
📦 Proyecto Integrador Etapa 2
├── 📄 index.html              # Página principal de la aplicación
├── 🎨 style.css               # Estilos CSS del sistema
├── ⚙️ app.js                  # Lógica principal y clases del sistema
├── 👤 Cliente.js              # Clase Cliente mejorada (Etapa 2)
├── 🧪 Cliente.test.js         # Suite de pruebas unitarias
├── 🖥️ test-runner.html        # Interfaz para ejecutar pruebas
├── ❌ error-cases-demo.html   # Demostración de casos de error
├── 📖 README.md               # Este archivo
├── 📋 README-Etapa2.md        # Documentación específica de Etapa 2
├── 📄 Proyecto Integrador Etapa 1.pdf  # Documentación original
└── 📸 CAPTURAS/               # Capturas de pantalla del sistema
    ├── Test.png
    └── Test01.png
```

## 🚀 Instalación y Uso

### Requisitos Previos
- Navegador web moderno (Chrome, Firefox, Safari, Edge)
- No se requiere instalación de dependencias adicionales

### Instalación
1. **Clonar o descargar** el proyecto
2. **Abrir** `index.html` en tu navegador web
3. **¡Listo!** El sistema está funcionando

### Uso Básico
1. **Registrarse**: Crear una nueva cuenta de usuario
2. **Iniciar Sesión**: Acceder con email y contraseña
3. **Crear Cuentas**: Agregar cuentas bancarias
4. **Realizar Movimientos**: Depositar o retirar dinero
5. **Ver Historial**: Consultar movimientos recientes

## 👤 Clase Cliente

### Características de la Clase Cliente (Etapa 2)

La clase `Cliente` ha sido completamente rediseñada con validaciones robustas y funcionalidades avanzadas:

#### 🔐 Validaciones Implementadas
- **Nombre**: 2-50 caracteres, solo letras y espacios
- **Apellido**: 2-50 caracteres, solo letras y espacios  
- **DNI**: 7-8 dígitos numéricos (acepta puntos y guiones)
- **Email**: Formato válido, máximo 100 caracteres, conversión a minúsculas
- **Password**: 6-50 caracteres

#### 🛠️ Métodos Principales
```javascript
// Crear cliente
const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');

// Validar datos
const validacion = cliente.validarCliente();

// Gestión de cuentas
cliente.agregarCuenta('C-20241201-1234');
cliente.removerCuenta('C-20241201-1234');
cliente.tieneCuenta('C-20241201-1234');

// Actualizar datos
cliente.actualizarDatosPersonales({
    telefono: '123456789',
    direccion: 'Calle Principal 123'
});

// Cambiar contraseña
cliente.cambiarPassword('nuevapassword456');

// Serialización
const json = cliente.toJSON();
const nuevoCliente = Cliente.fromJSON(json);
```

## 🧪 Pruebas Unitarias

### Suite de Pruebas Completa

El proyecto incluye una suite completa de pruebas unitarias con más de **50 casos de prueba**:

#### 📊 Cobertura de Pruebas
- ✅ **Constructor**: Casos válidos e inválidos
- ✅ **Validaciones**: Todos los métodos de validación
- ✅ **Métodos de instancia**: Funcionalidades principales
- ✅ **Serialización**: JSON y reconstrucción
- ✅ **Casos edge**: Límites y situaciones especiales
- ✅ **Métodos estáticos**: Generación de IDs únicos

#### 🚀 Ejecutar Pruebas

**Opción 1: Interfaz Web**
1. Abrir `test-runner.html` en el navegador
2. Hacer clic en "🚀 Ejecutar Todas las Pruebas"
3. Ver resultados y estadísticas en tiempo real

**Opción 2: Consola del Navegador**
1. Abrir `test-runner.html`
2. Abrir DevTools (F12)
3. Ejecutar: `ejecutarPruebasCliente()`

#### ❌ Casos de Error Cubiertos
- **Datos vacíos o nulos**: Validación de campos requeridos
- **Formatos incorrectos**: Email, DNI, etc.
- **Longitudes inválidas**: Límites mínimos y máximos
- **Caracteres no permitidos**: Validación de caracteres especiales
- **Casos edge**: Situaciones límite y duplicados

## 📸 Capturas de Pantalla

El proyecto incluye capturas de pantalla en la carpeta `CAPTURAS/` que muestran:
- Interfaz principal del sistema
- Dashboard de usuario
- Formularios de registro y login
- Gestión de cuentas bancarias
- Historial de movimientos

## 🔧 API y Documentación

### Clases Principales

#### `Cliente`
```javascript
class Cliente {
    constructor(nombre, apellido, dni, email, password, telefono?, direccion?)
    validarNombre(nombre)
    validarApellido(apellido)
    validarDNI(dni)
    validarEmail(email)
    validarPassword(password)
    obtenerNombreCompleto()
    agregarCuenta(codigoCuenta)
    removerCuenta(codigoCuenta)
    tieneCuenta(codigoCuenta)
    actualizarDatosPersonales(datos)
    cambiarPassword(nuevaPassword)
    verificarPassword(password)
    cambiarEstado(activo)
    estaActivo()
    obtenerDiasDesdeRegistro()
    toJSON()
    static fromJSON(datos)
    validarCliente()
}
```

#### `Cuenta`
```javascript
class Cuenta {
    constructor(clienteId, saldoInicial?)
    depositar(monto)
    retirar(monto)
    agregarMovimiento(mov)
    static generarCodigo()
}
```

#### `Movimiento`
```javascript
class Movimiento {
    constructor(tipo, monto, fecha?, descripcion?)
    static generarId()
}
```

#### `SistemaFintech`
```javascript
class SistemaFintech {
    constructor(storageKey?)
    guardar()
    cargar()
    crearCliente(nombre, apellido, dni, email, pass)
    login(email, pass)
    getClientePorEmail(email)
    crearCuentaParaCliente(clienteId, saldoInicial?)
    getCuentasDeCliente(clienteId)
    getCuentaPorCodigo(codigo)
    realizarDeposito(codigoCuenta, monto)
    realizarRetiro(codigoCuenta, monto)
}
```

## 🎯 Objetivos del Proyecto

### Etapa 1 ✅
- [x] Diseño de clases POO básicas
- [x] Implementación de funcionalidades core
- [x] Interfaz web funcional
- [x] Persistencia en localStorage

### Etapa 2 ✅
- [x] Clase Cliente completamente desarrollada
- [x] Validaciones robustas implementadas
- [x] Suite de pruebas unitarias completa
- [x] Documentación técnica detallada
- [x] Casos de error cubiertos


## 👨‍💻 Autor

- **Desarrollador**: Ludmila Martos
- **Proyecto**: Sistema de Gestión Fintech - Proyecto Integrador
- **Etapa**: 2 - Desarrollo de Clase Cliente

## 📞 Contacto

-  [Email](mailto:ludmilamartos@gmail.com)
-  [Linkedin](https://www.linkedin.com/in/ludmimar89/)
- [GitHub](https://github.com/Ludmimar)

---

<div align="center">

**⭐ Si te gusta este proyecto, ¡dale una estrella! ⭐**

![Fintech](https://img.shields.io/badge/Fintech-System-green?style=for-the-badge&logo=bank&logoColor=white)

</div>



