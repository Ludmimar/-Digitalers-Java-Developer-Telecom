package com.educacionIT.javase.entidades;

import java.util.Arrays;
import java.util.Date;

public class Profesor extends Empleado {
	private String[] cursos;

	/**
	 * 
	 */
	public Profesor() {
		super();
	}

	/**
	 * @param nombre
	 * @param apellido
	 * @param documento
	 * @param fechaNacimiento
	 * @param fechaCargo
	 * @param sueldo
	 * @param cursos
	 */
	public Profesor(String nombre, String apellido, Documento documento, Date fechaNacimiento, Date fechaCargo,
			Float sueldo, String[] cursos) {
		super(nombre, apellido, documento, fechaNacimiento, fechaCargo, sueldo);
		this.cursos = cursos;
	}

	@Override
	public String toString() {
		return "Profesor [toString()=" + super.toString() + ", cursos=" + Arrays.toString(cursos) + "]";
	}

	public String[] getCursos() {
		return cursos;
	}

	public void setCursos(String[] cursos) {
		this.cursos = cursos;
	}

	@Override
	public String mostrarTipoPersona() {
		return getNombre() + " " + getApellido() + " es Profesor";
	}

}
