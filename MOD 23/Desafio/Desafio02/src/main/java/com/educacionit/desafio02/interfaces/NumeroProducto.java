package com.educacionit.desafio02.interfaces;

import com.educacionit.desafio02.entidades.Cuenta;
import com.educacionit.desafio02.entidades.Producto;
import com.educacionit.desafio02.entidades.TarjetaCredito;

public interface NumeroProducto {

	default Integer getNumeroGenerado() {

		// preguntamos a que clase pertenecen
		if (this.getClass() == Cuenta.class) {
			// hacenmos un casteo
			Cuenta cuenta = (Cuenta) this;
			switch (cuenta.getTipo().toUpperCase()) {
			case "CC":
				return Producto.NUMERO_CC++;
			case "CA":
				return Producto.NUMERO_CA++;
			default:
				break;
			}
		} else if (this.getClass() == TarjetaCredito.class) {
			return Producto.NUMERO_TC++;
		}

		return null;
	}
}
