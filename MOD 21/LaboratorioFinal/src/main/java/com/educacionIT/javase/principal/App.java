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
		System.out.println("Ingreso de Datos de Personas Laboratorio Final");
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

			// creamos un objeto persona auxiliar para asignar a la posicion del vector
			// correspondiente
			Persona personaAuxiliar = new Persona();
			// Creamos un Documento temporar y por constructor le mandamos los datos
			Documento documento = new Documento();

			System.out.print("Ingrese el Nombre de la Persona [" + (i + 1) + "]: ");
			personaAuxiliar.setNombre(teclado.next());
			System.out.print("Ingrese el Apellido de la Persona [" + (i + 1) + "]: ");
			personaAuxiliar.setApellido(teclado.next());
			System.out.print("Ingrese el Tipo de Documento de la Persona [" + (i + 1) + "]: ");
			documento.setTipoDocumento(teclado.next());
			System.out.print("Ingrese el Numero de Documento de la Persona [" + (i + 1) + "]: ");
			documento.setNumeroDocumento(teclado.nextInt());

			// seteamos el dato del documento en la persona
			personaAuxiliar.setDocumento(documento);
			System.out.print("Ingrese la Edad de la Persona [" + (i + 1) + "]: ");
			personaAuxiliar.setEdad(teclado.nextByte());

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

			String atributosPersona = "nombre=" + personas[i].getNombre() + ", apellido=" + personas[i].getApellido()
					+ ", tipoDocumento=" + personas[i].getDocumento().getTipoDocumento() + ", numeroDocumento="
					+ personas[i].getDocumento().getNumeroDocumento() + ", edad=" + personas[i].getEdad() + " y es "
					+ (personas[i].mayorEdad() ? "mayor de edad" : "menor de edad");
			System.out.println(atributosPersona);

		}

		// debemos cerrar la comunicacion con la consola, no nos preocupemos ya que lo
		// veremos mas adelante el por qué de esto :)
		teclado.close();

	}

}
