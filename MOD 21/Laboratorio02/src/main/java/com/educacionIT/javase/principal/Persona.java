package com.educacionIT.javase.principal;

class Persona {

	// atributos
	String nombre;
	String apellido;
	Documento documento;
	byte edad;

	Persona(String nombre, String apellido, Documento documento, byte edad) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.documento = documento;
		this.edad = edad;
	}

	// creamos un metodo para modularizar aun mas nuestra clase
	boolean mayorEdad() {
		// recordemos que los operadores relacionales devuelven un valor booleano
		// y pueden asigançrnse directamente a una variable o retornar ela respues en un
		// metodo
		return edad >= 18;
	}

	// mejoramos nuestro metodo para hacerlo mas generico

	String mostrarAtributos() {
		// utilizamos una variable para que sea mas entendible
		// el tipo de mnensaje o estructura del mensaje es decision del desarrollador
		// aprovechamos mostrar atributos de la clase documento
		String mensaje = "nombre=" + nombre + ", apellido=" + apellido + ", " + documento.mostrarAtributos() + ", edad="
				+ edad + " y es " + (mayorEdad() ? "mayor de edad" : "menor de edad");
		return mensaje;
	}

}
