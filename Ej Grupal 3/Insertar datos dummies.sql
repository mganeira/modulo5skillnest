INSERT INTO `libreria_db`.`Clientes` (`nombre_cliente`, `correo_cliente`, `telefono_cliente`, `direccion_cliente`) VALUES
('María González', 'maria@email.com', 912345678, 'Av. Providencia 1234, Santiago'),
('Juan Pérez', 'juan@email.com', 987654321, 'Calle Las Condes 567, Santiago'),
('Ana López', 'ana@email.com', 956781234, 'Paseo Ahumada 890, Centro'),
('Carlos Rojas', 'carlos@email.com', 934567890, 'Av. Apoquindo 2345, Las Condes'),
('Sofía Mart', 'sofia@email.com', 923456789, 'Calle Huérfanos 456, Santiago');

-- Insertar Libros
INSERT INTO `libreria_db`.`Libros` (`titulo_libro`, `autor_libro`, `precio_libro`, `cantidad_disponible`, `categoria_libro`) VALUES
('Cien años de soledad', 'Gabriel García Márquez', 25999, 15, 'Ficción'),
('Fundación', 'Isaac Asimov', 22500, 12, 'Ciencia Ficción'),
('Asesinato en el Orient Express', 'Agatha Christie', 18750, 20, 'Misterio'),
('Orgullo y prejuicio', 'Jane Austen', 16990, 18, 'Romance'),
('Sapiens', 'Yuval Noah Harari', 28990, 10, 'Historia'),
('Harry Potter y la piedra filosofal', 'J.K. Rowling', 19990, 25, 'Infantil'),
('El Alquimista', 'Paulo Coelho', 17500, 22, 'Ficción'),
('1984', 'George Orwell', 20990, 14, 'Ficción');

-- Insertar Pedidos
INSERT INTO `libreria_db`.`Pedidos` (`fecha_pedido`, `total_pedido`, `estado_pedido`, `Clientes_id_cliente`) VALUES
('2024-09-01', 44480, 'Completado', 1),
('2024-09-02', 22500, 'Completado', 2),
('2024-09-03', 35000, 'Completado', 3),
('2024-09-04', 65970, 'Completado', 4),
('2024-09-05', 19990, 'Pendiente', 5),
('2024-09-06', 41490, 'Completado', 1),
('2024-09-07', 28990, 'Completado', 2);

-- Insertar Detalles_Pedido
INSERT INTO `libreria_db`.`Detalles_Pedido` (`fecha_pago`, `monto_pago`, `metodo_pago`, `cantidad_libro`, `precio_libro`, `Pedidos_id_pedido`, `Libros_id_libro`) VALUES
-- Pedido 1: María González
('2024-09-01', 25999, 'Tarjeta Crédito', 1, 25999, 1, 1),
('2024-09-01', 18481, 'Tarjeta Crédito', 1, 17500, 1, 7),
-- Pedido 2: Juan Pérez
('2024-09-02', 22500, 'Efectivo', 1, 22500, 2, 2),
-- Pedido 3: Ana López
('2024-09-03', 35000, 'Transferencia', 2, 17500, 3, 7),
-- Pedido 4: Carlos Rojas
('2024-09-04', 28990, 'Tarjeta Débito', 1, 28990, 4, 5),
('2024-09-04', 16990, 'Tarjeta Débito', 1, 16990, 4, 4),
('2024-09-04', 19990, 'Tarjeta Débito', 1, 19990, 4, 6),
-- Pedido 5: Sofía Mart
('2024-09-05', 19990, 'Efectivo', 1, 19990, 5, 6),
-- Pedido 6: María González (segunda compra)
('2024-09-06', 18750, 'Tarjeta Crédito', 1, 18750, 6, 3),
('2024-09-06', 22740, 'Tarjeta Crédito', 1, 22500, 6, 2),
-- Pedido 7: Juan Pérez (segunda compra)
('2024-09-07', 28990, 'Transferencia', 1, 28990, 7, 5);

-- Insertar Pagos 
INSERT INTO `libreria_db`.`Pagos` (`fecha_pago`, `monto_pago`, `metodo_pago`, `Pedidos_id_pedido`) VALUES
('2024-09-01', 44480, 'Tarjeta Crédito', 1),
('2024-09-02', 22500, 'Efectivo', 2),
('2024-09-03', 35000, 'Transferencia', 3),
('2024-09-04', 65970, 'Tarjeta Débito', 4),
('2024-09-06', 41490, 'Tarjeta Crédito', 6),
('2024-09-07', 28990, 'Transferencia', 7);