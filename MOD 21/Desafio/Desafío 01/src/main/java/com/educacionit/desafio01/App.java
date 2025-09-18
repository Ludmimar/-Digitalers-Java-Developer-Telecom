package com.educacionit.desafio01;

import java.util.Arrays;
import java.util.Scanner;

import com.educacionit.desafio01.dentidades.Usuario;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		// declaramos las variables y objetos
		Scanner teclado = new Scanner(System.in);
		Usuario usuario = new Usuario();
		String[] simbolos = { "*", ".", "-", "_" };
		final String dominioValido = "@educacionit.com";
		String correo;
		String clave;

		do {
			// pedimos el correo
			System.out.print("Indique el correo electronico del instituto: ");
			correo = teclado.next().toLowerCase();
			if (correo.length() > dominioValido.length() && correo.endsWith(dominioValido)) {
				break;
			}
			System.out.println("Debe ser un correo valido y recuerde que el dominio debe se de " + dominioValido);
		} while (true);

		do {
			// pedimos la clave
			System.out.print("Indique la clave: ");
			clave = teclado.next();

			String primeraLetra = clave.substring(0, 1);
			boolean iniciaMayuscula = primeraLetra.toUpperCase().equals(primeraLetra);
			boolean contieneSimbolo = false;

			for (int i = 0; i < simbolos.length; i++) {
				// pregunto si contiene los simbolos
				if (clave.contains(simbolos[i])) {
					contieneSimbolo = true;
					break;
				}
			}

			if (iniciaMayuscula && contieneSimbolo) {
				break;
			}

			System.out.println(
					"Recuerde que la clave debe empezar en mayuscula y debe contener al menos uno de los siguientes simbolos: "
							+ Arrays.toString(simbolos));
		} while (true);
		
		usuario.setCorreo(correo);
		usuario.setClave(clave);
		System.out.println(usuario.getDatos());

		teclado.close();
	}
}
