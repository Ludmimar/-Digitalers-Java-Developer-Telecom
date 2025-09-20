package com.educacionIT.javase.interfaces;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public interface UtilidadesFecha {
	String PATRON_FECHA = "dd/MM/yyyy";
	SimpleDateFormat FORMATO_FECHA = new SimpleDateFormat(PATRON_FECHA);

	/**
	 * 
	 * @param fecha Date
	 * @return String
	 */
	static String getFechaAString(Date fecha) {
		return FORMATO_FECHA.format(fecha);
	}

	/**
	 * 
	 * @param fecha String
	 * @return Date
	 * @throws ParseException
	 */
	static Date getStringAFecha(String fecha) throws ParseException {
		return FORMATO_FECHA.parse(fecha);
	}

}
