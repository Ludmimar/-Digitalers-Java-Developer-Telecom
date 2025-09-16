/**
 * Clase SistemaFintech - Sistema de Gestión Fintech Completo
 * Integra todas las clases del sistema: Cliente, Cuenta, Movimiento, Tarjeta, Prestamo
 * Maneja la persistencia y operaciones del sistema completo
 */
class SistemaFintech {
  /**
   * Constructor de la clase SistemaFintech
   * @param {string} storageKey - Clave para localStorage (opcional)
   */
  constructor(storageKey = 'fintech_data_v3') {
    this.storageKey = storageKey;
    this.data = {
      clientes: [],
      cuentas: [],
      tarjetas: [],
      prestamos: [],
      configuracion: {
        version: '3.0',
        fechaCreacion: new Date().toISOString(),
        ultimaActualizacion: new Date().toISOString()
      }
    };
    this.usuarioActivo = null;
    this.cargar();
  }

  /**
   * Guarda todos los datos en localStorage
   */
  guardar() {
    try {
      this.data.configuracion.ultimaActualizacion = new Date().toISOString();
      localStorage.setItem(this.storageKey, JSON.stringify(this.data));
      return true;
    } catch (error) {
      console.error('Error al guardar datos:', error);
      return false;
    }
  }

  /**
   * Carga todos los datos desde localStorage
   */
  cargar() {
    try {
      const raw = localStorage.getItem(this.storageKey);
      if (raw) {
        const parsed = JSON.parse(raw);
        
        // Reconstruir objetos Cliente
        this.data.clientes = (parsed.clientes || []).map(c => {
          const cliente = Cliente.fromJSON(c);
          return cliente;
        });
        
        // Reconstruir objetos Cuenta
        this.data.cuentas = (parsed.cuentas || []).map(ct => {
          const cuenta = Cuenta.fromJSON(ct);
          return cuenta;
        });
        
        // Reconstruir objetos Tarjeta
        this.data.tarjetas = (parsed.tarjetas || []).map(t => {
          const tarjeta = Tarjeta.fromJSON(t);
          return tarjeta;
        });
        
        // Reconstruir objetos Prestamo
        this.data.prestamos = (parsed.prestamos || []).map(p => {
          const prestamo = Prestamo.fromJSON(p);
          return prestamo;
        });
        
        // Mantener configuración
        this.data.configuracion = parsed.configuracion || this.data.configuracion;
      }
    } catch (error) {
      console.error('Error al cargar datos:', error);
      this.data = {
        clientes: [],
        cuentas: [],
        tarjetas: [],
        prestamos: [],
        configuracion: {
          version: '3.0',
          fechaCreacion: new Date().toISOString(),
          ultimaActualizacion: new Date().toISOString()
        }
      };
    }
  }

  // ========== GESTIÓN DE CLIENTES ==========

  /**
   * Crea un nuevo cliente
   * @param {string} nombre - Nombre del cliente
   * @param {string} apellido - Apellido del cliente
   * @param {string} dni - DNI del cliente
   * @param {string} email - Email del cliente
   * @param {string} password - Contraseña del cliente
   * @param {string} telefono - Teléfono del cliente (opcional)
   * @param {string} direccion - Dirección del cliente (opcional)
   * @returns {Cliente} Cliente creado
   */
  crearCliente(nombre, apellido, dni, email, password, telefono = '', direccion = '') {
    if (this.getClientePorEmail(email)) {
      throw new Error('El email ya está registrado');
    }
    
    const cliente = new Cliente(nombre, apellido, dni, email, password, telefono, direccion);
    this.data.clientes.push(cliente);
    this.guardar();
    return cliente;
  }

  /**
   * Realiza login de un cliente
   * @param {string} email - Email del cliente
   * @param {string} password - Contraseña del cliente
   * @returns {Cliente} Cliente autenticado
   */
  login(email, password) {
    const cliente = this.getClientePorEmail(email);
    if (!cliente) {
      throw new Error('Usuario no encontrado');
    }
    if (!cliente.verificarPassword(password)) {
      throw new Error('Contraseña incorrecta');
    }
    if (!cliente.estaActivo()) {
      throw new Error('Usuario inactivo');
    }
    
    this.usuarioActivo = cliente;
    return cliente;
  }

  /**
   * Cierra la sesión del usuario activo
   */
  logout() {
    this.usuarioActivo = null;
  }

  /**
   * Obtiene un cliente por email
   * @param {string} email - Email del cliente
   * @returns {Cliente|null} Cliente encontrado o null
   */
  getClientePorEmail(email) {
    return this.data.clientes.find(c => c.email === email.toLowerCase());
  }

  /**
   * Obtiene un cliente por ID
   * @param {string} clienteId - ID del cliente
   * @returns {Cliente|null} Cliente encontrado o null
   */
  getClientePorId(clienteId) {
    return this.data.clientes.find(c => c.id === clienteId);
  }

  /**
   * Obtiene todos los clientes
   * @returns {Array} Array de clientes
   */
  obtenerTodosLosClientes() {
    return [...this.data.clientes];
  }

  // ========== GESTIÓN DE CUENTAS ==========

  /**
   * Crea una cuenta para un cliente
   * @param {string} clienteId - ID del cliente
   * @param {number} saldoInicial - Saldo inicial (opcional)
   * @param {string} tipoCuenta - Tipo de cuenta (opcional)
   * @returns {Cuenta} Cuenta creada
   */
  crearCuentaParaCliente(clienteId, saldoInicial = 0, tipoCuenta = 'corriente') {
    const cliente = this.getClientePorId(clienteId);
    if (!cliente) {
      throw new Error('Cliente no encontrado');
    }
    
    const cuenta = new Cuenta(clienteId, saldoInicial, tipoCuenta);
    this.data.cuentas.push(cuenta);
    cliente.agregarCuenta(cuenta.codigo);
    this.guardar();
    return cuenta;
  }

  /**
   * Obtiene las cuentas de un cliente
   * @param {string} clienteId - ID del cliente
   * @returns {Array} Array de cuentas
   */
  getCuentasDeCliente(clienteId) {
    return this.data.cuentas.filter(c => c.clienteId === clienteId);
  }

  /**
   * Obtiene una cuenta por código
   * @param {string} codigo - Código de la cuenta
   * @returns {Cuenta|null} Cuenta encontrada o null
   */
  getCuentaPorCodigo(codigo) {
    return this.data.cuentas.find(c => c.codigo === codigo);
  }

  /**
   * Realiza un depósito en una cuenta
   * @param {string} codigoCuenta - Código de la cuenta
   * @param {number} monto - Monto a depositar
   * @param {string} descripcion - Descripción del depósito (opcional)
   * @returns {Object} Resultado del depósito
   */
  realizarDeposito(codigoCuenta, monto, descripcion = 'Depósito') {
    const cuenta = this.getCuentaPorCodigo(codigoCuenta);
    if (!cuenta) {
      throw new Error('Cuenta no encontrada');
    }
    
    const resultado = cuenta.depositar(monto, descripcion);
    this.guardar();
    return resultado;
  }

  /**
   * Realiza un retiro de una cuenta
   * @param {string} codigoCuenta - Código de la cuenta
   * @param {number} monto - Monto a retirar
   * @param {string} descripcion - Descripción del retiro (opcional)
   * @returns {Object} Resultado del retiro
   */
  realizarRetiro(codigoCuenta, monto, descripcion = 'Retiro') {
    const cuenta = this.getCuentaPorCodigo(codigoCuenta);
    if (!cuenta) {
      throw new Error('Cuenta no encontrada');
    }
    
    const resultado = cuenta.retirar(monto, descripcion);
    this.guardar();
    return resultado;
  }

  // ========== GESTIÓN DE TARJETAS ==========

  /**
   * Crea una tarjeta para un cliente
   * @param {string} clienteId - ID del cliente
   * @param {string} cuentaId - ID de la cuenta asociada
   * @param {string} tipoTarjeta - Tipo de tarjeta ('credito' o 'debito')
   * @param {string} marca - Marca de la tarjeta
   * @param {number} limiteCredito - Límite de crédito (solo para tarjetas de crédito)
   * @returns {Tarjeta} Tarjeta creada
   */
  crearTarjetaParaCliente(clienteId, cuentaId, tipoTarjeta, marca, limiteCredito = 0) {
    const cliente = this.getClientePorId(clienteId);
    if (!cliente) {
      throw new Error('Cliente no encontrado');
    }
    
    const cuenta = this.data.cuentas.find(c => c.id === cuentaId);
    if (!cuenta) {
      throw new Error('Cuenta no encontrada');
    }
    
    if (cuenta.clienteId !== clienteId) {
      throw new Error('La cuenta no pertenece al cliente');
    }
    
    const tarjeta = new Tarjeta(clienteId, cuentaId, tipoTarjeta, marca, limiteCredito);
    this.data.tarjetas.push(tarjeta);
    this.guardar();
    return tarjeta;
  }

  /**
   * Obtiene las tarjetas de un cliente
   * @param {string} clienteId - ID del cliente
   * @returns {Array} Array de tarjetas
   */
  getTarjetasDeCliente(clienteId) {
    return this.data.tarjetas.filter(t => t.clienteId === clienteId);
  }

  /**
   * Obtiene una tarjeta por ID
   * @param {string} tarjetaId - ID de la tarjeta
   * @returns {Tarjeta|null} Tarjeta encontrada o null
   */
  getTarjetaPorId(tarjetaId) {
    return this.data.tarjetas.find(t => t.id === tarjetaId);
  }

  /**
   * Realiza una compra con una tarjeta
   * @param {string} tarjetaId - ID de la tarjeta
   * @param {number} monto - Monto de la compra
   * @param {string} comercio - Nombre del comercio
   * @param {string} descripcion - Descripción de la compra (opcional)
   * @returns {Object} Resultado de la compra
   */
  realizarCompraConTarjeta(tarjetaId, monto, comercio, descripcion = '') {
    const tarjeta = this.getTarjetaPorId(tarjetaId);
    if (!tarjeta) {
      throw new Error('Tarjeta no encontrada');
    }
    
    const resultado = tarjeta.realizarCompra(monto, comercio, descripcion);
    
    // Si es tarjeta de débito, también afectar la cuenta asociada
    if (tarjeta.tipoTarjeta === 'debito') {
      const cuenta = this.getCuentaPorCodigo(tarjeta.cuentaId);
      if (cuenta) {
        cuenta.retirar(monto, `Compra con tarjeta - ${comercio}`);
      }
    }
    
    this.guardar();
    return resultado;
  }

  // ========== GESTIÓN DE PRÉSTAMOS ==========

  /**
   * Crea un préstamo para un cliente
   * @param {string} clienteId - ID del cliente
   * @param {number} montoSolicitado - Monto solicitado
   * @param {number} plazoMeses - Plazo en meses
   * @param {number} tasaInteres - Tasa de interés anual
   * @param {string} tipoPrestamo - Tipo de préstamo
   * @param {string} proposito - Propósito del préstamo (opcional)
   * @returns {Prestamo} Préstamo creado
   */
  crearPrestamoParaCliente(clienteId, montoSolicitado, plazoMeses, tasaInteres, tipoPrestamo, proposito = '') {
    const cliente = this.getClientePorId(clienteId);
    if (!cliente) {
      throw new Error('Cliente no encontrado');
    }
    
    const prestamo = new Prestamo(clienteId, montoSolicitado, plazoMeses, tasaInteres, tipoPrestamo, proposito);
    this.data.prestamos.push(prestamo);
    this.guardar();
    return prestamo;
  }

  /**
   * Obtiene los préstamos de un cliente
   * @param {string} clienteId - ID del cliente
   * @returns {Array} Array de préstamos
   */
  getPrestamosDeCliente(clienteId) {
    return this.data.prestamos.filter(p => p.clienteId === clienteId);
  }

  /**
   * Obtiene un préstamo por ID
   * @param {string} prestamoId - ID del préstamo
   * @returns {Prestamo|null} Préstamo encontrado o null
   */
  getPrestamoPorId(prestamoId) {
    return this.data.prestamos.find(p => p.id === prestamoId);
  }

  /**
   * Aprueba un préstamo
   * @param {string} prestamoId - ID del préstamo
   * @param {string} observaciones - Observaciones de la aprobación (opcional)
   * @returns {Prestamo} Préstamo aprobado
   */
  aprobarPrestamo(prestamoId, observaciones = '') {
    const prestamo = this.getPrestamoPorId(prestamoId);
    if (!prestamo) {
      throw new Error('Préstamo no encontrado');
    }
    
    prestamo.aprobar(observaciones);
    this.guardar();
    return prestamo;
  }

  /**
   * Rechaza un préstamo
   * @param {string} prestamoId - ID del préstamo
   * @param {string} motivo - Motivo del rechazo
   * @returns {Prestamo} Préstamo rechazado
   */
  rechazarPrestamo(prestamoId, motivo) {
    const prestamo = this.getPrestamoPorId(prestamoId);
    if (!prestamo) {
      throw new Error('Préstamo no encontrado');
    }
    
    prestamo.rechazar(motivo);
    this.guardar();
    return prestamo;
  }

  /**
   * Desembolsa un préstamo
   * @param {string} prestamoId - ID del préstamo
   * @param {string} cuentaDestino - Cuenta de destino del desembolso
   * @returns {Object} Resultado del desembolso
   */
  desembolsarPrestamo(prestamoId, cuentaDestino) {
    const prestamo = this.getPrestamoPorId(prestamoId);
    if (!prestamo) {
      throw new Error('Préstamo no encontrado');
    }
    
    const cuenta = this.getCuentaPorCodigo(cuentaDestino);
    if (!cuenta) {
      throw new Error('Cuenta de destino no encontrada');
    }
    
    prestamo.desembolsar(cuentaDestino);
    cuenta.depositar(prestamo.montoAprobado, `Desembolso préstamo ${prestamo.numeroPrestamo}`);
    
    this.guardar();
    return {
      exito: true,
      prestamo: prestamo,
      cuenta: cuenta,
      montoDesembolsado: prestamo.montoAprobado
    };
  }

  /**
   * Registra un pago de préstamo
   * @param {string} prestamoId - ID del préstamo
   * @param {number} monto - Monto del pago
   * @param {string} fechaPago - Fecha del pago (opcional)
   * @param {string} observaciones - Observaciones del pago (opcional)
   * @returns {Object} Resultado del pago
   */
  registrarPagoPrestamo(prestamoId, monto, fechaPago = null, observaciones = '') {
    const prestamo = this.getPrestamoPorId(prestamoId);
    if (!prestamo) {
      throw new Error('Préstamo no encontrado');
    }
    
    const resultado = prestamo.registrarPago(monto, fechaPago, observaciones);
    this.guardar();
    return resultado;
  }

  // ========== REPORTES Y ESTADÍSTICAS ==========

  /**
   * Obtiene el resumen financiero de un cliente
   * @param {string} clienteId - ID del cliente
   * @returns {Object} Resumen financiero
   */
  obtenerResumenFinanciero(clienteId) {
    const cliente = this.getClientePorId(clienteId);
    if (!cliente) {
      throw new Error('Cliente no encontrado');
    }
    
    const cuentas = this.getCuentasDeCliente(clienteId);
    const tarjetas = this.getTarjetasDeCliente(clienteId);
    const prestamos = this.getPrestamosDeCliente(clienteId);
    
    const saldoTotal = cuentas.reduce((sum, c) => sum + c.obtenerSaldo(), 0);
    const limiteCreditoTotal = tarjetas.reduce((sum, t) => sum + t.limiteCredito, 0);
    const saldoDisponibleTotal = tarjetas.reduce((sum, t) => sum + t.saldoDisponible, 0);
    const deudaTotal = prestamos.reduce((sum, p) => sum + p.saldoPendiente, 0);
    
    return {
      cliente: cliente.obtenerInformacion(),
      cuentas: {
        cantidad: cuentas.length,
        saldoTotal: Math.round(saldoTotal * 100) / 100,
        cuentasActivas: cuentas.filter(c => c.estaActiva()).length
      },
      tarjetas: {
        cantidad: tarjetas.length,
        limiteCreditoTotal: Math.round(limiteCreditoTotal * 100) / 100,
        saldoDisponibleTotal: Math.round(saldoDisponibleTotal * 100) / 100,
        tarjetasActivas: tarjetas.filter(t => t.activa && !t.bloqueada).length
      },
      prestamos: {
        cantidad: prestamos.length,
        deudaTotal: Math.round(deudaTotal * 100) / 100,
        prestamosActivos: prestamos.filter(p => p.estado === 'desembolsado').length
      },
      patrimonio: Math.round((saldoTotal + saldoDisponibleTotal - deudaTotal) * 100) / 100
    };
  }

  /**
   * Obtiene estadísticas generales del sistema
   * @returns {Object} Estadísticas del sistema
   */
  obtenerEstadisticasSistema() {
    const totalClientes = this.data.clientes.length;
    const clientesActivos = this.data.clientes.filter(c => c.estaActivo()).length;
    const totalCuentas = this.data.cuentas.length;
    const cuentasActivas = this.data.cuentas.filter(c => c.estaActiva()).length;
    const totalTarjetas = this.data.tarjetas.length;
    const tarjetasActivas = this.data.tarjetas.filter(t => t.activa && !t.bloqueada).length;
    const totalPrestamos = this.data.prestamos.length;
    const prestamosActivos = this.data.prestamos.filter(p => p.estado === 'desembolsado').length;
    
    const saldoTotalSistema = this.data.cuentas.reduce((sum, c) => sum + c.obtenerSaldo(), 0);
    const limiteCreditoTotalSistema = this.data.tarjetas.reduce((sum, t) => sum + t.limiteCredito, 0);
    const deudaTotalSistema = this.data.prestamos.reduce((sum, p) => sum + p.saldoPendiente, 0);
    
    return {
      clientes: {
        total: totalClientes,
        activos: clientesActivos,
        inactivos: totalClientes - clientesActivos
      },
      cuentas: {
        total: totalCuentas,
        activas: cuentasActivas,
        saldoTotal: Math.round(saldoTotalSistema * 100) / 100
      },
      tarjetas: {
        total: totalTarjetas,
        activas: tarjetasActivas,
        limiteCreditoTotal: Math.round(limiteCreditoTotalSistema * 100) / 100
      },
      prestamos: {
        total: totalPrestamos,
        activos: prestamosActivos,
        deudaTotal: Math.round(deudaTotalSistema * 100) / 100
      },
      sistema: {
        version: this.data.configuracion.version,
        fechaCreacion: this.data.configuracion.fechaCreacion,
        ultimaActualizacion: this.data.configuracion.ultimaActualizacion
      }
    };
  }

  // ========== UTILIDADES ==========

  /**
   * Obtiene el usuario activo
   * @returns {Cliente|null} Usuario activo o null
   */
  obtenerUsuarioActivo() {
    return this.usuarioActivo;
  }

  /**
   * Verifica si hay un usuario activo
   * @returns {boolean} True si hay usuario activo
   */
  hayUsuarioActivo() {
    return this.usuarioActivo !== null;
  }

  /**
   * Limpia todos los datos del sistema
   */
  limpiarDatos() {
    this.data = {
      clientes: [],
      cuentas: [],
      tarjetas: [],
      prestamos: [],
      configuracion: {
        version: '3.0',
        fechaCreacion: new Date().toISOString(),
        ultimaActualizacion: new Date().toISOString()
      }
    };
    this.usuarioActivo = null;
    this.guardar();
  }

  /**
   * Exporta todos los datos del sistema
   * @returns {Object} Datos exportados
   */
  exportarDatos() {
    return {
      ...this.data,
      exportado: new Date().toISOString()
    };
  }

  /**
   * Importa datos al sistema
   * @param {Object} datos - Datos a importar
   * @returns {boolean} True si la importación fue exitosa
   */
  importarDatos(datos) {
    try {
      if (!datos.clientes || !Array.isArray(datos.clientes)) {
        throw new Error('Formato de datos inválido');
      }
      
      this.data = {
        clientes: datos.clientes.map(c => Cliente.fromJSON(c)),
        cuentas: (datos.cuentas || []).map(ct => Cuenta.fromJSON(ct)),
        tarjetas: (datos.tarjetas || []).map(t => Tarjeta.fromJSON(t)),
        prestamos: (datos.prestamos || []).map(p => Prestamo.fromJSON(p)),
        configuracion: datos.configuracion || this.data.configuracion
      };
      
      this.guardar();
      return true;
    } catch (error) {
      console.error('Error al importar datos:', error);
      return false;
    }
  }

  /**
   * Valida la integridad de los datos
   * @returns {Object} Resultado de la validación
   */
  validarIntegridadDatos() {
    const errores = [];
    
    // Validar clientes
    this.data.clientes.forEach((cliente, index) => {
      const validacion = cliente.validarCliente();
      if (!validacion.valido) {
        errores.push(`Cliente ${index}: ${validacion.errores.join(', ')}`);
      }
    });
    
    // Validar cuentas
    this.data.cuentas.forEach((cuenta, index) => {
      const validacion = cuenta.validarCuenta();
      if (!validacion.valida) {
        errores.push(`Cuenta ${index}: ${validacion.errores.join(', ')}`);
      }
      
      // Verificar que el cliente existe
      if (!this.getClientePorId(cuenta.clienteId)) {
        errores.push(`Cuenta ${index}: Cliente no encontrado`);
      }
    });
    
    // Validar tarjetas
    this.data.tarjetas.forEach((tarjeta, index) => {
      const validacion = tarjeta.validarTarjeta();
      if (!validacion.valida) {
        errores.push(`Tarjeta ${index}: ${validacion.errores.join(', ')}`);
      }
      
      // Verificar que el cliente y cuenta existen
      if (!this.getClientePorId(tarjeta.clienteId)) {
        errores.push(`Tarjeta ${index}: Cliente no encontrado`);
      }
      if (!this.data.cuentas.find(c => c.id === tarjeta.cuentaId)) {
        errores.push(`Tarjeta ${index}: Cuenta no encontrada`);
      }
    });
    
    // Validar préstamos
    this.data.prestamos.forEach((prestamo, index) => {
      const validacion = prestamo.validarPrestamo();
      if (!validacion.valido) {
        errores.push(`Préstamo ${index}: ${validacion.errores.join(', ')}`);
      }
      
      // Verificar que el cliente existe
      if (!this.getClientePorId(prestamo.clienteId)) {
        errores.push(`Préstamo ${index}: Cliente no encontrado`);
      }
    });
    
    return {
      valido: errores.length === 0,
      errores: errores
    };
  }
}

// Exportar la clase para uso en Node.js (si es necesario)
if (typeof module !== 'undefined' && module.exports) {
  module.exports = SistemaFintech;
}
