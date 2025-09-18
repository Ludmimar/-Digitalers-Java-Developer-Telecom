package com.educacionit.desafio02.entidades;

import com.educacionit.desafio02.excepciones.TipoProductoExcepcion;
import com.educacionit.desafio02.utilidades.Formatos;

public class Cuenta extends Producto {
	public static String[] TIPOS_CUENTAS_DISPONIBLES = { "CC", "CA" };
	public static String[] TIPOS_CUENTAS_NO_DISPONIBLES = { "FCI", "PF" };
	private String tipo;

	public Cuenta() {
		setNumero(getNumeroGenerado());
	}

	public Cuenta(Integer banco, Integer sucursal, String tipo) throws TipoProductoExcepcion {
		super(banco, sucursal);
		setTipo(tipo);
		setNumero(getNumeroGenerado());

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

	public void setTipo(String tipo) throws TipoProductoExcepcion {
		int codigo = verificarCuenta(tipo);

		switch (codigo) {
		case 0:
			this.tipo = tipo;
			break;
		default:
			throw new TipoProductoExcepcion(codigo);
		}

	}

	private int verificarCuenta(String tipo) {
		/*
		 * 1 Producto No disponible | 2 Producto Inexistente
		 * 
		 */

		for (String disponible : TIPOS_CUENTAS_DISPONIBLES) {
			if (tipo.equalsIgnoreCase(disponible)) {
				return 0;
			}
		}

		for (String noDisponible : TIPOS_CUENTAS_NO_DISPONIBLES) {
			if (tipo.equalsIgnoreCase(noDisponible)) {
				return 1;
			}
		}

		return 2;
	}

}
