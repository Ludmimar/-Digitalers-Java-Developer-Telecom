package com.educacionIT.javase.principal;

/**
 * @author EducacionIT
 * @class Principal
 * @date 10 jun. 2020
 */
public class OperacionMatematicaConIFAnidados {
	public static void main(String[] args) {
		// declaramos e inicilizamos las variables
		// las declaramos float por la division
		float numero1 = 5.0f;
		float numero2 = 6.3f;
		char operacion = '+';

		// en este caso inicializamos la variable en cero en el caso que nunca se le
		// asigne valor
		float total = 0;
		// mostramos por pantalla
		System.out.println("Operaciones matematicas basicas");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// valores iniciales
		System.out.println("El valor de la variable numero 1 es: " + numero1);
		System.out.println("El valor de la variable numero 2 es: " + numero2);
		System.out.print("\n");

		// operaciones basicas

		if (operacion == '+') {// suma
			total = numero1 + numero2;
		} else if (operacion == '-') { // resta
			total = numero1 - numero2;
		} else if (operacion == '*') { // multiplicacion
			total = numero1 * numero2;
		} else if (operacion == '/') {// division
			total = numero1 / numero2;
		} else {
			System.out.println("Indico una operacion no valida");
		}

		System.out.println("El resultado de (" + numero1 + " " + operacion + " " + numero2 + ") es: " + total);

	}
}
