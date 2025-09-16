class Cliente {
  constructor(id, nombre, apellido, dni, email, password) {
    this.id = id;
    this.nombre = nombre;
    this.apellido = apellido;
    this.dni = dni;
    this.email = email;
    this.password = password;
    this.cuentas = [];
  }

  agregarCuenta(cuenta) {
    this.cuentas.push(cuenta);
  }
}
