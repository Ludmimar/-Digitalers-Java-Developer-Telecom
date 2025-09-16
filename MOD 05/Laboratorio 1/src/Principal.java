import java.util.Arrays;
import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		/*Ejercicio 1
		Crear un programa que ingrese una oración que
		realice las siguientes operaciones:
		1. Contar las palabras.
		2. Indicar si hay palabras repetidas.
		3. Ordenar las palabras de forma ascendente
		y mostrar el resultado.
		4. Ordenar las letras y mostrar el resultado.
		Consideraciones:
		La oración no puede estar vacía*/
		
		// creacion del scanner
		Scanner teclado = new Scanner(System.in);

		String[] palabras;
		char[] letras;
		int cantidadRepeticiones = 1;
		String palabraRepetida = "";
		String oracion = "";
		// se utiliza el bucle do while hasta que el usuario introduzca una oracion
		do {
			System.out.println("Indique la oracion a evaluar (No puede estar vacia):");
			oracion = teclado.nextLine();
		} while (oracion.length() == 0);

		// el metodo split retorna un arreglo donde cada elemento esta dividio por el
		// por el parametro indicado
		palabras = oracion.split(" ");

		// el metodo replace reemplaza un caracter por otro
		oracion = oracion.replace(" ", "");
		// el metodo toCharArray retorna un arreglo de caracteres
		letras = oracion.toCharArray();

		// ordenamos los arreglos
		Arrays.sort(palabras);
		Arrays.sort(letras);

		for (int i = 0; i < palabras.length; i++) {
			String palabraAuxiliar = palabras[i];
			int contadorAuxiliar = 0;

			for (int j = i; j < palabras.length; j++) {
				if (palabras[j].equals(palabraAuxiliar)) {
					contadorAuxiliar++;
				}
			}

			if (contadorAuxiliar > cantidadRepeticiones) {
				cantidadRepeticiones = contadorAuxiliar;
				palabraRepetida = palabraAuxiliar;
			}

		}

		System.out.println("La cantidad de palabras que contiene la oracion es: " + palabras.length);
		System.out.println(cantidadRepeticiones > 1
				? ("La palabras que se repite es [" + palabraRepetida + "] " + cantidadRepeticiones + " veces")
				: "Ninguna palabra se repite");

		System.out.println("Palabras Ordenadas: ");
		System.out.println(Arrays.toString(palabras));

		System.out.println("Letras Ordenadas: ");
		System.out.println(Arrays.toString(letras));
		teclado.close();
	}

}
