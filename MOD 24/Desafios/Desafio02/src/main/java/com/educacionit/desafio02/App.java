package com.educacionit.desafio02;

import java.util.ArrayList;
import java.util.List;

import com.educacionit.desafio02.comparadores.OrdenProductoNumeroDesc;
import com.educacionit.desafio02.entidades.Cuenta;
import com.educacionit.desafio02.entidades.Producto;
import com.educacionit.desafio02.entidades.TarjetaCredito;
import com.educacionit.desafio02.enumerados.ErrorBanco;
import com.educacionit.desafio02.enumerados.TipoCuenta;
import com.educacionit.desafio02.excepciones.TipoProductoExcepcion;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) throws TipoProductoExcepcion {

		List<Producto> productosCliente;
		productosCliente = new ArrayList<>();
		try {

			productosCliente.add(new Cuenta(15, 2, TipoCuenta.CC));
			productosCliente.add(new Cuenta(14, 3, TipoCuenta.CC));
			productosCliente.add(new Cuenta(16, 4, TipoCuenta.CC));
			productosCliente.add(new Cuenta(105, 42, TipoCuenta.CA));
			productosCliente.add(new Cuenta(150, 33, TipoCuenta.CA));
			productosCliente.add(new Cuenta(125, 9, TipoCuenta.CA));
			productosCliente.add(new TarjetaCredito(2, 15, 8));
			productosCliente.add(new TarjetaCredito(65, 52, 9));
			productosCliente.add(new TarjetaCredito(87, 74, 89));

			System.out.println("Antes de ordenar:");
			System.out.println();
			for (Producto producto : productosCliente) {
				System.out.println(producto);
			}

			productosCliente.sort(new OrdenProductoNumeroDesc());

			System.out.println();
			System.out.println("Despues de ordenar:");
			System.out.println();
			for (Producto producto : productosCliente) {
				System.out.println(producto);
			}

		} catch (Exception e) {
			throw new TipoProductoExcepcion(ErrorBanco.ERROR_PRODUCTO_INEXISTENTE);
		}

	}
}
