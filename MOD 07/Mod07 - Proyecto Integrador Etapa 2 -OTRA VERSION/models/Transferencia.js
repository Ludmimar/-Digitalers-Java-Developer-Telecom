class Transferencia {
  static realizar(cuentaOrigen, cuentaDestino, monto) {
    if (monto <= 0) throw new Error("Monto inválido");
    if (cuentaOrigen.saldo < monto) throw new Error("Saldo insuficiente");

    cuentaOrigen.retirar(monto);
    cuentaOrigen.movimientos.push(new Movimiento("transferencia saliente", monto));

    cuentaDestino.depositar(monto);
    cuentaDestino.movimientos.push(new Movimiento("transferencia recibida", monto));
  }
}
