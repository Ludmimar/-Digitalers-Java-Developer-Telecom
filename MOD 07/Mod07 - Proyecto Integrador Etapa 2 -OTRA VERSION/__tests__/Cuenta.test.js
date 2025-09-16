const { Cuenta } = require("../models/Cuenta");
const { Movimiento } = require("../models/Movimiento");

describe("Clase Cuenta", () => {
  let cuenta;

  beforeEach(() => {
    cuenta = new Cuenta("CTA001", 1000);
  });

  test("puede depositar", () => {
    cuenta.depositar(500);
    expect(cuenta.saldo).toBe(1500);
    expect(cuenta.movimientos.length).toBe(1);
    expect(cuenta.movimientos[0].tipo).toBe("deposito");
  });

  test("puede retirar", () => {
    cuenta.retirar(300);
    expect(cuenta.saldo).toBe(700);
    expect(cuenta.movimientos[0].tipo).toBe("retiro");
  });

  test("lanza error al retirar más de lo disponible", () => {
    expect(() => cuenta.retirar(2000)).toThrow("Fondos insuficientes");
  });
});
