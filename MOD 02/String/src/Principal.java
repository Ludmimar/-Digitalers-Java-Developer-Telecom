
public class Principal {

	public static void main(String[] args) {
		String cadena = "Hola Mundo";
		System.out.println(cadena);

		char caracter = cadena.charAt(0);
		System.out.println("Caracter en la posicion 0: " + caracter);

		String cadena2 = cadena.concat(" Bienvenidos a Educacion IT");

		System.out.println(cadena2);

		System.out.println("La cadena contiene la palabra Hola: " + cadena.contains("Hola"));

		System.out.println("La cadena comienza en H: " + cadena.startsWith(cadena));

		System.out.println("La cadena termina en o: " + cadena.endsWith(cadena));

		System.out.println("La M se encuentra en la posicion: " + cadena.indexOf('M'));

		System.out.println("La ultima O se encuentra en la posicion: " + cadena.lastIndexOf('o'));

		// %=indica que vamos a trabajar las variables o valores que nos van a pasar
		// d= para numeros enteros
		// s= para String
		// f= para numeros con decimales
		// $= indica el argumento, este debe tener un prefijo numerico indicando el
		// numero de argumento

		// Hay muchas ventajas para utilizar este metodo,

		String palabra1 = "palabra1";
		String palabra2 = "palabra2";
		System.out.println(String.format("Formateando palabras %1$s ,%1$s", palabra1));

		System.out.println(String.format("Formateando palabras %1$s y %2$s con %1$s", palabra1, palabra2));

		// ya hemos utilizado el simbolo mas para concatenar variables y/o constantes
		// pero java nos sugiere utilizar el concat o el format

		int numeroEntero = 5;
		// si no vamos a repetir la variable o a imprimir mas de una no es necesario
		// utilizar el $
		System.out.println(String.format("Este es un numero entero %d ", numeroEntero));
		// tambien podemos indicarle que nuestro numero entero se llene de ceros a la
		// izquierda
		// entre el porcentaje y la d colocamos el cero y que longitud final tendria el
		// numero
		System.out.println(String.format("Este es un numero entero %02d ", numeroEntero));

		float numeroDecimal = 5.60f;

		// si lo imprimimos directamente la consola del sistema omitira el cero de dicho
		// decimal

		System.out.println("Numero decimal " + numeroDecimal);

		// ahora bien podemos indicarle con el forma cuantos decimales despues del punto
		// queremos que muestre

		System.out.println(String.format("Este es un numero decimal %.2f ", numeroDecimal));

		System.out.println(cadena.isEmpty());

		// Join es un metodo que puede ser mas comodo que el concat

		// como primer elemento debemos indicar con que caracter queremos unir las
		// cadenas siguiente:

		System.out.println(String.join(" ", "Hola", "Mundo"));

		// hagamos lo mismo con concat

		String palabraInicial = "Hola";
		System.out.println(palabraInicial.concat(" ").concat("Mundo"));

		System.out.println(palabraInicial.replace("Ho", "hO"));

		System.out.println("Toda la cadena en minuscula: " + cadena.toLowerCase());

		System.out.println("Toda la cadena en mayuscula: " + cadena.toUpperCase());

		// podemos convertir caulquier dato (numerico,booleano) en una cadena de
		// caracteres
		System.out.println(String.valueOf(false));

		System.out.println("      Hola con espacio al principio y al final             ".trim());

	}

}
