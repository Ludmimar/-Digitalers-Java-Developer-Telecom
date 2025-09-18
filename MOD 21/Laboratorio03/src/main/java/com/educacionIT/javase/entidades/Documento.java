package com.educacionIT.javase.entidades;

public class Documento {
	String tipoDocumento;
	int numeroDocumento;

	// constructor con todos los atributos
	public Documento(String tipoDocumento, int numeroDocumento) {
		this.tipoDocumento = tipoDocumento;
		this.numeroDocumento = numeroDocumento;
	}

	public String mostrarAtributos() {
		return "tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento;
	}

}
