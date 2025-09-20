public enum EstadoPedido {
    NUEVO,           // el pedido recién fue creado
    PROCESANDO,      // el pedido está siendo preparado
    ENVIADO,         // el pedido salió del depósito
    ENTREGADO,       // el pedido llegó al cliente
    CANCELADO        // el pedido fue cancelado
}
