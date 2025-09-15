import java.util.Scanner;
public class App {

	public static void main(String[] args) {
		String usser = "administrador";
		String password = "administrador.1234";
		// formula= ((max - min) + 1 )+ max
		int tokenGenerado = (int)(Math.random()*(999999-100000)+1)+100000;
		Scanner entrada = new Scanner(System.in);
		System.out.println("Bienvenido a Online Banking, por favor ingrese las credenciales solicitadas");
		System.out.println("Clave Token generada automaticamente: "+tokenGenerado);
		
		System.out.println("Usuario");
		String usuario = entrada.nextLine();
		
		System.out.println("Contraseña");
		String contraseña = entrada.nextLine();
		
		//entrada.nextLine(); // limpio 
		System.out.println("Token");
		int token = entrada.nextInt();
		
		if(usuario.equalsIgnoreCase(usser) && contraseña.equals(contraseña) && tokenGenerado == token) {
			System.out.println("Credenciales correctas, bienvenido");
		}else {
			System.out.println("Error de credenciales...");
		}
		

	}

}
