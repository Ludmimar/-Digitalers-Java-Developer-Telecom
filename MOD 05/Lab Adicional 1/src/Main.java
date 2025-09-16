import java.util.Scanner;
public class Main {
    /*Ejercicio 1 Crear un programa que reciba 3 parámetros y calcule la suma,
    resta, multiplicación, división y el resto de dos números con decimales.
    Las consignas para lograrlo son:
    ● Debe crear un método que no retorne nada, que reciba los 3 parámetros,
       2 números con decimales y el carácter de operación.
    ● Debe crear los métodos de las operaciones que retorne un número con decimales.
    ● Debe mostrar por consola un mensaje que indique el resultado y la operación realizada.*/
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        // Pedimos los valores y la operación
        System.out.print("Ingrese el primer número decimal: ");
        double num1 = sc.nextDouble();

        System.out.print("Ingrese el segundo número decimal: ");
        double num2 = sc.nextDouble();

        System.out.print("Ingrese la operación (+, -, *, /, %): ");
        char operacion = sc.next().charAt(0);

        // Llamada al método principal que procesa
        calcular(num1, num2, operacion);

        sc.close();
    }

    // Método que no retorna nada, recibe los 3 parámetros
    public static void calcular(double a, double b, char op) {
        double resultado;

        switch (op) {
            case '+':
                resultado = sumar(a, b);
                System.out.println("La suma es: " + resultado);
                break;
            case '-':
                resultado = restar(a, b);
                System.out.println("La resta es: " + resultado);
                break;
            case '*':
                resultado = multiplicar(a, b);
                System.out.println("La multiplicación es: " + resultado);
                break;
            case '/':
                if (b != 0) {
                    resultado = dividir(a, b);
                    System.out.println("La división es: " + resultado);
                } else {
                    System.out.println("Error: no se puede dividir por cero.");
                }
                break;
            case '%':
                if (b != 0) {
                    resultado = resto(a, b);
                    System.out.println("El resto es: " + resultado);
                } else {
                    System.out.println("Error: no se puede calcular el resto con divisor cero.");
                }
                break;
            default:
                System.out.println("Operación inválida.");
        }
    }

    // Métodos de operaciones que retornan double
    public static double sumar(double a, double b) {
        return a + b;
    }

    public static double restar(double a, double b) {
        return a - b;
    }

    public static double multiplicar(double a, double b) {
        return a * b;
    }

    public static double dividir(double a, double b) {
        return a / b;
    }

    public static double resto(double a, double b) {
        return a % b;
    }

}