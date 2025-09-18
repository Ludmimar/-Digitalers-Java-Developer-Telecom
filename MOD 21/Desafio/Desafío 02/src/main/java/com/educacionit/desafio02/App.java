package com.educacionit.desafio02;

import java.util.Scanner;

import com.educacionit.desafio02.entidades.Documento;
import com.educacionit.desafio02.entidades.Persona;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		// declaramos variables
		Scanner teclado = new Scanner(System.in);
		String[] documentos = { "DNI", "LC", "LE", "PAS", "CI" };
		final String mensajeDocumentos = "\n\t1-Documento Nacional de Identidad -DNI \n\t2-Libreta Cívica - LC \n\t3-Libreta de Enrolamiento - LE \n\t4-Pasaporte - PAS \n\t5-Cédula de Identidad -CI";
		int indiceTipoDocumento;
		String tipoDocumento;
		String numeroDocumento;
		String nombre;
		String apellido;
		int cantidadPersonas;
		boolean existePersona = false;
		Persona[] personas;

		System.out.print("Indique la cantidad de personas: ");
		cantidadPersonas = teclado.nextInt();
		personas = new Persona[cantidadPersonas];

		for (int i = 0; i < personas.length; i++) {
			System.out.println("Persona [" + (i + 1) + "]");
			System.out.print("Indique el nombre: ");
			nombre = teclado.next();

			System.out.print("Indique el apellido: ");
			apellido = teclado.next();

			do {
				existePersona = false;
				System.out.println("Documentos de " + nombre + " " + apellido + ": " + mensajeDocumentos);
				System.out.print("Tipo: ");
				indiceTipoDocumento = teclado.nextInt();
				tipoDocumento = documentos[indiceTipoDocumento - 1];
				System.out.print("Numero: ");
				numeroDocumento = teclado.next().toUpperCase();
				// validamos
				for (int j = 0; j < i; j++) {
					if (personas[j].getDocumento().getTipoDocumento().equals(tipoDocumento)
							&& personas[j].getDocumento().getNumeroDocumento().equals(numeroDocumento)) {
						existePersona = true;
						System.err.println(
								"El tipo y numero de documento ingresados ya existen, vuelva a ingresarlos...");
						break;
					}
				}

			} while (existePersona);

			// instanciamos a la persona y le agregamos los atributos
			Persona persona = new Persona();
			persona.setNombre(nombre);
			persona.setApellido(apellido);
			persona.setDocumento(new Documento(tipoDocumento, numeroDocumento));

			// la agregamos al arreglo
			personas[i] = persona;

		}

		// mostramos los datos ingresados

		for (int i = 0; i < personas.length; i++) {
			System.out.println(personas[i].getDatos());
		}

		teclado.close();

	}
}
