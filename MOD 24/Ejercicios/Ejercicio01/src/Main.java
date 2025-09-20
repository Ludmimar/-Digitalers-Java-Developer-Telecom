/*

 Necesitamos saber el estado de los pedidos de un sistema.

 NUEVO → el pedido recién fue creado.

PROCESANDO → el pedido está siendo preparado.

ENVIADO → el pedido salió del depósito.

ENTREGADO → el pedido llegó al cliente.

CANCELADO → el pedido fue cancelado.

 1. Crear un enum para el estado del pedido.
 2. Crear una clase que sea Pedido que va a tener un id, estado, un cliente (String)
 3. Un constructor
 4. Implementar un metodo que sea mostrar info y que muestre el id, estado y el cliente.


 * */
public class Main {
    public static void main(String[] args) {
        // Crear algunos pedidos de ejemplo
        Pedido pedido1 = new Pedido(1, EstadoPedido.NUEVO, "Juan Pérez");
        Pedido pedido2 = new Pedido(2, EstadoPedido.PROCESANDO, "María García");
        Pedido pedido3 = new Pedido(3, EstadoPedido.ENTREGADO, "Carlos López");
        
        // Mostrar información de los pedidos
        pedido1.mostrarInfo();
        pedido2.mostrarInfo();
        pedido3.mostrarInfo();
        
        // Ejemplo de cambio de estado manual
        System.out.println("\n--- Cambiando estado del pedido 1 manualmente ---");
        pedido1.setEstado(EstadoPedido.PROCESANDO);
        pedido1.mostrarInfo();
        
        // Demostrar el método avanzarEstado
        System.out.println("\n--- Demostrando método avanzarEstado ---");
        
        // Crear un pedido nuevo para demostrar la progresión completa
        Pedido pedidoNuevo = new Pedido(4, EstadoPedido.NUEVO, "Ana Martínez");
        pedidoNuevo.mostrarInfo();
        
        // Avanzar estados secuencialmente
        pedidoNuevo.avanzarEstado(); // NUEVO -> PROCESANDO
        pedidoNuevo.mostrarInfo();
        
        pedidoNuevo.avanzarEstado(); // PROCESANDO -> ENVIADO
        pedidoNuevo.mostrarInfo();
        
        pedidoNuevo.avanzarEstado(); // ENVIADO -> ENTREGADO
        pedidoNuevo.mostrarInfo();
        
        // Intentar avanzar cuando ya está entregado (no debería hacer nada)
        pedidoNuevo.avanzarEstado(); // ENTREGADO -> no cambia
        pedidoNuevo.mostrarInfo();
        
        // Demostrar con pedido cancelado
        Pedido pedidoCancelado = new Pedido(5, EstadoPedido.CANCELADO, "Pedro Sánchez");
        pedidoCancelado.mostrarInfo();
        pedidoCancelado.avanzarEstado(); // CANCELADO -> no cambia
        pedidoCancelado.mostrarInfo();
    }
}