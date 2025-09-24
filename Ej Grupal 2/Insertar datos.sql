
INSERT INTO clientes (nombre, telefono, direccion) VALUES
('María González', 987654321, 'Av. Libertador 1234, Santiago'),
('Juan Pérez', 956789123, 'Calle Principal 567, Valparaíso'),
('Ana Rodríguez', 945123789, 'Pasaje Los Robles 89, Concepción'),
('Carlos Martínez', 932456789, 'Av. O\'Higgins 2345, La Serena'),
('Sofía López', 921789456, 'Calle Arturo Prat 678, Temuco'),
('Diego Hernández', 914567832, 'Av. Brasil 1567, Iquique'),
('Camila Torres', 908765432, 'Calle Baquedano 234, Antofagasta');


INSERT INTO articulos (tipo_articulo, estado, clientes_id_cliente) VALUES
('Televisor LED 32"', 'En reparación', 1),
('Microondas', 'Terminado', 2),
('Refrigerador', 'En proceso', 3),
('Lavadora', 'Pendiente', 1),       
('Computadora Desktop', 'En reparación', 4),
('Tablet', 'Terminado', 5),
('Licuadora', 'En proceso', 3);      

INSERT INTO citas (fecha_hora, clientes_id_cliente) VALUES
('2025-09-05', 1),
('2025-09-05', 2),
('2025-09-06', 3),
('2025-09-06', 4),
('2025-09-07', 5),
('2025-09-08', 6),
('2025-09-08', 7),
('2025-09-09', 1);


INSERT INTO pagos (monto, fecha_pago, clientes_id_cliente) VALUES
('25000.00', '2025-09-04', 1),
('18500.50', '2025-09-03', 2),
('32000.00', '2025-09-02', 3),
('15750.25', '2025-09-01', 4),
('28900.00', '2025-08-31', 5),
('22300.75', '2025-08-30', 6);

-- VERIFICAR
SELECT 
    c.id_cliente,
    c.nombre,
    COUNT(a.id_articulo) as total_articulos,
    COUNT(ci.id_cita) as total_citas,
    COUNT(p.id_pagos) as total_pagos
FROM clientes c
LEFT JOIN articulos a ON c.id_cliente = a.clientes_id_cliente
LEFT JOIN citas ci ON c.id_cliente = ci.clientes_id_cliente  
LEFT JOIN pagos p ON c.id_cliente = p.clientes_id_cliente
GROUP BY c.id_cliente, c.nombre
ORDER BY c.id_cliente;
