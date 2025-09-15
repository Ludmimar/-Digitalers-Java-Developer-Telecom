import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		/*Realizar un programa que permita al usuario ingresar
		por consola dos números y realice las siguientes
		operaciones:
		1. El usuario debe poder ingresar la cantidad de
		decimales que desea ver en el resultado.
		2. Sacar la potencia de los números ingresados.*/

		Scanner teclado = new Scanner(System.in);
		int cantidadDecimales;
		float base, exponente;
		double resultado;
		System.out.print("Indique un numero base: ");
		base = teclado.nextFloat();
		System.out.print("Indique un numero exponente: ");
		exponente = teclado.nextFloat();

		System.out.print("Indique cuantos decimales quiere mostrar: ");
		cantidadDecimales = teclado.nextInt();

		resultado = Math.pow(base, exponente);
		System.out.println(String.format(
				"La potencia con " + cantidadDecimales + " decimales: %." + cantidadDecimales + "f ", resultado));

		teclado.close();
	}

}
