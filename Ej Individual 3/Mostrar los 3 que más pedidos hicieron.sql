SELECT clientes.id, clientes.nombre, COUNT(pedidos.id) AS cantidad_pedidos
FROM clientes 
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id, clientes.nombre
ORDER BY cantidad_pedidos DESC
LIMIT 3;