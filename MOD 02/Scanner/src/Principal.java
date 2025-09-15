import java.util.Scanner;

public class Principal {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		byte numeroByte;
		short numeroShort;
		int numeroInt;
		long numeroLong;
		float numeroFloat;
		double numeroDouble;
		boolean logico;
		char caracter;
		String cadena;

		System.out.print("Escriba un numero en el rango [-128, 127]: ");
		numeroByte = scanner.nextByte();
		System.out.println("Escribio: " + numeroByte);

		System.out.print("Escriba un numero en el rango [-32.768, 32.767]: ");
		numeroShort = scanner.nextShort();
		System.out.println("Escribio: " + numeroShort);

		System.out.print("Escriba un numero en el rango  [-2147483648, 2147483647]: ");
		numeroInt = scanner.nextInt();
		System.out.println("Escribio: " + numeroInt);

		System.out.print("Escriba un numero en el rango  [-9223372036854775808, 9223372036854775807]: ");
		numeroLong = scanner.nextInt();
		System.out.println("Escribio: " + numeroLong);

		System.out.print("Escriba un numero en el rango [1.4E-45, 3.4028235E38]: ");
		numeroFloat = scanner.nextFloat();
		System.out.println("Escribio: " + numeroFloat);

		System.out.print("Escriba un numero en el rango [4.9E-324, 1.7976931348623157E308]: ");
		numeroDouble = scanner.nextDouble();
		System.out.println("Escribio: " + numeroDouble);

		System.out.print("Escriba un valor logico [true, false]: ");
		logico = scanner.nextBoolean();
		System.out.println("Escribio: " + logico);

		System.out.print("Escriba un caracter: ");
		// No existe el metodo que devuelva la cadena pero si podemos tomar un caracter
		// de la cadena
		caracter = scanner.next().charAt(0);

		/**
		 * este escape o truco lo colcamos cuando utilizamos cualquier metodo de la
		 * clase Scanner y el proximo metodo es un nextLine como lo vemos al escribir
		 * una palabra, lo que sucede es que los metodos anteriores dejan libre el
		 * "Enter" \n o salto de carro y el nextLine lo asume como entrada, asi que lo
		 * consumimos para que no nos de problemas al leer el parrafo siguiente
		 */
		scanner.nextLine();

		System.out.println("Escribio: " + caracter);

		System.out.print("Escriba una o varias palabras: ");
		cadena = scanner.nextLine();
		System.out.println("Escribio: " + cadena);

		// el scanner es un flujo de comunicacion entre la PC y nuestra aplicacion y
		// debemos cerrar dicho flujo para que no consuma mas recursos cuando no lo
		// necesitamos.
		// nuestros programas con pequeño y no afectan pero cuando aprendamos a crear
		// aplicacioones mas grandes nos daremos cuenta que es importante hacerlo.
		scanner.close();
	}

}
