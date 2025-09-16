import java.util.Scanner;

public class App {
	/*Etapa 2
	1. Por cada intento fallido, debe crear una
	nueva Clave Token.
	2. Realizar un método para que retorne cada
	Clave Token.
	3. La Clave Token no deberá repetirse, por lo
	que se debe validar si ya ha sido suministrada
	anteriormente en la misma ejecución de la
	aplicación.
	4. Crear un método que valide los datos
	ingresados por el cliente y retorne si los datos
	son correctos o no.
	5. Crear un método que contenga los ciclos de
	pregunta de las credenciales que no posea
	retorno alguno.*/

    public static void main(String[] args) {
        procesoLogin();
    }

    public static void procesoLogin() {
        String usuarioCorrecto = "administrador";
        String passwordCorrecta = "administrador.1234";
        Scanner entrada = new Scanner(System.in);

        int[] tokensGenerados = new int[1000];
        int contadorTokens = 0;

        boolean accesoConcedido = false;
        int intentosFallidos = 0;
        final int MAX_INTENTOS = 3;

        System.out.println("Bienvenido a Online Banking");

        while (!accesoConcedido && intentosFallidos < MAX_INTENTOS) {
            int nuevoToken = generarTokenUnico(tokensGenerados, contadorTokens);
            tokensGenerados[contadorTokens] = nuevoToken;
            contadorTokens++;

            System.out.println("\n--- Intento " + (intentosFallidos + 1) + " ---");
            System.out.println("Clave Token generada automáticamente: " + obtenerUltimoToken(tokensGenerados, contadorTokens));

            System.out.print("Usuario: ");
            String usuario = entrada.nextLine().trim();

            System.out.print("Contraseña: ");
            String contraseña = entrada.nextLine().trim();

            System.out.print("Token: ");
            String tokenInput = entrada.nextLine().trim();

            if (usuario.isEmpty() || contraseña.isEmpty() || tokenInput.isEmpty()) {
                System.out.println("Error: Todos los campos son obligatorios.");
                continue;
            }

            if (!esNumeroDe6Digitos(tokenInput)) {
                System.out.println("Error: El token debe ser un número de 6 dígitos.");
                continue;
            }

            int tokenIngresado = convertirANumero(tokenInput);
            int tokenCorrecto = obtenerUltimoToken(tokensGenerados, contadorTokens);

            if (datosCorrectos(usuario, contraseña, tokenIngresado,
                    usuarioCorrecto, passwordCorrecta, tokenCorrecto)) {
                System.out.println("✅ Credenciales correctas. Bienvenido a Online Banking.");
                accesoConcedido = true;
            } else {
                intentosFallidos++;
                System.out.println("❌ Credenciales incorrectas.");

                if (intentosFallidos < MAX_INTENTOS) {
                    System.out.print("¿Desea intentar nuevamente? (s/n): ");
                    String respuesta = entrada.nextLine().trim().toLowerCase();
                    if (!respuesta.equals("s")) {
                        System.out.println("Sesión cancelada por el usuario.");
                        break;
                    }
                } else {
                    System.out.println("⚠️ Ha alcanzado el límite de intentos.");
                    System.out.println("Por seguridad, diríjase a la sucursal del banco más cercana para desbloquear sus credenciales.");
                }
            }
        }

        entrada.close();
    }

    // Punto 1 y 3
    public static int generarTokenUnico(int[] tokensGenerados, int contadorTokens) {
        int token;
        boolean repetido;

        do {
            token = (int) (Math.random() * 900000) + 100000;
            repetido = false;

            for (int i = 0; i < contadorTokens; i++) {
                if (tokensGenerados[i] == token) {
                    repetido = true;
                    break;
                }
            }
        } while (repetido);

        return token;
    }

    // Punto 2
    public static int obtenerUltimoToken(int[] tokensGenerados, int contadorTokens) {
        return tokensGenerados[contadorTokens - 1];
    }

    // Punto 4
    public static boolean datosCorrectos(String usuarioIngresado, String contraseñaIngresada, int tokenIngresado,
                                         String usuarioCorrecto, String contraseñaCorrecta, int tokenCorrecto) {
        return usuarioIngresado.equalsIgnoreCase(usuarioCorrecto)
                && contraseñaIngresada.equals(contraseñaCorrecta)
                && tokenIngresado == tokenCorrecto;
    }

    public static boolean esNumeroDe6Digitos(String str) {
        if (str.length() != 6) return false;
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) return false;
        }
        return true;
    }

    public static int convertirANumero(String str) {
        int resultado = 0;
        for (int i = 0; i < str.length(); i++) {
            resultado = resultado * 10 + (str.charAt(i) - '0');
        }
        return resultado;
    }
}
