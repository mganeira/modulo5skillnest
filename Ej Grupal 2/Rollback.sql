START TRANSACTION;

INSERT INTO clientes (nombre, telefono, direccion) 
VALUES ('Ana Silva', 956111222, 'Av. Nueva 456');

INSERT INTO articulos (tipo_articulo, estado, clientes_id_cliente) 
VALUES ('Televisor', 'Pendiente', 999);

ROLLBACK;
