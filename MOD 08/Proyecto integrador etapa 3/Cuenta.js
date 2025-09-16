/**
 * Clase Cuenta - Sistema de Gestión Fintech
 * Representa una cuenta bancaria con funcionalidades de depósito, retiro y gestión de movimientos
 */
class Cuenta {
  /**
   * Constructor de la clase Cuenta
   * @param {string} clienteId - ID del cliente propietario
   * @param {number} saldoInicial - Saldo inicial de la cuenta (opcional, default: 0)
   * @param {string} tipoCuenta - Tipo de cuenta (opcional, default: 'corriente')
   */
  constructor(clienteId, saldoInicial = 0, tipoCuenta = 'corriente') {
    this.id = Cuenta.generarId();
    this.codigo = Cuenta.generarCodigo();
    this.clienteId = this.validarClienteId(clienteId);
    this.saldo = this.validarSaldo(saldoInicial);
    this.tipoCuenta = this.validarTipoCuenta(tipoCuenta);
    this.movimientos = [];
    this.fechaCreacion = new Date().toISOString();
    this.activa = true;
    this.limiteRetiroDiario = this.obtenerLimiteRetiroDiario();
    this.retirosHoy = 0;
    this.fechaUltimoRetiro = null;
  }

  /**
   * Genera un ID único para la cuenta
   * @returns {string} ID único generado
   */
  static generarId() {
    return 'cuenta-' + Math.random().toString(36).slice(2, 10);
  }

  /**
   * Genera un código único para la cuenta
   * @returns {string} Código único generado
   */
  static generarCodigo() {
    const fecha = new Date();
    const año = fecha.getFullYear();
    const mes = String(fecha.getMonth() + 1).padStart(2, '0');
    const dia = String(fecha.getDate()).padStart(2, '0');
    const numero = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
    return `C-${año}${mes}${dia}-${numero}`;
  }

  /**
   * Valida el ID del cliente
   * @param {string} clienteId - ID del cliente a validar
   * @returns {string} ID del cliente validado
   * @throws {Error} Si el ID del cliente no es válido
   */
  validarClienteId(clienteId) {
    if (!clienteId || typeof clienteId !== 'string') {
      throw new Error('El ID del cliente es requerido y debe ser una cadena de texto');
    }
    if (clienteId.trim().length === 0) {
      throw new Error('El ID del cliente no puede estar vacío');
    }
    return clienteId.trim();
  }

  /**
   * Valida el saldo de la cuenta
   * @param {number} saldo - Saldo a validar
   * @returns {number} Saldo validado
   * @throws {Error} Si el saldo no es válido
   */
  validarSaldo(saldo) {
    if (typeof saldo !== 'number') {
      throw new Error('El saldo debe ser un número');
    }
    if (isNaN(saldo)) {
      throw new Error('El saldo no puede ser NaN');
    }
    if (saldo < 0) {
      throw new Error('El saldo inicial no puede ser negativo');
    }
    return Math.round(saldo * 100) / 100; // Redondear a 2 decimales
  }

  /**
   * Valida el tipo de cuenta
   * @param {string} tipoCuenta - Tipo de cuenta a validar
   * @returns {string} Tipo de cuenta validado
   * @throws {Error} Si el tipo de cuenta no es válido
   */
  validarTipoCuenta(tipoCuenta) {
    const tiposValidos = ['corriente', 'ahorro', 'empresarial', 'premium'];
    if (!tiposValidos.includes(tipoCuenta)) {
      throw new Error(`Tipo de cuenta inválido. Tipos válidos: ${tiposValidos.join(', ')}`);
    }
    return tipoCuenta;
  }

  /**
   * Obtiene el límite de retiro diario según el tipo de cuenta
   * @returns {number} Límite de retiro diario
   */
  obtenerLimiteRetiroDiario() {
    const limites = {
      'corriente': 50000,
      'ahorro': 20000,
      'empresarial': 200000,
      'premium': 100000
    };
    return limites[this.tipoCuenta] || 50000;
  }

  /**
   * Realiza un depósito en la cuenta
   * @param {number} monto - Monto a depositar
   * @param {string} descripcion - Descripción del depósito (opcional)
   * @returns {Object} Resultado del depósito
   * @throws {Error} Si el depósito no es válido
   */
  depositar(monto, descripcion = 'Depósito') {
    this.validarMonto(monto);
    this.verificarCuentaActiva();

    const montoRedondeado = Math.round(monto * 100) / 100;
    const saldoAnterior = this.saldo;
    this.saldo += montoRedondeado;

    const movimiento = new Movimiento('deposito', montoRedondeado, descripcion);
    this.agregarMovimiento(movimiento);

    return {
      exito: true,
      monto: montoRedondeado,
      saldoAnterior: saldoAnterior,
      saldoNuevo: this.saldo,
      movimiento: movimiento
    };
  }

  /**
   * Realiza un retiro de la cuenta
   * @param {number} monto - Monto a retirar
   * @param {string} descripcion - Descripción del retiro (opcional)
   * @returns {Object} Resultado del retiro
   * @throws {Error} Si el retiro no es válido
   */
  retirar(monto, descripcion = 'Retiro') {
    this.validarMonto(monto);
    this.verificarCuentaActiva();
    this.verificarSaldoSuficiente(monto);
    this.verificarLimiteRetiroDiario(monto);

    const montoRedondeado = Math.round(monto * 100) / 100;
    const saldoAnterior = this.saldo;
    this.saldo -= montoRedondeado;

    const movimiento = new Movimiento('retiro', montoRedondeado, descripcion);
    this.agregarMovimiento(movimiento);

    // Actualizar contadores de retiro diario
    this.actualizarContadoresRetiro(montoRedondeado);

    return {
      exito: true,
      monto: montoRedondeado,
      saldoAnterior: saldoAnterior,
      saldoNuevo: this.saldo,
      movimiento: movimiento
    };
  }

  /**
   * Valida el monto de una transacción
   * @param {number} monto - Monto a validar
   * @throws {Error} Si el monto no es válido
   */
  validarMonto(monto) {
    if (typeof monto !== 'number') {
      throw new Error('El monto debe ser un número');
    }
    if (isNaN(monto)) {
      throw new Error('El monto no puede ser NaN');
    }
    if (monto <= 0) {
      throw new Error('El monto debe ser mayor a 0');
    }
    if (monto > 1000000) {
      throw new Error('El monto no puede exceder $1,000,000');
    }
  }

  /**
   * Verifica que la cuenta esté activa
   * @throws {Error} Si la cuenta no está activa
   */
  verificarCuentaActiva() {
    if (!this.activa) {
      throw new Error('La cuenta no está activa');
    }
  }

  /**
   * Verifica que haya saldo suficiente para el retiro
   * @param {number} monto - Monto a retirar
   * @throws {Error} Si no hay saldo suficiente
   */
  verificarSaldoSuficiente(monto) {
    if (this.saldo < monto) {
      throw new Error(`Saldo insuficiente. Saldo disponible: $${this.saldo}`);
    }
  }

  /**
   * Verifica que el retiro no exceda el límite diario
   * @param {number} monto - Monto a retirar
   * @throws {Error} Si excede el límite diario
   */
  verificarLimiteRetiroDiario(monto) {
    this.resetearContadoresSiEsNuevoDia();
    
    if (this.retirosHoy + monto > this.limiteRetiroDiario) {
      throw new Error(`Límite de retiro diario excedido. Límite: $${this.limiteRetiroDiario}, Retirado hoy: $${this.retirosHoy}`);
    }
  }

  /**
   * Resetea los contadores de retiro si es un nuevo día
   */
  resetearContadoresSiEsNuevoDia() {
    const hoy = new Date().toDateString();
    if (this.fechaUltimoRetiro !== hoy) {
      this.retirosHoy = 0;
      this.fechaUltimoRetiro = hoy;
    }
  }

  /**
   * Actualiza los contadores de retiro diario
   * @param {number} monto - Monto retirado
   */
  actualizarContadoresRetiro(monto) {
    this.retirosHoy += monto;
    this.fechaUltimoRetiro = new Date().toDateString();
  }

  /**
   * Agrega un movimiento a la cuenta
   * @param {Movimiento} movimiento - Movimiento a agregar
   */
  agregarMovimiento(movimiento) {
    this.movimientos.push(movimiento);
  }

  /**
   * Obtiene el saldo actual de la cuenta
   * @returns {number} Saldo actual
   */
  obtenerSaldo() {
    return this.saldo;
  }

  /**
   * Obtiene todos los movimientos de la cuenta
   * @returns {Array} Array de movimientos
   */
  obtenerMovimientos() {
    return [...this.movimientos];
  }

  /**
   * Obtiene los movimientos de un tipo específico
   * @param {string} tipo - Tipo de movimiento ('deposito' o 'retiro')
   * @returns {Array} Array de movimientos del tipo especificado
   */
  obtenerMovimientosPorTipo(tipo) {
    return this.movimientos.filter(mov => mov.tipo === tipo);
  }

  /**
   * Obtiene los movimientos de un rango de fechas
   * @param {Date} fechaInicio - Fecha de inicio
   * @param {Date} fechaFin - Fecha de fin
   * @returns {Array} Array de movimientos en el rango especificado
   */
  obtenerMovimientosPorFecha(fechaInicio, fechaFin) {
    return this.movimientos.filter(mov => {
      const fechaMovimiento = new Date(mov.fecha);
      return fechaMovimiento >= fechaInicio && fechaMovimiento <= fechaFin;
    });
  }

  /**
   * Obtiene el resumen de movimientos del mes actual
   * @returns {Object} Resumen de movimientos
   */
  obtenerResumenMensual() {
    const ahora = new Date();
    const inicioMes = new Date(ahora.getFullYear(), ahora.getMonth(), 1);
    const finMes = new Date(ahora.getFullYear(), ahora.getMonth() + 1, 0);

    const movimientosMes = this.obtenerMovimientosPorFecha(inicioMes, finMes);
    
    const depositos = movimientosMes.filter(mov => mov.tipo === 'deposito');
    const retiros = movimientosMes.filter(mov => mov.tipo === 'retiro');

    const totalDepositos = depositos.reduce((sum, mov) => sum + mov.monto, 0);
    const totalRetiros = retiros.reduce((sum, mov) => sum + mov.monto, 0);

    return {
      mes: ahora.getMonth() + 1,
      año: ahora.getFullYear(),
      totalDepositos: Math.round(totalDepositos * 100) / 100,
      totalRetiros: Math.round(totalRetiros * 100) / 100,
      saldoInicialMes: this.saldo - totalDepositos + totalRetiros,
      saldoFinalMes: this.saldo,
      cantidadDepositos: depositos.length,
      cantidadRetiros: retiros.length
    };
  }

  /**
   * Activa o desactiva la cuenta
   * @param {boolean} activa - Estado de activación
   */
  cambiarEstado(activa) {
    this.activa = Boolean(activa);
  }

  /**
   * Verifica si la cuenta está activa
   * @returns {boolean} True si la cuenta está activa
   */
  estaActiva() {
    return this.activa;
  }

  /**
   * Cambia el tipo de cuenta
   * @param {string} nuevoTipo - Nuevo tipo de cuenta
   * @throws {Error} Si el nuevo tipo no es válido
   */
  cambiarTipoCuenta(nuevoTipo) {
    this.tipoCuenta = this.validarTipoCuenta(nuevoTipo);
    this.limiteRetiroDiario = this.obtenerLimiteRetiroDiario();
  }

  /**
   * Obtiene la información básica de la cuenta
   * @returns {Object} Información básica de la cuenta
   */
  obtenerInformacion() {
    return {
      id: this.id,
      codigo: this.codigo,
      clienteId: this.clienteId,
      saldo: this.saldo,
      tipoCuenta: this.tipoCuenta,
      activa: this.activa,
      fechaCreacion: this.fechaCreacion,
      limiteRetiroDiario: this.limiteRetiroDiario,
      cantidadMovimientos: this.movimientos.length
    };
  }

  /**
   * Convierte la cuenta a un objeto JSON
   * @returns {Object} Objeto JSON de la cuenta
   */
  toJSON() {
    return {
      id: this.id,
      codigo: this.codigo,
      clienteId: this.clienteId,
      saldo: this.saldo,
      tipoCuenta: this.tipoCuenta,
      movimientos: this.movimientos.map(mov => mov.toJSON()),
      fechaCreacion: this.fechaCreacion,
      activa: this.activa,
      limiteRetiroDiario: this.limiteRetiroDiario,
      retirosHoy: this.retirosHoy,
      fechaUltimoRetiro: this.fechaUltimoRetiro
    };
  }

  /**
   * Crea una instancia de Cuenta desde un objeto JSON
   * @param {Object} datos - Datos de la cuenta en formato JSON
   * @returns {Cuenta} Nueva instancia de Cuenta
   */
  static fromJSON(datos) {
    const cuenta = new Cuenta(
      datos.clienteId,
      datos.saldo,
      datos.tipoCuenta
    );
    
    cuenta.id = datos.id;
    cuenta.codigo = datos.codigo;
    cuenta.movimientos = datos.movimientos.map(movData => Movimiento.fromJSON(movData));
    cuenta.fechaCreacion = datos.fechaCreacion;
    cuenta.activa = datos.activa !== undefined ? datos.activa : true;
    cuenta.limiteRetiroDiario = datos.limiteRetiroDiario || cuenta.obtenerLimiteRetiroDiario();
    cuenta.retirosHoy = datos.retirosHoy || 0;
    cuenta.fechaUltimoRetiro = datos.fechaUltimoRetiro || null;
    
    return cuenta;
  }

  /**
   * Valida todos los datos de la cuenta
   * @returns {Object} Resultado de la validación
   */
  validarCuenta() {
    const errores = [];
    
    try {
      this.validarClienteId(this.clienteId);
    } catch (error) {
      errores.push(`Cliente ID: ${error.message}`);
    }
    
    try {
      this.validarSaldo(this.saldo);
    } catch (error) {
      errores.push(`Saldo: ${error.message}`);
    }
    
    try {
      this.validarTipoCuenta(this.tipoCuenta);
    } catch (error) {
      errores.push(`Tipo de cuenta: ${error.message}`);
    }

    return {
      valida: errores.length === 0,
      errores: errores
    };
  }
}

// Exportar la clase para uso en Node.js (si es necesario)
if (typeof module !== 'undefined' && module.exports) {
  module.exports = Cuenta;
}
