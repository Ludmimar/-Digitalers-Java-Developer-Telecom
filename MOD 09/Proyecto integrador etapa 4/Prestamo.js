/**
 * Clase Prestamo - Sistema de Gestión Fintech
 * Representa un préstamo bancario con funcionalidades de cálculo de cuotas y seguimiento de pagos
 */
class Prestamo {
  /**
   * Constructor de la clase Prestamo
   * @param {string} clienteId - ID del cliente solicitante
   * @param {number} montoSolicitado - Monto del préstamo solicitado
   * @param {number} plazoMeses - Plazo del préstamo en meses
   * @param {number} tasaInteres - Tasa de interés anual (porcentaje)
   * @param {string} tipoPrestamo - Tipo de préstamo ('personal', 'hipotecario', 'automotriz', 'empresarial')
   * @param {string} proposito - Propósito del préstamo (opcional)
   */
  constructor(clienteId, montoSolicitado, plazoMeses, tasaInteres, tipoPrestamo, proposito = '') {
    this.id = Prestamo.generarId();
    this.numeroPrestamo = Prestamo.generarNumeroPrestamo();
    this.clienteId = this.validarClienteId(clienteId);
    this.montoSolicitado = this.validarMonto(montoSolicitado);
    this.plazoMeses = this.validarPlazo(plazoMeses);
    this.tasaInteres = this.validarTasaInteres(tasaInteres);
    this.tipoPrestamo = this.validarTipoPrestamo(tipoPrestamo);
    this.proposito = this.validarProposito(proposito);
    
    // Cálculos financieros
    this.montoAprobado = this.calcularMontoAprobado();
    this.cuotaMensual = this.calcularCuotaMensual();
    this.totalAPagar = this.calcularTotalAPagar();
    this.interesTotal = this.calcularInteresTotal();
    
    // Estado del préstamo
    this.estado = 'solicitado';
    this.fechaSolicitud = new Date().toISOString();
    this.fechaAprobacion = null;
    this.fechaDesembolso = null;
    this.fechaVencimiento = null;
    
    // Seguimiento de pagos
    this.pagosRealizados = [];
    this.saldoPendiente = this.montoAprobado;
    this.cuotasPagadas = 0;
    this.cuotasVencidas = 0;
    this.proximoVencimiento = null;
    
    // Configuración adicional
    this.moraDiaria = this.calcularMoraDiaria();
    this.garantias = [];
    this.observaciones = '';
  }

  /**
   * Genera un ID único para el préstamo
   * @returns {string} ID único generado
   */
  static generarId() {
    return 'prestamo-' + Math.random().toString(36).slice(2, 10);
  }

  /**
   * Genera un número único para el préstamo
   * @returns {string} Número único generado
   */
  static generarNumeroPrestamo() {
    const fecha = new Date();
    const año = fecha.getFullYear();
    const mes = String(fecha.getMonth() + 1).padStart(2, '0');
    const numero = Math.floor(Math.random() * 10000).toString().padStart(4, '0');
    return `PR-${año}${mes}-${numero}`;
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
   * Valida el monto del préstamo
   * @param {number} monto - Monto a validar
   * @returns {number} Monto validado
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
    if (monto > 5000000) {
      throw new Error('El monto no puede exceder $5,000,000');
    }
    return Math.round(monto * 100) / 100;
  }

  /**
   * Valida el plazo del préstamo
   * @param {number} plazo - Plazo a validar
   * @returns {number} Plazo validado
   * @throws {Error} Si el plazo no es válido
   */
  validarPlazo(plazo) {
    if (typeof plazo !== 'number') {
      throw new Error('El plazo debe ser un número');
    }
    if (isNaN(plazo)) {
      throw new Error('El plazo no puede ser NaN');
    }
    if (plazo <= 0) {
      throw new Error('El plazo debe ser mayor a 0');
    }
    if (plazo > 360) {
      throw new Error('El plazo no puede exceder 360 meses (30 años)');
    }
    return Math.floor(plazo);
  }

  /**
   * Valida la tasa de interés
   * @param {number} tasa - Tasa a validar
   * @returns {number} Tasa validada
   * @throws {Error} Si la tasa no es válida
   */
  validarTasaInteres(tasa) {
    if (typeof tasa !== 'number') {
      throw new Error('La tasa de interés debe ser un número');
    }
    if (isNaN(tasa)) {
      throw new Error('La tasa de interés no puede ser NaN');
    }
    if (tasa < 0) {
      throw new Error('La tasa de interés no puede ser negativa');
    }
    if (tasa > 50) {
      throw new Error('La tasa de interés no puede exceder 50% anual');
    }
    return Math.round(tasa * 100) / 100;
  }

  /**
   * Valida el tipo de préstamo
   * @param {string} tipo - Tipo a validar
   * @returns {string} Tipo validado
   * @throws {Error} Si el tipo no es válido
   */
  validarTipoPrestamo(tipo) {
    const tiposValidos = ['personal', 'hipotecario', 'automotriz', 'empresarial', 'educativo'];
    if (!tiposValidos.includes(tipo)) {
      throw new Error(`Tipo de préstamo inválido. Tipos válidos: ${tiposValidos.join(', ')}`);
    }
    return tipo;
  }

  /**
   * Valida el propósito del préstamo
   * @param {string} proposito - Propósito a validar
   * @returns {string} Propósito validado
   */
  validarProposito(proposito) {
    if (typeof proposito !== 'string') {
      return '';
    }
    return proposito.trim().substring(0, 200); // Máximo 200 caracteres
  }

  /**
   * Calcula el monto aprobado basado en el tipo de préstamo
   * @returns {number} Monto aprobado
   */
  calcularMontoAprobado() {
    const factoresAprobacion = {
      'personal': 0.8,
      'hipotecario': 0.9,
      'automotriz': 0.85,
      'empresarial': 0.7,
      'educativo': 0.95
    };
    
    const factor = factoresAprobacion[this.tipoPrestamo] || 0.8;
    return Math.round(this.montoSolicitado * factor * 100) / 100;
  }

  /**
   * Calcula la cuota mensual usando la fórmula de amortización
   * @returns {number} Cuota mensual
   */
  calcularCuotaMensual() {
    const tasaMensual = this.tasaInteres / 100 / 12;
    const cuota = (this.montoAprobado * tasaMensual * Math.pow(1 + tasaMensual, this.plazoMeses)) / 
                  (Math.pow(1 + tasaMensual, this.plazoMeses) - 1);
    return Math.round(cuota * 100) / 100;
  }

  /**
   * Calcula el total a pagar
   * @returns {number} Total a pagar
   */
  calcularTotalAPagar() {
    return Math.round(this.cuotaMensual * this.plazoMeses * 100) / 100;
  }

  /**
   * Calcula el interés total
   * @returns {number} Interés total
   */
  calcularInteresTotal() {
    return Math.round((this.totalAPagar - this.montoAprobado) * 100) / 100;
  }

  /**
   * Calcula la mora diaria
   * @returns {number} Mora diaria
   */
  calcularMoraDiaria() {
    const moraAnual = this.tasaInteres * 0.5; // 50% de la tasa de interés
    return Math.round((this.cuotaMensual * moraAnual / 100 / 30) * 100) / 100;
  }

  /**
   * Aprueba el préstamo
   * @param {string} observaciones - Observaciones de la aprobación (opcional)
   */
  aprobar(observaciones = '') {
    if (this.estado !== 'solicitado') {
      throw new Error('Solo se pueden aprobar préstamos en estado solicitado');
    }
    
    this.estado = 'aprobado';
    this.fechaAprobacion = new Date().toISOString();
    this.observaciones = observaciones;
    this.calcularFechasVencimiento();
  }

  /**
   * Rechaza el préstamo
   * @param {string} motivo - Motivo del rechazo
   */
  rechazar(motivo) {
    if (this.estado !== 'solicitado') {
      throw new Error('Solo se pueden rechazar préstamos en estado solicitado');
    }
    
    this.estado = 'rechazado';
    this.observaciones = motivo;
  }

  /**
   * Desembolsa el préstamo
   * @param {string} cuentaDestino - Cuenta de destino del desembolso
   */
  desembolsar(cuentaDestino) {
    if (this.estado !== 'aprobado') {
      throw new Error('Solo se pueden desembolsar préstamos aprobados');
    }
    
    this.estado = 'desembolsado';
    this.fechaDesembolso = new Date().toISOString();
    this.calcularFechasVencimiento();
  }

  /**
   * Calcula las fechas de vencimiento
   */
  calcularFechasVencimiento() {
    if (this.fechaDesembolso) {
      const fechaDesembolso = new Date(this.fechaDesembolso);
      const fechaVencimiento = new Date(fechaDesembolso);
      fechaVencimiento.setMonth(fechaVencimiento.getMonth() + this.plazoMeses);
      this.fechaVencimiento = fechaVencimiento.toISOString();
      
      // Calcular próximo vencimiento
      const proximoVencimiento = new Date(fechaDesembolso);
      proximoVencimiento.setMonth(proximoVencimiento.getMonth() + this.cuotasPagadas + 1);
      this.proximoVencimiento = proximoVencimiento.toISOString();
    }
  }

  /**
   * Registra un pago
   * @param {number} monto - Monto del pago
   * @param {string} fechaPago - Fecha del pago (opcional, default: fecha actual)
   * @param {string} observaciones - Observaciones del pago (opcional)
   * @returns {Object} Resultado del pago
   */
  registrarPago(monto, fechaPago = null, observaciones = '') {
    if (this.estado !== 'desembolsado') {
      throw new Error('Solo se pueden registrar pagos en préstamos desembolsados');
    }
    
    this.validarMonto(monto);
    
    const fecha = fechaPago ? new Date(fechaPago) : new Date();
    const pago = {
      id: this.generarIdPago(),
      monto: Math.round(monto * 100) / 100,
      fecha: fecha.toISOString(),
      observaciones: observaciones,
      tipo: this.determinarTipoPago(monto)
    };
    
    this.pagosRealizados.push(pago);
    this.saldoPendiente -= pago.monto;
    
    // Actualizar contadores
    if (pago.monto >= this.cuotaMensual) {
      this.cuotasPagadas += Math.floor(pago.monto / this.cuotaMensual);
    }
    
    // Verificar si está al día
    this.verificarEstadoCuotas();
    
    return {
      exito: true,
      pago: pago,
      saldoPendiente: this.saldoPendiente,
      cuotasPagadas: this.cuotasPagadas
    };
  }

  /**
   * Determina el tipo de pago
   * @param {number} monto - Monto del pago
   * @returns {string} Tipo de pago
   */
  determinarTipoPago(monto) {
    if (monto >= this.cuotaMensual) {
      return 'cuota_completa';
    } else if (monto > 0) {
      return 'pago_parcial';
    } else {
      return 'pago_extra';
    }
  }

  /**
   * Genera un ID único para pagos
   * @returns {string} ID único generado
   */
  generarIdPago() {
    return 'pago-' + Math.random().toString(36).slice(2, 10);
  }

  /**
   * Verifica el estado de las cuotas
   */
  verificarEstadoCuotas() {
    if (this.fechaDesembolso) {
      const fechaDesembolso = new Date(this.fechaDesembolso);
      const mesesTranscurridos = this.calcularMesesTranscurridos(fechaDesembolso);
      this.cuotasVencidas = Math.max(0, mesesTranscurridos - this.cuotasPagadas);
    }
  }

  /**
   * Calcula los meses transcurridos desde una fecha
   * @param {Date} fechaInicio - Fecha de inicio
   * @returns {number} Meses transcurridos
   */
  calcularMesesTranscurridos(fechaInicio) {
    const ahora = new Date();
    const meses = (ahora.getFullYear() - fechaInicio.getFullYear()) * 12 + 
                  (ahora.getMonth() - fechaInicio.getMonth());
    return Math.max(0, meses);
  }

  /**
   * Calcula la mora acumulada
   * @returns {number} Mora acumulada
   */
  calcularMoraAcumulada() {
    return Math.round(this.cuotasVencidas * this.moraDiaria * 30 * 100) / 100;
  }

  /**
   * Obtiene el estado del préstamo formateado
   * @returns {string} Estado formateado
   */
  obtenerEstadoFormateado() {
    const estados = {
      'solicitado': 'Solicitado',
      'aprobado': 'Aprobado',
      'rechazado': 'Rechazado',
      'desembolsado': 'Desembolsado',
      'pagado': 'Pagado',
      'vencido': 'Vencido'
    };
    return estados[this.estado] || this.estado;
  }

  /**
   * Obtiene el tipo de préstamo formateado
   * @returns {string} Tipo formateado
   */
  obtenerTipoFormateado() {
    const tipos = {
      'personal': 'Personal',
      'hipotecario': 'Hipotecario',
      'automotriz': 'Automotriz',
      'empresarial': 'Empresarial',
      'educativo': 'Educativo'
    };
    return tipos[this.tipoPrestamo] || this.tipoPrestamo;
  }

  /**
   * Obtiene el resumen del préstamo
   * @returns {Object} Resumen del préstamo
   */
  obtenerResumen() {
    return {
      numeroPrestamo: this.numeroPrestamo,
      tipo: this.obtenerTipoFormateado(),
      montoSolicitado: this.montoSolicitado,
      montoAprobado: this.montoAprobado,
      cuotaMensual: this.cuotaMensual,
      plazoMeses: this.plazoMeses,
      tasaInteres: this.tasaInteres,
      estado: this.obtenerEstadoFormateado(),
      saldoPendiente: this.saldoPendiente,
      cuotasPagadas: this.cuotasPagadas,
      cuotasVencidas: this.cuotasVencidas,
      moraAcumulada: this.calcularMoraAcumulada()
    };
  }

  /**
   * Obtiene la información completa del préstamo
   * @returns {Object} Información completa
   */
  obtenerInformacion() {
    return {
      id: this.id,
      numeroPrestamo: this.numeroPrestamo,
      clienteId: this.clienteId,
      montoSolicitado: this.montoSolicitado,
      montoAprobado: this.montoAprobado,
      plazoMeses: this.plazoMeses,
      tasaInteres: this.tasaInteres,
      tipoPrestamo: this.tipoPrestamo,
      proposito: this.proposito,
      cuotaMensual: this.cuotaMensual,
      totalAPagar: this.totalAPagar,
      interesTotal: this.interesTotal,
      estado: this.estado,
      fechaSolicitud: this.fechaSolicitud,
      fechaAprobacion: this.fechaAprobacion,
      fechaDesembolso: this.fechaDesembolso,
      fechaVencimiento: this.fechaVencimiento,
      saldoPendiente: this.saldoPendiente,
      cuotasPagadas: this.cuotasPagadas,
      cuotasVencidas: this.cuotasVencidas,
      proximoVencimiento: this.proximoVencimiento,
      moraDiaria: this.moraDiaria,
      cantidadPagos: this.pagosRealizados.length,
      observaciones: this.observaciones
    };
  }

  /**
   * Convierte el préstamo a un objeto JSON
   * @returns {Object} Objeto JSON del préstamo
   */
  toJSON() {
    return {
      id: this.id,
      numeroPrestamo: this.numeroPrestamo,
      clienteId: this.clienteId,
      montoSolicitado: this.montoSolicitado,
      montoAprobado: this.montoAprobado,
      plazoMeses: this.plazoMeses,
      tasaInteres: this.tasaInteres,
      tipoPrestamo: this.tipoPrestamo,
      proposito: this.proposito,
      cuotaMensual: this.cuotaMensual,
      totalAPagar: this.totalAPagar,
      interesTotal: this.interesTotal,
      estado: this.estado,
      fechaSolicitud: this.fechaSolicitud,
      fechaAprobacion: this.fechaAprobacion,
      fechaDesembolso: this.fechaDesembolso,
      fechaVencimiento: this.fechaVencimiento,
      saldoPendiente: this.saldoPendiente,
      cuotasPagadas: this.cuotasPagadas,
      cuotasVencidas: this.cuotasVencidas,
      proximoVencimiento: this.proximoVencimiento,
      moraDiaria: this.moraDiaria,
      pagosRealizados: [...this.pagosRealizados],
      garantias: [...this.garantias],
      observaciones: this.observaciones
    };
  }

  /**
   * Crea una instancia de Prestamo desde un objeto JSON
   * @param {Object} datos - Datos del préstamo en formato JSON
   * @returns {Prestamo} Nueva instancia de Prestamo
   */
  static fromJSON(datos) {
    const prestamo = new Prestamo(
      datos.clienteId,
      datos.montoSolicitado,
      datos.plazoMeses,
      datos.tasaInteres,
      datos.tipoPrestamo,
      datos.proposito
    );
    
    prestamo.id = datos.id;
    prestamo.numeroPrestamo = datos.numeroPrestamo;
    prestamo.montoAprobado = datos.montoAprobado;
    prestamo.cuotaMensual = datos.cuotaMensual;
    prestamo.totalAPagar = datos.totalAPagar;
    prestamo.interesTotal = datos.interesTotal;
    prestamo.estado = datos.estado;
    prestamo.fechaSolicitud = datos.fechaSolicitud;
    prestamo.fechaAprobacion = datos.fechaAprobacion;
    prestamo.fechaDesembolso = datos.fechaDesembolso;
    prestamo.fechaVencimiento = datos.fechaVencimiento;
    prestamo.saldoPendiente = datos.saldoPendiente;
    prestamo.cuotasPagadas = datos.cuotasPagadas;
    prestamo.cuotasVencidas = datos.cuotasVencidas;
    prestamo.proximoVencimiento = datos.proximoVencimiento;
    prestamo.moraDiaria = datos.moraDiaria;
    prestamo.pagosRealizados = [...(datos.pagosRealizados || [])];
    prestamo.garantias = [...(datos.garantias || [])];
    prestamo.observaciones = datos.observaciones || '';
    
    return prestamo;
  }

  /**
   * Valida todos los datos del préstamo
   * @returns {Object} Resultado de la validación
   */
  validarPrestamo() {
    const errores = [];
    
    try {
      this.validarClienteId(this.clienteId);
    } catch (error) {
      errores.push(`Cliente ID: ${error.message}`);
    }
    
    try {
      this.validarMonto(this.montoSolicitado);
    } catch (error) {
      errores.push(`Monto: ${error.message}`);
    }
    
    try {
      this.validarPlazo(this.plazoMeses);
    } catch (error) {
      errores.push(`Plazo: ${error.message}`);
    }
    
    try {
      this.validarTasaInteres(this.tasaInteres);
    } catch (error) {
      errores.push(`Tasa de interés: ${error.message}`);
    }
    
    try {
      this.validarTipoPrestamo(this.tipoPrestamo);
    } catch (error) {
      errores.push(`Tipo de préstamo: ${error.message}`);
    }

    return {
      valido: errores.length === 0,
      errores: errores
    };
  }
}

// Exportar la clase para uso en Node.js (si es necesario)
if (typeof module !== 'undefined' && module.exports) {
  module.exports = Prestamo;
}

