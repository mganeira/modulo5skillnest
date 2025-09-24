
CREATE TABLE IF NOT EXISTS `libreria_db`.`Clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre_cliente` VARCHAR(100) NOT NULL,
  `correo_cliente` VARCHAR(100) NOT NULL,
  `telefono_cliente` INT(10) NOT NULL,
  `direccion_cliente` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `libreria_db`.`Libros` (
  `id_libro` INT NOT NULL AUTO_INCREMENT,
  `titulo_libro` VARCHAR(255) NOT NULL,
  `autor_libro` VARCHAR(100) NOT NULL,
  `precio_libro` DECIMAL(10,2) NOT NULL,
  `cantidad_disponible` INT NOT NULL,
    CONSTRAINT chk_valor_positivo CHECK (cantidad_disponible > 0),
  `categoria_libro` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_libro`),
  UNIQUE INDEX `id_libro_UNIQUE` (`id_libro` ASC) VISIBLE)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `libreria_db`.`Pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fecha_pedido` DATE NOT NULL,
  `total_pedido` DECIMAL(10,2) NOT NULL,
  `estado_pedido` VARCHAR(50) NOT NULL,
  `Clientes_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE INDEX `id_pedido_UNIQUE` (`id_pedido` ASC) VISIBLE,
  INDEX `fk_Pedidos_Clientes_idx` (`Clientes_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_Pedidos_Clientes`
    FOREIGN KEY (`Clientes_id_cliente`)
    REFERENCES `libreria_db`.`Clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `libreria_db`.`Detalles_Pedido` (
  `id_detalle` INT NOT NULL AUTO_INCREMENT,
  `fecha_pago` DATE NOT NULL,
  `monto_pago` DECIMAL(10,2) NOT NULL,
  `metodo_pago` VARCHAR(50) NOT NULL,
  `cantidad_libro` INT NOT NULL,
  `precio_libro` DECIMAL(10,2) NOT NULL,
  `Pedidos_id_pedido` INT NOT NULL,
  `Libros_id_libro` INT NOT NULL,
  PRIMARY KEY (`id_detalle`),
  UNIQUE INDEX `id_detalle_UNIQUE` (`id_detalle` ASC) VISIBLE,
  INDEX `fk_Detalles_Pedido_Pedidos1_idx` (`Pedidos_id_pedido` ASC) VISIBLE,
  INDEX `fk_Detalles_Pedido_Libros1_idx` (`Libros_id_libro` ASC) VISIBLE,
  CONSTRAINT `fk_Detalles_Pedido_Pedidos1`
    FOREIGN KEY (`Pedidos_id_pedido`)
    REFERENCES `libreria_db`.`Pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Detalles_Pedido_Libros1`
    FOREIGN KEY (`Libros_id_libro`)
    REFERENCES `libreria_db`.`Libros` (`id_libro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `libreria_db`.`Pagos` (
  `id_pago` INT NOT NULL AUTO_INCREMENT,
  `fecha_pago` DATE NOT NULL,
  `monto_pago` DECIMAL(10,2) NOT NULL,
  `metodo_pago` VARCHAR(50) NOT NULL,
  `Pedidos_id_pedido` INT NOT NULL,
  UNIQUE INDEX `idPagos_UNIQUE` (`id_pago` ASC) VISIBLE,
  PRIMARY KEY (`id_pago`),
  INDEX `fk_Pagos_Pedidos1_idx` (`Pedidos_id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_Pagos_Pedidos1`
    FOREIGN KEY (`Pedidos_id_pedido`)
    REFERENCES `libreria_db`.`Pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
