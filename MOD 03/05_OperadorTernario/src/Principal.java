
public class Principal {

	public static void main(String[] args) {
		// if reducido u operador ternario
		int num1, num2;
		num1 = 2;
		num2 = 5;

		String consola = ((num1 > num2) ? "Es mayor" : "Es menor");

		System.out.println(consola);

		// lo mismo pero con if else

		if (num1 > num2) {
			System.out.println("Es mayor");
		} else {
			System.out.println("Es menor");
		}

	}

}
