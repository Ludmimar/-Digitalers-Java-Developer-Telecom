import java.util.Scanner;

public class App {

    public static void main(String[] args) {
        pedirCredenciales();
    }

    public static void pedirCredenciales() {
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
            int tokenGenerado = generarTokenUnico(tokensGenerados, contadorTokens);
            tokensGenerados[contadorTokens] = tokenGenerado;
            contadorTokens++;

            System.out.println("\n--- Intento " + (intentosFallidos + 1) + " ---");
            System.out.println("Clave Token generada automáticamente: " + tokenGenerado);

            System.out.print("Usuario: ");
            String usuario = entrada.nextLine().trim();

            System.out.print("Contraseña: ");
            String contraseña = entrada.nextLine().trim();

            System.out.print("Token: ");
            String tokenInput = entrada.nextLine().trim();

            // Validar que todos los campos estén completos
            if (usuario.isEmpty() || contraseña.isEmpty() || tokenInput.isEmpty()) {
                System.out.println("Error: Todos los campos son obligatorios.");
                continue;
            }

            // Validar que el token tenga solo dígitos y 6 caracteres
            if (!esNumeroDe6Digitos(tokenInput)) {
                System.out.println("Error: El token debe ser un número de 6 dígitos.");
                continue;
            }

            int tokenIngresado = convertirANumero(tokenInput);

            if (validarCredenciales(usuario, contraseña, tokenIngresado,
                    usuarioCorrecto, passwordCorrecta, tokenGenerado)) {
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

    public static int generarTokenUnico(int[] tokensGenerados, int contadorTokens) {
        int token;
        boolean repetido;

        do {
            token = (int) (Math.random() * 900000) + 100000; // entre 100000 y 999999
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

    public static boolean validarCredenciales(String usuarioIngresado, String contraseñaIngresada, int tokenIngresado,
                                              String usuarioCorrecto, String contraseñaCorrecta, int tokenCorrecto) {
        return usuarioIngresado.equalsIgnoreCase(usuarioCorrecto)
                && contraseñaIngresada.equals(contraseñaCorrecta)
                && tokenIngresado == tokenCorrecto;
    }

    // Valida si el string representa un número de 6 dígitos
    public static boolean esNumeroDe6Digitos(String str) {
        if (str.length() != 6) return false;
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) return false;
        }
        return true;
    }

    // Convierte el string a número, asumiendo que ya fue validado
    public static int convertirANumero(String str) {
        int resultado = 0;
        for (int i = 0; i < str.length(); i++) {
            resultado = resultado * 10 + (str.charAt(i) - '0');
        }
        return resultado;
    }
}
