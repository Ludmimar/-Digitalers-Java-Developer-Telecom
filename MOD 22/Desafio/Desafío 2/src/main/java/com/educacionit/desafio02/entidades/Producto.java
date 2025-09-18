package com.educacionit.desafio02.entidades;

public class Producto {
	private Integer banco;
	private Integer sucursal;
	private Integer numero;
	protected static Integer numeroCC = 1;
	protected static Integer numeroCA = 1;
	protected static Integer numeroTC = 1;

	public Producto() {

	}

	public Producto(Integer banco, Integer sucursal) {
		super();
		this.banco = banco;
		this.sucursal = sucursal;

	}

	@Override
	public String toString() {
		return "Producto [banco=" + banco + ", sucursal=" + sucursal + ", numero=" + numero + "]";
	}

	public Integer getBanco() {
		return banco;
	}

	public void setBanco(Integer banco) {
		this.banco = banco;
	}

	public Integer getSucursal() {
		return sucursal;
	}

	public void setSucursal(Integer sucursal) {
		this.sucursal = sucursal;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

}
