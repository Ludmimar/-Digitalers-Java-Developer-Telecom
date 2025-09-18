package com.educacionIT.javase.principal;

/**
 * @author EducacionIT
 * @class Principal
 * @date 10 jun. 2020
 */
public class Promedio {
	public static void main(String[] args) {
		// declaramos e inicilizamos las variables
		// agregamos simbolos y guion bajo para verificar que se pueden utilizar al
		// nombrar variables
		float $numero_1 = 5;
		float $numero_2 = 7;
		float $numero_3 = 4.6f;
		float $numero_4 = 9.1f;
		float $total;

		// mostramos por pantalla
		System.out.println("Promedio");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// valores iniciales
		System.out.println("El valor de la variable numero 1 es: " + $numero_1);
		System.out.println("El valor de la variable numero 2 es: " + $numero_2);
		System.out.println("El valor de la variable numero 3 es: " + $numero_3);
		System.out.println("El valor de la variable numero 4 es: " + $numero_4);
		System.out.print("\n");

		// sacamos el promedio sumando las 4 variables y diviendola entre la cantidad
		$total = ($numero_1 + $numero_2 + $numero_3 + $numero_4) / 4;
		System.out.println("El promedio de las 4 variables es: " + $total);

	}
}
