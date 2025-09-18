package com.educacionit.desafio01.dentidades;

public class Producto {

	public static Float DESCUENTO = 30f;
	private String descripcion;
	private Float precio;
	private Integer cantidad;

	public Producto() {

	}

	public Producto(String descripcion, Float precio, Integer cantidad) {
		super();
		this.descripcion = descripcion;
		this.precio = precio;
		this.cantidad = cantidad;
	}

	@Override
	public String toString() {
		return "Producto [descripcion=" + descripcion + ", precio=" + precio + ", cantidad=" + cantidad + "]";
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Float getPrecio() {
		return precio;
	}

	public void setPrecio(Float precio) {
		this.precio = precio;
	}

	public Integer getCantidad() {
		return cantidad;
	}

	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}

	public Float getPrecioInventario() {
		return precio * cantidad;
	}

}
