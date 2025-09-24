-- Estos cambios se guardan inmediatamente
INSERT INTO productos (id, nombre, descripcion) 
VALUES (228, 'borrador', 'borra tus errores');

UPDATE productos SET nombre = 'lápiz especial' WHERE id = 222;

-- No hay vuelta atrás, los cambios ya están guardados
SELECT * FROM productos WHERE id IN (222, 228);