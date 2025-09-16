/*Ejercicio 3
Escribir un programa que tenga un procedimiento
llamado mensaje, que imprima una palabra e
invocar ese procedimiento 5 veces.*/
public class Main {
    public static void main(String[] args) {
        // Invocamos el procedimiento 5 veces
        for (int i = 0; i < 5; i++) {
            mensaje();
        }
    }

    // Procedimiento (método void) que imprime una palabra
    public static void mensaje() {
        System.out.println("Hola");
    }
}