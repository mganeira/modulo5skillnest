START TRANSACTION;
    
    INSERT INTO productos (id, nombre, descripcion) 
    VALUES (229, 'regla', 'para medir');
    
    UPDATE productos SET descripcion = 'descripción actualizada' WHERE id = 223;
    
-- Decidimos que queremos estos cambios
COMMIT;

-- Los cambios están guardados
SELECT * FROM productos WHERE id IN (223, 229);