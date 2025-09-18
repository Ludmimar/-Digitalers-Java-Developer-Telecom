package com.educacionIT.javase.entidades;

import java.util.Random;

public class Persona {

	// atributos
	private String nombre;
	private String apellido;
	private Documento documento;
	private byte edad;
	
	public Persona() {
		
	}

	public Persona(String nombre, String apellido, Documento documento) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.documento = documento;
		this.edad = asignarEdad();
	}

	// creamos un metodo para modularizar aun mas nuestra clase
	public boolean mayorEdad() {
		// recordemos que los operadores relacionales devuelven un valor booleano
		// y pueden asigançrnse directamente a una variable o retornar ela respues en un
		// metodo
		return edad >= 18;
	}

	// mejoramos nuestro metodo para hacerlo mas generico

	public String mostrarAtributos() {
		// utilizamos una variable para que sea mas entendible
		// el tipo de mnensaje o estructura del mensaje es decision del desarrollador
		// aprovechamos mostrar atributos de la clase documento
		String mensaje = "nombre=" + nombre + ", apellido=" + apellido + ", " + documento.mostrarAtributos() + ", edad="
				+ edad + " y es " + (mayorEdad() ? "mayor de edad" : "menor de edad");
		return mensaje;
	}

	// asignar edad
	public byte asignarEdad() {
		// utilizamos la clase Random y hacemos un casting aunque no hemos visto bien
		// este tema lo que se hace es convertir el dato en tipo byte ya que entero es
		// mas grande
		Random nuevaEdad = new Random();
		return (byte) nuevaEdad.nextInt(127);

	}

	/**
	 * @return the nombre
	 */
	public String getNombre() {
		return nombre;
	}

	/**
	 * @param nombre the nombre to set
	 */
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	/**
	 * @return the apellido
	 */
	public String getApellido() {
		return apellido;
	}

	/**
	 * @param apellido the apellido to set
	 */
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	/**
	 * @return the documento
	 */
	public Documento getDocumento() {
		return documento;
	}

	/**
	 * @param documento the documento to set
	 */
	public void setDocumento(Documento documento) {
		this.documento = documento;
	}

	/**
	 * @return the edad
	 */
	public byte getEdad() {
		return edad;
	}

	/**
	 * @param edad the edad to set
	 */
	public void setEdad(byte edad) {
		this.edad = edad;
	}
	
	
	

}
