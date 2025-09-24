SELECT clientes.nombre AS Nombre_Cliente, 
SUM(DATEDIFF(alquileres.fecha_fin,alquileres.fecha_inicio +1) AS Total_Dias_Alquilados
FROM Clientes
JOIN Alquileres ON clientes.id_cliente = alquileres.id_cliente
GROUP BY clientes.id_cliente, clientes.nombre
ORDER BY Total_Dias_Alquilados DESC;
