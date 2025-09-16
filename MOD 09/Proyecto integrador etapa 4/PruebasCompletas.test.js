/**
 * Suite Completa de Pruebas Unitarias - Sistema Fintech Etapa 3
 * Incluye pruebas para todas las clases: Cliente, Cuenta, Movimiento, Tarjeta, Prestamo, SistemaFintech
 */

// Framework de pruebas simple
class TestFramework {
  constructor() {
    this.tests = [];
    this.results = {
      total: 0,
      passed: 0,
      failed: 0,
      errors: []
    };
  }

  test(name, testFunction) {
    this.tests.push({ name, testFunction });
  }

  run() {
    console.log('🧪 Iniciando Suite de Pruebas Completa - Sistema Fintech Etapa 3');
    console.log('=' .repeat(80));
    
    this.results.total = this.tests.length;
    this.results.passed = 0;
    this.results.failed = 0;
    this.results.errors = [];

    this.tests.forEach((test, index) => {
      try {
        console.log(`\n${index + 1}. ${test.name}`);
        test.testFunction();
        console.log('   ✅ PASÓ');
        this.results.passed++;
      } catch (error) {
        console.log(`   ❌ FALLÓ: ${error.message}`);
        this.results.failed++;
        this.results.errors.push({
          test: test.name,
          error: error.message
        });
      }
    });

    this.showSummary();
  }

  showSummary() {
    console.log('\n' + '=' .repeat(80));
    console.log('📊 RESUMEN DE PRUEBAS');
    console.log('=' .repeat(80));
    console.log(`Total de pruebas: ${this.results.total}`);
    console.log(`✅ Pasaron: ${this.results.passed}`);
    console.log(`❌ Fallaron: ${this.results.failed}`);
    console.log(`📈 Tasa de éxito: ${((this.results.passed / this.results.total) * 100).toFixed(1)}%`);
    
    if (this.results.errors.length > 0) {
      console.log('\n❌ ERRORES DETALLADOS:');
      this.results.errors.forEach(error => {
        console.log(`   • ${error.test}: ${error.error}`);
      });
    }
    
    console.log('\n' + '=' .repeat(80));
  }

  assert(condition, message) {
    if (!condition) {
      throw new Error(message);
    }
  }

  assertEqual(actual, expected, message) {
    if (actual !== expected) {
      throw new Error(`${message}. Esperado: ${expected}, Actual: ${actual}`);
    }
  }

  assertThrows(fn, expectedError, message) {
    try {
      fn();
      throw new Error(`${message}. Se esperaba que lanzara un error`);
    } catch (error) {
      if (expectedError && !error.message.includes(expectedError)) {
        throw new Error(`${message}. Error esperado: ${expectedError}, Error actual: ${error.message}`);
      }
    }
  }
}

// Crear instancia del framework
const test = new TestFramework();

// ========== PRUEBAS DE LA CLASE CLIENTE ==========

test.test('Cliente - Creación con datos válidos', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  
  test.assert(cliente.nombre === 'Juan', 'Nombre no se asignó correctamente');
  test.assert(cliente.apellido === 'Pérez', 'Apellido no se asignó correctamente');
  test.assert(cliente.dni === '12345678', 'DNI no se asignó correctamente');
  test.assert(cliente.email === 'juan@test.com', 'Email no se asignó correctamente');
  test.assert(cliente.password === 'password123', 'Password no se asignó correctamente');
  test.assert(cliente.activo === true, 'Cliente debería estar activo por defecto');
  test.assert(cliente.cuentas.length === 0, 'Cliente debería empezar sin cuentas');
});

test.test('Cliente - Validación de nombre', () => {
  test.assertThrows(() => new Cliente('', 'Pérez', '12345678', 'juan@test.com', 'password123'), 
    'El nombre es requerido', 'Debería fallar con nombre vacío');
  
  test.assertThrows(() => new Cliente('A', 'Pérez', '12345678', 'juan@test.com', 'password123'), 
    'El nombre debe tener al menos 2 caracteres', 'Debería fallar con nombre muy corto');
  
  test.assertThrows(() => new Cliente('Juan123', 'Pérez', '12345678', 'juan@test.com', 'password123'), 
    'El nombre solo puede contener letras y espacios', 'Debería fallar con números en nombre');
});

test.test('Cliente - Validación de DNI', () => {
  test.assertThrows(() => new Cliente('Juan', 'Pérez', '', 'juan@test.com', 'password123'), 
    'El DNI es requerido', 'Debería fallar con DNI vacío');
  
  test.assertThrows(() => new Cliente('Juan', 'Pérez', '123456', 'juan@test.com', 'password123'), 
    'El DNI debe contener entre 7 y 8 dígitos numéricos', 'Debería fallar con DNI muy corto');
  
  test.assertThrows(() => new Cliente('Juan', 'Pérez', '123456789', 'juan@test.com', 'password123'), 
    'El DNI debe contener entre 7 y 8 dígitos numéricos', 'Debería fallar con DNI muy largo');
  
  // DNI con puntos y guiones debería funcionar
  const cliente = new Cliente('Juan', 'Pérez', '12.345.678', 'juan@test.com', 'password123');
  test.assert(cliente.dni === '12345678', 'DNI con puntos debería limpiarse correctamente');
});

test.test('Cliente - Validación de email', () => {
  test.assertThrows(() => new Cliente('Juan', 'Pérez', '12345678', '', 'password123'), 
    'El email es requerido', 'Debería fallar con email vacío');
  
  test.assertThrows(() => new Cliente('Juan', 'Pérez', '12345678', 'email-invalido', 'password123'), 
    'El formato del email no es válido', 'Debería fallar con email inválido');
  
  // Email en mayúsculas debería convertirse a minúsculas
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'JUAN@TEST.COM', 'password123');
  test.assert(cliente.email === 'juan@test.com', 'Email debería convertirse a minúsculas');
});

test.test('Cliente - Gestión de cuentas', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  
  cliente.agregarCuenta('C-20241201-1234');
  test.assert(cliente.tieneCuenta('C-20241201-1234'), 'Debería tener la cuenta agregada');
  test.assert(cliente.obtenerCantidadCuentas() === 1, 'Debería tener 1 cuenta');
  
  cliente.removerCuenta('C-20241201-1234');
  test.assert(!cliente.tieneCuenta('C-20241201-1234'), 'No debería tener la cuenta removida');
  test.assert(cliente.obtenerCantidadCuentas() === 0, 'Debería tener 0 cuentas');
});

test.test('Cliente - Serialización JSON', () => {
  const cliente = new Cliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  cliente.agregarCuenta('C-20241201-1234');
  
  const json = cliente.toJSON();
  test.assert(json.nombre === 'Juan', 'JSON debería contener el nombre');
  test.assert(json.cuentas.length === 1, 'JSON debería contener las cuentas');
  
  const clienteReconstruido = Cliente.fromJSON(json);
  test.assert(clienteReconstruido.nombre === 'Juan', 'Cliente reconstruido debería tener el nombre correcto');
  test.assert(clienteReconstruido.tieneCuenta('C-20241201-1234'), 'Cliente reconstruido debería tener las cuentas');
});

// ========== PRUEBAS DE LA CLASE CUENTA ==========

test.test('Cuenta - Creación con datos válidos', () => {
  const cuenta = new Cuenta('cliente-123', 1000, 'corriente');
  
  test.assert(cuenta.clienteId === 'cliente-123', 'Cliente ID no se asignó correctamente');
  test.assert(cuenta.saldo === 1000, 'Saldo inicial no se asignó correctamente');
  test.assert(cuenta.tipoCuenta === 'corriente', 'Tipo de cuenta no se asignó correctamente');
  test.assert(cuenta.activa === true, 'Cuenta debería estar activa por defecto');
  test.assert(cuenta.movimientos.length === 0, 'Cuenta debería empezar sin movimientos');
});

test.test('Cuenta - Depósito válido', () => {
  const cuenta = new Cuenta('cliente-123', 1000);
  const resultado = cuenta.depositar(500, 'Depósito de prueba');
  
  test.assert(resultado.exito === true, 'Depósito debería ser exitoso');
  test.assert(cuenta.saldo === 1500, 'Saldo debería ser 1500 después del depósito');
  test.assert(cuenta.movimientos.length === 1, 'Debería tener 1 movimiento');
  test.assert(cuenta.movimientos[0].tipo === 'deposito', 'Movimiento debería ser de tipo depósito');
});

test.test('Cuenta - Retiro válido', () => {
  const cuenta = new Cuenta('cliente-123', 1000);
  const resultado = cuenta.retirar(300, 'Retiro de prueba');
  
  test.assert(resultado.exito === true, 'Retiro debería ser exitoso');
  test.assert(cuenta.saldo === 700, 'Saldo debería ser 700 después del retiro');
  test.assert(cuenta.movimientos.length === 1, 'Debería tener 1 movimiento');
  test.assert(cuenta.movimientos[0].tipo === 'retiro', 'Movimiento debería ser de tipo retiro');
});

test.test('Cuenta - Retiro con saldo insuficiente', () => {
  const cuenta = new Cuenta('cliente-123', 1000);
  
  test.assertThrows(() => cuenta.retirar(1500), 
    'Saldo insuficiente', 'Debería fallar con saldo insuficiente');
});

test.test('Cuenta - Límite de retiro diario', () => {
  const cuenta = new Cuenta('cliente-123', 100000, 'corriente'); // Límite diario: 50000
  
  test.assertThrows(() => cuenta.retirar(60000), 
    'Límite de retiro diario excedido', 'Debería fallar al exceder límite diario');
});

test.test('Cuenta - Resumen mensual', () => {
  const cuenta = new Cuenta('cliente-123', 1000);
  cuenta.depositar(500, 'Depósito 1');
  cuenta.depositar(300, 'Depósito 2');
  cuenta.retirar(200, 'Retiro 1');
  
  const resumen = cuenta.obtenerResumenMensual();
  test.assert(resumen.totalDepositos === 800, 'Total de depósitos debería ser 800');
  test.assert(resumen.totalRetiros === 200, 'Total de retiros debería ser 200');
  test.assert(resumen.cantidadDepositos === 2, 'Debería tener 2 depósitos');
  test.assert(resumen.cantidadRetiros === 1, 'Debería tener 1 retiro');
});

// ========== PRUEBAS DE LA CLASE MOVIMIENTO ==========

test.test('Movimiento - Creación con datos válidos', () => {
  const movimiento = new Movimiento('deposito', 1000, 'Depósito inicial');
  
  test.assert(movimiento.tipo === 'deposito', 'Tipo no se asignó correctamente');
  test.assert(movimiento.monto === 1000, 'Monto no se asignó correctamente');
  test.assert(movimiento.descripcion === 'Depósito inicial', 'Descripción no se asignó correctamente');
  test.assert(movimiento.estado === 'completado', 'Estado debería ser completado por defecto');
});

test.test('Movimiento - Validación de tipo', () => {
  test.assertThrows(() => new Movimiento('tipo-invalido', 1000), 
    'Tipo de movimiento inválido', 'Debería fallar con tipo inválido');
});

test.test('Movimiento - Validación de monto', () => {
  test.assertThrows(() => new Movimiento('deposito', 0), 
    'El monto debe ser mayor a 0', 'Debería fallar con monto 0');
  
  test.assertThrows(() => new Movimiento('deposito', -100), 
    'El monto debe ser mayor a 0', 'Debería fallar con monto negativo');
  
  test.assertThrows(() => new Movimiento('deposito', 2000000), 
    'El monto no puede exceder $1,000,000', 'Debería fallar con monto muy alto');
});

test.test('Movimiento - Métodos de verificación', () => {
  const deposito = new Movimiento('deposito', 1000);
  const retiro = new Movimiento('retiro', 500);
  
  test.assert(deposito.esDeposito() === true, 'Debería identificar depósito correctamente');
  test.assert(deposito.esRetiro() === false, 'No debería ser retiro');
  
  test.assert(retiro.esRetiro() === true, 'Debería identificar retiro correctamente');
  test.assert(retiro.esDeposito() === false, 'No debería ser depósito');
});

test.test('Movimiento - Impacto en saldo', () => {
  const deposito = new Movimiento('deposito', 1000);
  const retiro = new Movimiento('retiro', 500);
  
  test.assert(deposito.obtenerImpactoSaldo() === 1000, 'Depósito debería tener impacto positivo');
  test.assert(retiro.obtenerImpactoSaldo() === -500, 'Retiro debería tener impacto negativo');
});

// ========== PRUEBAS DE LA CLASE TARJETA ==========

test.test('Tarjeta - Creación con datos válidos', () => {
  const tarjeta = new Tarjeta('cliente-123', 'cuenta-456', 'credito', 'visa', 10000);
  
  test.assert(tarjeta.clienteId === 'cliente-123', 'Cliente ID no se asignó correctamente');
  test.assert(tarjeta.cuentaId === 'cuenta-456', 'Cuenta ID no se asignó correctamente');
  test.assert(tarjeta.tipoTarjeta === 'credito', 'Tipo de tarjeta no se asignó correctamente');
  test.assert(tarjeta.marca === 'visa', 'Marca no se asignó correctamente');
  test.assert(tarjeta.limiteCredito === 10000, 'Límite de crédito no se asignó correctamente');
  test.assert(tarjeta.activa === true, 'Tarjeta debería estar activa por defecto');
  test.assert(tarjeta.bloqueada === false, 'Tarjeta no debería estar bloqueada por defecto');
});

test.test('Tarjeta - Validación de tipo', () => {
  test.assertThrows(() => new Tarjeta('cliente-123', 'cuenta-456', 'tipo-invalido', 'visa'), 
    'Tipo de tarjeta inválido', 'Debería fallar con tipo inválido');
});

test.test('Tarjeta - Validación de marca', () => {
  test.assertThrows(() => new Tarjeta('cliente-123', 'cuenta-456', 'credito', 'marca-invalida'), 
    'Marca inválida', 'Debería fallar con marca inválida');
});

test.test('Tarjeta - Compra válida', () => {
  const tarjeta = new Tarjeta('cliente-123', 'cuenta-456', 'credito', 'visa', 10000);
  const resultado = tarjeta.realizarCompra(1000, 'Supermercado', 'Compra de alimentos');
  
  test.assert(resultado.exito === true, 'Compra debería ser exitosa');
  test.assert(tarjeta.saldoDisponible === 9000, 'Saldo disponible debería ser 9000');
  test.assert(tarjeta.transacciones.length === 1, 'Debería tener 1 transacción');
});

test.test('Tarjeta - Compra con saldo insuficiente', () => {
  const tarjeta = new Tarjeta('cliente-123', 'cuenta-456', 'credito', 'visa', 1000);
  
  test.assertThrows(() => tarjeta.realizarCompra(1500, 'Tienda'), 
    'Saldo insuficiente', 'Debería fallar con saldo insuficiente');
});

test.test('Tarjeta - Número enmascarado', () => {
  const tarjeta = new Tarjeta('cliente-123', 'cuenta-456', 'credito', 'visa', 10000);
  const numeroEnmascarado = tarjeta.obtenerNumeroEnmascarado();
  
  test.assert(numeroEnmascarado.includes('****'), 'Número debería estar enmascarado');
  test.assert(numeroEnmascarado.length === 19, 'Número enmascarado debería tener 19 caracteres');
});

test.test('Tarjeta - Bloqueo y desbloqueo', () => {
  const tarjeta = new Tarjeta('cliente-123', 'cuenta-456', 'credito', 'visa', 10000);
  
  tarjeta.bloquear();
  test.assert(tarjeta.bloqueada === true, 'Tarjeta debería estar bloqueada');
  
  test.assertThrows(() => tarjeta.realizarCompra(100, 'Tienda'), 
    'La tarjeta está bloqueada', 'Debería fallar al usar tarjeta bloqueada');
  
  tarjeta.desbloquear();
  test.assert(tarjeta.bloqueada === false, 'Tarjeta debería estar desbloqueada');
});

// ========== PRUEBAS DE LA CLASE PRESTAMO ==========

test.test('Prestamo - Creación con datos válidos', () => {
  const prestamo = new Prestamo('cliente-123', 100000, 12, 15, 'personal', 'Compra de auto');
  
  test.assert(prestamo.clienteId === 'cliente-123', 'Cliente ID no se asignó correctamente');
  test.assert(prestamo.montoSolicitado === 100000, 'Monto solicitado no se asignó correctamente');
  test.assert(prestamo.plazoMeses === 12, 'Plazo no se asignó correctamente');
  test.assert(prestamo.tasaInteres === 15, 'Tasa de interés no se asignó correctamente');
  test.assert(prestamo.tipoPrestamo === 'personal', 'Tipo de préstamo no se asignó correctamente');
  test.assert(prestamo.estado === 'solicitado', 'Estado debería ser solicitado por defecto');
});

test.test('Prestamo - Validación de monto', () => {
  test.assertThrows(() => new Prestamo('cliente-123', 0, 12, 15, 'personal'), 
    'El monto debe ser mayor a 0', 'Debería fallar con monto 0');
  
  test.assertThrows(() => new Prestamo('cliente-123', 6000000, 12, 15, 'personal'), 
    'El monto no puede exceder $5,000,000', 'Debería fallar con monto muy alto');
});

test.test('Prestamo - Validación de plazo', () => {
  test.assertThrows(() => new Prestamo('cliente-123', 100000, 0, 15, 'personal'), 
    'El plazo debe ser mayor a 0', 'Debería fallar con plazo 0');
  
  test.assertThrows(() => new Prestamo('cliente-123', 100000, 400, 15, 'personal'), 
    'El plazo no puede exceder 360 meses', 'Debería fallar con plazo muy largo');
});

test.test('Prestamo - Validación de tasa de interés', () => {
  test.assertThrows(() => new Prestamo('cliente-123', 100000, 12, -5, 'personal'), 
    'La tasa de interés no puede ser negativa', 'Debería fallar con tasa negativa');
  
  test.assertThrows(() => new Prestamo('cliente-123', 100000, 12, 60, 'personal'), 
    'La tasa de interés no puede exceder 50% anual', 'Debería fallar con tasa muy alta');
});

test.test('Prestamo - Cálculo de cuota mensual', () => {
  const prestamo = new Prestamo('cliente-123', 100000, 12, 15, 'personal');
  
  test.assert(prestamo.cuotaMensual > 0, 'Cuota mensual debería ser mayor a 0');
  test.assert(prestamo.totalAPagar > prestamo.montoAprobado, 'Total a pagar debería ser mayor al monto aprobado');
  test.assert(prestamo.interesTotal > 0, 'Interés total debería ser mayor a 0');
});

test.test('Prestamo - Aprobación y rechazo', () => {
  const prestamo = new Prestamo('cliente-123', 100000, 12, 15, 'personal');
  
  prestamo.aprobar('Cliente con buen historial crediticio');
  test.assert(prestamo.estado === 'aprobado', 'Estado debería ser aprobado');
  test.assert(prestamo.fechaAprobacion !== null, 'Fecha de aprobación debería estar establecida');
  
  const prestamo2 = new Prestamo('cliente-456', 200000, 24, 20, 'hipotecario');
  prestamo2.rechazar('Ingresos insuficientes');
  test.assert(prestamo2.estado === 'rechazado', 'Estado debería ser rechazado');
});

test.test('Prestamo - Registro de pagos', () => {
  const prestamo = new Prestamo('cliente-123', 100000, 12, 15, 'personal');
  prestamo.aprobar();
  prestamo.desembolsar('cuenta-destino');
  
  const resultado = prestamo.registrarPago(prestamo.cuotaMensual, null, 'Pago mensual');
  
  test.assert(resultado.exito === true, 'Pago debería ser exitoso');
  test.assert(prestamo.saldoPendiente < prestamo.montoAprobado, 'Saldo pendiente debería disminuir');
  test.assert(prestamo.pagosRealizados.length === 1, 'Debería tener 1 pago registrado');
});

// ========== PRUEBAS DE LA CLASE SISTEMAFINTECH ==========

test.test('SistemaFintech - Creación del sistema', () => {
  const sistema = new SistemaFintech('test_storage');
  
  test.assert(sistema.data.clientes.length === 0, 'Sistema debería empezar sin clientes');
  test.assert(sistema.data.cuentas.length === 0, 'Sistema debería empezar sin cuentas');
  test.assert(sistema.data.tarjetas.length === 0, 'Sistema debería empezar sin tarjetas');
  test.assert(sistema.data.prestamos.length === 0, 'Sistema debería empezar sin préstamos');
  test.assert(sistema.usuarioActivo === null, 'No debería haber usuario activo inicialmente');
});

test.test('SistemaFintech - Creación de cliente', () => {
  const sistema = new SistemaFintech('test_storage');
  const cliente = sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  
  test.assert(sistema.data.clientes.length === 1, 'Debería tener 1 cliente');
  test.assert(cliente.nombre === 'Juan', 'Cliente debería tener el nombre correcto');
  
  // Intentar crear cliente con email duplicado
  test.assertThrows(() => sistema.crearCliente('María', 'García', '87654321', 'juan@test.com', 'password456'), 
    'El email ya está registrado', 'Debería fallar con email duplicado');
});

test.test('SistemaFintech - Login y logout', () => {
  const sistema = new SistemaFintech('test_storage');
  sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  
  const cliente = sistema.login('juan@test.com', 'password123');
  test.assert(cliente.nombre === 'Juan', 'Login debería retornar el cliente correcto');
  test.assert(sistema.hayUsuarioActivo() === true, 'Debería haber usuario activo');
  
  sistema.logout();
  test.assert(sistema.hayUsuarioActivo() === false, 'No debería haber usuario activo después del logout');
  
  // Login con credenciales incorrectas
  test.assertThrows(() => sistema.login('juan@test.com', 'password-incorrecto'), 
    'Contraseña incorrecta', 'Debería fallar con contraseña incorrecta');
});

test.test('SistemaFintech - Gestión de cuentas', () => {
  const sistema = new SistemaFintech('test_storage');
  const cliente = sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  const cuenta = sistema.crearCuentaParaCliente(cliente.id, 1000, 'corriente');
  
  test.assert(sistema.data.cuentas.length === 1, 'Debería tener 1 cuenta');
  test.assert(cuenta.saldo === 1000, 'Cuenta debería tener saldo inicial correcto');
  test.assert(cliente.tieneCuenta(cuenta.codigo), 'Cliente debería tener la cuenta asociada');
  
  const cuentasCliente = sistema.getCuentasDeCliente(cliente.id);
  test.assert(cuentasCliente.length === 1, 'Debería retornar 1 cuenta para el cliente');
});

test.test('SistemaFintech - Depósitos y retiros', () => {
  const sistema = new SistemaFintech('test_storage');
  const cliente = sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  const cuenta = sistema.crearCuentaParaCliente(cliente.id, 1000);
  
  const resultadoDeposito = sistema.realizarDeposito(cuenta.codigo, 500, 'Depósito de prueba');
  test.assert(resultadoDeposito.exito === true, 'Depósito debería ser exitoso');
  
  const cuentaActualizada = sistema.getCuentaPorCodigo(cuenta.codigo);
  test.assert(cuentaActualizada.saldo === 1500, 'Saldo debería ser 1500');
  
  const resultadoRetiro = sistema.realizarRetiro(cuenta.codigo, 300, 'Retiro de prueba');
  test.assert(resultadoRetiro.exito === true, 'Retiro debería ser exitoso');
  
  const cuentaFinal = sistema.getCuentaPorCodigo(cuenta.codigo);
  test.assert(cuentaFinal.saldo === 1200, 'Saldo final debería ser 1200');
});

test.test('SistemaFintech - Gestión de tarjetas', () => {
  const sistema = new SistemaFintech('test_storage');
  const cliente = sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  const cuenta = sistema.crearCuentaParaCliente(cliente.id, 10000);
  const tarjeta = sistema.crearTarjetaParaCliente(cliente.id, cuenta.id, 'credito', 'visa', 5000);
  
  test.assert(sistema.data.tarjetas.length === 1, 'Debería tener 1 tarjeta');
  test.assert(tarjeta.limiteCredito === 5000, 'Tarjeta debería tener límite correcto');
  
  const tarjetasCliente = sistema.getTarjetasDeCliente(cliente.id);
  test.assert(tarjetasCliente.length === 1, 'Debería retornar 1 tarjeta para el cliente');
  
  const resultadoCompra = sistema.realizarCompraConTarjeta(tarjeta.id, 1000, 'Supermercado');
  test.assert(resultadoCompra.exito === true, 'Compra debería ser exitosa');
});

test.test('SistemaFintech - Gestión de préstamos', () => {
  const sistema = new SistemaFintech('test_storage');
  const cliente = sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  const cuenta = sistema.crearCuentaParaCliente(cliente.id, 10000);
  const prestamo = sistema.crearPrestamoParaCliente(cliente.id, 50000, 12, 15, 'personal', 'Compra de auto');
  
  test.assert(sistema.data.prestamos.length === 1, 'Debería tener 1 préstamo');
  test.assert(prestamo.estado === 'solicitado', 'Préstamo debería estar solicitado');
  
  const prestamoAprobado = sistema.aprobarPrestamo(prestamo.id, 'Cliente con buen perfil');
  test.assert(prestamoAprobado.estado === 'aprobado', 'Préstamo debería estar aprobado');
  
  const resultadoDesembolso = sistema.desembolsarPrestamo(prestamo.id, cuenta.codigo);
  test.assert(resultadoDesembolso.exito === true, 'Desembolso debería ser exitoso');
  test.assert(prestamoAprobado.estado === 'desembolsado', 'Préstamo debería estar desembolsado');
});

test.test('SistemaFintech - Resumen financiero', () => {
  const sistema = new SistemaFintech('test_storage');
  const cliente = sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  const cuenta = sistema.crearCuentaParaCliente(cliente.id, 10000);
  const tarjeta = sistema.crearTarjetaParaCliente(cliente.id, cuenta.id, 'credito', 'visa', 5000);
  const prestamo = sistema.crearPrestamoParaCliente(cliente.id, 30000, 12, 15, 'personal');
  
  sistema.aprobarPrestamo(prestamo.id);
  sistema.desembolsarPrestamo(prestamo.id, cuenta.codigo);
  
  const resumen = sistema.obtenerResumenFinanciero(cliente.id);
  
  test.assert(resumen.cuentas.cantidad === 1, 'Debería tener 1 cuenta en el resumen');
  test.assert(resumen.tarjetas.cantidad === 1, 'Debería tener 1 tarjeta en el resumen');
  test.assert(resumen.prestamos.cantidad === 1, 'Debería tener 1 préstamo en el resumen');
  test.assert(resumen.patrimonio !== undefined, 'Debería calcular el patrimonio');
});

test.test('SistemaFintech - Estadísticas del sistema', () => {
  const sistema = new SistemaFintech('test_storage');
  
  // Crear datos de prueba
  const cliente1 = sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  const cliente2 = sistema.crearCliente('María', 'García', '87654321', 'maria@test.com', 'password456');
  const cuenta1 = sistema.crearCuentaParaCliente(cliente1.id, 10000);
  const cuenta2 = sistema.crearCuentaParaCliente(cliente2.id, 5000);
  
  const estadisticas = sistema.obtenerEstadisticasSistema();
  
  test.assert(estadisticas.clientes.total === 2, 'Debería tener 2 clientes');
  test.assert(estadisticas.cuentas.total === 2, 'Debería tener 2 cuentas');
  test.assert(estadisticas.cuentas.saldoTotal === 15000, 'Saldo total debería ser 15000');
});

test.test('SistemaFintech - Validación de integridad', () => {
  const sistema = new SistemaFintech('test_storage');
  const cliente = sistema.crearCliente('Juan', 'Pérez', '12345678', 'juan@test.com', 'password123');
  const cuenta = sistema.crearCuentaParaCliente(cliente.id, 1000);
  
  const validacion = sistema.validarIntegridadDatos();
  test.assert(validacion.valido === true, 'Datos deberían ser válidos');
  test.assert(validacion.errores.length === 0, 'No debería haber errores');
});

// ========== PRUEBAS DE INTEGRACIÓN ==========

test.test('Integración - Flujo completo de cliente', () => {
  const sistema = new SistemaFintech('test_storage');
  
  // 1. Crear cliente
  const cliente = sistema.crearCliente('Ana', 'López', '11223344', 'ana@test.com', 'password123');
  test.assert(cliente.nombre === 'Ana', 'Cliente creado correctamente');
  
  // 2. Login
  const clienteLogin = sistema.login('ana@test.com', 'password123');
  test.assert(clienteLogin.id === cliente.id, 'Login exitoso');
  
  // 3. Crear cuenta
  const cuenta = sistema.crearCuentaParaCliente(cliente.id, 5000, 'ahorro');
  test.assert(cuenta.saldo === 5000, 'Cuenta creada con saldo inicial');
  
  // 4. Realizar operaciones
  sistema.realizarDeposito(cuenta.codigo, 2000, 'Depósito inicial');
  sistema.realizarRetiro(cuenta.codigo, 1000, 'Retiro para gastos');
  
  const cuentaFinal = sistema.getCuentaPorCodigo(cuenta.codigo);
  test.assert(cuentaFinal.saldo === 6000, 'Saldo final correcto');
  
  // 5. Crear tarjeta
  const tarjeta = sistema.crearTarjetaParaCliente(cliente.id, cuenta.id, 'debito', 'mastercard');
  test.assert(tarjeta.tipoTarjeta === 'debito', 'Tarjeta creada correctamente');
  
  // 6. Solicitar préstamo
  const prestamo = sistema.crearPrestamoParaCliente(cliente.id, 20000, 24, 12, 'personal', 'Mejoras en casa');
  test.assert(prestamo.estado === 'solicitado', 'Préstamo solicitado correctamente');
  
  // 7. Obtener resumen
  const resumen = sistema.obtenerResumenFinanciero(cliente.id);
  test.assert(resumen.cuentas.cantidad === 1, 'Resumen completo generado');
});

test.test('Integración - Persistencia de datos', () => {
  const sistema1 = new SistemaFintech('test_storage');
  const cliente = sistema1.crearCliente('Test', 'Usuario', '99887766', 'test@test.com', 'password123');
  const cuenta = sistema1.crearCuentaParaCliente(cliente.id, 1000);
  
  // Crear nuevo sistema (simula recarga de página)
  const sistema2 = new SistemaFintech('test_storage');
  
  const clienteCargado = sistema2.getClientePorEmail('test@test.com');
  test.assert(clienteCargado !== null, 'Cliente debería persistir');
  test.assert(clienteCargado.nombre === 'Test', 'Datos del cliente deberían persistir');
  
  const cuentaCargada = sistema2.getCuentaPorCodigo(cuenta.codigo);
  test.assert(cuentaCargada !== null, 'Cuenta debería persistir');
  test.assert(cuentaCargada.saldo === 1000, 'Saldo de cuenta debería persistir');
});

// ========== PRUEBAS DE CASOS EDGE ==========

test.test('Casos Edge - Datos límite', () => {
  // Cliente con datos en límites mínimos
  const clienteMin = new Cliente('Ab', 'Cd', '1234567', 'a@b.c', '123456');
  test.assert(clienteMin.nombre === 'Ab', 'Debería aceptar nombre mínimo');
  
  // Cliente con datos en límites máximos
  const clienteMax = new Cliente('A'.repeat(50), 'B'.repeat(50), '12345678', 'test@test.com', 'A'.repeat(50));
  test.assert(clienteMax.nombre.length === 50, 'Debería aceptar nombre máximo');
});

test.test('Casos Edge - Operaciones financieras', () => {
  const cuenta = new Cuenta('cliente-123', 0.01); // Saldo mínimo
  
  // Depósito mínimo
  cuenta.depositar(0.01);
  test.assert(cuenta.saldo === 0.02, 'Debería manejar montos mínimos');
  
  // Retiro exacto del saldo
  cuenta.retirar(0.02);
  test.assert(cuenta.saldo === 0, 'Debería permitir retiro exacto del saldo');
});

test.test('Casos Edge - Manejo de errores', () => {
  const sistema = new SistemaFintech('test_storage');
  
  // Intentar operaciones sin usuario activo
  test.assertThrows(() => sistema.getCuentasDeCliente('cliente-inexistente'), 
    'Cliente no encontrado', 'Debería manejar cliente inexistente');
  
  // Intentar operaciones con datos inválidos
  test.assertThrows(() => sistema.realizarDeposito('cuenta-inexistente', 100), 
    'Cuenta no encontrada', 'Debería manejar cuenta inexistente');
});

// ========== EJECUTAR TODAS LAS PRUEBAS ==========

function ejecutarPruebasCompletas() {
  test.run();
}

// Función para ejecutar desde consola
if (typeof window !== 'undefined') {
  window.ejecutarPruebasCompletas = ejecutarPruebasCompletas;
}

// Ejecutar automáticamente si se carga el script
if (typeof window !== 'undefined' && window.location.pathname.includes('test')) {
  ejecutarPruebasCompletas();
}

