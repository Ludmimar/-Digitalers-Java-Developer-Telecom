/**
 * Clase Tarjeta - Sistema de Gestión Fintech
 * Representa una tarjeta de crédito o débito asociada a una cuenta bancaria
 */
class Tarjeta {
  /**
   * Constructor de la clase Tarjeta
   * @param {string} clienteId - ID del cliente propietario
   * @param {string} cuentaId - ID de la cuenta asociada
   * @param {string} tipoTarjeta - Tipo de tarjeta ('credito' o 'debito')
   * @param {string} marca - Marca de la tarjeta ('visa', 'mastercard', 'amex')
   * @param {number} limiteCredito - Límite de crédito (solo para tarjetas de crédito)
   */
  constructor(clienteId, cuentaId, tipoTarjeta, marca, limiteCredito = 0) {
    this.id = Tarjeta.generarId();
    this.numero = Tarjeta.generarNumeroTarjeta();
    this.clienteId = this.validarClienteId(clienteId);
    this.cuentaId = this.validarCuentaId(cuentaId);
    this.tipoTarjeta = this.validarTipoTarjeta(tipoTarjeta);
    this.marca = this.validarMarca(marca);
    this.limiteCredito = this.validarLimiteCredito(limiteCredito);
    this.saldoDisponible = this.tipoTarjeta === 'credito' ? this.limiteCredito : 0;
    this.fechaVencimiento = this.generarFechaVencimiento();
    this.cvv = this.generarCVV();
    this.nombreTitular = '';
    this.activa = true;
    this.bloqueada = false;
    this.fechaCreacion = new Date().toISOString();
    this.transacciones = [];
    this.limiteDiario = this.obtenerLimiteDiario();
    this.gastosHoy = 0;
    this.fechaUltimoGasto = null;
  }

  /**
   * Genera un ID único para la tarjeta
   * @returns {string} ID único generado
   */
  static generarId() {
    return 'tarjeta-' + Math.random().toString(36).slice(2, 10);
  }

  /**
   * Genera un número de tarjeta válido según la marca
   * @returns {string} Número de tarjeta generado
   */
  static generarNumeroTarjeta() {
    const prefijos = {
      'visa': ['4'],
      'mastercard': ['5'],
      'amex': ['3']
    };
    
    const prefijo = prefijos['visa'][0]; // Default a Visa
    const longitud = 16; // Longitud estándar
    
    let numero = prefijo;
    for (let i = 1; i < longitud - 1; i++) {
      numero += Math.floor(Math.random() * 10);
    }
    
    // Algoritmo de Luhn para dígito verificador
    const digitoVerificador = Tarjeta.calcularDigitoVerificador(numero);
    numero += digitoVerificador;
    
    return numero;
  }

  /**
   * Calcula el dígito verificador usando el algoritmo de Luhn
   * @param {string} numero - Número sin dígito verificador
   * @returns {string} Dígito verificador
   */
  static calcularDigitoVerificador(numero) {
    let suma = 0;
    let alternar = false;
    
    for (let i = numero.length - 1; i >= 0; i--) {
      let digito = parseInt(numero[i]);
      
      if (alternar) {
        digito *= 2;
        if (digito > 9) {
          digito = (digito % 10) + 1;
        }
      }
      
      suma += digito;
      alternar = !alternar;
    }
    
    return ((10 - (suma % 10)) % 10).toString();
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
   * Valida el ID de la cuenta
   * @param {string} cuentaId - ID de la cuenta a validar
   * @returns {string} ID de la cuenta validado
   * @throws {Error} Si el ID de la cuenta no es válido
   */
  validarCuentaId(cuentaId) {
    if (!cuentaId || typeof cuentaId !== 'string') {
      throw new Error('El ID de la cuenta es requerido y debe ser una cadena de texto');
    }
    if (cuentaId.trim().length === 0) {
      throw new Error('El ID de la cuenta no puede estar vacío');
    }
    return cuentaId.trim();
  }

  /**
   * Valida el tipo de tarjeta
   * @param {string} tipoTarjeta - Tipo de tarjeta a validar
   * @returns {string} Tipo de tarjeta validado
   * @throws {Error} Si el tipo de tarjeta no es válido
   */
  validarTipoTarjeta(tipoTarjeta) {
    const tiposValidos = ['credito', 'debito'];
    if (!tiposValidos.includes(tipoTarjeta)) {
      throw new Error(`Tipo de tarjeta inválido. Tipos válidos: ${tiposValidos.join(', ')}`);
    }
    return tipoTarjeta;
  }

  /**
   * Valida la marca de la tarjeta
   * @param {string} marca - Marca a validar
   * @returns {string} Marca validada
   * @throws {Error} Si la marca no es válida
   */
  validarMarca(marca) {
    const marcasValidas = ['visa', 'mastercard', 'amex'];
    if (!marcasValidas.includes(marca)) {
      throw new Error(`Marca inválida. Marcas válidas: ${marcasValidas.join(', ')}`);
    }
    return marca;
  }

  /**
   * Valida el límite de crédito
   * @param {number} limiteCredito - Límite de crédito a validar
   * @returns {number} Límite de crédito validado
   * @throws {Error} Si el límite de crédito no es válido
   */
  validarLimiteCredito(limiteCredito) {
    if (typeof limiteCredito !== 'number') {
      throw new Error('El límite de crédito debe ser un número');
    }
    if (isNaN(limiteCredito)) {
      throw new Error('El límite de crédito no puede ser NaN');
    }
    if (limiteCredito < 0) {
      throw new Error('El límite de crédito no puede ser negativo');
    }
    if (limiteCredito > 1000000) {
      throw new Error('El límite de crédito no puede exceder $1,000,000');
    }
    return Math.round(limiteCredito * 100) / 100;
  }

  /**
   * Genera una fecha de vencimiento (3 años desde hoy)
   * @returns {string} Fecha de vencimiento en formato ISO
   */
  generarFechaVencimiento() {
    const fecha = new Date();
    fecha.setFullYear(fecha.getFullYear() + 3);
    fecha.setMonth(11); // Diciembre
    fecha.setDate(31); // Último día del mes
    return fecha.toISOString();
  }

  /**
   * Genera un CVV de 3 dígitos
   * @returns {string} CVV generado
   */
  generarCVV() {
    return Math.floor(Math.random() * 1000).toString().padStart(3, '0');
  }

  /**
   * Obtiene el límite diario según el tipo de tarjeta
   * @returns {number} Límite diario
   */
  obtenerLimiteDiario() {
    const limites = {
      'credito': 10000,
      'debito': 5000
    };
    return limites[this.tipoTarjeta] || 5000;
  }

  /**
   * Realiza una compra con la tarjeta
   * @param {number} monto - Monto de la compra
   * @param {string} comercio - Nombre del comercio
   * @param {string} descripcion - Descripción de la compra (opcional)
   * @returns {Object} Resultado de la compra
   * @throws {Error} Si la compra no es válida
   */
  realizarCompra(monto, comercio, descripcion = '') {
    this.validarMonto(monto);
    this.verificarTarjetaActiva();
    this.verificarTarjetaNoBloqueada();
    this.verificarLimiteDiario(monto);
    this.verificarSaldoDisponible(monto);

    const montoRedondeado = Math.round(monto * 100) / 100;
    const saldoAnterior = this.saldoDisponible;
    
    if (this.tipoTarjeta === 'credito') {
      this.saldoDisponible -= montoRedondeado;
    } else {
      // Para tarjetas de débito, el saldo se maneja en la cuenta asociada
      this.saldoDisponible -= montoRedondeado;
    }

    const transaccion = {
      id: this.generarIdTransaccion(),
      tipo: 'compra',
      monto: montoRedondeado,
      comercio: comercio,
      descripcion: descripcion,
      fecha: new Date().toISOString(),
      estado: 'completada'
    };

    this.transacciones.push(transaccion);
    this.actualizarContadoresGasto(montoRedondeado);

    return {
      exito: true,
      monto: montoRedondeado,
      saldoAnterior: saldoAnterior,
      saldoNuevo: this.saldoDisponible,
      transaccion: transaccion
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
    if (monto > 50000) {
      throw new Error('El monto no puede exceder $50,000 por transacción');
    }
  }

  /**
   * Verifica que la tarjeta esté activa
   * @throws {Error} Si la tarjeta no está activa
   */
  verificarTarjetaActiva() {
    if (!this.activa) {
      throw new Error('La tarjeta no está activa');
    }
  }

  /**
   * Verifica que la tarjeta no esté bloqueada
   * @throws {Error} Si la tarjeta está bloqueada
   */
  verificarTarjetaNoBloqueada() {
    if (this.bloqueada) {
      throw new Error('La tarjeta está bloqueada');
    }
  }

  /**
   * Verifica que el gasto no exceda el límite diario
   * @param {number} monto - Monto a gastar
   * @throws {Error} Si excede el límite diario
   */
  verificarLimiteDiario(monto) {
    this.resetearContadoresSiEsNuevoDia();
    
    if (this.gastosHoy + monto > this.limiteDiario) {
      throw new Error(`Límite diario excedido. Límite: $${this.limiteDiario}, Gastado hoy: $${this.gastosHoy}`);
    }
  }

  /**
   * Verifica que haya saldo disponible
   * @param {number} monto - Monto a gastar
   * @throws {Error} Si no hay saldo suficiente
   */
  verificarSaldoDisponible(monto) {
    if (this.saldoDisponible < monto) {
      throw new Error(`Saldo insuficiente. Saldo disponible: $${this.saldoDisponible}`);
    }
  }

  /**
   * Resetea los contadores de gasto si es un nuevo día
   */
  resetearContadoresSiEsNuevoDia() {
    const hoy = new Date().toDateString();
    if (this.fechaUltimoGasto !== hoy) {
      this.gastosHoy = 0;
      this.fechaUltimoGasto = hoy;
    }
  }

  /**
   * Actualiza los contadores de gasto diario
   * @param {number} monto - Monto gastado
   */
  actualizarContadoresGasto(monto) {
    this.gastosHoy += monto;
    this.fechaUltimoGasto = new Date().toDateString();
  }

  /**
   * Genera un ID único para transacciones
   * @returns {string} ID único generado
   */
  generarIdTransaccion() {
    return 'txn-' + Math.random().toString(36).slice(2, 10);
  }

  /**
   * Obtiene el número de tarjeta enmascarado
   * @returns {string} Número enmascarado
   */
  obtenerNumeroEnmascarado() {
    const numero = this.numero;
    return numero.substring(0, 4) + ' **** **** ' + numero.substring(12);
  }

  /**
   * Obtiene la fecha de vencimiento formateada
   * @returns {string} Fecha de vencimiento formateada
   */
  obtenerFechaVencimientoFormateada() {
    const fecha = new Date(this.fechaVencimiento);
    const mes = String(fecha.getMonth() + 1).padStart(2, '0');
    const año = fecha.getFullYear().toString().slice(-2);
    return `${mes}/${año}`;
  }

  /**
   * Verifica si la tarjeta está vencida
   * @returns {boolean} True si está vencida
   */
  estaVencida() {
    const hoy = new Date();
    const fechaVencimiento = new Date(this.fechaVencimiento);
    return hoy > fechaVencimiento;
  }

  /**
   * Verifica si la tarjeta está próxima a vencer (30 días)
   * @returns {boolean} True si está próxima a vencer
   */
  estaProximaAVencer() {
    const hoy = new Date();
    const fechaVencimiento = new Date(this.fechaVencimiento);
    const diferenciaDias = (fechaVencimiento - hoy) / (1000 * 60 * 60 * 24);
    return diferenciaDias <= 30 && diferenciaDias > 0;
  }

  /**
   * Bloquea la tarjeta
   */
  bloquear() {
    this.bloqueada = true;
  }

  /**
   * Desbloquea la tarjeta
   */
  desbloquear() {
    this.bloqueada = false;
  }

  /**
   * Activa o desactiva la tarjeta
   * @param {boolean} activa - Estado de activación
   */
  cambiarEstado(activa) {
    this.activa = Boolean(activa);
  }

  /**
   * Establece el nombre del titular
   * @param {string} nombreTitular - Nombre del titular
   * @throws {Error} Si el nombre no es válido
   */
  establecerNombreTitular(nombreTitular) {
    if (!nombreTitular || typeof nombreTitular !== 'string') {
      throw new Error('El nombre del titular es requerido');
    }
    if (nombreTitular.trim().length < 2) {
      throw new Error('El nombre del titular debe tener al menos 2 caracteres');
    }
    this.nombreTitular = nombreTitular.trim();
  }

  /**
   * Obtiene el resumen de gastos del mes actual
   * @returns {Object} Resumen de gastos
   */
  obtenerResumenMensual() {
    const ahora = new Date();
    const inicioMes = new Date(ahora.getFullYear(), ahora.getMonth(), 1);
    const finMes = new Date(ahora.getFullYear(), ahora.getMonth() + 1, 0);

    const transaccionesMes = this.transacciones.filter(txn => {
      const fechaTxn = new Date(txn.fecha);
      return fechaTxn >= inicioMes && fechaTxn <= finMes;
    });

    const totalGastos = transaccionesMes.reduce((sum, txn) => sum + txn.monto, 0);

    return {
      mes: ahora.getMonth() + 1,
      año: ahora.getFullYear(),
      totalGastos: Math.round(totalGastos * 100) / 100,
      cantidadTransacciones: transaccionesMes.length,
      limiteCredito: this.limiteCredito,
      saldoDisponible: this.saldoDisponible,
      limiteDiario: this.limiteDiario,
      gastosHoy: this.gastosHoy
    };
  }

  /**
   * Obtiene la información completa de la tarjeta
   * @returns {Object} Información completa
   */
  obtenerInformacion() {
    return {
      id: this.id,
      numero: this.numero,
      numeroEnmascarado: this.obtenerNumeroEnmascarado(),
      clienteId: this.clienteId,
      cuentaId: this.cuentaId,
      tipoTarjeta: this.tipoTarjeta,
      marca: this.marca,
      limiteCredito: this.limiteCredito,
      saldoDisponible: this.saldoDisponible,
      fechaVencimiento: this.fechaVencimiento,
      fechaVencimientoFormateada: this.obtenerFechaVencimientoFormateada(),
      cvv: this.cvv,
      nombreTitular: this.nombreTitular,
      activa: this.activa,
      bloqueada: this.bloqueada,
      fechaCreacion: this.fechaCreacion,
      limiteDiario: this.limiteDiario,
      cantidadTransacciones: this.transacciones.length
    };
  }

  /**
   * Convierte la tarjeta a un objeto JSON
   * @returns {Object} Objeto JSON de la tarjeta
   */
  toJSON() {
    return {
      id: this.id,
      numero: this.numero,
      clienteId: this.clienteId,
      cuentaId: this.cuentaId,
      tipoTarjeta: this.tipoTarjeta,
      marca: this.marca,
      limiteCredito: this.limiteCredito,
      saldoDisponible: this.saldoDisponible,
      fechaVencimiento: this.fechaVencimiento,
      cvv: this.cvv,
      nombreTitular: this.nombreTitular,
      activa: this.activa,
      bloqueada: this.bloqueada,
      fechaCreacion: this.fechaCreacion,
      transacciones: [...this.transacciones],
      limiteDiario: this.limiteDiario,
      gastosHoy: this.gastosHoy,
      fechaUltimoGasto: this.fechaUltimoGasto
    };
  }

  /**
   * Crea una instancia de Tarjeta desde un objeto JSON
   * @param {Object} datos - Datos de la tarjeta en formato JSON
   * @returns {Tarjeta} Nueva instancia de Tarjeta
   */
  static fromJSON(datos) {
    const tarjeta = new Tarjeta(
      datos.clienteId,
      datos.cuentaId,
      datos.tipoTarjeta,
      datos.marca,
      datos.limiteCredito
    );
    
    tarjeta.id = datos.id;
    tarjeta.numero = datos.numero;
    tarjeta.saldoDisponible = datos.saldoDisponible;
    tarjeta.fechaVencimiento = datos.fechaVencimiento;
    tarjeta.cvv = datos.cvv;
    tarjeta.nombreTitular = datos.nombreTitular || '';
    tarjeta.activa = datos.activa !== undefined ? datos.activa : true;
    tarjeta.bloqueada = datos.bloqueada || false;
    tarjeta.fechaCreacion = datos.fechaCreacion;
    tarjeta.transacciones = [...(datos.transacciones || [])];
    tarjeta.limiteDiario = datos.limiteDiario || tarjeta.obtenerLimiteDiario();
    tarjeta.gastosHoy = datos.gastosHoy || 0;
    tarjeta.fechaUltimoGasto = datos.fechaUltimoGasto || null;
    
    return tarjeta;
  }

  /**
   * Valida todos los datos de la tarjeta
   * @returns {Object} Resultado de la validación
   */
  validarTarjeta() {
    const errores = [];
    
    try {
      this.validarClienteId(this.clienteId);
    } catch (error) {
      errores.push(`Cliente ID: ${error.message}`);
    }
    
    try {
      this.validarCuentaId(this.cuentaId);
    } catch (error) {
      errores.push(`Cuenta ID: ${error.message}`);
    }
    
    try {
      this.validarTipoTarjeta(this.tipoTarjeta);
    } catch (error) {
      errores.push(`Tipo de tarjeta: ${error.message}`);
    }
    
    try {
      this.validarMarca(this.marca);
    } catch (error) {
      errores.push(`Marca: ${error.message}`);
    }
    
    try {
      this.validarLimiteCredito(this.limiteCredito);
    } catch (error) {
      errores.push(`Límite de crédito: ${error.message}`);
    }

    return {
      valida: errores.length === 0,
      errores: errores
    };
  }
}

// Exportar la clase para uso en Node.js (si es necesario)
if (typeof module !== 'undefined' && module.exports) {
  module.exports = Tarjeta;
}
