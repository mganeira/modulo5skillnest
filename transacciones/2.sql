-- Ver datos iniciales
SELECT * FROM usuarios;

-- Iniciar transacción
START TRANSACTION;

    -- Hacer cambios
    DELETE FROM usuarios WHERE id = 2;  -- Eliminar Kevin Duque
    UPDATE usuarios SET apellido = 'Apellido Cambiado' WHERE id = 1;
    
    -- Ver los cambios temporales
    SELECT * FROM usuarios;
    -- Kevin ya no aparece, Valeria tiene apellido cambiado

-- ¡Ups! Nos arrepentimos, cancelamos todo
ROLLBACK;

-- Ver que todo volvió a como estaba antes
SELECT * FROM usuarios;
-- Kevin sigue ahí, Valeria tiene su apellido original