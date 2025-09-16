const { Movimiento } = require('./Movimiento');

class Cuenta {
  constructor(codigo, saldo) {
    if (!codigo) throw new Error('El código de cuenta es obligatorio.');
    if (isNaN(saldo) || saldo < 0) throw new Error('El saldo inicial debe ser un número válido no negativo.');

    this.codigo = codigo;
    this.saldo = parseFloat(saldo);
    this.movimientos = [];
  }

  depositar(monto) {
    if (isNaN(monto) || monto <= 0) {
      throw new Error('El monto a depositar debe ser un número positivo.');
    }

    this.saldo += parseFloat(monto);
    this.movimientos.push(new Movimiento('deposito', monto));
  }

  retirar(monto) {
    if (isNaN(monto) || monto <= 0) {
      throw new Error('El monto a retirar debe ser un número positivo.');
    }

    if (monto > this.saldo) {
      throw new Error('Fondos insuficientes');
    }

    this.saldo -= parseFloat(monto);
    this.movimientos.push(new Movimiento('retiro', monto));
  }

  transferir(monto, cuentaDestino) {
    if (isNaN(monto) || monto <= 0) {
      throw new Error('El monto a transferir debe ser un número positivo.');
    }

    if (monto > this.saldo) {
      throw new Error('Fondos insuficientes para la transferencia.');
    }

    // Retirar de la cuenta origen
    this.saldo -= parseFloat(monto);
    this.movimientos.push(new Movimiento('transferencia saliente', monto));

    // Depositar en la cuenta destino
    cuentaDestino.saldo += parseFloat(monto);
    cuentaDestino.movimientos.push(new Movimiento('transferencia recibida', monto));
  }

  consultarSaldo() {
    return this.saldo;
  }
}

module.exports = { Cuenta };
