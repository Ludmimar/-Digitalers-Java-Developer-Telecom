package com.educacionit.desafio02;

import java.util.Scanner;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		// declaramos variables
		Scanner teclado = new Scanner(System.in);
		long numero;
		long numeroAbsoluto;
		long multiplicador;
		long multiplicadorAbsoluto;
		boolean numeroEsPositivo;
		boolean multiplicadorEsPositivo;
		long resultado = 0;

		// pedimos los datos
		System.out.print("Indique el numero a multiplicar: ");
		numero = teclado.nextLong();

		System.out.print("Indique por cuanto multiplicar: ");
		multiplicador = teclado.nextLong();

		// esto lo hacemos para no hacer el calculo en el ciclo cada vez que itere
		numeroAbsoluto = Math.abs(numero);
		multiplicadorAbsoluto = Math.abs(multiplicador);

		// si uno de los dos numeros es cero no ejecutamos el for
		if (!(numero == 0) && !(multiplicador == 0)) {
			for (int i = 0; i < multiplicadorAbsoluto; i++) {
				resultado += numeroAbsoluto;
			}

		}

		numeroEsPositivo = numero >= 0;
		multiplicadorEsPositivo = multiplicador >= 0;

		// recordar la ley de signos
		if ((numeroEsPositivo && multiplicadorEsPositivo) || (!numeroEsPositivo && !multiplicadorEsPositivo)) {
			System.out.println("El resultado es: " + resultado);
		} else {
			System.out.println("El resultado es: -" + resultado);
		}
		teclado.close();

	}
}
