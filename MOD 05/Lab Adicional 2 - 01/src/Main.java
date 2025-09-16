import java.util.Scanner;
/*Ejercicio 1
Crear un programa que evalúe una oración e
indique si existe una palabra palíndroma o un
número capicúa y muestre por consola cuáles
cumplen con la condición.
Indicaciones
● Debe crear un método que retorne si la
palabra cumple con la condición.
● Debe evaluar si es un número o palabra
e indicarlo.
Palíndromo y capicúa: palabra o frase que se lee igual
de izquierda a derecha que de derecha a izquierda.
Ej: reconocer.
Aunque son sinónimos, suele usarse palíndroma para
las palabras y capicúa para los números.
Para este ejercicio se evaluaran solamente las
palabras y no la frase*/
public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Ingreso de la oración
        System.out.print("Ingrese una oración: ");
        String oracion = sc.nextLine();

        // Separar en palabras
        String[] palabras = oracion.split(" ");

        // Evaluar cada palabra
        for (String palabra : palabras) {
            if (esNumero(palabra)) {
                if (esPalindromo(palabra)) {
                    System.out.println("El número \"" + palabra + "\" es capicúa.");
                }
            } else {
                if (esPalindromo(palabra)) {
                    System.out.println("La palabra \"" + palabra + "\" es palíndroma.");
                }
            }
        }

        sc.close();
    }

    // Método que determina si una palabra o número es palíndromo/capicúa
    public static boolean esPalindromo(String texto) {
        String invertido = new StringBuilder(texto).reverse().toString();
        return texto.equalsIgnoreCase(invertido);
    }

    // Método para saber si es número
    public static boolean esNumero(String texto) {
        try {
            Integer.parseInt(texto);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }

    }
}