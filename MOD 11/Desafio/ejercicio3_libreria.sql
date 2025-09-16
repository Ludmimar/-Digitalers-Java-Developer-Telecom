-- =====================================================
-- EJERCICIO 3 - LIBRERÍA DATABASE - PRIMARY KEYS Y DATOS ADICIONALES
-- =====================================================

-- Usar la base de datos LIBRERÍA creada en el Ejercicio 2
USE LIBRERÍA;

-- =====================================================
-- 1. VERIFICACIÓN DE CLAVES PRIMARIAS
-- =====================================================

-- Las claves primarias ya están definidas correctamente en el Ejercicio 2:
-- - autores: autor_id VARCHAR(11) PRIMARY KEY
-- - locales: local_id CHAR(4) PRIMARY KEY  
-- - editoriales: editorial_id CHAR(4) PRIMARY KEY
-- - puestos: puesto_id SMALLINT PRIMARY KEY
-- - libros: libro_id VARCHAR(6) PRIMARY KEY
-- - empleados: empleado_id CHAR(9) PRIMARY KEY
-- - libroautor: PRIMARY KEY (autor_id, libro_id) - Clave compuesta
-- - ventas: PRIMARY KEY (local_id, factura_nro) - Clave compuesta

-- Verificar las claves primarias de cada tabla
DESCRIBE autores;
DESCRIBE locales;
DESCRIBE editoriales;
DESCRIBE puestos;
DESCRIBE libros;
DESCRIBE empleados;
DESCRIBE libroautor;
DESCRIBE ventas;

-- =====================================================
-- 2. EXAMINAR LOS DATOS INGRESADOS
-- =====================================================

-- Mostrar datos actuales en cada tabla
SELECT 'DATOS ACTUALES EN AUTORES:' as info;
SELECT * FROM autores;

SELECT 'DATOS ACTUALES EN LOCALES:' as info;
SELECT * FROM locales;

SELECT 'DATOS ACTUALES EN EDITORIALES:' as info;
SELECT * FROM editoriales;

SELECT 'DATOS ACTUALES EN PUESTOS:' as info;
SELECT * FROM puestos;

SELECT 'DATOS ACTUALES EN LIBROS:' as info;
SELECT * FROM libros;

SELECT 'DATOS ACTUALES EN EMPLEADOS:' as info;
SELECT * FROM empleados;

SELECT 'DATOS ACTUALES EN LIBROAUTOR:' as info;
SELECT * FROM libroautor;

SELECT 'DATOS ACTUALES EN VENTAS:' as info;
SELECT * FROM ventas;

-- =====================================================
-- 3. INSERTAR 3 REGISTROS ADICIONALES EN CADA TABLA
-- =====================================================

-- Insertar 3 registros adicionales en la tabla autores
INSERT INTO autores (autor_id, apellido, nombre, telefono, direccion, ciudad, provincia, c_postal, estado) VALUES
('A005', 'Vargas Llosa', 'Mario', '555-0105', 'Calle Las Flores 123', 'Lima', 'LI', '15001', 1),
('A006', 'Allende', 'Isabel', '555-0106', 'Av. Providencia 456', 'Santiago', 'RM', '75000', 1),
('A007', 'Mistral', 'Gabriela', '555-0107', 'Calle Elqui 789', 'Vicuña', 'CO', '17600', 1);

-- Insertar 3 registros adicionales en la tabla locales
INSERT INTO locales (local_id, nombre, direccion, ciudad, provincia, c_postal) VALUES
('L005', 'Librería del Este', 'Av. Córdoba 7890', 'Buenos Aires', 'BA', '1054'),
('L006', 'Librería Universitaria', 'Av. Callao 1234', 'Buenos Aires', 'BA', '1023'),
('L007', 'Librería Cultural', 'Av. Las Heras 5678', 'Buenos Aires', 'BA', '1425');

-- Insertar 3 registros adicionales en la tabla editoriales
INSERT INTO editoriales (editorial_id, nombre, ciudad, provincia, pais) VALUES
('E005', 'Editorial Tusquets', 'Barcelona', 'BC', 'España'),
('E006', 'Editorial Seix Barral', 'Barcelona', 'BC', 'España'),
('E007', 'Editorial Alfaguara', 'Madrid', 'MD', 'España');

-- Insertar 3 registros adicionales en la tabla puestos
INSERT INTO puestos (puesto_id, descripcion) VALUES
(6, 'Corrector'),
(7, 'Traductor'),
(8, 'Diseñador Gráfico');

-- Insertar 3 registros adicionales en la tabla libros
INSERT INTO libros (libro_id, titulo, categoria, editorial_id, precio, comentarios, fecha_publicacion) VALUES
('L00005', 'La ciudad y los perros', 'Ficción', 'E005', 28.50, 'Primera novela de Vargas Llosa', '1963-03-10'),
('L00006', 'La casa de los espíritus', 'Ficción', 'E006', 24.75, 'Novela de realismo mágico', '1982-01-01'),
('L00007', 'Desolación', 'Poesía', 'E007', 19.99, 'Obra poética fundamental', '1922-06-15');

-- Insertar 3 registros adicionales en la tabla empleados
INSERT INTO empleados (empleado_id, nombre, apellido, puesto_id, editorial_id, fecha_ingreso) VALUES
('EMP000005', 'Laura', 'Fernández', 6, 'E005', '2022-05-20'),
('EMP000006', 'Diego', 'Sánchez', 7, 'E006', '2021-09-12'),
('EMP000007', 'Carmen', 'Ruiz', 8, 'E007', '2023-02-28');

-- Insertar 3 registros adicionales en la tabla libroautor
-- Nota: La combinación autor/libro debe ser única según la lógica del negocio
INSERT INTO libroautor (autor_id, libro_id) VALUES
('A005', 'L00005'),
('A006', 'L00006'),
('A007', 'L00007');

-- Insertar 3 registros adicionales en la tabla ventas
-- Nota: Un mismo número de factura se puede repetir en varios locales
-- y en un mismo local con distintos códigos de libros
INSERT INTO ventas (local_id, factura_nro, fecha, cantidad, forma_pago, libro_id) VALUES
('L005', 'F001', '2024-01-18 10:15:00', 1, 'Efectivo', 'L00005'),
('L006', 'F001', '2024-01-18 14:30:00', 2, 'Tarjeta', 'L00006'),
('L007', 'F006', '2024-01-19 09:45:00', 1, 'Transferencia', 'L00007');

-- =====================================================
-- 4. VERIFICACIÓN DE LOS NUEVOS DATOS INSERTADOS
-- =====================================================

-- Mostrar el conteo total de registros en cada tabla
SELECT 'RESUMEN DE REGISTROS DESPUÉS DE EJERCICIO 3:' as info;
SELECT 'AUTORES' as tabla, COUNT(*) as total_registros FROM autores
UNION ALL
SELECT 'LOCALES', COUNT(*) FROM locales
UNION ALL
SELECT 'EDITORIALES', COUNT(*) FROM editoriales
UNION ALL
SELECT 'PUESTOS', COUNT(*) FROM puestos
UNION ALL
SELECT 'LIBROS', COUNT(*) FROM libros
UNION ALL
SELECT 'EMPLEADOS', COUNT(*) FROM empleados
UNION ALL
SELECT 'LIBROAUTOR', COUNT(*) FROM libroautor
UNION ALL
SELECT 'VENTAS', COUNT(*) FROM ventas;

-- Mostrar todos los datos actualizados
SELECT 'DATOS FINALES EN AUTORES:' as info;
SELECT * FROM autores ORDER BY autor_id;

SELECT 'DATOS FINALES EN LOCALES:' as info;
SELECT * FROM locales ORDER BY local_id;

SELECT 'DATOS FINALES EN EDITORIALES:' as info;
SELECT * FROM editoriales ORDER BY editorial_id;

SELECT 'DATOS FINALES EN PUESTOS:' as info;
SELECT * FROM puestos ORDER BY puesto_id;

SELECT 'DATOS FINALES EN LIBROS:' as info;
SELECT * FROM libros ORDER BY libro_id;

SELECT 'DATOS FINALES EN EMPLEADOS:' as info;
SELECT * FROM empleados ORDER BY empleado_id;

SELECT 'DATOS FINALES EN LIBROAUTOR:' as info;
SELECT * FROM libroautor ORDER BY autor_id, libro_id;

SELECT 'DATOS FINALES EN VENTAS:' as info;
SELECT * FROM ventas ORDER BY local_id, factura_nro;

-- =====================================================
-- 5. VERIFICACIÓN DE LA LÓGICA DEL NEGOCIO
-- =====================================================

-- Verificar que la combinación autor/libro es única
SELECT 'VERIFICACIÓN: Combinaciones únicas autor/libro:' as info;
SELECT autor_id, libro_id, COUNT(*) as cantidad
FROM libroautor 
GROUP BY autor_id, libro_id 
HAVING COUNT(*) > 1;

-- Verificar que el mismo número de factura puede repetirse en diferentes locales
SELECT 'VERIFICACIÓN: Facturas repetidas en diferentes locales:' as info;
SELECT factura_nro, COUNT(DISTINCT local_id) as locales_diferentes
FROM ventas 
GROUP BY factura_nro 
HAVING COUNT(DISTINCT local_id) > 1;

-- Verificar que en un mismo local puede haber facturas con diferentes libros
SELECT 'VERIFICACIÓN: Mismo local con diferentes libros:' as info;
SELECT local_id, COUNT(DISTINCT libro_id) as libros_diferentes
FROM ventas 
GROUP BY local_id 
HAVING COUNT(DISTINCT libro_id) > 1;
