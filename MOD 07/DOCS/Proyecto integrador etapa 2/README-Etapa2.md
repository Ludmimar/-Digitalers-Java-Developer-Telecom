# Proyecto Integrador Fintech - Etapa 2

## Desarrollo de la Clase Cliente

Esta etapa se enfoca en el desarrollo completo de la clase `Cliente` para el sistema de gestión Fintech, incluyendo validaciones robustas, métodos de gestión y una batería completa de pruebas unitarias.

## 📁 Archivos Desarrollados

### 1. `Cliente.js`
Clase principal con funcionalidades completas:

**Características principales:**
- ✅ Validaciones robustas para todos los campos
- ✅ Gestión de cuentas bancarias
- ✅ Métodos de actualización de datos
- ✅ Serialización JSON
- ✅ Documentación JSDoc completa

**Métodos implementados:**
- `validarNombre()` - Validación de nombres con caracteres permitidos
- `validarApellido()` - Validación de apellidos
- `validarDNI()` - Validación de DNI (7-8 dígitos)
- `validarEmail()` - Validación de formato de email
- `validarPassword()` - Validación de contraseñas (6-50 caracteres)
- `obtenerNombreCompleto()` - Concatenación de nombre y apellido
- `agregarCuenta()` - Asociar cuentas bancarias
- `removerCuenta()` - Desasociar cuentas
- `tieneCuenta()` - Verificar existencia de cuenta
- `actualizarDatosPersonales()` - Actualizar información personal
- `cambiarPassword()` - Cambio de contraseña
- `verificarPassword()` - Verificación de contraseña
- `cambiarEstado()` - Activar/desactivar cliente
- `toJSON()` - Serialización a JSON
- `fromJSON()` - Creación desde JSON
- `validarCliente()` - Validación completa

### 2. `Cliente.test.js`
Suite completa de pruebas unitarias:

**Cobertura de pruebas:**
- ✅ **Constructor** - Creación con datos válidos e inválidos
- ✅ **Validaciones** - Todos los métodos de validación
- ✅ **Métodos de instancia** - Funcionalidades principales
- ✅ **Serialización** - JSON y reconstrucción
- ✅ **Casos edge** - Límites y casos especiales
- ✅ **Métodos estáticos** - Generación de IDs

**Tipos de pruebas:**
- Pruebas de casos válidos
- Pruebas de casos de error
- Pruebas de casos límite
- Pruebas de validación
- Pruebas de serialización

### 3. `test-runner.html`
Interfaz web para ejecutar las pruebas:

**Características:**
- 🎨 Interfaz moderna y responsive
- 📊 Estadísticas de pruebas en tiempo real
- 🚀 Ejecución de pruebas con un clic
- 📋 Documentación visual de características
- ✅ Indicadores visuales de éxito/error

## 🧪 Ejecutar las Pruebas

### Opción 1: Navegador Web
1. Abrir `test-runner.html` en cualquier navegador
2. Hacer clic en "🚀 Ejecutar Todas las Pruebas"
3. Ver resultados y estadísticas

### Opción 2: Consola del Navegador
1. Abrir `test-runner.html`
2. Abrir DevTools (F12)
3. Ejecutar: `ejecutarPruebasCliente()`

## 📊 Cobertura de Pruebas

La suite de pruebas incluye **más de 50 casos de prueba** que cubren:

### Validaciones
- ✅ Nombres y apellidos (longitud, caracteres permitidos)
- ✅ DNI (formato, longitud, caracteres especiales)
- ✅ Email (formato, longitud, conversión a minúsculas)
- ✅ Contraseñas (longitud mínima y máxima)

### Funcionalidades
- ✅ Gestión de cuentas bancarias
- ✅ Actualización de datos personales
- ✅ Cambio de contraseñas
- ✅ Control de estado (activo/inactivo)
- ✅ Serialización JSON

### Casos Edge
- ✅ Datos vacíos o nulos
- ✅ Límites de longitud
- ✅ Caracteres especiales
- ✅ Duplicados
- ✅ Estados límite

## 🔧 Integración con el Sistema Existente

La nueva clase `Cliente` es **completamente compatible** con el código existente:

- ✅ Mantiene la misma interfaz pública
- ✅ Compatible con `localStorage`
- ✅ Funciona con `SistemaFintech`
- ✅ No requiere cambios en el frontend

## 🚀 Mejoras Implementadas

### Comparado con la Etapa 1:
1. **Validaciones robustas** - Todos los campos tienen validación completa
2. **Métodos adicionales** - Funcionalidades para gestión completa
3. **Documentación JSDoc** - Documentación profesional
4. **Pruebas unitarias** - Cobertura completa de funcionalidades
5. **Manejo de errores** - Mensajes descriptivos y específicos
6. **Serialización** - Soporte completo para JSON
7. **Casos edge** - Manejo de situaciones límite

## 📝 Uso de la Clase

```javascript
// Crear un nuevo cliente
const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');

// Validar datos
const validacion = cliente.validarCliente();
if (validacion.valido) {
    console.log('Cliente válido');
} else {
    console.log('Errores:', validacion.errores);
}

// Agregar cuenta bancaria
cliente.agregarCuenta('C-20241201-1234');

// Actualizar datos
cliente.actualizarDatosPersonales({
    telefono: '123456789',
    direccion: 'Calle Principal 123'
});

// Serializar a JSON
const json = cliente.toJSON();

// Crear desde JSON
const nuevoCliente = Cliente.fromJSON(json);
```

## 🎯 Objetivos Cumplidos

- ✅ **Clase Cliente completa** con validaciones robustas
- ✅ **Batería de pruebas unitarias** con más de 50 casos
- ✅ **Documentación completa** con JSDoc
- ✅ **Interfaz de pruebas** moderna y funcional
- ✅ **Compatibilidad total** con el sistema existente
- ✅ **Manejo de errores** profesional
- ✅ **Casos edge** cubiertos

## 🔮 Próximos Pasos

La clase `Cliente` está lista para ser integrada en etapas posteriores del proyecto, proporcionando una base sólida y bien probada para el sistema de gestión Fintech.
