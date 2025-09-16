/**
 * Clase Movimiento - Sistema de Gestión Fintech
 * Representa una transacción financiera (depósito o retiro) en una cuenta bancaria
 */
class Movimiento {
  /**
   * Constructor de la clase Movimiento
   * @param {string} tipo - Tipo de movimiento ('deposito' o 'retiro')
   * @param {number} monto - Monto de la transacción
   * @param {string} descripcion - Descripción del movimiento (opcional)
   * @param {string} fecha - Fecha del movimiento (opcional, default: fecha actual)
   */
  constructor(tipo, monto, descripcion = '', fecha = null) {
    this.id = Movimiento.generarId();
    this.tipo = this.validarTipo(tipo);
    this.monto = this.validarMonto(monto);
    this.descripcion = this.validarDescripcion(descripcion);
    this.fecha = fecha ? new Date(fecha).toISOString() : new Date().toISOString();
    this.estado = 'completado';
    this.referencia = this.generarReferencia();
  }

  /**
   * Genera un ID único para el movimiento
   * @returns {string} ID único generado
   */
  static generarId() {
    return 'mov-' + Math.random().toString(36).slice(2, 10);
  }

  /**
   * Valida el tipo de movimiento
   * @param {string} tipo - Tipo a validar
   * @returns {string} Tipo validado
   * @throws {Error} Si el tipo no es válido
   */
  validarTipo(tipo) {
    const tiposValidos = ['deposito', 'retiro', 'transferencia', 'pago', 'cobro'];
    if (!tiposValidos.includes(tipo)) {
      throw new Error(`Tipo de movimiento inválido. Tipos válidos: ${tiposValidos.join(', ')}`);
    }
    return tipo;
  }

  /**
   * Valida el monto del movimiento
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
    if (monto > 1000000) {
      throw new Error('El monto no puede exceder $1,000,000');
    }
    return Math.round(monto * 100) / 100; // Redondear a 2 decimales
  }

  /**
   * Valida la descripción del movimiento
   * @param {string} descripcion - Descripción a validar
   * @returns {string} Descripción validada
   */
  validarDescripcion(descripcion) {
    if (typeof descripcion !== 'string') {
      return '';
    }
    return descripcion.trim().substring(0, 200); // Máximo 200 caracteres
  }

  /**
   * Genera una referencia única para el movimiento
   * @returns {string} Referencia generada
   */
  generarReferencia() {
    const fecha = new Date(this.fecha);
    const timestamp = fecha.getTime().toString().slice(-8);
    const random = Math.random().toString(36).slice(2, 6).toUpperCase();
    return `REF-${timestamp}-${random}`;
  }

  /**
   * Obtiene el tipo de movimiento formateado
   * @returns {string} Tipo formateado
   */
  obtenerTipoFormateado() {
    const tipos = {
      'deposito': 'Depósito',
      'retiro': 'Retiro',
      'transferencia': 'Transferencia',
      'pago': 'Pago',
      'cobro': 'Cobro'
    };
    return tipos[this.tipo] || this.tipo;
  }

  /**
   * Obtiene el monto formateado con signo según el tipo
   * @returns {string} Monto formateado
   */
  obtenerMontoFormateado() {
    const signo = this.tipo === 'deposito' || this.tipo === 'cobro' ? '+' : '-';
    return `${signo}$${this.monto.toFixed(2)}`;
  }

  /**
   * Obtiene la fecha formateada
   * @returns {string} Fecha formateada
   */
  obtenerFechaFormateada() {
    const fecha = new Date(this.fecha);
    return fecha.toLocaleDateString('es-ES', {
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour: '2-digit',
      minute: '2-digit'
    });
  }

  /**
   * Obtiene la fecha formateada solo con fecha (sin hora)
   * @returns {string} Fecha formateada sin hora
   */
  obtenerSoloFecha() {
    const fecha = new Date(this.fecha);
    return fecha.toLocaleDateString('es-ES', {
      year: 'numeric',
      month: '2-digit',
      day: '2-digit'
    });
  }

  /**
   * Obtiene la hora formateada
   * @returns {string} Hora formateada
   */
  obtenerHora() {
    const fecha = new Date(this.fecha);
    return fecha.toLocaleTimeString('es-ES', {
      hour: '2-digit',
      minute: '2-digit'
    });
  }

  /**
   * Verifica si el movimiento es de tipo depósito
   * @returns {boolean} True si es depósito
   */
  esDeposito() {
    return this.tipo === 'deposito';
  }

  /**
   * Verifica si el movimiento es de tipo retiro
   * @returns {boolean} True si es retiro
   */
  esRetiro() {
    return this.tipo === 'retiro';
  }

  /**
   * Verifica si el movimiento es de tipo transferencia
   * @returns {boolean} True si es transferencia
   */
  esTransferencia() {
    return this.tipo === 'transferencia';
  }

  /**
   * Obtiene el impacto en el saldo (positivo o negativo)
   * @returns {number} Impacto en el saldo
   */
  obtenerImpactoSaldo() {
    return this.esDeposito() || this.tipo === 'cobro' ? this.monto : -this.monto;
  }

  /**
   * Cambia el estado del movimiento
   * @param {string} nuevoEstado - Nuevo estado
   * @throws {Error} Si el estado no es válido
   */
  cambiarEstado(nuevoEstado) {
    const estadosValidos = ['pendiente', 'completado', 'cancelado', 'rechazado'];
    if (!estadosValidos.includes(nuevoEstado)) {
      throw new Error(`Estado inválido. Estados válidos: ${estadosValidos.join(', ')}`);
    }
    this.estado = nuevoEstado;
  }

  /**
   * Obtiene el estado del movimiento
   * @returns {string} Estado actual
   */
  obtenerEstado() {
    return this.estado;
  }

  /**
   * Verifica si el movimiento está completado
   * @returns {boolean} True si está completado
   */
  estaCompletado() {
    return this.estado === 'completado';
  }

  /**
   * Verifica si el movimiento está pendiente
   * @returns {boolean} True si está pendiente
   */
  estaPendiente() {
    return this.estado === 'pendiente';
  }

  /**
   * Verifica si el movimiento está cancelado
   * @returns {boolean} True si está cancelado
   */
  estaCancelado() {
    return this.estado === 'cancelado';
  }

  /**
   * Obtiene la información completa del movimiento
   * @returns {Object} Información completa
   */
  obtenerInformacion() {
    return {
      id: this.id,
      tipo: this.tipo,
      tipoFormateado: this.obtenerTipoFormateado(),
      monto: this.monto,
      montoFormateado: this.obtenerMontoFormateado(),
      descripcion: this.descripcion,
      fecha: this.fecha,
      fechaFormateada: this.obtenerFechaFormateada(),
      soloFecha: this.obtenerSoloFecha(),
      hora: this.obtenerHora(),
      estado: this.estado,
      referencia: this.referencia,
      impactoSaldo: this.obtenerImpactoSaldo()
    };
  }

  /**
   * Obtiene un resumen del movimiento
   * @returns {string} Resumen del movimiento
   */
  obtenerResumen() {
    return `${this.obtenerTipoFormateado()} - ${this.obtenerMontoFormateado()} - ${this.obtenerFechaFormateada()}`;
  }

  /**
   * Convierte el movimiento a un objeto JSON
   * @returns {Object} Objeto JSON del movimiento
   */
  toJSON() {
    return {
      id: this.id,
      tipo: this.tipo,
      monto: this.monto,
      descripcion: this.descripcion,
      fecha: this.fecha,
      estado: this.estado,
      referencia: this.referencia
    };
  }

  /**
   * Crea una instancia de Movimiento desde un objeto JSON
   * @param {Object} datos - Datos del movimiento en formato JSON
   * @returns {Movimiento} Nueva instancia de Movimiento
   */
  static fromJSON(datos) {
    const movimiento = new Movimiento(
      datos.tipo,
      datos.monto,
      datos.descripcion,
      datos.fecha
    );
    
    movimiento.id = datos.id;
    movimiento.estado = datos.estado || 'completado';
    movimiento.referencia = datos.referencia || movimiento.generarReferencia();
    
    return movimiento;
  }

  /**
   * Valida todos los datos del movimiento
   * @returns {Object} Resultado de la validación
   */
  validarMovimiento() {
    const errores = [];
    
    try {
      this.validarTipo(this.tipo);
    } catch (error) {
      errores.push(`Tipo: ${error.message}`);
    }
    
    try {
      this.validarMonto(this.monto);
    } catch (error) {
      errores.push(`Monto: ${error.message}`);
    }

    return {
      valido: errores.length === 0,
      errores: errores
    };
  }

  /**
   * Compara dos movimientos por fecha
   * @param {Movimiento} otro - Otro movimiento a comparar
   * @returns {number} -1, 0, o 1 según la comparación
   */
  compararPorFecha(otro) {
    const fecha1 = new Date(this.fecha);
    const fecha2 = new Date(otro.fecha);
    return fecha1 - fecha2;
  }

  /**
   * Compara dos movimientos por monto
   * @param {Movimiento} otro - Otro movimiento a comparar
   * @returns {number} -1, 0, o 1 según la comparación
   */
  compararPorMonto(otro) {
    return this.monto - otro.monto;
  }

  /**
   * Verifica si el movimiento es del día actual
   * @returns {boolean} True si es del día actual
   */
  esDeHoy() {
    const hoy = new Date().toDateString();
    const fechaMovimiento = new Date(this.fecha).toDateString();
    return hoy === fechaMovimiento;
  }

  /**
   * Verifica si el movimiento es de la semana actual
   * @returns {boolean} True si es de la semana actual
   */
  esDeEstaSemana() {
    const ahora = new Date();
    const inicioSemana = new Date(ahora.setDate(ahora.getDate() - ahora.getDay()));
    const finSemana = new Date(ahora.setDate(ahora.getDate() - ahora.getDay() + 6));
    const fechaMovimiento = new Date(this.fecha);
    
    return fechaMovimiento >= inicioSemana && fechaMovimiento <= finSemana;
  }

  /**
   * Verifica si el movimiento es del mes actual
   * @returns {boolean} True si es del mes actual
   */
  esDeEsteMes() {
    const ahora = new Date();
    const fechaMovimiento = new Date(this.fecha);
    
    return ahora.getMonth() === fechaMovimiento.getMonth() && 
           ahora.getFullYear() === fechaMovimiento.getFullYear();
  }
}

// Exportar la clase para uso en Node.js (si es necesario)
if (typeof module !== 'undefined' && module.exports) {
  module.exports = Movimiento;
}

