select clientes.id, clientes.nombre, pedidos.id, pedidos.total
from clientes
LEFT JOIN pedidos ON pedidos.cliente_id = clientes.id ;