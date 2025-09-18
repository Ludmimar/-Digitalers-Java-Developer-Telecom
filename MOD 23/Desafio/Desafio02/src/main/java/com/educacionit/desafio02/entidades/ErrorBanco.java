package com.educacionit.desafio02.entidades;

public class ErrorBanco {
	private int codigo;
	private String descripcion;

	public ErrorBanco() {

	}

	public ErrorBanco(int codigo, String descripcion) {
		super();
		this.codigo = codigo;
		this.descripcion = descripcion;
	}

	@Override
	public String toString() {
		return "Error [codigo=" + codigo + ", descripcion=" + descripcion + "]";
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

}
