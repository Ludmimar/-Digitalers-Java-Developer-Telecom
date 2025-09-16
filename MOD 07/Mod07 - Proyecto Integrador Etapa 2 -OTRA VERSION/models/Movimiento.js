class Movimiento {
  constructor(tipo, monto) {
    if (typeof tipo !== 'string' || tipo.trim() === '') {
      throw new Error('El tipo de movimiento debe ser un texto no vacío.');
    }

    if (isNaN(monto) || parseFloat(monto) <= 0) {
      throw new Error('El monto debe ser un número mayor a 0.');
    }

    this.tipo = tipo;
    this.monto = parseFloat(monto);
    this.fecha = new Date(); // Fecha actual al crear el movimiento
  }
}

module.exports = { Movimiento };
