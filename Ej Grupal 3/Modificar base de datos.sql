ALTER TABLE clientes MODIFY telefono_cliente VARCHAR(20);

ALTER TABLE libros MODIFY precio_libro DECIMAL(10,3);

ALTER TABLE pagos ADD COLUMN fecha_confirmacion DATE;

DROP TABLE detalles_pedido;

