
public class Principal {

	public static void main(String[] args) {
		// Imprimir en Consola
		
		// en la misma linea
		System.out.print("Hola Mundo primera linea");
		System.out.print("Hola Mundo misma linea");
		
		// imprimir una linea en blanco o salto de linea
		System.out.println();
		
		// imprimir un texto y al final una linea en blanco o salto de linea 
		
		System.out.println("Hola Mundo primera linea");
		System.out.println("Hola Mundo segunda linea");
		
		/* Caracteres de escape: existen ciertos caracteres que no se permiten utilizar directamente como las comillas dobles
		   y otros que nos serviran para hacer algo mas que imprimir un valor
	
			\n Salto de línea. Sitúa el cursor al principio de la línea siguiente
			\b Retroceso. Mueve el cursor un carácter atrás en la línea actual.
			\t Tabulador horizontal. Mueve el cursor hacia adelante una distancia determinada por el tabulador.
			\r Ir al principio de la línea. Mueve el cursor al principio de la línea actual.
			\" Comillas. Permite mostrar por pantalla el caracter comillas dobles.
			\\ Barra inversa.
		 */
		
		System.out.println("\n salto de linea  \t tabulador  \" comillas \\ barra inversa");
		
		
	}

}
