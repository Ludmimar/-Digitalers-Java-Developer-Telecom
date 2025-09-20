package com.educacionIT.javase.principal;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.Scanner;
import java.util.Set;

import com.educacionIT.javase.comparadores.OrdenDocumento;
import com.educacionIT.javase.comparadores.OrdenEdadDesc;
import com.educacionIT.javase.entidades.Administrativo;
import com.educacionIT.javase.entidades.Alumno;
import com.educacionIT.javase.entidades.Director;
import com.educacionIT.javase.entidades.Documento;
import com.educacionIT.javase.entidades.Persona;
import com.educacionIT.javase.entidades.Profesor;
import com.educacionIT.javase.enumerados.TiposDocumento;
import com.educacionIT.javase.interfaces.Constantes;
import com.educacionIT.javase.interfaces.UtilidadesFecha;

/**
 * Hello world!
 *
 */
public class App {
	private static Scanner teclado = new Scanner(System.in);

	public static void main(String[] args) {

		Scanner teclado = new Scanner(System.in);

		// declaracion de Variables
		Set<Persona> personas = new HashSet<>();
		List<Persona> listaPersonas = new ArrayList<>();

		// mostramos por pantalla
		System.out.println("Ingreso de Datos de Personas Laboratorio01");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// pregunta a usuario
		System.out.print("Ingrese la cantidad de Personas que cargara: ");
		int cantidadPersonas = teclado.nextInt();

		for (int i = 0; i < cantidadPersonas; i++) {
			// declaramos las variables
			String nombre;
			String apellido;
			TiposDocumento tipo;
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

			while (true) {
				System.out.print("Ingrese el Tipo de Documento de la Persona [" + (i + 1) + "]: ");

				try {
					tipo = TiposDocumento.valueOf(teclado.next().toUpperCase());
					break;
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

			}
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

			personas.add(persona);

		}

		System.out.println("Personas:");
		// mostramos el tipo de perona usando el foreach
		for (Persona persona : personas) {
			System.out.println(persona);
			System.out.println(persona.mostrarTipoPersona());
		}

		// agregamos la coleccion a la lista para proceder a ordenarla
		listaPersonas.addAll(personas);
		listaPersonas.sort(new OrdenDocumento());

		System.out.println();
		System.out.println("Personas Ordenadas:");
		// mostramos el tipo de perona usando el foreach
		for (Persona persona : listaPersonas) {
			System.out.println(persona);
		}

		asistenacia(listaPersonas);

		teclado.close();
	}

	/*
	 * Metodo para obtener la fecha
	 */
	private static Date obtenerFecha() {

		String fechaUsuario = "";
		Date fecha = null;
		while (true) {
			try {
				System.out.print("Formato Fecha[dd/mm/aaaa]: ");
				fechaUsuario = teclado.next();
				// el metodo parse recibe un string y retorna un objeto de tipo DATE
				fecha = UtilidadesFecha.getStringAFecha(fechaUsuario);
				break;
			} catch (ParseException e) {
				System.err.println("debe ingresar un dato valido: " + e.getMessage());
			}
		}

		return fecha;
	}

	private static int[] agregarCursos(int cantidad) {
		int[] cursos = new int[cantidad];

		for (int i = 0; i < cursos.length; i++) {
			while (true) {
				System.out.print("Ingrese el curso [" + (i + 1) + "] : ");
				String curso = teclado.next();
				int idCurso = validarCurso(curso);
				if (idCurso != -1) {
					cursos[i] = idCurso;
					break;
				}
				System.err.println("debe ingresar un curso valido: " + Constantes.getCursos().values());
			}
		}
		return cursos;

	}

	// metodo para validar los cursos
	private static int validarCurso(String curso) {
		Map<Integer, String> cursos = Constantes.getCursos();

		if (cursos.containsValue(curso)) {
			for (Entry<Integer, String> cursoAuxiliar : cursos.entrySet()) {
				if (cursoAuxiliar.getValue().equalsIgnoreCase(curso)) {
					return cursoAuxiliar.getKey();
				}
			}
		}

		return -1;
	}

	// metodo para la cola de asistencia de la institucion
	private static void asistenacia(Collection<Persona> personas) {
		Queue<Persona> colaPersonas = new PriorityQueue<Persona>(new OrdenEdadDesc());
		colaPersonas.addAll(personas);

		System.out.println("COLA DE ASISTENCIA");
		while (!colaPersonas.isEmpty()) {
			System.out.println("Por atender a: " + colaPersonas.peek());
			System.out.println("Atendiendo a: " + colaPersonas.poll());
		}
	}

}
