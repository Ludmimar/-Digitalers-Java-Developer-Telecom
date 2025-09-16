public class Principal {

	public static void main(String[] args) {
		// llamar a los metodos
		holaMundo();

		imprimirMensaje("Enviando mensaje");

		// se puede utilizar una variable y enviarla como argumento
		String mensajeArgumento = "Enviando mensaje 2";
		imprimirMensaje(mensajeArgumento);

		// utilizar los metodos que retornan valores
		mensajeArgumento = mensaje();

		System.out.println(mensajeArgumento);

		// tambien se puede utilizar directamente en otros metodos
		System.out.println("La suma de 5 + 2 es igual a " + suma(5, 2));
	
		System.out.println(mayorDeEdad(28) ? "Es mayo de edad" : "Es menor de edad");

	}

	// metodos de tipo procedimiento (sin retorno - void)
	// sin parametros
	static void holaMundo() {
		System.out.println("Hola Mundo");
	}

	// con parametros, pueden ser de cualquier tipo y si son mas de uno deben estar
	// separados por comas
	static void imprimirMensaje(String mensaje) {
		System.out.println(mensaje);
	}

	// metodos de tipo funcion (retornan un primitivo o un objeto)

	static String mensaje() {
		String mensaje = "Hola desde Educacion IT";
		return mensaje;
	}

	static int suma(int a, int b) {
		return a + b;
	}

	static boolean mayorDeEdad(int edad) {
		if (edad >= 18) {
			return true;
		} else {
			return false;
		}
		// este codigo se puede mejorar
		
		// opcion 1
		/*
		if (edad >= 18) {
			return true;
		}
		return false;
		*/
		
		// opcion 2 mas optimo
		// return edad >= 18;
	}

}
