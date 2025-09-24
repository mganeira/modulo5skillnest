START TRANSACTION;
    
    DELETE FROM productos WHERE id = 224;  -- Eliminar el clip
    INSERT INTO productos (id, nombre, descripcion) 
    VALUES (230, 'calculadora', 'para cálculos');
    
-- Decidimos que NO queremos estos cambios
ROLLBACK;

-- El clip sigue ahí, la calculadora no se creó
SELECT * FROM productos WHERE id IN (224, 230);