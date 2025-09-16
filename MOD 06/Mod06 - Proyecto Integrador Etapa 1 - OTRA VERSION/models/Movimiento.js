class Movimiento {
  constructor(tipo, monto) {
    this.tipo = tipo;
    this.monto = parseFloat(monto);
    this.fecha = new Date(); // La fecha se convierte en string al serializar
  }
}
