-- Script para insertar datos de ejemplo en las bases de datos

-- Usar base de datos BONUS_TRACK
USE BONUS_TRACK;

-- Insertar datos en tabla AUTORES
INSERT INTO AUTORES (NOMBRE, APELLIDO, NACIONALIDAD, FECHA_NACIMIENTO) VALUES
('José', 'ECHEVERRÍA', 'Argentina', '1980-05-15'),
('María', 'González', 'España', '1975-03-22'),
('Carlos', 'López', 'México', '1985-08-10'),
('Ana', 'Martínez', 'Colombia', '1990-12-05');

-- Insertar datos en tabla EMPLEADOS
INSERT INTO EMPLEADOS (NOMBRE, APELLIDO, PUESTO, FECHA_INGRESO, SALARIO) VALUES
('Juan', 'Pérez', 'Gerente', '2020-01-15', 50000.00),
('Laura', 'Rodríguez', 'Vendedor', '2021-03-20', 35000.00),
('Pedro', 'Sánchez', 'Administrativo', '2019-06-10', 40000.00),
('Carmen', 'Torres', 'Vendedor', '2022-02-14', 32000.00),
('Roberto', 'THOMAS', 'Supervisor', '2018-04-12', 45000.00),
('María', 'PEREIRA', 'Contadora', '2017-09-08', 42000.00),
('Carlos', 'DEVO', 'Técnico', '2019-11-25', 38000.00),
('Ana', 'CRUZ', 'Asistente', '2020-07-30', 30000.00);

-- Usar base de datos LIBRERÍA
USE LIBRERIA;

-- Insertar datos en tabla LIBROS
INSERT INTO LIBROS (TITULO, AUTOR, EDITORIAL, PRECIO, STOCK, FECHA_PUBLICACION) VALUES
('El Quijote', 'Miguel de Cervantes', 'Editorial Planeta', 25.50, 15, '1605-01-01'),
('Cien años de soledad', 'Gabriel García Márquez', 'Editorial Sudamericana', 30.00, 8, '1967-06-05'),
('Don Juan Tenorio', 'José Zorrilla', 'Editorial Espasa', 18.75, 12, '1844-03-28'),
('La casa de los espíritus', 'Isabel Allende', 'Editorial Plaza & Janés', 28.90, 6, '1982-01-01');
