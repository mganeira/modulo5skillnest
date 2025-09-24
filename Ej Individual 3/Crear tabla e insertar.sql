create table clientes (id INT PRIMARY KEY auto_increment, nombre VARCHAR(25), direccion VARCHAR(50), telefono VARCHAR(20));

create table pedidos (id INT PRIMARY KEY auto_increment, cliente_id INT, fecha DATE, total INT, FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO `pedidos_ahora`.`clientes` (`nombre`, `direccion`, `telefono`) VALUES ('Felipe', 'Av Felipe', '987652322');
INSERT INTO `pedidos_ahora`.`clientes` (`nombre`, `direccion`, `telefono`) VALUES ('Marcela', 'Av Marcela', '987561231');
INSERT INTO `pedidos_ahora`.`clientes` (`nombre`, `direccion`, `telefono`) VALUES ('Evelin', 'Av Evelin', '976767623');
INSERT INTO `pedidos_ahora`.`clientes` (`nombre`, `direccion`, `telefono`) VALUES ('Piero', 'Av Piero', '954545453');
INSERT INTO `pedidos_ahora`.`clientes` (`nombre`, `direccion`, `telefono`) VALUES ('Omar', 'Av Omar', '987654645');

INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('10000', '1');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('20000', '2');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('3000', '3');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('4500', '4');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('5500', '5');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('1099', '4');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('54565', '1');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('12770', '2');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('998', '2');
INSERT INTO `pedidos_ahora`.`pedidos` (`total`, `cliente_id`) VALUES ('4320', '1');