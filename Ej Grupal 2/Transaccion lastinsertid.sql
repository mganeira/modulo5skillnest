-- Transaccion con last_insert_id 

START TRANSACTION;

-- Paso 1: insertar cliente
INSERT INTO clientes (nombre, telefono, direccion) 
VALUES ('Pedro Sánchez', 912345678, 'Calle Nueva 123');

-- Paso 2: insertar artículo solo si el paso anterior fue exitoso
-- Usamos el ID del cliente insertado
SET @cliente_id = LAST_INSERT_ID();

INSERT INTO articulos (clientes_id_cliente, tipo_articulo, estado)
VALUES (@cliente_id, 'Microondas', 'Pendiente');

-- Paso 3: borrar un artículo terminado 
DELETE FROM articulos WHERE estado = 'Terminado' LIMIT 1;

-- Si todas las sentencias fueron exitosas:
COMMIT;


