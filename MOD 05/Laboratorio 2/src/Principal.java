import java.util.Arrays;
import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		/*Ejercicio 1
		Crear un programa que genere números enteros
		aleatorios y muestre cuáles son primos y cuáles no.
		Debe seguir las siguientes condiciones:
		1. La cantidad de números aleatorios será indicada
		por el usuario.
		2. Los números aleatorios estarán comprendidos entre
		1 y el número máximo sugerido por el usuario.*/

		Scanner teclado = new Scanner(System.in);
		int[] numerosAleatorios;
		int cantidadNumeros;
		int numeroLimite;

		System.out.print("Indique la cantidad de numeros aleatorios a generar: ");
		cantidadNumeros = teclado.nextInt();
		System.out.print("Indique el numero maximo a generar por cada aleatorio: ");
		numeroLimite = teclado.nextInt();
		numerosAleatorios = new int[cantidadNumeros];

		// llenamos el arreglo de enteros con numeros aleatorios
		for (int i = 0; i < numerosAleatorios.length; i++) {
			// generamos un numero aleatorio entre 1 y el limite
			int numero = (int) ((Math.random() * numeroLimite) + 1);
			numerosAleatorios[i] = numero;

		}

		for (int i = 0; i < numerosAleatorios.length; i++) {
			boolean esPrimo = true;
			int numero = numerosAleatorios[i];

			// un numero es primo cuando posee mas de dos divisores
			// adicionalmente no tenemos que evaluar todos los numeros por debajo de el, con
			// evaluar hasta la raiz cuadrada es suficiente
			for (int j = 2; j <= (Math.sqrt(numero)); j++) {
				if (numero % j == 0) {
					esPrimo = false;
					break;
				}
			}

			System.out.println("El numero " + numero + " " + ((!esPrimo || numero == 1) ? "no es primo" : "es primo"));

		}

		System.out.println(Arrays.toString(numerosAleatorios));
		teclado.close();

	}

}
