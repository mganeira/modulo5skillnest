-- Ver datos iniciales
SELECT * FROM usuarios;

-- Iniciar transacción
START TRANSACTION;

    -- Agregar un nuevo usuario
    INSERT INTO usuarios (id, nombre, apellido, direccion_id) 
    VALUES (5, 'Carlos', 'López', 8);
    
    -- Actualizar un usuario existente
    UPDATE usuarios SET nombre = 'Valeria Actualizada' WHERE id = 1;
    
    -- Ver los cambios (solo visibles en esta sesión)
    SELECT * FROM usuarios;

-- Confirmar todos los cambios
COMMIT;

-- Ahora los cambios son permanentes y visibles para todos
SELECT * FROM usuarios;