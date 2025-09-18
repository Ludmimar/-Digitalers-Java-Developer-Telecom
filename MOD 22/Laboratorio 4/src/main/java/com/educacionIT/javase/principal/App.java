package com.educacionIT.javase.principal;

import java.util.Date;
import java.util.Scanner;

import com.educacionIT.javase.entidades.Administrativo;
import com.educacionIT.javase.entidades.Alumno;
import com.educacionIT.javase.entidades.Director;
import com.educacionIT.javase.entidades.Documento;
import com.educacionIT.javase.entidades.Persona;
import com.educacionIT.javase.entidades.Profesor;

/**
 * Hello world!
 *
 */
public class App {
	private static Scanner teclado = new Scanner(System.in);

	public static void main(String[] args) {

		Scanner teclado = new Scanner(System.in);

		// declaracion de Variables, sin inicializarlos porque no sabemos el tamaño
		Persona[] personas;

		// mostramos por pantalla
		System.out.println("Ingreso de Datos de Personas Laboratorio02");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// pregunta a usuario
		System.out.print("Ingrese la cantidad de Personas que cargara: ");
		int cantidadPersonas = teclado.nextInt();
		personas = new Persona[cantidadPersonas];

		for (int i = 0; i < personas.length; i++) {
			// declaramos las variables
			String nombre;
			String apellido;
			String tipo;
			Integer numero;
			Date fechaNacimiento;
			Date fechaCargo;
			int cantidadCursos;
			String carrera;
			Float sueldo;

			System.out.println("Ingreso tipo de Persona:");
			System.out.println("1 - Alumno.");
			System.out.println("2 - Director.");
			System.out.println("3 - Profesor.");
			System.out.println("4 - Administrativo.");
			System.out.println();
			int tipoPersona = teclado.nextInt();

			// objeto auxiliar
			Persona persona = null;

			// pedimos los atributos que son comunes a todos los objetos
			System.out.print("Ingrese el Nombre de la Persona [" + (i + 1) + "]: ");
			nombre = teclado.next();
			System.out.print("Ingrese el Apellido de la Persona [" + (i + 1) + "]: ");
			apellido = teclado.next();
			System.out.print("Ingrese el Tipo de Documento de la Persona [" + (i + 1) + "]: ");
			tipo = teclado.next();
			System.out.print("Ingrese el Numero de Documento de la Persona [" + (i + 1) + "]: ");
			numero = teclado.nextInt();
			System.out.println("Ingrese la Fecha de Nacimiento de la Persona [" + (i + 1) + "]: ");
			fechaNacimiento = obtenerFecha();

			switch (tipoPersona) {
			case 1:// alumno

				System.out.print("Ingrese la cantidad de cursos de la Persona [" + (i + 1) + "]: ");
				cantidadCursos = teclado.nextInt();

				persona = new Alumno(nombre, apellido, new Documento(tipo, numero), fechaNacimiento,
						agregarCursos(cantidadCursos));

				break;
			case 2:
				System.out.println("Ingrese la Fecha de inicio del Cargo de la Persona [" + (i + 1) + "]: ");
				fechaCargo = obtenerFecha();

				System.out.println("Ingrese la Carrera encargada de la Persona [" + (i + 1) + "]: ");
				carrera = teclado.next();

				System.out.print("Ingrese el Sueldo de la Persona [" + (i + 1) + "]: ");
				sueldo = teclado.nextFloat();

				persona = new Director(nombre, apellido, new Documento(tipo, numero), fechaNacimiento, fechaCargo,
						sueldo, carrera);
				break;

			case 3:
				System.out.println("Ingrese la Fecha de inicio del Cargo de la Persona [" + (i + 1) + "]: ");
				fechaCargo = obtenerFecha();

				System.out.print("Ingrese el Sueldo de la Persona [" + (i + 1) + "]: ");
				sueldo = teclado.nextFloat();

				System.out.print("Ingrese la cantidad de cursos de la Persona [" + (i + 1) + "]: ");
				cantidadCursos = teclado.nextInt();

				persona = new Profesor(nombre, apellido, new Documento(tipo, numero), fechaNacimiento, fechaCargo,
						sueldo, agregarCursos(cantidadCursos));
				break;

			case 4:
				System.out.println("Ingrese la Fecha de inicio del Cargo de la Persona [" + (i + 1) + "]: ");
				fechaCargo = obtenerFecha();

				System.out.print("Ingrese el Sueldo de la Persona [" + (i + 1) + "]: ");
				sueldo = teclado.nextFloat();

				persona = new Administrativo(nombre, apellido, new Documento(tipo, numero), fechaNacimiento, fechaCargo,
						sueldo);
				break;
			}

			personas[i] = persona;

		}

		// mostramos el tipo de perona usando el foreach
		for (

		Persona persona : personas) {
			System.out.println(persona);
			System.out.println(persona.mostrarTipoPersona());
		}

		teclado.close();
	}

	/*
	 * Metodo para obtener la fecha mas adelante veremos formas mas optimas y
	 * simples de hacer lo mismo
	 */
	private static Date obtenerFecha() {
		System.out.print("Ingrese el año: ");
		int anio = teclado.nextInt();
		System.out.print("Ingrese el mes en numero, ej: 1 que indica enero, 12 que indica diciembre: ");
		int mes = teclado.nextInt();
		System.out.print("Ingrese el dia: ");
		int dia = teclado.nextInt();
		return new Date(anio - 1900, mes - 1, dia);
	}

	private static String[] agregarCursos(int cantidad) {
		String[] cursos = new String[cantidad];

		for (int i = 0; i < cursos.length; i++) {
			System.out.print("Ingrese el curso [" + (i + 1) + "] : ");
			cursos[i] = teclado.next();
		}
		return cursos;

	}

}
