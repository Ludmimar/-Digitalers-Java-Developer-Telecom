package com.educacionit.desafio01;

import java.util.Arrays;
import java.util.Scanner;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		Scanner teclado = new Scanner(System.in);
		int[] numerosAleatorios;
		int cantidadNumeros;

		System.out.print("Indique la cantidad de numeros aleatorios a generar: ");
		cantidadNumeros = teclado.nextInt();

		numerosAleatorios = new int[cantidadNumeros];

		// llenamos el arreglo de enteros con numeros aleatorios
		for (int i = 0; i < numerosAleatorios.length; i++) {
			// generamos un numero aleatorio entre 1 y el limite
			numerosAleatorios[i] = (int) ((Math.random() * cantidadNumeros) + 1);

		}

		// mostramos los elementos generados en la consola
		System.out.println(Arrays.toString(numerosAleatorios));

		// recorremos el arreglo e indicamos sin cumplen las condiciones dadas
		for (int i = 0; i < numerosAleatorios.length; i++) {
			int numero = numerosAleatorios[i];
			boolean divisible3 = numero % 3 == 0;
			boolean divisible5 = numero % 5 == 0;
			String resultado = "";

			if (divisible3) {
				resultado += "Fizz";
			}

			if (divisible5) {
				resultado += "Buzz";
			}

			System.out.println(resultado.length() > 0 ? resultado : numero);

		}

		teclado.close();
	}
}
