
public class Principal {

	public static void main(String[] args) {
		// Usando el if else con variables numéricas
		// usando variables dentro del condicional
		int num1 = 12, num2 = 6;
		boolean variableBoolean;
		variableBoolean = true;
		
		System.out.println("Bifurcacion: if - else");
		num1 = 2;
		num2 = 5;
		if (num1 > num2) {
			System.out.println("Verdad," + num1 + " es mayor que " + num2);
		} else {
			System.out.println("Falso," + num2 + " es mayor que " + num1);
		}

		// usando la variable boolean
		variableBoolean = false;

		if (variableBoolean) {
			System.out.println("La variable es: " + variableBoolean);
		} else {
			System.out.println("La variable es: " + variableBoolean);
		}

		// sin las llaves
		if (variableBoolean)
			System.out.println("La variable es: " + variableBoolean);
		else
			System.out.println("La variable es: " + variableBoolean);

	}

}
