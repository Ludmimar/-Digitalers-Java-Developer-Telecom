package com.educacionIT.javase.principal;

import java.util.Scanner;

/**
 * @author EducacionIT
 * @class Principal
 * @date 10 jun. 2020
 */
public class CredencialesFor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Utilizamos la Clase Scanner para pedir los datos por la consola
		Scanner teclado = new Scanner(System.in);

		// declaramos e inicializamos las variables
		int numeroMaximoIntentos = 3;
		boolean credencialescorrectas = false;

		// mostramos por pantalla
		System.out.println("Ingreso al Sistema");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// ciclar mientras no coloque las credenciales de forma correcta o llegue a los
		// maximos intentos

		for (int i = 0; (!credencialescorrectas && i < numeroMaximoIntentos); i++) {
			System.out.print("Introduzca su usuario: ");
			String usuario = teclado.next();
			System.out.print("Introduzca su clave: ");
			String clave = teclado.next();

			// preguntamos si ingreso las credenciales de forma correcta
			if (usuario.equalsIgnoreCase("Administrador") && clave.equals("admin1234")) {
				credencialescorrectas = true;
			} else {
				System.out.println("Credenciales incorrectas, Intente de nuevo ");
			}
			// otra forma de imprimir una linea en blanco
			System.out.println();
		}

		if (credencialescorrectas) {
			System.out.println("Ingreso correctamente ( ◠‿◠)");
		} else {
			System.out.println("Usuario Bloqueado ( ・_・)");
		}

		// debemos cerrar la comunicacion con la consola, no nos preocupemos ya que lo
		// veremos mas adelante el por qué de esto :)
		teclado.close();

	}

}
