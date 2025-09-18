package com.educacionIT.javase.principal;

/**
 * @author EducacionIT
 * @class Principal
 * @date 10 jun. 2020
 */
public class NumeroMayor {
	public static void main(String[] args) {
		// declaramos e inicilizamos las variables

		int numero_1 = 5;
		int numero_2 = 7;
		int numero_3 = 9;

		// mostramos por pantalla
		System.out.println("Numero Mayor de 3 Variables");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// valores iniciales
		System.out.println("El valor de la variable numero 1 es: " + numero_1);
		System.out.println("El valor de la variable numero 2 es: " + numero_2);
		System.out.println("El valor de la variable numero 3 es: " + numero_3);
		System.out.print("\n");

		// realizamos las preguntas

		if (numero_1 > numero_2 && numero_1 > numero_3) {
			System.out.println("La variable mayor es el numero 1");
		} else if (numero_2 > numero_1 && numero_2 > numero_3) {
			System.out.println("La variable mayor es el numero 2");
		} else {
			System.out.println("La variable mayor es el numero 3");
		}

	}
}
