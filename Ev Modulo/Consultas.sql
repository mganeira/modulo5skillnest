
-- Consultas Básicas Realiza consultas básicas utilizando el lenguaje SQL:Recupera todos los productos disponibles en el inventario.
SELECT * FROM productos;
-- Recupera todos los proveedores que suministran productos específicos.

SELECT DISTINCT p.id_proveedor, p.tipo, p.fecha, p.cantidad from proveedores p
join productos pr on p.id_proveedor = pr.proveedores_id_proveedor;

-- Consulta las transacciones realizadas en una fecha específica.
SELECT * FROM transacciones 
WHERE fecha = '2025-11-09';

-- Realiza consultas de selección con funciones de agrupación, como COUNT() y SUM(), para calcular el número total de productos vendidos o el valor total de las compras.
SELECT COUNT(*) as total_productos_vendidos
FROM transacciones 
WHERE tipo = 'VENTA';
 --
 SELECT p.id_producto, 
p.nombre AS nombre_producto,
SUM(cantidad) AS total_vendido,
COUNT(*) AS numero_transacciones
FROM productos p
JOIN transacciones t on p.id_producto = t.productos_id_producto 
WHERE tipo = 'VENTA'
GROUP BY id_producto
ORDER BY total_vendido DESC;
