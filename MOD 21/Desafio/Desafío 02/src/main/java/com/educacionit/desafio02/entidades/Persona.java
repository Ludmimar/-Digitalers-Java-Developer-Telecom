package com.educacionit.desafio02.entidades;

public class Persona {

	// atributos
	private String nombre;
	private String apellido;
	private Documento documento;

	public Persona() {

	}

	public Persona(String nombre, String apellido, Documento documento) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.documento = documento;
	}

	public String getDatos() {
		return "Persona [nombre: " + nombre + ", apellido: " + apellido + ", " + documento.getDatos() + "]";
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

}
