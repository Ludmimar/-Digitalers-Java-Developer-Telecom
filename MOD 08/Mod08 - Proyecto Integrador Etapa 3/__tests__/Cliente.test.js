const { Cliente } = require('../models/Cliente.js');

describe('Clase Cliente', () => {
  let cliente;

  beforeEach(() => {
    cliente = new Cliente("C001", "Juan", "Pérez", "12345678", "juan@test.com", "clave123");
  });

  test('debe crear correctamente un cliente', () => {
    expect(cliente.nombre).toBe("Juan");
    expect(cliente.apellido).toBe("Pérez");
    expect(cliente.dni).toBe("12345678");
    expect(cliente.email).toBe("juan@test.com");
    expect(cliente.password).toBe("clave123");
    expect(cliente.cuentas.length).toBe(0);
  });

  test('puede agregar una cuenta', () => {
    const cuentaMock = { codigo: "CTA001", saldo: 5000 };
    cliente.agregarCuenta(cuentaMock);
    expect(cliente.cuentas.length).toBe(1);
    expect(cliente.cuentas[0].codigo).toBe("CTA001");
  });

  test('puede obtener una cuenta por código', () => {
    const cuentaMock = { codigo: "CTA123", saldo: 2000 };
    cliente.agregarCuenta(cuentaMock);
    const resultado = cliente.obtenerCuentaPorCodigo("CTA123");
    expect(resultado).toBe(cuentaMock);
  });

  test('puede eliminar una cuenta', () => {
    const cuentaMock = { codigo: "CTA999", saldo: 1000 };
    cliente.agregarCuenta(cuentaMock);
    const eliminado = cliente.eliminarCuenta("CTA999");
    expect(eliminado).toBe(true);
    expect(cliente.cuentas.length).toBe(0);
  });

  test('devuelve false si intenta eliminar una cuenta inexistente', () => {
    const eliminado = cliente.eliminarCuenta("CTA404");
    expect(eliminado).toBe(false);
  });

  test('verifica si el cliente tiene una cuenta', () => {
    const cuentaMock = { codigo: "CTA777", saldo: 1500 };
    cliente.agregarCuenta(cuentaMock);
    expect(cliente.tieneCuenta("CTA777")).toBe(true);
    expect(cliente.tieneCuenta("CTA000")).toBe(false);
  });
});
