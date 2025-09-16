/**
 * Clase Cliente - Sistema de Gestión Fintech
 * Representa un cliente del sistema financiero con validaciones y métodos de gestión
 */
class Cliente {
  /**
   * Constructor de la clase Cliente
   * @param {string} nombre - Nombre del cliente
   * @param {string} apellido - Apellido del cliente
   * @param {string} dni - Documento Nacional de Identidad
   * @param {string} email - Correo electrónico del cliente
   * @param {string} password - Contraseña del cliente
   * @param {string} telefono - Teléfono del cliente (opcional)
   * @param {string} direccion - Dirección del cliente (opcional)
   */
  constructor(nombre, apellido, dni, email, password, telefono = '', direccion = '') {
    this.id = Cliente.generarId();
    this.nombre = this.validarNombre(nombre);
    this.apellido = this.validarApellido(apellido);
    this.dni = this.validarDNI(dni);
    this.email = this.validarEmail(email);
    this.password = this.validarPassword(password);
    this.telefono = telefono;
    this.direccion = direccion;
    this.cuentas = []; // Array de códigos de cuentas asociadas
    this.fechaRegistro = new Date().toISOString();
    this.activo = true;
  }

  /**
   * Genera un ID único para el cliente
   * @returns {string} ID único generado
   */
  static generarId() {
    return 'cli-' + Math.random().toString(36).slice(2, 10);
  }

  /**
   * Valida el nombre del cliente
   * @param {string} nombre - Nombre a validar
   * @returns {string} Nombre validado
   * @throws {Error} Si el nombre no es válido
   */
  validarNombre(nombre) {
    if (!nombre || typeof nombre !== 'string') {
      throw new Error('El nombre es requerido y debe ser una cadena de texto');
    }
    const nombreLimpio = nombre.trim();
    if (nombreLimpio.length < 2) {
      throw new Error('El nombre debe tener al menos 2 caracteres');
    }
    if (nombreLimpio.length > 50) {
      throw new Error('El nombre no puede exceder 50 caracteres');
    }
    if (!/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/.test(nombreLimpio)) {
      throw new Error('El nombre solo puede contener letras y espacios');
    }
    return nombreLimpio;
  }

  /**
   * Valida el apellido del cliente
   * @param {string} apellido - Apellido a validar
   * @returns {string} Apellido validado
   * @throws {Error} Si el apellido no es válido
   */
  validarApellido(apellido) {
    if (!apellido || typeof apellido !== 'string') {
      throw new Error('El apellido es requerido y debe ser una cadena de texto');
    }
    const apellidoLimpio = apellido.trim();
    if (apellidoLimpio.length < 2) {
      throw new Error('El apellido debe tener al menos 2 caracteres');
    }
    if (apellidoLimpio.length > 50) {
      throw new Error('El apellido no puede exceder 50 caracteres');
    }
    if (!/^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$/.test(apellidoLimpio)) {
      throw new Error('El apellido solo puede contener letras y espacios');
    }
    return apellidoLimpio;
  }

  /**
   * Valida el DNI del cliente
   * @param {string} dni - DNI a validar
   * @returns {string} DNI validado
   * @throws {Error} Si el DNI no es válido
   */
  validarDNI(dni) {
    if (!dni || typeof dni !== 'string') {
      throw new Error('El DNI es requerido y debe ser una cadena de texto');
    }
    const dniLimpio = dni.trim().replace(/[.-]/g, '');
    if (!/^\d{7,8}$/.test(dniLimpio)) {
      throw new Error('El DNI debe contener entre 7 y 8 dígitos numéricos');
    }
    return dniLimpio;
  }

  /**
   * Valida el email del cliente
   * @param {string} email - Email a validar
   * @returns {string} Email validado (en minúsculas)
   * @throws {Error} Si el email no es válido
   */
  validarEmail(email) {
    if (!email || typeof email !== 'string') {
      throw new Error('El email es requerido y debe ser una cadena de texto');
    }
    const emailLimpio = email.trim().toLowerCase();
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(emailLimpio)) {
      throw new Error('El formato del email no es válido');
    }
    if (emailLimpio.length > 100) {
      throw new Error('El email no puede exceder 100 caracteres');
    }
    return emailLimpio;
  }

  /**
   * Valida la contraseña del cliente
   * @param {string} password - Contraseña a validar
   * @returns {string} Contraseña validada
   * @throws {Error} Si la contraseña no es válida
   */
  validarPassword(password) {
    if (!password || typeof password !== 'string') {
      throw new Error('La contraseña es requerida y debe ser una cadena de texto');
    }
    if (password.length < 6) {
      throw new Error('La contraseña debe tener al menos 6 caracteres');
    }
    if (password.length > 50) {
      throw new Error('La contraseña no puede exceder 50 caracteres');
    }
    return password;
  }

  /**
   * Obtiene el nombre completo del cliente
   * @returns {string} Nombre completo
   */
  obtenerNombreCompleto() {
    return `${this.nombre} ${this.apellido}`;
  }

  /**
   * Agrega una cuenta al cliente
   * @param {string} codigoCuenta - Código de la cuenta a agregar
   * @throws {Error} Si el código de cuenta no es válido
   */
  agregarCuenta(codigoCuenta) {
    if (!codigoCuenta || typeof codigoCuenta !== 'string') {
      throw new Error('El código de cuenta es requerido');
    }
    if (this.cuentas.includes(codigoCuenta)) {
      throw new Error('La cuenta ya está asociada a este cliente');
    }
    this.cuentas.push(codigoCuenta);
  }

  /**
   * Remueve una cuenta del cliente
   * @param {string} codigoCuenta - Código de la cuenta a remover
   * @returns {boolean} True si se removió exitosamente
   */
  removerCuenta(codigoCuenta) {
    const indice = this.cuentas.indexOf(codigoCuenta);
    if (indice === -1) {
      return false;
    }
    this.cuentas.splice(indice, 1);
    return true;
  }

  /**
   * Verifica si el cliente tiene una cuenta específica
   * @param {string} codigoCuenta - Código de la cuenta a verificar
   * @returns {boolean} True si el cliente tiene la cuenta
   */
  tieneCuenta(codigoCuenta) {
    return this.cuentas.includes(codigoCuenta);
  }

  /**
   * Obtiene el número total de cuentas del cliente
   * @returns {number} Número de cuentas
   */
  obtenerCantidadCuentas() {
    return this.cuentas.length;
  }

  /**
   * Actualiza los datos personales del cliente
   * @param {Object} datos - Objeto con los datos a actualizar
   * @param {string} datos.nombre - Nuevo nombre (opcional)
   * @param {string} datos.apellido - Nuevo apellido (opcional)
   * @param {string} datos.telefono - Nuevo teléfono (opcional)
   * @param {string} datos.direccion - Nueva dirección (opcional)
   */
  actualizarDatosPersonales(datos) {
    if (datos.nombre !== undefined) {
      this.nombre = this.validarNombre(datos.nombre);
    }
    if (datos.apellido !== undefined) {
      this.apellido = this.validarApellido(datos.apellido);
    }
    if (datos.telefono !== undefined) {
      this.telefono = datos.telefono;
    }
    if (datos.direccion !== undefined) {
      this.direccion = datos.direccion;
    }
  }

  /**
   * Cambia la contraseña del cliente
   * @param {string} nuevaPassword - Nueva contraseña
   * @throws {Error} Si la nueva contraseña no es válida
   */
  cambiarPassword(nuevaPassword) {
    this.password = this.validarPassword(nuevaPassword);
  }

  /**
   * Verifica si la contraseña proporcionada es correcta
   * @param {string} password - Contraseña a verificar
   * @returns {boolean} True si la contraseña es correcta
   */
  verificarPassword(password) {
    return this.password === password;
  }

  /**
   * Activa o desactiva el cliente
   * @param {boolean} activo - Estado de activación
   */
  cambiarEstado(activo) {
    this.activo = Boolean(activo);
  }

  /**
   * Verifica si el cliente está activo
   * @returns {boolean} True si el cliente está activo
   */
  estaActivo() {
    return this.activo;
  }

  /**
   * Obtiene la edad del cliente basada en la fecha de registro
   * @returns {number} Días desde el registro
   */
  obtenerDiasDesdeRegistro() {
    const fechaRegistro = new Date(this.fechaRegistro);
    const ahora = new Date();
    const diferencia = ahora - fechaRegistro;
    return Math.floor(diferencia / (1000 * 60 * 60 * 24));
  }

  /**
   * Convierte el cliente a un objeto JSON
   * @returns {Object} Objeto JSON del cliente
   */
  toJSON() {
    return {
      id: this.id,
      nombre: this.nombre,
      apellido: this.apellido,
      dni: this.dni,
      email: this.email,
      telefono: this.telefono,
      direccion: this.direccion,
      cuentas: [...this.cuentas],
      fechaRegistro: this.fechaRegistro,
      activo: this.activo
    };
  }

  /**
   * Crea una instancia de Cliente desde un objeto JSON
   * @param {Object} datos - Datos del cliente en formato JSON
   * @returns {Cliente} Nueva instancia de Cliente
   */
  static fromJSON(datos) {
    const cliente = new Cliente(
      datos.nombre,
      datos.apellido,
      datos.dni,
      datos.email,
      datos.password || 'temp123' // Password temporal para reconstrucción
    );
    cliente.id = datos.id;
    cliente.telefono = datos.telefono || '';
    cliente.direccion = datos.direccion || '';
    cliente.cuentas = [...(datos.cuentas || [])];
    cliente.fechaRegistro = datos.fechaRegistro;
    cliente.activo = datos.activo !== undefined ? datos.activo : true;
    return cliente;
  }

  /**
   * Valida todos los datos del cliente
   * @returns {Object} Resultado de la validación
   */
  validarCliente() {
    const errores = [];
    
    try {
      this.validarNombre(this.nombre);
    } catch (error) {
      errores.push(`Nombre: ${error.message}`);
    }
    
    try {
      this.validarApellido(this.apellido);
    } catch (error) {
      errores.push(`Apellido: ${error.message}`);
    }
    
    try {
      this.validarDNI(this.dni);
    } catch (error) {
      errores.push(`DNI: ${error.message}`);
    }
    
    try {
      this.validarEmail(this.email);
    } catch (error) {
      errores.push(`Email: ${error.message}`);
    }
    
    try {
      this.validarPassword(this.password);
    } catch (error) {
      errores.push(`Password: ${error.message}`);
    }

    return {
      valido: errores.length === 0,
      errores: errores
    };
  }
}

// Exportar la clase para uso en Node.js (si es necesario)
if (typeof module !== 'undefined' && module.exports) {
  module.exports = Cliente;
}
