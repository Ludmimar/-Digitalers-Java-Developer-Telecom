package com.educacionIT.javase.principal;

class Documento {
	String tipoDocumento;
	int numeroDocumento;

	// constructor con todos los atributos
	Documento(String tipoDocumento, int numeroDocumento) {
		this.tipoDocumento = tipoDocumento;
		this.numeroDocumento = numeroDocumento;
	}

	String mostrarAtributos() {
		return "tipoDocumento=" + tipoDocumento + ", numeroDocumento=" + numeroDocumento;
	}

}
