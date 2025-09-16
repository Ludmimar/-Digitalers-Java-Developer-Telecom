# 🏦 Modelo de Negocios - Sistema Fintech Etapa 3

## Diagrama del Modelo de Negocios Completo

```mermaid
classDiagram
    class SistemaFintech {
        -String storageKey
        -Object data
        -Cliente usuarioActivo
        +crearCliente(nombre, apellido, dni, email, password)
        +login(email, password)
        +logout()
        +crearCuentaParaCliente(clienteId, saldoInicial, tipoCuenta)
        +realizarDeposito(codigoCuenta, monto, descripcion)
        +realizarRetiro(codigoCuenta, monto, descripcion)
        +crearTarjetaParaCliente(clienteId, cuentaId, tipoTarjeta, marca, limiteCredito)
        +realizarCompraConTarjeta(tarjetaId, monto, comercio, descripcion)
        +crearPrestamoParaCliente(clienteId, montoSolicitado, plazoMeses, tasaInteres, tipoPrestamo)
        +aprobarPrestamo(prestamoId, observaciones)
        +rechazarPrestamo(prestamoId, motivo)
        +desembolsarPrestamo(prestamoId, cuentaDestino)
        +registrarPagoPrestamo(prestamoId, monto, fechaPago, observaciones)
        +obtenerResumenFinanciero(clienteId)
        +obtenerEstadisticasSistema()
        +validarIntegridadDatos()
        +guardar()
        +cargar()
    }

    class Cliente {
        -String id
        -String nombre
        -String apellido
        -String dni
        -String email
        -String password
        -String telefono
        -String direccion
        -Array cuentas
        -String fechaRegistro
        -Boolean activo
        +validarNombre(nombre)
        +validarApellido(apellido)
        +validarDNI(dni)
        +validarEmail(email)
        +validarPassword(password)
        +obtenerNombreCompleto()
        +agregarCuenta(codigoCuenta)
        +removerCuenta(codigoCuenta)
        +tieneCuenta(codigoCuenta)
        +obtenerCantidadCuentas()
        +actualizarDatosPersonales(datos)
        +cambiarPassword(nuevaPassword)
        +verificarPassword(password)
        +cambiarEstado(activo)
        +estaActivo()
        +obtenerDiasDesdeRegistro()
        +toJSON()
        +fromJSON(datos)
        +validarCliente()
    }

    class Cuenta {
        -String id
        -String codigo
        -String clienteId
        -Number saldo
        -String tipoCuenta
        -Array movimientos
        -String fechaCreacion
        -Boolean activa
        -Number limiteRetiroDiario
        -Number retirosHoy
        -String fechaUltimoRetiro
        +validarClienteId(clienteId)
        +validarSaldo(saldo)
        +validarTipoCuenta(tipoCuenta)
        +obtenerLimiteRetiroDiario()
        +depositar(monto, descripcion)
        +retirar(monto, descripcion)
        +validarMonto(monto)
        +verificarCuentaActiva()
        +verificarSaldoSuficiente(monto)
        +verificarLimiteRetiroDiario(monto)
        +agregarMovimiento(movimiento)
        +obtenerSaldo()
        +obtenerMovimientos()
        +obtenerMovimientosPorTipo(tipo)
        +obtenerMovimientosPorFecha(fechaInicio, fechaFin)
        +obtenerResumenMensual()
        +cambiarEstado(activa)
        +estaActiva()
        +cambiarTipoCuenta(nuevoTipo)
        +obtenerInformacion()
        +toJSON()
        +fromJSON(datos)
        +validarCuenta()
    }

    class Movimiento {
        -String id
        -String tipo
        -Number monto
        -String descripcion
        -String fecha
        -String estado
        -String referencia
        +validarTipo(tipo)
        +validarMonto(monto)
        +validarDescripcion(descripcion)
        +generarReferencia()
        +obtenerTipoFormateado()
        +obtenerMontoFormateado()
        +obtenerFechaFormateada()
        +obtenerSoloFecha()
        +obtenerHora()
        +esDeposito()
        +esRetiro()
        +esTransferencia()
        +obtenerImpactoSaldo()
        +cambiarEstado(nuevoEstado)
        +obtenerEstado()
        +estaCompletado()
        +estaPendiente()
        +estaCancelado()
        +obtenerInformacion()
        +obtenerResumen()
        +toJSON()
        +fromJSON(datos)
        +validarMovimiento()
        +compararPorFecha(otro)
        +compararPorMonto(otro)
        +esDeHoy()
        +esDeEstaSemana()
        +esDeEsteMes()
    }

    class Tarjeta {
        -String id
        -String numero
        -String clienteId
        -String cuentaId
        -String tipoTarjeta
        -String marca
        -Number limiteCredito
        -Number saldoDisponible
        -String fechaVencimiento
        -String cvv
        -String nombreTitular
        -Boolean activa
        -Boolean bloqueada
        -String fechaCreacion
        -Array transacciones
        -Number limiteDiario
        -Number gastosHoy
        -String fechaUltimoGasto
        +validarClienteId(clienteId)
        +validarCuentaId(cuentaId)
        +validarTipoTarjeta(tipoTarjeta)
        +validarMarca(marca)
        +validarLimiteCredito(limiteCredito)
        +generarFechaVencimiento()
        +generarCVV()
        +obtenerLimiteDiario()
        +realizarCompra(monto, comercio, descripcion)
        +validarMonto(monto)
        +verificarTarjetaActiva()
        +verificarTarjetaNoBloqueada()
        +verificarLimiteDiario(monto)
        +verificarSaldoDisponible(monto)
        +obtenerNumeroEnmascarado()
        +obtenerFechaVencimientoFormateada()
        +estaVencida()
        +estaProximaAVencer()
        +bloquear()
        +desbloquear()
        +cambiarEstado(activa)
        +establecerNombreTitular(nombreTitular)
        +obtenerResumenMensual()
        +obtenerInformacion()
        +toJSON()
        +fromJSON(datos)
        +validarTarjeta()
    }

    class Prestamo {
        -String id
        -String numeroPrestamo
        -String clienteId
        -Number montoSolicitado
        -Number plazoMeses
        -Number tasaInteres
        -String tipoPrestamo
        -String proposito
        -Number montoAprobado
        -Number cuotaMensual
        -Number totalAPagar
        -Number interesTotal
        -String estado
        -String fechaSolicitud
        -String fechaAprobacion
        -String fechaDesembolso
        -String fechaVencimiento
        -Array pagosRealizados
        -Number saldoPendiente
        -Number cuotasPagadas
        -Number cuotasVencidas
        -String proximoVencimiento
        -Number moraDiaria
        -Array garantias
        -String observaciones
        +validarClienteId(clienteId)
        +validarMonto(monto)
        +validarPlazo(plazo)
        +validarTasaInteres(tasa)
        +validarTipoPrestamo(tipo)
        +validarProposito(proposito)
        +calcularMontoAprobado()
        +calcularCuotaMensual()
        +calcularTotalAPagar()
        +calcularInteresTotal()
        +calcularMoraDiaria()
        +aprobar(observaciones)
        +rechazar(motivo)
        +desembolsar(cuentaDestino)
        +calcularFechasVencimiento()
        +registrarPago(monto, fechaPago, observaciones)
        +determinarTipoPago(monto)
        +verificarEstadoCuotas()
        +calcularMesesTranscurridos(fechaInicio)
        +calcularMoraAcumulada()
        +obtenerEstadoFormateado()
        +obtenerTipoFormateado()
        +obtenerResumen()
        +obtenerInformacion()
        +toJSON()
        +fromJSON(datos)
        +validarPrestamo()
    }

    %% Relaciones entre clases
    SistemaFintech ||--o{ Cliente : "gestiona"
    SistemaFintech ||--o{ Cuenta : "gestiona"
    SistemaFintech ||--o{ Tarjeta : "gestiona"
    SistemaFintech ||--o{ Prestamo : "gestiona"
    
    Cliente ||--o{ Cuenta : "posee"
    Cliente ||--o{ Tarjeta : "posee"
    Cliente ||--o{ Prestamo : "solicita"
    
    Cuenta ||--o{ Movimiento : "registra"
    Cuenta ||--o{ Tarjeta : "asociada"
    
    Tarjeta ||--o{ Prestamo : "puede financiar"
    
    Prestamo ||--o{ Movimiento : "genera pagos"
```

## 📊 Descripción del Modelo de Negocios

### 🏗️ Arquitectura del Sistema

El modelo de negocios del Sistema Fintech está diseñado siguiendo principios de **Programación Orientada a Objetos** y **Separación de Responsabilidades**. Cada clase tiene responsabilidades específicas y bien definidas:

### 🔧 Clases Principales

#### 1. **SistemaFintech** (Clase Principal)
- **Responsabilidad**: Orquestar todas las operaciones del sistema
- **Funciones**: Gestión de persistencia, autenticación, coordinación entre clases
- **Patrón**: Singleton/Facade para simplificar la interfaz del sistema

#### 2. **Cliente** (Entidad Central)
- **Responsabilidad**: Representar usuarios del sistema financiero
- **Funciones**: Validación de datos personales, gestión de cuentas asociadas
- **Validaciones**: DNI, email, contraseñas, nombres y apellidos

#### 3. **Cuenta** (Entidad Financiera Core)
- **Responsabilidad**: Gestionar cuentas bancarias y operaciones básicas
- **Funciones**: Depósitos, retiros, límites diarios, historial de movimientos
- **Tipos**: Corriente, Ahorro, Empresarial, Premium

#### 4. **Movimiento** (Entidad Transaccional)
- **Responsabilidad**: Registrar todas las transacciones financieras
- **Funciones**: Trazabilidad, validación, formateo de datos
- **Tipos**: Depósito, Retiro, Transferencia, Pago, Cobro

#### 5. **Tarjeta** (Entidad de Pago)
- **Responsabilidad**: Gestionar tarjetas de crédito y débito
- **Funciones**: Compras, límites, bloqueos, seguimiento de gastos
- **Tipos**: Crédito, Débito
- **Marcas**: Visa, Mastercard, American Express

#### 6. **Prestamo** (Entidad Crediticia)
- **Responsabilidad**: Gestionar préstamos bancarios
- **Funciones**: Cálculo de cuotas, seguimiento de pagos, gestión de mora
- **Tipos**: Personal, Hipotecario, Automotriz, Empresarial, Educativo

### 🔄 Flujos de Negocio Principales

#### **Flujo de Registro y Autenticación**
1. Cliente se registra → SistemaFintech valida datos → Cliente creado
2. Cliente inicia sesión → SistemaFintech autentica → Sesión activa

#### **Flujo de Gestión de Cuentas**
1. Cliente solicita cuenta → SistemaFintech crea cuenta → Cuenta asociada al cliente
2. Cliente realiza depósito/retiro → Cuenta valida operación → Movimiento registrado

#### **Flujo de Gestión de Tarjetas**
1. Cliente solicita tarjeta → SistemaFintech crea tarjeta → Tarjeta asociada a cuenta
2. Cliente realiza compra → Tarjeta valida operación → Transacción registrada

#### **Flujo de Gestión de Préstamos**
1. Cliente solicita préstamo → SistemaFintech crea solicitud → Préstamo en estado "solicitado"
2. Sistema evalúa → Préstamo aprobado/rechazado → Si aprobado, desembolso → Seguimiento de pagos

### 🛡️ Validaciones y Seguridad

#### **Validaciones de Datos**
- **Cliente**: DNI (7-8 dígitos), Email (formato válido), Contraseñas (6-50 caracteres)
- **Cuenta**: Saldos positivos, límites diarios, tipos válidos
- **Movimiento**: Montos positivos, tipos válidos, fechas coherentes
- **Tarjeta**: Números válidos (algoritmo Luhn), fechas de vencimiento, límites
- **Préstamo**: Montos razonables, plazos válidos, tasas de interés apropiadas

#### **Controles de Negocio**
- **Límites diarios**: Retiros y gastos con tarjeta
- **Saldo suficiente**: Verificación antes de retiros y compras
- **Estados válidos**: Transiciones de estado controladas
- **Integridad referencial**: Validación de relaciones entre entidades

### 📈 Características Avanzadas

#### **Reportes y Analytics**
- Resumen financiero por cliente
- Estadísticas generales del sistema
- Análisis de movimientos por período
- Seguimiento de préstamos y pagos

#### **Persistencia y Recuperación**
- Almacenamiento en localStorage
- Serialización/deserialización JSON
- Validación de integridad de datos
- Exportación/importación de datos

#### **Manejo de Errores**
- Validaciones exhaustivas con mensajes descriptivos
- Manejo de casos edge y límites
- Logging de errores para debugging
- Recuperación graceful de fallos

### 🎯 Beneficios del Modelo

1. **Modularidad**: Cada clase tiene responsabilidades específicas
2. **Escalabilidad**: Fácil agregar nuevas funcionalidades
3. **Mantenibilidad**: Código organizado y documentado
4. **Testabilidad**: Cada clase puede probarse independientemente
5. **Flexibilidad**: Fácil modificar reglas de negocio
6. **Robustez**: Validaciones exhaustivas y manejo de errores

### 🔮 Extensiones Futuras

El modelo está diseñado para facilitar futuras extensiones:

- **Sistema de Notificaciones**: Integración con email/SMS
- **API Externa**: Integración con bancos y procesadores de pago
- **Analytics Avanzados**: Machine learning para scoring crediticio
- **Seguridad Avanzada**: Encriptación, autenticación de dos factores
- **Multi-moneda**: Soporte para diferentes monedas
- **Blockchain**: Integración con tecnologías distribuidas

---

Este modelo de negocios proporciona una base sólida y bien estructurada para el desarrollo de un sistema Fintech completo, siguiendo las mejores prácticas de desarrollo de software y diseño de sistemas financieros.
