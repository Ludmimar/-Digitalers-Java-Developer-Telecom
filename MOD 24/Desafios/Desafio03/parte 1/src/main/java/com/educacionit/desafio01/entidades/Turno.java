package com.educacionit.desafio01.entidades;

import java.util.concurrent.atomic.AtomicInteger;

public final class Turno implements Comparable<Turno> {
	private Persona persona;
	private Integer numero;
	private static final Byte EDAD_PRIORIDAD = 55;
	private static AtomicInteger CONTADOR = new AtomicInteger(1);

	public Turno() {
		super();
		this.numero = CONTADOR.getAndIncrement();
	}

	public Turno(Persona persona) {
		super();
		this.persona = persona;
		this.numero = CONTADOR.getAndIncrement();
	}

	@Override
	public String toString() {
		return "Turno [" + persona + "] - (" + String.format("%05d", numero) + ")";
	}

	public Persona getPersona() {
		return persona;
	}

	public void setPersona(Persona persona) {
		this.persona = persona;
	}

	public Integer getNumero() {
		return numero;
	}

	@Override
	public int compareTo(Turno turno) {
		int prioridadTurno1 = this.numero;
		int prioridadTurno2 = turno.numero;

		// si las dos personas cumplen la prioridad se ordena por como se ingreso en la
		// cola
		boolean turnoPrioridad1 = this.persona.getEdad() >= EDAD_PRIORIDAD;
		boolean turnoPrioridad2 = turno.persona.getEdad() >= EDAD_PRIORIDAD;

		if ((turnoPrioridad1) && (turnoPrioridad2)) {
			return prioridadTurno1 - prioridadTurno2;
		}

		if (turnoPrioridad1) {
			prioridadTurno1 = -this.numero;
		}
		if (turnoPrioridad2) {
			prioridadTurno2 = -turno.numero;
		}

		return prioridadTurno1 - prioridadTurno2;
	}

}
