import java.util.Scanner;
public class App {

	public static void main(String[] args) {
		
		
		// Estructuras condicionales
		/*
		int numero = 18;
		if(numero >=  18) { //si hay mas de una instruccion si o si debo encerrar entre llaves
			System.out.println("Es mayor oigual a 18 ");
		}*/
		/*
		Si no pongo entrellaves me ejecuta System.out.println("Hola mundo!!");
		if(numero >=  18)  
			System.out.println("Es mayor oigual a 18 ");
			System.out.println("Hola mundo!!");
		*/
		/*
		System.out.println("A");
		int n1=20;
		int n2=10;
		int n3=(n1>n2)? n1:0;
		System.out.println(n3); //20
		
		System.out.println("B");
		n1=20;
		n2=20;
		n3=(n1<n2)? n1:0;
		System.out.println(n3);// false 0
		
		System.out.println("C");
		n1=20;
		n2=10;
		n3=(n1==n2)? n1:0;
		System.out.println(n3);//  0
		
		System.out.println("D");
		n1=20;
		n2=10;
		n3=(n1!=n2)? n1:0;
		System.out.println(n3);//  20
		*/
		/*
		int nro = 18;
		if(nro >=  13 ) {
			System.out.println("Sos mayor de edad");
		}else {
			System.out.println("Sos menor de edad");
		}
		
		int edad = 18;
		if(edad >=  13 && edad<18) { 
			System.out.println("Sos un adolescente");
		}else if(edad<35){
			System.out.println("Estas en tu edad joven");
		}else {
			System.out.println("Sos un adulto");
		}
		*/
		// este ejemplo es mas complicado, no conviene anidar asi
		/*
		System.out.println("D");
		int n1=20;
		int n2=10;
		int n3=(n1!=n2)? n1:(n1>n2?47:55);
		System.out.println(n3); //20
		*/
		
		/*Laboratorio adicional if-else ejercicio 1*/
		/*
		Scanner ingreso = new Scanner(System.in);
		String usuarioCorrecto="user123";
		String passwordCorrecto="admin123";
		
		System.out.println("Ingrese su usuario: ");
		String usuarioIngresado = ingreso.nextLine();
		
		System.out.println("Ingrese su password: ");
		String passwordIngresado = ingreso.nextLine();
		
		if(usuarioIngresado.equals(usuarioCorrecto)&&passwordIngresado.equals(passwordCorrecto) ) {
			System.out.println("Bienvenido al sistema");
		}else {
			System.out.println("Credenciales incorrectas");
		}
		*/
		// alumni mod 3. estructura if else, lab adicional ejercicio 2
		/*Introducción a Java
		Ejercicio 2
		Dada la siguiente tabla del tiempo, hacer un
		programa que indique qué puede hacer una
		persona con dicho pronóstico:*/
		/*
		int temperatura=25;
		String tiempo="Lluvia";
		
		if(temperatura>25 && tiempo.equals("Soleado")) {
			System.out.println("Caminar y tomar sol");
			
		}else if(temperatura>15 && temperatura<=25 && tiempo.equals("Soleado")) {
			System.out.println("Caminar");
			
		}else if(temperatura<=15 && tiempo.equals("Soleado")) {
			System.out.println("Caminar con campera");
			
		}else if(temperatura<10 && tiempo.equals("Lluvia")) {
			System.out.println("Quedarse en casa o salir con paraguas y campera");
			
		}else if(temperatura<10 && tiempo.equals("Nieve")){
			System.out.println("Esquiar");
		}else {
			System.out.println("No se encuentran sugerencias");
		}*/
		/*
		int mes =1;
		switch(mes) {
		case 1:
			System.out.println("Enero");
			break;//corta aca y no sigue evaluando los case
		case 2:
			System.out.println("Febrero");
			break;
		case 3:
			System.out.println("Marzo");
			break;
		case 4:
			System.out.println("Abril");
			break;
		case 5:
			System.out.println("Mayo");
			break;
		case 6:
			System.out.println("Junio");
			break;
		case 7:
			System.out.println("Julio");
			break;
		case 8:
			System.out.println("Agosto");
			break;
		case 9:
			System.out.println("Septiembre");
			break;
		case 10:
			System.out.println("Octubre");
			break;
		case 11:
			System.out.println("Noviembre");
			break;
		case 12:
			System.out.println("Diciembre");
			break;
		default:
			System.out.println("Mes invalido");
		}
		*/
		/*
		int mes =10;
		switch(mes) {
		case 1:
		case 2:
		case 3:
			System.out.println("Primer Trimetre");
			break;
		case 4:
		case 5:
		case 6:
			System.out.println("Segundo Trimetre");
			break;
		case 7:			
		case 8:
		case 9:
			System.out.println("Tercer Trimetre");
			break;
		case 10:
		case 11:
		case 12:
			System.out.println("Cuarto Trimetre");
			break;
		default:
			System.out.println("Mes invalido");
		}
		*/
		//Modulo 3 Lab adicional 
		/*Introducción a Java
		Crear un programa que simule la petición de
		una opción según el siguiente menú y muestre
		en pantalla que ha ingresado a la opción
		seleccionada con las opciones siguientes:
		Ejercicio 1
		¡Gracias por contactarte con nosotros!
		¿En qué podemos ayudarte?
		A) Documentación
		B) Cotización
		C) Asistencia
		D) Siniestros
		E) Información de Pagos
		F) Otras Consultas
		G) Anulación
		Escribe la letra de la opción seleccionada*/
		
		
		System.out.println("¡Gracias por contactarte con nosotros!");
		System.out.println("¿En qué podemos ayudarte?");
		System.out.println("A) Documentación");
		System.out.println("B) Cotización");
		System.out.println("C) Asistencia");
		System.out.println("D) Siniestros");
		System.out.println("E) Información de Pagos");
		System.out.println("F) Otras Consultas");
		System.out.println("G) Anulación");
		System.out.println("Escribe la letra de la opción seleccionada");
		
		
		
		Scanner ingreso = new Scanner(System.in);
		System.out.println("Ingrese la opcion correspondiente: ");
		String opcion = ingreso.nextLine();
		
		
		switch(opcion.toUpperCase()) {
		case "A":
			System.out.println("A ingresado Documentación");
			break;
		case "B":
			System.out.println("A ingresado Cotización");
			break;
		case "C":
			System.out.println("A ingresado Asistencia");
			break;
		case "D":
			System.out.println("A ingresado Siniestros");
			break;
		case "E":
			System.out.println("A ingresado Información de Pagos");
			break;
		case "F":
			System.out.println("A ingresado Otras Consultas");
			break;
		case "G":
			System.out.println("A ingresado Anulación");
			break;
		default:
			System.out.println("OPCION NO VALIDA");
		}
		
		
		//Ejercicio 2
				/*Ejercicio 2
				Ingresar dos números y ofrecer al usuario un
				menú con las siguientes opciones:
				“1-suma 2-resta 3-producto 4-división”.
				Luego, mostrar el resultado de la operación
				aritmética elegida.
				Pseudocódigo
				DEFINIR n1, n2,opcion
				LEER n1
				LEER n2
				LEER opcion
				SI opcion= ’ + ‘ ENTONCES
				INFORMAR n1 + n2
				FIN SI
				SINO
				SI opcion = ’ - ‘ ENTONCES
				INFORMAR n1 - n2
				FIN SI
				SINO
				SI opcion = ’ * ‘ ENTONCES
				INFORMAR n1 * n2
				FIN SI
				SINO
				SI opcion = ’ / ‘ ENTONCES
				INFORMAR n1/ n2
				FIN SI*/
		
		
		System.out.println("Ingrese el primer numero: ");
		int num1 = ingreso.nextInt();
		System.out.println("Ingrese el segundo numero: ");
		int num2 = ingreso.nextInt();
		System.out.println("Ingrese operacion a realizar: 1=suma / 2=resta / 3=multiplicacion / 4=Division ");
		int resultado = (int)ingreso.nextInt();
		
		switch(resultado) {
		case 1:
			System.out.println("El resultado de la suma es: " + (num1+num2));
			break;
		case 2:
			System.out.println("El resultado de la resta es: " + (num1-num2));
			break;
		case 3:
			System.out.println("El resultado de la multiplicacion es: " + (num1*num2));
			break;
		case 4:
			if(num2>0) {
				System.out.println("El resultado de la resta es: " + (num1/num2));
				break;
			}else {
				System.out.println("No se puede dividir por cero");
				break;
			}
		default:
			System.out.println("Opcion no valida");
		}
		
		
		
		
		
		
		
		
	}

}
