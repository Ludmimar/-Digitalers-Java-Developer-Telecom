package com.educacionIT.javase.principal;

class Persona {

	// atributos
	String nombre;
	String apellido;
	String tipoDocumento;
	int numeroDocumento;
	byte edad;

	void mostrarAtributos() {
		// utilizamos una variable para que sea mas entendible
		// el tipo de mnensaje o estructura del mensaje es decision del desarrollador
		String mensaje = "nombre=" + nombre + ", apellido=" + apellido + ", tipoDocumento=" + tipoDocumento
				+ ", numeroDocumento=" + numeroDocumento + ", edad=" + edad + " y es "
				+ (edad >= 18 ? "mayor de edad" : "menor de edad");
		System.out.println(mensaje);
	}

}
