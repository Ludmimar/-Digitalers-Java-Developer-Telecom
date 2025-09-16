
public class Principal {
	/**
	 * Estructuras Repetitivas Ciclos Indeterminados
	 */
	public static void main(String[] args) {

		// while o miestras, se repite hasta que la condicion se deje de cumplir
		// es importante verificar que debe existir un momento que no se cumpla para
		// poder terminar el ciclo de lo contrario quedara infinito
		int num1, num2;
		num1 = 0;
		num2 = 5;

		System.out.println("Bucle o ciclo while simple");
		do {
			System.out.println("Veces dentro del ciclo:" + (num1 + 1));
			num1++;
		} while (num1 <= num2);

		System.out.println("Bucle o ciclo while con interrupcion ");

		// lo interesante del bucle do while es que se evalua al final de la ejecucion
		// de cada ciclo, lo que garantiza que se ejecute al menos una vez.
		
		// break y continue dentro de while
		do {
			num1++;
			// aqui evalua si el numero es 3. de ser asi omitir las siguientes instrucciones
			// e ir a la siguiente iteracion
			if (num1 == 3) {
				continue;
			}
			// si el numero es 5 salir del ciclo
			if (num1 == 5) {
				break;
			}
			System.out.println("Veces dentro del ciclo:" + (num1 + 1));

		} while (num1 <= num2);

		// usualmente este tipo de bucles se utiliza mas con preguntas booleanas
		// estos ejemplos mostrados son para entender el bucle.

	}

}
