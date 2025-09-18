package com.educacionit.desafio01.dentidades;

public class ProductoNoPerecedero extends Producto {

	public ProductoNoPerecedero() {
		super();
	}

	public ProductoNoPerecedero(String descripcion, Float precio, Integer cantidad) {
		super(descripcion, precio, cantidad);
	}

	@Override
	public String toString() {
		return "ProductoNoPerecedero [toString()=" + super.toString() + "]";
	}

}
