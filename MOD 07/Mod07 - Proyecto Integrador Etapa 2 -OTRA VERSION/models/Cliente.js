class Cliente {
  constructor(id, nombre, apellido, dni, email, password) {
    this.id = id;
    this.nombre = nombre;
    this.apellido = apellido;
    this.dni = dni;
    this.email = email;
    this.password = password;
    this.cuentas = []; // array de cuentas bancarias
  }

  agregarCuenta(cuenta) {
    this.cuentas.push(cuenta);
  }

  obtenerCuentaPorCodigo(codigo) {
    return this.cuentas.find(c => c.codigo === codigo);
  }

  eliminarCuenta(codigo) {
    const index = this.cuentas.findIndex(c => c.codigo === codigo);
    if (index !== -1) {
      this.cuentas.splice(index, 1);
      return true;
    }
    return false;
  }

  tieneCuenta(codigo) {
    return this.cuentas.some(c => c.codigo === codigo);
  }
}
module.exports = { Cliente };