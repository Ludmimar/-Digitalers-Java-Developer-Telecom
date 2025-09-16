/*Ejercicio 2
Crear una función suma que reciba dos parámetros,
uno de tipo entero y otro de tipo double,
que realice la suma y retorne la suma de ambos
como un double.*/
public class Main {
    public static void main(String[] args) {
        int numEntero = 5;
        double numDecimal = 7.3;

        double resultado = suma(numEntero, numDecimal);

        System.out.println("La suma de " + numEntero + " + " + numDecimal + " = " + resultado);
    }

    // Función que recibe un int y un double, retorna un double
    public static double suma(int a, double b) {
        return a + b;
    }
}