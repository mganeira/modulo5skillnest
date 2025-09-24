
-- TRANSACCIÓN MANUAL INGRESANDO ID

START TRANSACTION;

INSERT INTO clientes (id_cliente, nombre, telefono, direccion) 
VALUES (10, 'Luis Torres', 945888999, 'Pasaje Los Alamos 789');

INSERT INTO articulos (tipo_articulo, estado, clientes_id_cliente) 
VALUES ('Microondas', 'Pendiente', 10);

COMMIT;