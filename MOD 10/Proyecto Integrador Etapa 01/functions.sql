-- =====================================================
-- PROYECTO INTEGRADOR ETAPA 01 - TECNO_PRJ
-- Funciones y Procedimientos para Manipulación de Datos
-- =====================================================

USE TECNO_PRJ;

-- =====================================================
-- 1. FUNCIONES DE UTILIDAD
-- =====================================================

-- Función para calcular el total de una factura
DELIMITER //
CREATE FUNCTION fn_calcular_total_factura(p_factura_id INT)
RETURNS DECIMAL(12,2)
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(12,2) DEFAULT 0;
    
    SELECT COALESCE(SUM(d.Cantidad * a.Precio), 0)
    INTO total
    FROM DETALLE d
    JOIN ARTICULOS a ON d.ArticuloID = a.ArticuloID
    WHERE d.FacturaID = p_factura_id;
    
    RETURN total;
END//

-- Función para verificar si hay stock suficiente
CREATE FUNCTION fn_verificar_stock(p_articulo_id INT, p_cantidad INT)
RETURNS BOOLEAN
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;
    
    SELECT Stock INTO stock_actual
    FROM ARTICULOS
    WHERE ArticuloID = p_articulo_id;
    
    RETURN stock_actual >= p_cantidad;
END//

-- Función para obtener el próximo número de factura
CREATE FUNCTION fn_proximo_numero_factura(p_letra CHAR(1))
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
    DECLARE proximo_numero INT;
    
    SELECT COALESCE(MAX(Numero), 0) + 1
    INTO proximo_numero
    FROM FACTURAS
    WHERE Letra = p_letra;
    
    RETURN proximo_numero;
END//

DELIMITER ;

-- =====================================================
-- 2. PROCEDIMIENTOS PARA ACTUALIZAR DATOS (UPDATE)
-- =====================================================

-- Procedimiento para actualizar precio de artículo
DELIMITER //
CREATE PROCEDURE sp_actualizar_precio_articulo(
    IN p_articulo_id INT,
    IN p_nuevo_precio DECIMAL(10,2),
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_resultado = 'Error al actualizar precio';
    END;
    
    START TRANSACTION;
    
    IF p_nuevo_precio <= 0 THEN
        SET p_resultado = 'El precio debe ser mayor a 0';
    ELSEIF NOT EXISTS (SELECT 1 FROM ARTICULOS WHERE ArticuloID = p_articulo_id) THEN
        SET p_resultado = 'El artículo no existe';
    ELSE
        UPDATE ARTICULOS 
        SET Precio = p_nuevo_precio
        WHERE ArticuloID = p_articulo_id;
        
        -- Recalcular montos de facturas que contengan este artículo
        UPDATE FACTURAS f
        SET Monto = fn_calcular_total_factura(f.FacturaID)
        WHERE f.FacturaID IN (
            SELECT DISTINCT d.FacturaID
            FROM DETALLE d
            WHERE d.ArticuloID = p_articulo_id
        );
        
        SET p_resultado = 'Precio actualizado correctamente';
    END IF;
    
    COMMIT;
END//

-- Procedimiento para actualizar stock de artículo
CREATE PROCEDURE sp_actualizar_stock_articulo(
    IN p_articulo_id INT,
    IN p_nuevo_stock INT,
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_resultado = 'Error al actualizar stock';
    END;
    
    START TRANSACTION;
    
    IF p_nuevo_stock < 0 THEN
        SET p_resultado = 'El stock no puede ser negativo';
    ELSEIF NOT EXISTS (SELECT 1 FROM ARTICULOS WHERE ArticuloID = p_articulo_id) THEN
        SET p_resultado = 'El artículo no existe';
    ELSE
        UPDATE ARTICULOS 
        SET Stock = p_nuevo_stock
        WHERE ArticuloID = p_articulo_id;
        
        SET p_resultado = 'Stock actualizado correctamente';
    END IF;
    
    COMMIT;
END//

-- Procedimiento para actualizar datos de cliente
CREATE PROCEDURE sp_actualizar_cliente(
    IN p_cliente_id INT,
    IN p_nombre VARCHAR(25),
    IN p_apellido VARCHAR(25),
    IN p_direccion VARCHAR(50),
    IN p_comentarios VARCHAR(50),
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_resultado = 'Error al actualizar cliente';
    END;
    
    START TRANSACTION;
    
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE ClienteID = p_cliente_id) THEN
        SET p_resultado = 'El cliente no existe';
    ELSEIF p_nombre IS NULL OR p_nombre = '' OR p_apellido IS NULL OR p_apellido = '' THEN
        SET p_resultado = 'Nombre y apellido son obligatorios';
    ELSE
        UPDATE CLIENTES 
        SET Nombre = p_nombre,
            Apellido = p_apellido,
            Direccion = p_direccion,
            Comentarios = p_comentarios
        WHERE ClienteID = p_cliente_id;
        
        SET p_resultado = 'Cliente actualizado correctamente';
    END IF;
    
    COMMIT;
END//

DELIMITER ;

-- =====================================================
-- 3. PROCEDIMIENTOS PARA ELIMINAR DATOS (DELETE)
-- =====================================================

-- Procedimiento para eliminar artículo (solo si no tiene ventas)
DELIMITER //
CREATE PROCEDURE sp_eliminar_articulo(
    IN p_articulo_id INT,
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_resultado = 'Error al eliminar artículo';
    END;
    
    START TRANSACTION;
    
    IF NOT EXISTS (SELECT 1 FROM ARTICULOS WHERE ArticuloID = p_articulo_id) THEN
        SET p_resultado = 'El artículo no existe';
    ELSEIF EXISTS (SELECT 1 FROM DETALLE WHERE ArticuloID = p_articulo_id) THEN
        SET p_resultado = 'No se puede eliminar: el artículo tiene ventas asociadas';
    ELSE
        DELETE FROM ARTICULOS WHERE ArticuloID = p_articulo_id;
        SET p_resultado = 'Artículo eliminado correctamente';
    END IF;
    
    COMMIT;
END//

-- Procedimiento para eliminar cliente (solo si no tiene facturas)
CREATE PROCEDURE sp_eliminar_cliente(
    IN p_cliente_id INT,
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_resultado = 'Error al eliminar cliente';
    END;
    
    START TRANSACTION;
    
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE ClienteID = p_cliente_id) THEN
        SET p_resultado = 'El cliente no existe';
    ELSEIF EXISTS (SELECT 1 FROM FACTURAS WHERE ClienteID = p_cliente_id) THEN
        SET p_resultado = 'No se puede eliminar: el cliente tiene facturas asociadas';
    ELSE
        DELETE FROM CLIENTES WHERE ClienteID = p_cliente_id;
        SET p_resultado = 'Cliente eliminado correctamente';
    END IF;
    
    COMMIT;
END//

-- Procedimiento para eliminar factura completa
CREATE PROCEDURE sp_eliminar_factura(
    IN p_factura_id INT,
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_resultado = 'Error al eliminar factura';
    END;
    
    START TRANSACTION;
    
    IF NOT EXISTS (SELECT 1 FROM FACTURAS WHERE FacturaID = p_factura_id) THEN
        SET p_resultado = 'La factura no existe';
    ELSE
        -- Los detalles se eliminan automáticamente por CASCADE
        DELETE FROM FACTURAS WHERE FacturaID = p_factura_id;
        SET p_resultado = 'Factura eliminada correctamente';
    END IF;
    
    COMMIT;
END//

DELIMITER ;

-- =====================================================
-- 4. PROCEDIMIENTOS PARA OPERACIONES COMPLEJAS
-- =====================================================

-- Procedimiento para crear una nueva venta completa
DELIMITER //
CREATE PROCEDURE sp_crear_venta(
    IN p_cliente_id INT,
    IN p_letra CHAR(1),
    IN p_fecha DATE,
    IN p_detalles JSON, -- Formato: [{"articulo_id": 1, "cantidad": 2}, ...]
    OUT p_factura_id INT,
    OUT p_resultado VARCHAR(100)
)
BEGIN
    DECLARE v_numero INT;
    DECLARE v_detalle_count INT;
    DECLARE v_i INT DEFAULT 0;
    DECLARE v_articulo_id INT;
    DECLARE v_cantidad INT;
    DECLARE v_stock_suficiente BOOLEAN DEFAULT TRUE;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET p_resultado = 'Error al crear venta';
    END;
    
    START TRANSACTION;
    
    -- Validaciones iniciales
    IF NOT EXISTS (SELECT 1 FROM CLIENTES WHERE ClienteID = p_cliente_id) THEN
        SET p_resultado = 'El cliente no existe';
    ELSEIF p_letra NOT IN ('A', 'B', 'C') THEN
        SET p_resultado = 'Tipo de factura inválido';
    ELSE
        -- Obtener próximo número de factura
        SET v_numero = fn_proximo_numero_factura(p_letra);
        
        -- Verificar stock para todos los artículos
        SET v_detalle_count = JSON_LENGTH(p_detalles);
        WHILE v_i < v_detalle_count AND v_stock_suficiente DO
            SET v_articulo_id = JSON_UNQUOTE(JSON_EXTRACT(p_detalles, CONCAT('$[', v_i, '].articulo_id')));
            SET v_cantidad = JSON_UNQUOTE(JSON_EXTRACT(p_detalles, CONCAT('$[', v_i, '].cantidad')));
            
            IF NOT fn_verificar_stock(v_articulo_id, v_cantidad) THEN
                SET v_stock_suficiente = FALSE;
                SET p_resultado = CONCAT('Stock insuficiente para artículo ID: ', v_articulo_id);
            END IF;
            
            SET v_i = v_i + 1;
        END WHILE;
        
        IF v_stock_suficiente THEN
            -- Crear la factura
            INSERT INTO FACTURAS (Letra, Numero, ClienteID, Fecha)
            VALUES (p_letra, v_numero, p_cliente_id, p_fecha);
            
            SET p_factura_id = LAST_INSERT_ID();
            
            -- Crear los detalles
            SET v_i = 0;
            WHILE v_i < v_detalle_count DO
                SET v_articulo_id = JSON_UNQUOTE(JSON_EXTRACT(p_detalles, CONCAT('$[', v_i, '].articulo_id')));
                SET v_cantidad = JSON_UNQUOTE(JSON_EXTRACT(p_detalles, CONCAT('$[', v_i, '].cantidad')));
                
                INSERT INTO DETALLE (ArticuloID, FacturaID, Cantidad)
                VALUES (v_articulo_id, p_factura_id, v_cantidad);
                
                SET v_i = v_i + 1;
            END WHILE;
            
            SET p_resultado = 'Venta creada correctamente';
        END IF;
    END IF;
    
    COMMIT;
END//

-- Procedimiento para generar reporte de ventas por período
CREATE PROCEDURE sp_reporte_ventas_periodo(
    IN p_fecha_desde DATE,
    IN p_fecha_hasta DATE,
    OUT p_total_facturas INT,
    OUT p_total_ventas DECIMAL(12,2),
    OUT p_promedio_factura DECIMAL(12,2)
)
BEGIN
    SELECT 
        COUNT(*),
        COALESCE(SUM(Monto), 0),
        COALESCE(AVG(Monto), 0)
    INTO 
        p_total_facturas,
        p_total_ventas,
        p_promedio_factura
    FROM FACTURAS
    WHERE Fecha BETWEEN p_fecha_desde AND p_fecha_hasta;
END//

DELIMITER ;

-- =====================================================
-- 5. EJEMPLOS DE USO DE LAS FUNCIONES Y PROCEDIMIENTOS
-- =====================================================

-- Ejemplo 1: Actualizar precio de un artículo
-- CALL sp_actualizar_precio_articulo(1, 90000.00, @resultado);
-- SELECT @resultado;

-- Ejemplo 2: Actualizar stock de un artículo
-- CALL sp_actualizar_stock_articulo(1, 20, @resultado);
-- SELECT @resultado;

-- Ejemplo 3: Actualizar datos de cliente
-- CALL sp_actualizar_cliente(1, 'Juan Carlos', 'Pérez González', 'Av. Corrientes 1234, CABA', 'Cliente VIP actualizado', @resultado);
-- SELECT @resultado;

-- Ejemplo 4: Eliminar artículo (solo si no tiene ventas)
-- CALL sp_eliminar_articulo(15, @resultado);
-- SELECT @resultado;

-- Ejemplo 5: Crear nueva venta
-- CALL sp_crear_venta(1, 'A', '2024-02-01', '[{"articulo_id": 1, "cantidad": 1}, {"articulo_id": 2, "cantidad": 2}]', @factura_id, @resultado);
-- SELECT @factura_id, @resultado;

-- Ejemplo 6: Generar reporte de ventas
-- CALL sp_reporte_ventas_periodo('2024-01-01', '2024-01-31', @total_facturas, @total_ventas, @promedio);
-- SELECT @total_facturas AS TotalFacturas, @total_ventas AS TotalVentas, @promedio AS PromedioFactura;

-- =====================================================
-- 6. PROCEDIMIENTOS DE MANTENIMIENTO
-- =====================================================

-- Procedimiento para recalcular todos los montos de facturas
DELIMITER //
CREATE PROCEDURE sp_recalcular_montos_facturas()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_factura_id INT;
    DECLARE v_cursor CURSOR FOR SELECT FacturaID FROM FACTURAS;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN v_cursor;
    
    read_loop: LOOP
        FETCH v_cursor INTO v_factura_id;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        UPDATE FACTURAS 
        SET Monto = fn_calcular_total_factura(v_factura_id)
        WHERE FacturaID = v_factura_id;
    END LOOP;
    
    CLOSE v_cursor;
END//

-- Procedimiento para verificar integridad de datos
CREATE PROCEDURE sp_verificar_integridad()
BEGIN
    SELECT 'Verificando integridad de datos...' AS Mensaje;
    
    -- Verificar facturas sin detalles
    SELECT 'Facturas sin detalles:' AS Verificacion, COUNT(*) AS Cantidad
    FROM FACTURAS f
    LEFT JOIN DETALLE d ON f.FacturaID = d.FacturaID
    WHERE d.FacturaID IS NULL;
    
    -- Verificar artículos con stock negativo
    SELECT 'Artículos con stock negativo:' AS Verificacion, COUNT(*) AS Cantidad
    FROM ARTICULOS
    WHERE Stock < 0;
    
    -- Verificar montos de facturas vs detalles
    SELECT 'Facturas con monto incorrecto:' AS Verificacion, COUNT(*) AS Cantidad
    FROM FACTURAS f
    WHERE f.Monto != fn_calcular_total_factura(f.FacturaID);
END//

DELIMITER ;
