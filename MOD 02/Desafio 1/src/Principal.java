import java.util.Scanner;
public class Principal {

	public static void main(String[] args) {
		/*Introducción a Java
		Ejercicio 1
		Generar un programa que permita al usuario ingresar por
		consola en la misma línea el primer nombre y primer
		apellido y realice las siguientes operaciones:
		1. Mostrar el nombre y apellido por separado.
		2. Mostrar las iniciales en mayúsculas.*/
		 Scanner scanner = new Scanner(System.in);

	        // Pedimos el nombre y apellido en la misma línea
	        System.out.print("Ingrese su primer nombre y primer apellido: ");
	        String entrada = scanner.nextLine();

	        // Dividimos la entrada en nombre y apellido
	        String[] partes = entrada.split(" ");

	        if (partes.length >= 2) {
	            String nombre = partes[0];
	            String apellido = partes[1];

	            // 1. Mostrar el nombre y apellido por separado
	            System.out.println("Nombre: " + nombre);
	            System.out.println("Apellido: " + apellido);

	            // 2. Mostrar las iniciales en mayúsculas
	            char inicialNombre = Character.toUpperCase(nombre.charAt(0));
	            char inicialApellido = Character.toUpperCase(apellido.charAt(0));

	            System.out.println("Iniciales: " + inicialNombre + "." + inicialApellido + ".");
	        } else {
	            System.out.println("Debe ingresar al menos un nombre y un apellido.");
	        }

	        scanner.close();

	}

}
