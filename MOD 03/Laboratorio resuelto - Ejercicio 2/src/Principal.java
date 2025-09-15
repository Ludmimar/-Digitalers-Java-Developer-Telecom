
public class Principal {
	public static void main(String[] args) {
		short temperatura = 5;
		String tiempo = "Nieve";

		if (temperatura > 25 && tiempo.equalsIgnoreCase("Soleado")) {
			System.out.println("Puede Salir Caminar y Tomar sol");
		} else if ((temperatura > 15 && temperatura <= 25) && tiempo.equalsIgnoreCase("Soleado")) {
			System.out.println("Puede Salir Caminar ");
		} else if (temperatura <= 15 && tiempo.equalsIgnoreCase("Soleado")) {
			System.out.println("Puede Salir Caminar con Campera");
		} else if (temperatura < 10 && tiempo.equalsIgnoreCase("Lluvia")) {
			System.out.println("Quedarse en casa o salir con Paraguas y Campera");
		} else if (temperatura < 10 && tiempo.equalsIgnoreCase("Nieve")) {
			System.out.println("Puede Salir a Esquiar");
		}

	}
}
