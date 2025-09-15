
public class Principal {

	public static void main(String[] args) {
		// los casos (switch)
		char operador;
		double numero1 = 7.6, numero2 = 6, resultado = 0;

		operador = '/';

		switch (operador) {
		case '+':
			resultado = numero1 + numero2;
			// el break es importante ya que le dice al caso que debe salir de él, de lo
			// contrario entrara
			// en todas las condiciones siguientes
			break;
		case '-':
			resultado = numero1 - numero2;
			break;
		case '*':
			resultado = numero1 * numero2;
			break;
		case '/':
			if (numero2 == 0) {
				System.out.println("No es posible realizar la división por cero");
			} else {
				resultado = numero1 / numero2;
			}
			break;
		default:
			System.out.println("No es un operador valido");
		}

		System.out.println("Resultado = " + resultado);

		// los casos (switch) si no se encuentra el break podemos hacer la analogía de
		// un OR
		String salir = "s";

		switch (salir) {
		// toma las s minúscula y mayúscula
		case "s":
		case "S":
			System.out.println("Salió");
			break;
		case "n":
		case "N":
			System.out.println("Continuo");
			break;
		default:
			System.out.println("opción no valida");
		}

	}

}
