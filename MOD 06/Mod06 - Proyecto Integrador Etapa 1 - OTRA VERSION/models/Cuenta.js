class Cuenta {
  constructor(codigo, saldo) {
    this.codigo = codigo;
    this.saldo = parseFloat(saldo);
    this.movimientos = [];
  }

  depositar(monto) {
    this.saldo += monto;
    this.movimientos.push(new Movimiento('deposito', monto));
  }

  retirar(monto) {
    this.saldo -= monto;
    this.movimientos.push(new Movimiento('retiro', monto));
  }

  consultarSaldo() {
    return this.saldo;
  }

  depositar(monto) {
  this.saldo += monto;
  this.movimientos.push(new Movimiento('deposito', monto));
}

retirar(monto) {
  this.saldo -= monto;
  this.movimientos.push(new Movimiento('retiro', monto));
}

}
