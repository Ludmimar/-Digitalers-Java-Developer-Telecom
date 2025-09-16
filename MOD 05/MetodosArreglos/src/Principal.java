import java.util.Arrays;

public class Principal {

	public static void main(String[] args) {
		String[] meses = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
				"Octubre", "Noviembre", "Diciembre" };
		// copiar un arreglo en otro
		String[] primerSementre = Arrays.copyOf(meses, 6);
		String[] segundoSementre = Arrays.copyOfRange(meses, 6, meses.length);
		String[] palabras = new String[5];

		// mostrar una cadena de caracteres con todos los elementos del arreglo
		System.out.println(Arrays.toString(meses));
		System.out.println(Arrays.toString(primerSementre));
		System.out.println(Arrays.toString(segundoSementre));
		System.out.println(Arrays.toString(palabras));

		// ordenar el arreglo de forma ascendente o por orden natural

		Arrays.sort(meses);
		System.out.println(Arrays.toString(meses));

		// comparar si los valores de un arreglo son iguales

		System.out.println(primerSementre.equals(segundoSementre) ? "Son iguales" : "Son diferentes");

		// Rellena un array con un valor que le indiquemos como parámetro.
		Arrays.fill(palabras, "Ok");
		System.out.println(Arrays.toString(palabras));

	}

}
