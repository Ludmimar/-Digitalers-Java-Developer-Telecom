# Diagrama Entidad-Relación - TECNO_PRJ

## Descripción de Entidades

### CLIENTES
- **ClienteID** (PK): Identificador único del cliente
- **Nombre**: Nombre del cliente
- **Apellido**: Apellido del cliente
- **CUIT**: Código Único de Identificación Tributaria
- **Dirección**: Dirección del cliente
- **Comentarios**: Observaciones adicionales

### ARTÍCULOS
- **ArticuloID** (PK): Identificador único del artículo
- **Nombre**: Nombre del artículo
- **Precio**: Precio unitario del artículo
- **Stock**: Cantidad disponible en inventario

### FACTURAS
- **FacturaID** (PK): Identificador único de la factura
- **Letra**: Tipo de factura (A, B, C)
- **Número**: Número de factura
- **ClienteID** (FK): Referencia al cliente
- **Fecha**: Fecha de emisión
- **Monto**: Monto total de la factura

### DETALLE
- **DetalleID** (PK): Identificador único del detalle
- **ArticuloID** (FK): Referencia al artículo
- **FacturaID** (FK): Referencia a la factura
- **Cantidad**: Cantidad vendida

## Relaciones

```
CLIENTES (1) -----> (N) FACTURAS
    |                    |
    |                    |
    |                    v
    |                DETALLE (N) <----- (1) ARTÍCULOS
    |                    |
    |                    |
    v                    v
ClienteID            ArticuloID
                    FacturaID
```

## Cardinalidades:
- **CLIENTES → FACTURAS**: 1:N (Un cliente puede tener muchas facturas)
- **FACTURAS → DETALLE**: 1:N (Una factura puede tener varios detalles)
- **ARTÍCULOS → DETALLE**: 1:N (Un artículo puede estar en varios detalles)

## Restricciones:
- ClienteID en FACTURAS debe existir en CLIENTES
- ArticuloID en DETALLE debe existir en ARTÍCULOS
- FacturaID en DETALLE debe existir en FACTURAS
- Monto en FACTURAS debe calcularse automáticamente basado en los detalles
