package com.educacionIT.javase.principal;

import java.util.Random;
import java.util.Scanner;

/**
 * @author EducacionIT
 * @class Principal
 * @date 10 jun. 2020
 */
public class AdivinarNumero {
	public static void main(String[] args) {
		// Utilizamos la Clase Random esta clase nos ayuda a generar numeros aleatorios
		Random aleatorio = new Random();

		// Utilizamos la Clase Scanner para pedir los datos por la consola
		Scanner teclado = new Scanner(System.in);

		// tenemos la utilidad nextInt que nos dat un numero aleatorio entero
		// con un limite nextInt(Limite)
		// le sumamos 1 ya que el numero aleatorio no incluye el limite
		int numeroAlatorio = (aleatorio.nextInt(10) + 1);

		// mostramos por pantalla
		System.out.println("Adivina el numero y gana");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// utilizamos el ciclo do while ya que por lo menos vamos a preguntar una vez

		do {
			System.out.print("Indique un numero:");
			int numeroUsuario = teclado.nextInt();

			// preguntamos si es igual al numero generado por la clase Random
			if (numeroUsuario == numeroAlatorio) {
				System.out.println("Felicitaciones Adivinaste (◠‿◠)");
				break;
			} else if (numeroUsuario > numeroAlatorio) {
				System.out.println("Intenta un numero menor");
			} else {
				System.out.println("Intenta un numero mayor");
			}
			// otra forma de imprimir una linea en blanco
			System.out.println();

		} while (true);

		// debemos cerrar la comunicacion con la consola, no nos preocupemos ya que lo
		// veremos mas adelante el por qué de esto :)
		teclado.close();

	}
}
