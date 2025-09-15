
public class App {

	public static void main(String[] args) {
		/*Ejercicio 1
		Crear un programa en Java que, dado un número
		entero de horas, muestre el equivalente en
		semanas, días y horas.*/
		
		 int horasTotales = 1500; // Número de horas predeterminado

	    // Cálculos
		 int semanas = horasTotales / (7 * 24); // 1 semana = 7 días * 24 horas
	     int diasRestantes = (horasTotales % (7 * 24)) / 24;
	     int horasRestantes = horasTotales % 24;

	    // Mostrar resultados
	     System.out.println("Horas totales: " + horasTotales);
	     System.out.println("Equivalente:");
	     System.out.println(semanas + " semana(s), " + diasRestantes + " día(s), " + horasRestantes + " hora(s).");

	     
		/*Ejercicio 6
		1. Resolver los enunciados desarrollando el código.
		2. Dados n1=5, n2=10 y n3=20, informar:
		a) n1+n2
		b) n3-n1
		c) n1*n3
		d) n3/n2*/
	     
	     int n1 = 5, n2 = 10, n3 = 20;
	     System.out.println("n1+n2= " + (n1+n2));
	     System.out.println("n3-n1= " + (n3-n1));
	     System.out.println("n1*n3= " + n1*n3);
	     System.out.println("n3/n2= " + n3/n2);
	     
	     /*Ejercicio 7
		1. Resolver los enunciados desarrollando el código.
		2. Dados n1=10, n2=20 y n3=30, informar:
		a) El total.
		b) El promedio.
		c) El resto entre n2 y n1.*/
	     int n1 = 10, n2 = 20, n3 = 30;
	     int total=n1+n2+n3;
	     double promedio=total/3;
	     int resto=n2%n1;
	     System.out.println("total= " + total);
	     System.out.println("promedio= " + promedio);
	     System.out.println("resto= " + resto);
	}

}
