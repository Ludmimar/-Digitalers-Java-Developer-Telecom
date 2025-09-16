-- EJERCICIO 2 - LIBRERÍA
-- Solución completa para los dos puntos del ejercicio

USE BONUS_TRACK;

-- 1. Crear tabla EMPLEADOS_ANTERIORES con la misma estructura que EMPLEADOS
-- y mover empleados con apellidos THOMAS, PEREIRA y DEVO

-- Crear la nueva tabla con la misma estructura
CREATE TABLE EMPLEADOS_ANTERIORES (
    ID_EMPLEADO INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(50) NOT NULL,
    PUESTO VARCHAR(50),
    FECHA_INGRESO DATE,
    SALARIO DECIMAL(10,2),
    PERMANENCIA INT
);

-- Copiar empleados con apellidos THOMAS, PEREIRA y DEVO a la nueva tabla
INSERT INTO EMPLEADOS_ANTERIORES (NOMBRE, APELLIDO, PUESTO, FECHA_INGRESO, SALARIO, PERMANENCIA)
SELECT NOMBRE, APELLIDO, PUESTO, FECHA_INGRESO, SALARIO, PERMANENCIA
FROM EMPLEADOS 
WHERE APELLIDO IN ('THOMAS', 'PEREIRA', 'DEVO');

-- Verificar que se copiaron correctamente
SELECT 'Empleados copiados a EMPLEADOS_ANTERIORES:' as Mensaje;
SELECT * FROM EMPLEADOS_ANTERIORES;

-- Eliminar los empleados copiados de la tabla original
DELETE FROM EMPLEADOS 
WHERE APELLIDO IN ('THOMAS', 'PEREIRA', 'DEVO');

-- Verificar que se eliminaron de la tabla original
SELECT 'Empleados restantes en EMPLEADOS:' as Mensaje;
SELECT * FROM EMPLEADOS;

-- 2. Copiar empleado CRUZ a EMPLEADOS_ANTERIORES y eliminarlo de EMPLEADOS

-- Copiar empleado CRUZ a la tabla EMPLEADOS_ANTERIORES
INSERT INTO EMPLEADOS_ANTERIORES (NOMBRE, APELLIDO, PUESTO, FECHA_INGRESO, SALARIO, PERMANENCIA)
SELECT NOMBRE, APELLIDO, PUESTO, FECHA_INGRESO, SALARIO, PERMANENCIA
FROM EMPLEADOS 
WHERE APELLIDO = 'CRUZ';

-- Verificar que se copió CRUZ
SELECT 'Empleado CRUZ copiado a EMPLEADOS_ANTERIORES:' as Mensaje;
SELECT * FROM EMPLEADOS_ANTERIORES WHERE APELLIDO = 'CRUZ';

-- Eliminar empleado CRUZ de la tabla original
DELETE FROM EMPLEADOS 
WHERE APELLIDO = 'CRUZ';

-- Verificación final: mostrar estado de ambas tablas
SELECT 'Estado final de EMPLEADOS:' as Mensaje;
SELECT * FROM EMPLEADOS;

SELECT 'Estado final de EMPLEADOS_ANTERIORES:' as Mensaje;
SELECT * FROM EMPLEADOS_ANTERIORES;
