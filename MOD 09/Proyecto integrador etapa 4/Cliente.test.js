/**
 * Suite de pruebas unitarias para la clase Cliente
 * Sistema de Gestión Fintech - Etapa 2
 */

// Simple Testing Framework
class TestFramework {
  constructor() {
    this.tests = [];
    this.passed = 0;
    this.failed = 0;
  }

  test(name, testFunction) {
    this.tests.push({ name, testFunction });
  }

  assertEqual(actual, expected, message = '') {
    if (actual !== expected) {
      throw new Error(`Expected ${expected}, but got ${actual}. ${message}`);
    }
  }

  assertTrue(condition, message = '') {
    if (!condition) {
      throw new Error(`Expected true, but got false. ${message}`);
    }
  }

  assertFalse(condition, message = '') {
    if (condition) {
      throw new Error(`Expected false, but got true. ${message}`);
    }
  }

  assertThrows(fn, expectedError = null, message = '') {
    try {
      fn();
      throw new Error(`Expected function to throw an error. ${message}`);
    } catch (error) {
      if (expectedError && !error.message.includes(expectedError)) {
        throw new Error(`Expected error containing "${expectedError}", but got "${error.message}". ${message}`);
      }
    }
  }

  run() {
    console.log('🧪 Ejecutando pruebas unitarias para la clase Cliente...\n');
    
    this.tests.forEach(({ name, testFunction }) => {
      try {
        testFunction();
        console.log(`✅ ${name}`);
        this.passed++;
      } catch (error) {
        console.log(`❌ ${name}: ${error.message}`);
        this.failed++;
      }
    });

    console.log(`\n📊 Resumen: ${this.passed} pasaron, ${this.failed} fallaron`);
    return this.failed === 0;
  }
}

// Crear instancia del framework de pruebas
const test = new TestFramework();

// ========== PRUEBAS DEL CONSTRUCTOR ==========

test.test('Constructor - Crear cliente con datos válidos', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  
  test.assertEqual(cliente.nombre, 'Juan');
  test.assertEqual(cliente.apellido, 'Pérez');
  test.assertEqual(cliente.dni, '12345678');
  test.assertEqual(cliente.email, 'juan@email.com');
  test.assertEqual(cliente.password, 'password123');
  test.assertTrue(cliente.cuentas instanceof Array);
  test.assertEqual(cliente.cuentas.length, 0);
  test.assertTrue(cliente.activo);
  test.assertTrue(cliente.id.startsWith('cli-'));
});

test.test('Constructor - Crear cliente con datos opcionales', () => {
  const cliente = new Cliente('María', 'González', '87654321', 'maria@email.com', 'pass123', '123456789', 'Calle 123');
  
  test.assertEqual(cliente.telefono, '123456789');
  test.assertEqual(cliente.direccion, 'Calle 123');
});

// ========== PRUEBAS DE VALIDACIÓN DE NOMBRE ==========

test.test('Validar nombre - Nombre válido', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.nombre, 'Juan');
});

test.test('Validar nombre - Nombre con espacios', () => {
  const cliente = new Cliente('Juan Carlos', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.nombre, 'Juan Carlos');
});

test.test('Validar nombre - Nombre con acentos', () => {
  const cliente = new Cliente('José', 'González', '12345678', 'jose@email.com', 'password123');
  test.assertEqual(cliente.nombre, 'José');
});

test.test('Validar nombre - Nombre vacío', () => {
  test.assertThrows(() => {
    new Cliente('', 'Pérez', '12345678', 'juan@email.com', 'password123');
  }, 'El nombre es requerido');
});

test.test('Validar nombre - Nombre muy corto', () => {
  test.assertThrows(() => {
    new Cliente('J', 'Pérez', '12345678', 'juan@email.com', 'password123');
  }, 'El nombre debe tener al menos 2 caracteres');
});

test.test('Validar nombre - Nombre muy largo', () => {
  const nombreLargo = 'A'.repeat(51);
  test.assertThrows(() => {
    new Cliente(nombreLargo, 'Pérez', '12345678', 'juan@email.com', 'password123');
  }, 'El nombre no puede exceder 50 caracteres');
});

test.test('Validar nombre - Nombre con números', () => {
  test.assertThrows(() => {
    new Cliente('Juan123', 'Pérez', '12345678', 'juan@email.com', 'password123');
  }, 'El nombre solo puede contener letras y espacios');
});

// ========== PRUEBAS DE VALIDACIÓN DE APELLIDO ==========

test.test('Validar apellido - Apellido válido', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.apellido, 'Pérez');
});

test.test('Validar apellido - Apellido vacío', () => {
  test.assertThrows(() => {
    new Cliente('Juan', '', '12345678', 'juan@email.com', 'password123');
  }, 'El apellido es requerido');
});

test.test('Validar apellido - Apellido con caracteres especiales', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez@', '12345678', 'juan@email.com', 'password123');
  }, 'El apellido solo puede contener letras y espacios');
});

// ========== PRUEBAS DE VALIDACIÓN DE DNI ==========

test.test('Validar DNI - DNI válido de 8 dígitos', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.dni, '12345678');
});

test.test('Validar DNI - DNI válido de 7 dígitos', () => {
  const cliente = new Cliente('Juan', 'Pérez', '1234567', 'juan@email.com', 'password123');
  test.assertEqual(cliente.dni, '1234567');
});

test.test('Validar DNI - DNI con puntos y guiones', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12.345.678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.dni, '12345678');
});

test.test('Validar DNI - DNI vacío', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '', 'juan@email.com', 'password123');
  }, 'El DNI es requerido');
});

test.test('Validar DNI - DNI muy corto', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '123456', 'juan@email.com', 'password123');
  }, 'El DNI debe contener entre 7 y 8 dígitos numéricos');
});

test.test('Validar DNI - DNI muy largo', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '123456789', 'juan@email.com', 'password123');
  }, 'El DNI debe contener entre 7 y 8 dígitos numéricos');
});

test.test('Validar DNI - DNI con letras', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '1234567A', 'juan@email.com', 'password123');
  }, 'El DNI debe contener entre 7 y 8 dígitos numéricos');
});

// ========== PRUEBAS DE VALIDACIÓN DE EMAIL ==========

test.test('Validar email - Email válido', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.email, 'juan@email.com');
});

test.test('Validar email - Email en mayúsculas se convierte a minúsculas', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'JUAN@EMAIL.COM', 'password123');
  test.assertEqual(cliente.email, 'juan@email.com');
});

test.test('Validar email - Email vacío', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '12345678', '', 'password123');
  }, 'El email es requerido');
});

test.test('Validar email - Email sin @', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '12345678', 'juanemail.com', 'password123');
  }, 'El formato del email no es válido');
});

test.test('Validar email - Email sin dominio', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '12345678', 'juan@', 'password123');
  }, 'El formato del email no es válido');
});

test.test('Validar email - Email muy largo', () => {
  const emailLargo = 'a'.repeat(95) + '@email.com';
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '12345678', emailLargo, 'password123');
  }, 'El email no puede exceder 100 caracteres');
});

// ========== PRUEBAS DE VALIDACIÓN DE PASSWORD ==========

test.test('Validar password - Password válido', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.password, 'password123');
});

test.test('Validar password - Password vacío', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', '');
  }, 'La contraseña es requerida');
});

test.test('Validar password - Password muy corto', () => {
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', '12345');
  }, 'La contraseña debe tener al menos 6 caracteres');
});

test.test('Validar password - Password muy largo', () => {
  const passwordLargo = 'a'.repeat(51);
  test.assertThrows(() => {
    new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', passwordLargo);
  }, 'La contraseña no puede exceder 50 caracteres');
});

// ========== PRUEBAS DE MÉTODOS DE INSTANCIA ==========

test.test('Obtener nombre completo', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.obtenerNombreCompleto(), 'Juan Pérez');
});

test.test('Agregar cuenta', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  cliente.agregarCuenta('C-20241201-1234');
  test.assertEqual(cliente.cuentas.length, 1);
  test.assertTrue(cliente.tieneCuenta('C-20241201-1234'));
});

test.test('Agregar cuenta duplicada', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  cliente.agregarCuenta('C-20241201-1234');
  test.assertThrows(() => {
    cliente.agregarCuenta('C-20241201-1234');
  }, 'La cuenta ya está asociada a este cliente');
});

test.test('Remover cuenta existente', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  cliente.agregarCuenta('C-20241201-1234');
  const resultado = cliente.removerCuenta('C-20241201-1234');
  test.assertTrue(resultado);
  test.assertEqual(cliente.cuentas.length, 0);
  test.assertFalse(cliente.tieneCuenta('C-20241201-1234'));
});

test.test('Remover cuenta inexistente', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  const resultado = cliente.removerCuenta('C-20241201-9999');
  test.assertFalse(resultado);
});

test.test('Obtener cantidad de cuentas', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertEqual(cliente.obtenerCantidadCuentas(), 0);
  cliente.agregarCuenta('C-20241201-1234');
  cliente.agregarCuenta('C-20241201-5678');
  test.assertEqual(cliente.obtenerCantidadCuentas(), 2);
});

test.test('Actualizar datos personales', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  cliente.actualizarDatosPersonales({
    nombre: 'Juan Carlos',
    telefono: '123456789',
    direccion: 'Calle Nueva 123'
  });
  test.assertEqual(cliente.nombre, 'Juan Carlos');
  test.assertEqual(cliente.telefono, '123456789');
  test.assertEqual(cliente.direccion, 'Calle Nueva 123');
});

test.test('Cambiar password', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  cliente.cambiarPassword('nuevapassword456');
  test.assertEqual(cliente.password, 'nuevapassword456');
});

test.test('Cambiar password inválida', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertThrows(() => {
    cliente.cambiarPassword('123');
  }, 'La contraseña debe tener al menos 6 caracteres');
});

test.test('Verificar password correcta', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertTrue(cliente.verificarPassword('password123'));
});

test.test('Verificar password incorrecta', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertFalse(cliente.verificarPassword('password456'));
});

test.test('Cambiar estado a inactivo', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  cliente.cambiarEstado(false);
  test.assertFalse(cliente.estaActivo());
});

test.test('Cambiar estado a activo', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  cliente.cambiarEstado(false);
  cliente.cambiarEstado(true);
  test.assertTrue(cliente.estaActivo());
});

test.test('Obtener días desde registro', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  const dias = cliente.obtenerDiasDesdeRegistro();
  test.assertTrue(dias >= 0);
});

// ========== PRUEBAS DE SERIALIZACIÓN ==========

test.test('Convertir a JSON', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  cliente.agregarCuenta('C-20241201-1234');
  const json = cliente.toJSON();
  
  test.assertEqual(json.nombre, 'Juan');
  test.assertEqual(json.apellido, 'Pérez');
  test.assertEqual(json.dni, '12345678');
  test.assertEqual(json.email, 'juan@email.com');
  test.assertEqual(json.cuentas.length, 1);
  test.assertTrue(json.activo);
});

test.test('Crear desde JSON', () => {
  const datosCliente = {
    id: 'cli-test123',
    nombre: 'María',
    apellido: 'González',
    dni: '87654321',
    email: 'maria@email.com',
    telefono: '987654321',
    direccion: 'Calle Test 456',
    cuentas: ['C-20241201-1111', 'C-20241201-2222'],
    fechaRegistro: '2024-01-01T00:00:00.000Z',
    activo: true
  };
  
  const cliente = Cliente.fromJSON(datosCliente);
  test.assertEqual(cliente.id, 'cli-test123');
  test.assertEqual(cliente.nombre, 'María');
  test.assertEqual(cliente.apellido, 'González');
  test.assertEqual(cliente.dni, '87654321');
  test.assertEqual(cliente.email, 'maria@email.com');
  test.assertEqual(cliente.telefono, '987654321');
  test.assertEqual(cliente.direccion, 'Calle Test 456');
  test.assertEqual(cliente.cuentas.length, 2);
  test.assertTrue(cliente.estaActivo());
});

// ========== PRUEBAS DE VALIDACIÓN COMPLETA ==========

test.test('Validar cliente completo - Cliente válido', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  const validacion = cliente.validarCliente();
  test.assertTrue(validacion.valido);
  test.assertEqual(validacion.errores.length, 0);
});

test.test('Validar cliente completo - Cliente con errores', () => {
  const cliente = new Cliente('J', 'P', '123', 'email-invalido', '123');
  const validacion = cliente.validarCliente();
  test.assertFalse(validacion.valido);
  test.assertTrue(validacion.errores.length > 0);
});

// ========== PRUEBAS DE MÉTODOS ESTÁTICOS ==========

test.test('Generar ID único', () => {
  const id1 = Cliente.generarId();
  const id2 = Cliente.generarId();
  test.assertTrue(id1.startsWith('cli-'));
  test.assertTrue(id2.startsWith('cli-'));
  test.assertFalse(id1 === id2);
});

// ========== PRUEBAS DE CASOS EDGE ==========

test.test('Constructor con parámetros null/undefined', () => {
  test.assertThrows(() => {
    new Cliente(null, 'Pérez', '12345678', 'juan@email.com', 'password123');
  }, 'El nombre es requerido');
  
  test.assertThrows(() => {
    new Cliente('Juan', undefined, '12345678', 'juan@email.com', 'password123');
  }, 'El apellido es requerido');
});

test.test('Agregar cuenta con código inválido', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertThrows(() => {
    cliente.agregarCuenta('');
  }, 'El código de cuenta es requerido');
  
  test.assertThrows(() => {
    cliente.agregarCuenta(null);
  }, 'El código de cuenta es requerido');
});

test.test('Actualizar datos con validación', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@email.com', 'password123');
  test.assertThrows(() => {
    cliente.actualizarDatosPersonales({ nombre: '' });
  }, 'El nombre es requerido');
});

// ========== EJECUTAR TODAS LAS PRUEBAS ==========

// Función para ejecutar las pruebas desde el navegador
function ejecutarPruebasCliente() {
  return test.run();
}

// Ejecutar automáticamente si se está en un entorno de Node.js
if (typeof module !== 'undefined' && module.exports) {
  module.exports = { ejecutarPruebasCliente, TestFramework };
}
