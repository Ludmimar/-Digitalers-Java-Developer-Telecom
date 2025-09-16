/*Ejercicio 4
Escribir una función que retorne un String, que
reciba un parámetro de tipo String llamado
“nombre” y retorne el mensaje “Hola” y el
valor del parámetro enviado.
Invocar esa función desde nuestro programa
e imprimir el resultado por consola.*/
public class Main {
    public static void main(String[] args) {
        // Llamamos a la función y guardamos el resultado
        String saludo = saludar("Ludmila");

        // Mostramos el resultado por consola
        System.out.println(saludo);
    }

    // Función que retorna un String y recibe un parámetro
    public static String saludar(String nombre) {
        return "Hola " + nombre;
    }
}