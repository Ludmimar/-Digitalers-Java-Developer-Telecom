package com.educacionIT.javase.principal;

/**
 * @author EducacionIT
 * @class Principal
 * @date 10 jun. 2020
 */
public class OperacionMatematica {
	public static void main(String[] args) {
		// declaramos e inicilizamos las variables
		// las declaramos float por la division
		float numero1 = 5.0f;
		float numero2 = 6.3f;
		float total;
		// mostramos por pantalla
		System.out.println("Operaciones matematicas basicas");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// valores iniciales
		System.out.println("El valor de la variable numero 1 es: " + numero1);
		System.out.println("El valor de la variable numero 2 es: " + numero2);
		System.out.print("\n");

		// operaciones basicas
		// suma
		total = numero1 + numero2;
		System.out.println("La suma da: " + total);

		// resta
		total = numero1 - numero2;
		System.out.println("La resta da: " + total);

		// multiplicacion
		total = numero1 * numero2;
		System.out.println("La multiplicacion da: " + total);

		// division
		total = numero1 / numero2;
		System.out.println("La division da: " + total);
	}

}
