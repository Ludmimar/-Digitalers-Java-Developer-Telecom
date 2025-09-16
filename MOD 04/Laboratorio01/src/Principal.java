import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		/*Ejercicio 1
		Crear un programa que lea números enteros
		(positivos y negativos) del teclado y muestre
		la suma de dichos números ingresados, el
		programa se detendrá cuando el usuario indique
		el número 0.*/
		
		// creacion del scanner
		Scanner teclado = new Scanner(System.in);

		// creacion de variables
		int total = 0;
		int numUsuario = 0;
		System.out.println("Suma de numeros enteros:");
		System.out.print("Para Salir escriba 0 de lo contrario escriba cualquier numero: ");
		numUsuario = teclado.nextInt();

		while (numUsuario != 0) {
			total += numUsuario;
			System.out.print("Para Culminar escriba 0 de lo contrario escriba cualquier numero: ");
			numUsuario = teclado.nextInt();
		}

		System.out.println("La suma total es: " + total);
		// cerramos el scanner para que no siga consumiendo recursos
		teclado.close();
		
		/*Ejercicio 2
		Imprimir los números del 1 al 10, sin imprimir
		números 2, 5 y 9, uno abajo del otro.
		Requisito: se necesita tener conocimiento del
		operador AND (&&) y del operador NOT (!=)*/
		int n = 1;
		while (n<=10){
			if ((n != 2) && (n != 5) && (n != 9)){
				System.out.println(n);
				}
			n++;
		}
		
		
		/*Ejercicio 3
		Imprimir los números del 1 al 30 sin imprimir
		números entre el 10 y el 20 uno abajo del otro.
		Requisito: se necesita tener conocimientos del
		operador OR (||)*/
		int n = 1;
		while (n < 31){
			if ((n < 10) | (n > 20)){
				System.out.println(n);
			}
			n++;
		}
		
		
		/*Ejercicio 4
		Imprimir la suma de los números del 1 al 10.*/
		int n = 1;
		int suma = 0;
		while (n <= 10){
			suma= suma + n;
			n++;
		}
		System.out.println("La suma del 1 al 10 es " + suma);

	}

}
