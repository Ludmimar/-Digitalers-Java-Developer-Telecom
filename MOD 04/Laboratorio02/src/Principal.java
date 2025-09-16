import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		/*Ejercicio 1
		Crear un programa que lea números enteros
		(positivos y negativos) del teclado y muestre la
		suma de dichos números ingresados. El programa
		se detendrá cuando el usuario indique el
		número 0, adicionalmente, debe indicar el
		número mayor y número menor introducido en
		el programa.*/
		
		// creacion del scanner
		Scanner teclado = new Scanner(System.in);

		// creacion de variables
		int total = 0;
		int numUsuario = 0;

		// inicializamos el numero mayor con el numero menor posible en Java
		int numeroMayor = -2147483648;
		// inicializamos el numero menor con el numero mayor posible en Java
		int numeroMenor = 2147483647;

		do {
			total += numUsuario;
			System.out.print("Para Culminar escriba 0 de lo contrario escriba cualquier numero: ");
			numUsuario = teclado.nextInt();

			if (numUsuario > numeroMayor) {
				numeroMayor = numUsuario;
			}

			if (numUsuario < numeroMenor) {
				numeroMenor = numUsuario;
			}

		} while (numUsuario != 0);

		System.out.println("La suma total es: " + total);

		System.out.println("El numero mayor es : " + numeroMayor);

		System.out.println("El numero menor es : " + numeroMenor);

		// cerramos el scanner para que no siga consumiendo recursos
		teclado.close();

	}

}
