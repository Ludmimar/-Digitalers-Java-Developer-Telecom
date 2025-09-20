public class Pedido {
    private int id;
    private EstadoPedido estado;
    private String cliente;
    
    // Constructor
    public Pedido(int id, EstadoPedido estado, String cliente) {
        this.id = id;
        this.estado = estado;
        this.cliente = cliente;
    }
    
    // Método para mostrar información del pedido
    public void mostrarInfo() {
        System.out.println("=== Información del Pedido ===");
        System.out.println("ID: " + id);
        System.out.println("Estado: " + estado);
        System.out.println("Cliente: " + cliente);
        System.out.println("==============================");
    }
    
    // Método para avanzar al siguiente estado
    public void avanzarEstado() {
        // Si el pedido está entregado o cancelado, no hacer nada
        if (estado == EstadoPedido.ENTREGADO || estado == EstadoPedido.CANCELADO) {
            System.out.println("El pedido " + id + " no puede avanzar de estado. Estado actual: " + estado);
            return;
        }
        
        // Avanzar al siguiente estado según la secuencia
        switch (estado) {
            case NUEVO:
                estado = EstadoPedido.PROCESANDO;
                System.out.println("Pedido " + id + " avanzó de NUEVO a PROCESANDO");
                break;
            case PROCESANDO:
                estado = EstadoPedido.ENVIADO;
                System.out.println("Pedido " + id + " avanzó de PROCESANDO a ENVIADO");
                break;
            case ENVIADO:
                estado = EstadoPedido.ENTREGADO;
                System.out.println("Pedido " + id + " avanzó de ENVIADO a ENTREGADO");
                break;
            case ENTREGADO:
            case CANCELADO:
                // Estos casos ya se manejan en la condición anterior
                break;
        }
    }
    
    // Getters y Setters (opcional, pero útil para futuras modificaciones)
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public EstadoPedido getEstado() {
        return estado;
    }
    
    public void setEstado(EstadoPedido estado) {
        this.estado = estado;
    }
    
    public String getCliente() {
        return cliente;
    }
    
    public void setCliente(String cliente) {
        this.cliente = cliente;
    }
}
