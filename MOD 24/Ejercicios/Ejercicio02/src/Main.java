import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        // Crear un ArrayList para guardar estudiantes
        ArrayList<Estudiante> listaEstudiantes = new ArrayList<>();
        
        // Agregar varios estudiantes usando add()
        listaEstudiantes.add(new Estudiante("Ana García", 8.5));
        listaEstudiantes.add(new Estudiante("Carlos López", 7.2));
        listaEstudiantes.add(new Estudiante("María Rodríguez", 9.1));
        listaEstudiantes.add(new Estudiante("José Martínez", 6.8));
        listaEstudiantes.add(new Estudiante("Laura Sánchez", 8.9));
        
        // Mostrar todos los estudiantes de la lista
        System.out.println("=== LISTA DE ESTUDIANTES ===");
        for (int i = 0; i < listaEstudiantes.size(); i++) {
            Estudiante estudiante = listaEstudiantes.get(i);
            System.out.println((i + 1) + ". " + estudiante.getNombre() + 
                             " - Nota: " + estudiante.getNota());
        }
        
        // Usar size() para mostrar cuántos estudiantes quedan en la lista
        System.out.println("\n=== INFORMACIÓN DE LA LISTA ===");
        System.out.println("Total de estudiantes en la lista: " + listaEstudiantes.size());
    }
}