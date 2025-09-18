package com.educacionIT.javase.entidades;

public final class Documento {
	private String tipo;
	private Integer numero;

	/**
	 * 
	 */
	public Documento() {
		super();
	}

	/**
	 * @param tipo
	 * @param numero
	 */
	public Documento(String tipo, Integer numero) {
		super();
		this.tipo = tipo;
		this.numero = numero;
	}

	@Override
	public String toString() {
		return "Documento [tipo=" + tipo + ", numero=" + numero + "]";
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

}
