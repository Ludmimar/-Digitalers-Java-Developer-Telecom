package com.educacionIT.javase.principal;

import java.util.Scanner;

import com.educacionIT.javase.entidades.Documento;
import com.educacionIT.javase.entidades.Persona;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {

		// Utilizamos la Clase Scanner para pedir los datos por la consola
		Scanner teclado = new Scanner(System.in);

		// declaracion de Variables, sin inicializarlos porque no sabemos el tamano
		Persona[] personas;
		int cantPersonas;

		// mostramos por pantalla
		System.out.println("Ingreso de Datos de Personas Laboratorio 3");
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// pregunta a usuario
		System.out.print("Ingrese la cantidad de Personas que cargara: ");

		// capturamos lo que el usuario ingresa y lo asignamos como tamaño del
		// vector, recuerden Int para capturar es un entero y saber cantidad de personas
		cantPersonas = teclado.nextInt();
		personas = new Persona[cantPersonas];

		// usamos un for para preguntar cada uno de los datos de las personas
		for (int i = 0; i < personas.length; i++) {
			System.out.print("Ingrese el Nombre de la Persona [" + (i + 1) + "]: ");
			String nombre = teclado.next();
			System.out.print("Ingrese el Apellido de la Persona [" + (i + 1) + "]: ");
			String apellido = teclado.next();
			System.out.print("Ingrese el Tipo de Documento de la Persona [" + (i + 1) + "]: ");
			String tipoDocumento = teclado.next();
			System.out.print("Ingrese el Numero de Documento de la Persona [" + (i + 1) + "]: ");
			int numeroDocumento = teclado.nextInt();

			// Creamos un Documento temporar y por constructor le mandamos los datos
			Documento documento = new Documento(tipoDocumento, numeroDocumento);
			// creamos un objeto persona auxiliar para asignar a la posicion del vector
			// correspondiente
			// vemos la venta de utilizar variables auxiliares con el mismo nombre de los
			// parametros
			Persona personaAuxiliar = new Persona(nombre, apellido, documento);

			// tambien podemos omitir el objeto documento y mandarlo instanciando
			// directamente al constructor de persona
			// Persona personaAuxiliar = new Persona(nombre, apellido, new
			// Documento(tipoDocumento, numeroDocumento), edad);
			// asignamos el objeto auxiliar a la posicion del vector correspondiente
			personas[i] = personaAuxiliar;
			System.out.println();

		}
		// mostramos un salto de linea para diferenciar el titulo
		System.out.print("\n");

		// mostramos las notas, en este metodo uso el .length y no la variable cantidad
		// solo a modo de ejemplo
		System.out.println("Datos de las Personas");
		for (int i = 0; i < personas.length; i++) {
			// mostramos los datos de las personas

			// al cambiar el metodo a uno con retorno lo podemos utilizar en donde
			// necesitemos y no nos vmos limitados a solo imprimirlo en consola
			System.out.println(personas[i].mostrarAtributos());

		}

		// debemos cerrar la comunicacion con la consola, no nos preocupemos ya que lo
		// veremos mas adelante el por qué de esto :)
		teclado.close();

	}

}
