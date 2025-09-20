package com.educacionit.desafio01;

import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

import com.educacionit.desafio01.entidades.Parametros;

public class AppTelefono {

	public static void main(String[] args) {
		Set<Parametros<Integer, String>> telefonos = new TreeSet<>();
		telefonos.add(new Parametros<Integer, String>(54, "Argentina"));
		telefonos.add(new Parametros<Integer, String>(58, "Venezuela"));
		telefonos.add(new Parametros<Integer, String>(56, "Chile"));
		telefonos.add(new Parametros<Integer, String>(57, "Colombia"));
		telefonos.add(new Parametros<Integer, String>(34, "España"));
		telefonos.add(new Parametros<Integer, String>(34, "España"));

		System.out.println();
		System.out.println("Lista de Documentos:");

		Iterator<Parametros<Integer, String>> iterador = telefonos.iterator();

		while (iterador.hasNext()) {
			Parametros<Integer, String> telefono = iterador.next();
			System.out.println(telefono);
		}

	}

}
