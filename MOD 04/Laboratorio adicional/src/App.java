import java.util.Scanner;

public class App {

	public static void main(String[] args) {
		// for
		/*
		 * for(inicializacion; condicion; incremento o decremento)*/
		/*
		for(int i=1;i<=5;i++) {
			System.out.println(i);
		}
		
		for(int i=10;i>=1;i--) {
			System.out.println(i);
		}
		
		//sume los multiplos de 3 del 1 al 100
		int suma=0;
		for(int i=10;i<=100;i--) {
			if(i%3==0) {
				suma+=i;
			}			
		}
		System.out.println("La suma de los multiplos de 3 es: ", suma);
		*/
		
		
		//Mod 4, estructura for - Lab adicional
		 
		
		/*
		 * Introducción a Java
		Ejercicio 1
		Crear un programa que ingrese una oración y
		muestre cuál es el carácter que más se repite.
		Consideraciones
		● No debe incluir el espacio en blanco.
		● La oración a ingresar no debe estar vacía.*/
/*
		Scanner teclado = new Scanner(System.in);

		int cantidadRepeticiones = 0;
		String oracion = "";
		
		do {
			System.out.println("Indique la oracion a evaluar (No puede estar vacia):");
			oracion = teclado.nextLine();
		} while (oracion.length() == 0);
		
		char caracterMasRepetido = oracion.charAt(0);

		// se utiliza el ciclo for ya que sabemos con exactitud la cantidad de
		// iteraciones
		for (int i = 0; i < oracion.length(); i++) {
			
			char caracterAevaluar = oracion.charAt(i);
			int contador = 0;
			
			if (caracterAevaluar == ' ') {
				continue;
			}

			for (int j = 0; j < oracion.length(); j++) {
				if (caracterAevaluar == oracion.charAt(j)) {
					contador++;
				}

			}

			if (contador > cantidadRepeticiones) {
				caracterMasRepetido = caracterAevaluar;
				cantidadRepeticiones = contador;
			}

		}

		System.out.println("El caracter [" + caracterMasRepetido + "] se repite " + cantidadRepeticiones + " veces");

		teclado.close();		
*/
		//Ejercicios 2 
		/*Introducción a Java
		Ejercicio 2
		Imprimir los números del 1 al 10 salteando de
		a dos, uno abajo del otro.*/
		/*
		for(int i=1;i<=10;i++) {
			if(i%2!=0) {
				System.out.println(i);
			}			
		}
		*/
		
		//Ejercicios 3
		/*mprimir los números del 10 al 1, uno abajo
		del otro.*/
				/*
		for(int i=10;i>=1;i--) {
			System.out.println(i);
		}
			*/	
		
		//Ejercicios 4
		/*Imprimir la suma de los números impares del
			1 al 10.*/
		/*
		int sum =0;
		for(int i=1;i<=10;i++) {
			if(i%2!=0) {
				sum+=i;
			}			
		}
		System.out.println("La suma de los numeros impares es: "+ sum);
		*/
		
		//Ejercicios 5
		/*Mostrar la resta de la multiplicación de los
		números del 1 al 5 con la suma de los números
		del 1 al 5.
		Por ejemplo, (1*2*3*4*5) - (1+2+3+4+5).*/
		/*
		
		int multiplicacion = 1; // no puedo inicializar en 0
		int sumatoria = 0;
		for(int i=1;i<=5;i++) {
			multiplicacion*=i;
			sumatoria+=i;
		}	
		int resta = multiplicacion - sumatoria;
		System.out.println("la resta es: " +resta);
		*/
		
		//Ejercicios 6
		//Imprimir la siguiente figura:
		/*
		for(int i=1;i<=4;i++) {
			System.out.println("@");
		}	
		*/
		
		//Ejercicios 7
		//Imprimir la siguiente figura:
		/*
		for(int i=1;i<=5;i++) {
			if(i%2==0) {
				System.out.println("@@");
			}else {
				System.out.println("@");
			}		
		}	
		*/
		
		
		//Ejercicios 8
		//Imprimir la siguiente figura:
		/*
		  for (int i = 1; i <= 5; i++) {
	            for (int j = 1; j <= i; j++) {
	                System.out.print("@");
	            }
	            System.out.println();
	        }
		
		*/
		
		//Ejercicios 9
		/*
		 for (int i = 5; i >= 1; i--) {
	            for (int j = 1; j <= i; j++) {
	                System.out.print("@");
	            }
	            System.out.println();
	        }
		
		*/
		//Ejercicios 10
		//parte creciente
		/*
		 for (int i = 1; i <= 4; i++) {
	            for (int j = 1; j <= i; j++) {
	                System.out.print("@");
	            }
	            System.out.println();
	        }

	        // Parte decreciente
	        for (int i = 3; i >= 1; i--) {
	            for (int j = 1; j <= i; j++) {
	                System.out.print("@");
	            }
	            System.out.println();
	        }
		*/
		
		//Ejercicios 11
		 // Parte decreciente
	/*
        for (int i = 5; i >= 1; i -= 2) {
            for (int j = 1; j <= i; j++) {
                System.out.print("@");
            }
            System.out.println();
        }
*/
        // Parte creciente
	/*
        for (int i = 3; i <= 5; i += 2) {
            for (int j = 1; j <= i; j++) {
                System.out.print("@");
            }
            System.out.println();
        }
*/
		/*
		//break y continue
		for(int i=1;i<=10;i++) {
			System.out.println("Encontre el cinco");
			break;
		}
		//continue
		for(int i=1;i<=5;i++) {
			if(i==3) { // no imprime el 3
				continue;
			}
			System.out.println(i);
		}
		*/
		
		//Arrays - arreglos - vectores
		// formas de declararlos
		/*
		int edades [];
		float [] pesos;
		
		// inicializo el arreglo
		pesos = new float[4];
		
		pesos[0]=36.4f;
		
		float numeroFlotante=16.5f;
		
		pesos[1]=numeroFlotante;
		System.out.println(pesos[1]);
		System.out.println(pesos.length);// obtengo el largo del arreglo
		//los arreglos son estaticos
		int[] habitantesCiudades = {25000, 36900, 1478, 57489, 54546};
		System.out.println(habitantesCiudades[0]);
		*/
		
		//mod 4 desafios: ejercicio 2
		/*
		 * Ejercicio 2
		Una persona desea invertir $1000 en un banco, el
		cual le otorga un 2% de interés mensual ¿Cuál
		será la cantidad de dinero que esta persona
		tendrá al cabo de un año?
		En el primer mes tendrá acumulado 1000 $ más
		20 $ de interés ( 2% de 1000 ). En el segundo
		mes se le sumará un 2% a la base de 1020 $ del
		mes anterior y así sucesivamente.*/
		
		double dinero = 1000;
		
		for(int i=1;i<=12;i++) {
			dinero = dinero * 1.02;
			System.out.printf("$%.2f%n",dinero);
		}
		
		
	}
}
