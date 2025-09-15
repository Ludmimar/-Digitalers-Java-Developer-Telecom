
public class Main {
    public static void main(String[] args) {
        /*Ejercicio 1
        Dado el siguiente código:
        int nro1 = 100, nro2 = 500, nro3 = 250;
        Informar cuál de los tres números
        es mayor.*/

        int nro1 = 10,nro2 = 20, nro3 = 30;
        if(nro1 > nro2 & nro1 > nro3) { System.out.println(" el nro1 es el mayor: " + nro1); }
        if (nro2 > nro1 & nro2 > nro3) { System.out.println(" el nro2 es el mayor: " + nro2); }
        if (nro3 > nro2 & nro3 > nro1) { System.out.println(" el nro3 es el mayor: " + nro3); }

        /*Ejercicio 2
        A partir del siguiente código:
        int a = 10, b=-2, c=5;
        hay 2 números positivos y 1 negativo
        Informar la multiplicación de los dos
        números positivos.*/

        int a = -10, b = 2, c = 5;
        if (a > 0 & b > 0) { System.out.println("a x b = " + a * b); }
        if (a > 0 & c > 0) { System.out.println("a x c = " + a * c); }
        if (b > 0 & c > 0) { System.out.println(" b x c = " + b * c); }

        /*Ejercicio 3
        Tomando el siguiente código:
        String usuario = “Pepito”, clave= “1234”;
        Informar los siguientes casos:
        1. Si el usuario es ”pepito” y la clave es ”1234”
        informar “¡Bienvenido pepito!”.
        2. Si el usuario es ”pepito” y la clave no es
        “1234” informar “Contraseña incorrecta”.
        3. Si el usuario no es “pepito” y la clave es
        “1234” informar “Usuario incorrecto”.*/

        String user="Pepito", pass="1234";
        if(user.equals("Pepe") & pass.equals("1234")) { System.out.println("Bienvenido Pepe!!"); }
        if(!(user.equals("Pepe")) & pass.equals("1234")) { System.out.println("usuario incorrecto"); }
        if(user.equals("Pepe") & !(pass.equals("1234"))) { System.out.println("Contraseña incorrecta"); }
    }
}