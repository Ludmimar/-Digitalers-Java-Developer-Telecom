package com.educacionit.desafio01.entidades;

import java.util.Objects;

public class Parametros<K, V> implements Comparable<K> {
	private K clave;
	private V valor;

	public Parametros() {
		super();
	}

	public Parametros(K clave, V valor) {
		super();
		this.clave = clave;
		this.valor = valor;
	}

	public K getClave() {
		return clave;
	}

	public void setClave(K clave) {
		this.clave = clave;
	}

	public V getValor() {
		return valor;
	}

	public void setValor(V valor) {
		this.valor = valor;
	}

	@Override
	public int hashCode() {
		return Objects.hash(clave);
	}

	@Override
	public String toString() {
		return "Parametros [clave=" + clave + ", valor=" + valor + "]";
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Parametros other = (Parametros) obj;
		return Objects.equals(clave, other.clave);
	}

	@Override
	public int compareTo(K clave) {
		// esto se puede repetir para cada uno de los objetos que necesitemos
		if (this.clave instanceof Integer && clave instanceof Parametros) {
			Parametros aux = (Parametros) clave;
			if (aux.clave instanceof Integer) {
				Integer aux1 = (Integer) this.clave;
				Integer aux2 = (Integer) aux.clave;

				return aux1 - aux2;
			}

		}
		return 0;
	}

}
