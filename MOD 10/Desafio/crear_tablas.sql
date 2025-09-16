-- Script para crear las cinco tablas del sistema
-- Estructura de base de datos según el esquema proporcionado

-- Tabla Provincia (tabla base sin dependencias)
CREATE TABLE Provincia (
    id INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Pais VARCHAR(100) NOT NULL
);

-- Tabla Localidad (depende de Provincia)
CREATE TABLE Localidad (
    id INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    CP VARCHAR(10) NOT NULL,
    Provincia INTEGER NOT NULL,
    FOREIGN KEY (Provincia) REFERENCES Provincia(id)
);

-- Tabla Cliente (depende de Localidad)
CREATE TABLE Cliente (
    id INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Fecha_nacimiento DATE NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    Localidad INTEGER NOT NULL,
    Telefono VARCHAR(20),
    FOREIGN KEY (Localidad) REFERENCES Localidad(id)
);

-- Tabla Movimiento (depende de Cliente)
CREATE TABLE Movimiento (
    id INTEGER PRIMARY KEY,
    Letra VARCHAR(1) NOT NULL,
    Fecha DATE NOT NULL,
    Cliente INTEGER NOT NULL,
    FOREIGN KEY (Cliente) REFERENCES Cliente(id)
);

-- Tabla Item (depende de Movimiento)
CREATE TABLE Item (
    id INTEGER PRIMARY KEY,
    Detalle VARCHAR(200) NOT NULL,
    Cantidad INTEGER NOT NULL,
    Valor DECIMAL(10,2) NOT NULL,
    Movimiento INTEGER NOT NULL,
    FOREIGN KEY (Movimiento) REFERENCES Movimiento(id)
);

-- Comentarios adicionales sobre la estructura:
-- 1. Provincia es la tabla base sin dependencias
-- 2. Localidad referencia a Provincia
-- 3. Cliente referencia a Localidad
-- 4. Movimiento referencia a Cliente
-- 5. Item referencia a Movimiento
-- 
-- Esta estructura permite mantener la integridad referencial
-- y facilita las consultas relacionadas entre las tablas.

-- Tabla Transportistas (adicional para completar el sistema)
CREATE TABLE Transportistas (
    id INTEGER PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Email VARCHAR(100),
    Direccion VARCHAR(200)
);
