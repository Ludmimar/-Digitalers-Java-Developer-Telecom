package com.educacionit.desafio02.entidades;

import com.educacionit.desafio02.utilidades.Formatos;

public class Cuenta extends Producto {
	private String tipo;

	public Cuenta() {
		generarNumeroProducto();
	}

	public Cuenta(Integer banco, Integer sucursal, String tipo) {
		super(banco, sucursal);
		this.tipo = tipo;
		generarNumeroProducto();

	}

	@Override
	public String toString() {
		return "Cuenta [Banco=" + Formatos.getFormato(getBanco(), "BANCO") + ", Sucursal="
				+ Formatos.getFormato(getSucursal(), "BANCO") + ", Numero=" + Formatos.getFormato(getNumero(), tipo)
				+ ", Tipo=" + tipo + "]";
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	private void generarNumeroProducto() {
		Integer numero = 0;
		switch (tipo.toUpperCase()) {
		case "CC":
			numero = numeroCC++;
			break;
		case "CA":
			numero = numeroCA++;
			break;
		default:
			break;
		}
		setNumero(numero);
	}

}
