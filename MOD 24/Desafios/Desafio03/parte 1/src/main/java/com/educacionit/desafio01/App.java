package com.educacionit.desafio01;

import java.util.PriorityQueue;
import java.util.Queue;

import com.educacionit.desafio01.entidades.Persona;
import com.educacionit.desafio01.entidades.Turno;

public class App {
	public static void main(String[] args) throws InterruptedException {
		int tiempoDeEspera = 2000; // en milisegundos

		Queue<Turno> turnos = new PriorityQueue<>();
		turnos.add(new Turno(new Persona("01", "Nombre 01", "Apellido 01", (byte) 35)));
		turnos.add(new Turno(new Persona("02", "Nombre 02", "Apellido 02", (byte) 60)));
		turnos.add(new Turno(new Persona("03", "Nombre 03", "Apellido 03", (byte) 18)));
		turnos.add(new Turno(new Persona("04", "Nombre 04", "Apellido 04", (byte) 45)));
		turnos.add(new Turno(new Persona("05", "Nombre 05", "Apellido 05", (byte) 65)));
		turnos.add(new Turno(new Persona("06", "Nombre 06", "Apellido 06", (byte) 89)));
		turnos.add(new Turno(new Persona("07", "Nombre 07", "Apellido 07", (byte) 77)));
		turnos.add(new Turno(new Persona("08", "Nombre 08", "Apellido 08", (byte) 50)));
		turnos.add(new Turno(new Persona("09", "Nombre 09", "Apellido 09", (byte) 48)));
		turnos.add(new Turno(new Persona("10", "Nombre 10", "Apellido 10", (byte) 32)));
		turnos.add(new Turno(new Persona("11", "Nombre 11", "Apellido 11", (byte) 29)));
		turnos.add(new Turno(new Persona("12", "Nombre 12", "Apellido 12", (byte) 46)));
		turnos.add(new Turno(new Persona("13", "Nombre 13", "Apellido 13", (byte) 87)));
		turnos.add(new Turno(new Persona("14", "Nombre 14", "Apellido 14", (byte) 55)));
		turnos.add(new Turno(new Persona("15", "Nombre 15", "Apellido 15", (byte) 31)));
		turnos.add(new Turno(new Persona("16", "Nombre 16", "Apellido 16", (byte) 20)));
		turnos.add(new Turno(new Persona("17", "Nombre 17", "Apellido 17", (byte) 19)));
		turnos.add(new Turno(new Persona("18", "Nombre 18", "Apellido 18", (byte) 80)));
		turnos.add(new Turno(new Persona("19", "Nombre 19", "Apellido 19", (byte) 53)));
		turnos.add(new Turno(new Persona("20", "Nombre 20", "Apellido 20", (byte) 66)));

		System.out.println("Inicio de Sistema de turnos");
		while (!turnos.isEmpty()) {
			System.out.println("Atendiendo a:  " + turnos.poll());
			Thread.sleep(tiempoDeEspera);
			if (turnos.peek() != null) {
				System.out.println("Por Atender a: " + turnos.peek());
				Thread.sleep(tiempoDeEspera);
			}
		}

		System.out.println("Fin de Sistema de turnos");

	}
}
