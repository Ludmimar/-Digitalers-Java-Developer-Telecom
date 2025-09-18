package com.educacionIT.javase.principal;

import java.util.Date;
import java.util.Scanner;

import com.educacionIT.javase.entidades.Alumno;
import com.educacionIT.javase.entidades.Documento;
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
		Alumno[] alumnos;
		Profesor[] profesores;

		// mostramos por pantalla
		System.out.println("Ingreso de Datos de Personas Laboratorio01");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// pregunta a usuario
		System.out.print("Ingrese la cantidad de Personas que cargara: ");
		int cantidadPersonas = teclado.nextInt();
		alumnos = new Alumno[cantidadPersonas];
		profesores = new Profesor[cantidadPersonas];

		for (int i = 0; i < cantidadPersonas; i++) {
			System.out.println("Ingreso tipo de Persona 1 si es Alumno o 2 si es Profesor: ");
			int tipoPersona = teclado.nextInt();

			if (tipoPersona == 1) {
				alumnos[i] = agregarAlumno(i);
			} else if (tipoPersona == 2) {
				profesores[i] = agregarProfesor(i);
			}

		}

		// mostramos los datos, con el proximo tema (Polimorfismo mejoraremos este
		// codigo)

		for (int i = 0; i < cantidadPersonas; i++) {
			// para mostrarlos en el orden correcto con el que fueron ingresados las
			// posiciones
			if (alumnos[i] != null) {
				System.out.println(alumnos[i]);
				System.out.println(alumnos[i].mostrarTipoPersona());
			} else {
				System.out.println(profesores[i]);
				System.out.println(profesores[i].mostrarTipoPersona());
			}
		}

		teclado.close();
	}

	private static Profesor agregarProfesor(int indice) {
		System.out.print("Ingrese el Nombre del Profesor [" + (indice + 1) + "]: ");
		String nombre = teclado.next();
		System.out.print("Ingrese el Apellido del Profesor [" + (indice + 1) + "]: ");
		String apellido = teclado.next();
		System.out.print("Ingrese el Tipo de Documento del Profesor [" + (indice + 1) + "]: ");
		String tipo = teclado.next();
		System.out.print("Ingrese el Numero de Documento del Profesor [" + (indice + 1) + "]: ");
		Integer numero = teclado.nextInt();
		System.out.println("Ingrese la Fecha de Nacimiento del Profesor [" + (indice + 1) + "]: ");
		Date fechaNacimiento = obtenerFecha();
		System.out.println("Ingrese la Fecha de inicio del Cargo del Profesor [" + (indice + 1) + "]: ");
		Date fechaCargo = obtenerFecha();

		System.out.print("Ingrese el Sueldo del Profesor [" + (indice + 1) + "]: ");
		Float sueldo = teclado.nextFloat();

		System.out.print("Ingrese la cantidad de cursos del Profesor [" + (indice + 1) + "]: ");
		int cantidadCursos = teclado.nextInt();
		String[] cursos = agregarCursos(cantidadCursos);

		Profesor profesorAuxiliar = new Profesor(nombre, apellido, new Documento(tipo, numero), fechaNacimiento,
				fechaCargo, sueldo, cursos);
		return profesorAuxiliar;
	}

	private static Alumno agregarAlumno(int indice) {

		System.out.print("Ingrese el Nombre del Alumno [" + (indice + 1) + "]: ");
		String nombre = teclado.next();
		System.out.print("Ingrese el Apellido del Alumno [" + (indice + 1) + "]: ");
		String apellido = teclado.next();
		System.out.print("Ingrese el Tipo de Documento del Alumno [" + (indice + 1) + "]: ");
		String tipo = teclado.next();
		System.out.print("Ingrese el Numero de Documento del Alumno [" + (indice + 1) + "]: ");
		Integer numero = teclado.nextInt();
		System.out.println("Ingrese la Fecha de Nacimiento del Alumno [" + (indice + 1) + "]: ");
		Date fechaNacimiento = obtenerFecha();

		System.out.print("Ingrese la cantidad de cursos del Alumno [" + (indice + 1) + "]: ");
		int cantidadCursos = teclado.nextInt();
		String[] cursos = agregarCursos(cantidadCursos);

		Alumno alumnoAuxiliar = new Alumno(nombre, apellido, new Documento(tipo, numero), fechaNacimiento, cursos);

		return alumnoAuxiliar;
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
