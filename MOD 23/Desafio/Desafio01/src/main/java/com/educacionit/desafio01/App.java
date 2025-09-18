package com.educacionit.desafio01;

import com.educacionit.desafio01.entidades.Impresora;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {

		try (Impresora impresora = new Impresora("HP")) {
			impresora.imprimir();
			impresora.imprimir(new String[] { "Hola", "Mundo" });
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
