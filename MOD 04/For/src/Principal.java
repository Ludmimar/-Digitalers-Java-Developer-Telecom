
public class Principal {

	public static void main(String[] args) {
		// bucle for
		System.out.println("Bucle o ciclo for simple ");
		for (int i = 0; i < 10; i++) {
			System.out.println("Veces dentro del ciclo:" + (i + 1));
		}
		// break y continue dentro del for
		System.out.println("Bucle o ciclo for con interrupcion ");
		for (int i = 0; i < 10; i++) {
			if (i == 3) {
				continue;
			}
			// si el numero es 5 salir del ciclo
			if (i == 5) {
				break;
			}
			System.out.println("Veces dentro del ciclo:" + (i + 1));
		}

	}

}
