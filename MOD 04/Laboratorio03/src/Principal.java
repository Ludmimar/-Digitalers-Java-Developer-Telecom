import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		/*Ejercicio 1
		Crear un programa que ingrese una oración y
		muestre cuál es el carácter que más se repite.
		Consideraciones
		● No debe incluir el espacio en blanco.
		● La oración a ingresar no debe estar vacía.*/
		
		// creacion del scanner
		Scanner teclado = new Scanner(System.in);

		int cantidadRepeticiones = 0;
		String oracion = "";
		// se utiliza el bucle do while hasta que el usuario introduzca una oracion
		do {
			System.out.println("Indique la oracion a evaluar (No puede estar vacia):");
			oracion = teclado.nextLine();
		} while (oracion.length() == 0);
		// asumimos el primer caracter como el que mas se repite
		char caracter = oracion.charAt(0);

		// se utiliza el ciclo for ya que sabemos con exactitud la cantidad de
		// iteraciones
		for (int i = 0; i < oracion.length(); i++) {
			// utilizamos auxiliares para poder comparar y sustituir
			char caracterAux = oracion.charAt(i);
			int contadorAuxiliar = 0;
			// si es el espacio en blanco no lo evaluamos
			if (caracterAux == ' ') {
				continue;
			}

			for (int j = 0; j < oracion.length(); j++) {
				if (caracterAux == oracion.charAt(j)) {
					contadorAuxiliar++;
				}

			}

			// si el caracter se repite mas veces que el anterior guardado lo sustituimos
			if (contadorAuxiliar > cantidadRepeticiones) {
				caracter = caracterAux;
				cantidadRepeticiones = contadorAuxiliar;
			}

		}

		System.out.println("El caracter [" + (caracter) + "] se repite " + cantidadRepeticiones + " veces");

		teclado.close();

	}

}
