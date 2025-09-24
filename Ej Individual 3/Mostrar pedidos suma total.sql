SELECT clientes.nombre, SUM(pedidos.total) AS total_pedidos
FROM clientes 
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.nombre 
ORDER BY total_pedidos DESC;