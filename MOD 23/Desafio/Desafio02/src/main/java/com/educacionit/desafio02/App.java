package com.educacionit.desafio02;

import com.educacionit.desafio02.entidades.Cuenta;
import com.educacionit.desafio02.entidades.TarjetaCredito;
import com.educacionit.desafio02.excepciones.TipoProductoExcepcion;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) throws TipoProductoExcepcion {

		Cuenta cuentaCC01 = new Cuenta(15, 2, "CC");
		Cuenta cuentaCC02 = new Cuenta(14, 3, "CC");
		Cuenta cuentaCC03 = new Cuenta(16, 4, "CC");

		Cuenta cuentaCA01 = new Cuenta(105, 42, "CA");
		Cuenta cuentaCA02 = new Cuenta(150, 33, "CA");
		Cuenta cuentaCA03 = new Cuenta(125, 9, "CA");

		Cuenta cuentaPF01 = new Cuenta(105, 42, "PF");
		Cuenta cuentaFCI01 = new Cuenta(450, 443, "FCI");
		Cuenta cuentaEL01 = new Cuenta(002, 999, "EL");

		TarjetaCredito tc01 = new TarjetaCredito(2, 15, 8);
		TarjetaCredito tc02 = new TarjetaCredito(65, 52, 9);
		TarjetaCredito tc03 = new TarjetaCredito(87, 74, 89);

		System.out.println(cuentaCC01);
		System.out.println(cuentaCC02);
		System.out.println(cuentaCC03);

		System.out.println(cuentaCA01);
		System.out.println(cuentaCA02);
		System.out.println(cuentaCA03);

		System.out.println(cuentaPF01);
		System.out.println(cuentaFCI01);
		System.out.println(cuentaEL01);

		System.out.println(tc01);
		System.out.println(tc02);
		System.out.println(tc03);

	}
}
