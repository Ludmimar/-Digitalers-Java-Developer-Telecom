-- =====================================================
-- EJERCICIO 1 - BASE DE DATOS BONUS_TRACK
-- =====================================================

-- 1. Crear una base de datos con el nombre BONUS_TRACK
CREATE DATABASE BONUS_TRACK;

-- 2. Poner en uso la base de datos generada en el paso anterior
USE BONUS_TRACK;

-- 3. Crear una tabla con el nombre "AGENDA" dentro de la base de datos
-- Estructura de la tabla AGENDA:
-- ID Contacto: integer PK (Primary Key)
-- Nombre: varchar(20) NOT NULL
-- Apellido: varchar(15) NOT NULL  
-- Domicilio: varchar(50)
-- Teléfono: integer NOT NULL
CREATE TABLE AGENDA (
    ID_Contacto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(20) NOT NULL,
    Apellido VARCHAR(15) NOT NULL,
    Domicilio VARCHAR(50),
    Telefono INT NOT NULL
);

-- 4. Comentarios del código SQL generado para la creación de la tabla "AGENDA":
-- - CREATE TABLE: Comando para crear una nueva tabla
-- - AGENDA: Nombre de la tabla a crear
-- - ID_Contacto INT PRIMARY KEY AUTO_INCREMENT: Campo clave primaria que se auto-incrementa
-- - Nombre VARCHAR(20) NOT NULL: Campo para el nombre, máximo 20 caracteres, obligatorio
-- - Apellido VARCHAR(15) NOT NULL: Campo para el apellido, máximo 15 caracteres, obligatorio
-- - Domicilio VARCHAR(50): Campo para la dirección, máximo 50 caracteres, opcional
-- - Telefono INT NOT NULL: Campo para el teléfono, tipo entero, obligatorio

-- 5. Visualizar las tablas existentes en la base de datos para verificar la creación de la tabla "AGENDA"
SHOW TABLES;

-- 6. Visualizar la estructura de la tabla "AGENDA"
DESCRIBE AGENDA;

-- 7. Agregar el campo MAIL a la tabla. Este campo deberá contener como máximo 50 caracteres y su carga es obligatoria
ALTER TABLE AGENDA 
ADD COLUMN MAIL VARCHAR(50) NOT NULL;

-- 8. Insertar 4 registros en la tabla "AGENDA"
INSERT INTO AGENDA (Nombre, Apellido, Domicilio, Telefono, MAIL) VALUES
('Juan', 'Pérez', 'Av. Corrientes 1234', 123456789, 'juan.perez@email.com'),
('María', 'González', 'Calle San Martín 567', 987654321, 'maria.gonzalez@email.com'),
('Carlos', 'López', 'Av. Santa Fe 890', 456789123, 'carlos.lopez@email.com'),
('Ana', 'Martínez', 'Calle Rivadavia 234', 789123456, 'ana.martinez@email.com');

-- Verificar los registros insertados
SELECT * FROM AGENDA;

-- Mostrar la estructura final de la tabla AGENDA
DESCRIBE AGENDA;
