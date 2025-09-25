# Sistema de Alquiler de Vehículos - Ejercicio Grupal 1

<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-28a745?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/Version-1.0.0-orange?style=for-the-badge)

</div>

---

## Descripción General

Este repositorio contiene una **colección completa de consultas SQL avanzadas** para un sistema de gestión de alquiler de vehículos. Las consultas están diseñadas para extraer información analítica y generar reportes detallados sobre clientes, vehículos, alquileres y pagos.

## Características Principales

- **10 Consultas SQL Optimizadas**
- **Análisis de Datos Completo**
- **Reportes Financieros**
- **Gestión de Flota Inteligente**
- **Segmentación de Clientes**

---

## Estructura de la Base de Datos

<table align="center">
<tr>
<th>Entidad</th>
<th>Descripción</th>
<th>Función</th>
</tr>
<tr>
<td><strong>Clientes</strong></td>
<td>Información personal y de contacto</td>
<td>Gestión de usuarios</td>
</tr>
<tr>
<td><strong>Vehículos</strong></td>
<td>Detalles de la flota disponible</td>
<td>Inventario y precios</td>
</tr>
<tr>
<td><strong>Alquileres</strong></td>
<td>Registros de transacciones</td>
<td>Control de operaciones</td>
</tr>
<tr>
<td><strong>Pagos</strong></td>
<td>Información financiera</td>
<td>Análisis económico</td>
</tr>
</table>

---

## Consultas Incluidas

### 1. **Clientes con Alquileres Activos**
```sql
SELECT clientes.nombre, clientes.email, clientes.telefono
FROM clientes JOIN Alquileres ON clientes.id_cliente = alquileres.id_cliente
WHERE '2025-03-15' BETWEEN fecha_inicio AND fecha_fin;
```
> **Propósito:** Identifica qué clientes tienen vehículos alquilados en una fecha determinada

### 2. **Vehículos Alquilados por Mes**
```sql
SELECT vehiculos.modelo, vehiculos.marcar, vehiculos.precio_dia
FROM Vehiculos JOIN Alquileres ON vehiculos.id_vehiculo = alquileres.id_vehiculo
WHERE (MONTH(alquileres.fecha_inicio) = 3 AND YEAR(alquileres.fecha_inicio) = 2025);
```
> **Propósito:** Obtiene información de vehículos alquilados en un mes específico

### 3. **Cálculo de Pagos Totales**
```sql
SELECT c.nombre, a.fecha_inicio, a.fecha_fin, v.precio_dia,
DATEDIFF(a.fecha_fin,a.fecha_inicio) as dias,
DATEDIFF(a.fecha_fin,a.fecha_inicio) * v.precio_dia AS total_pagar
FROM clientes c
JOIN alquileres a ON c.id_cliente = a.id_cliente
JOIN vehiculos v ON a.id_vehiculo = v.id_vehiculo;
```
> **Propósito:** Calcula automáticamente el monto total basado en días y precio diario

### 4. **Clientes Sin Pagos Registrados**
```sql
SELECT clientes.nombre, clientes.email
FROM Clientes
LEFT JOIN Alquileres ON clientes.id_cliente = alquileres.id_cliente
LEFT JOIN Pagos ON alquileres.id_alquiler = pagos.id_alquiler
WHERE pagos.id_pago IS NULL;
```
> **Propósito:** Identifica clientes pendientes de pago para seguimiento de cobranzas

### 5. **Promedio de Pagos por Cliente**
```sql
SELECT clientes.id_cliente, clientes.nombre, AVG(pagos.monto) AS Promedio_pago
FROM Clientes
LEFT JOIN Alquileres ON alquileres.id_cliente = clientes.id_cliente
LEFT JOIN Pagos ON alquileres.id_alquiler = pagos.id_alquiler
GROUP BY clientes.id_cliente, clientes.nombre;
```
> **Propósito:** Calcula el promedio de pagos realizados por cada cliente

### 6. **Vehículos Disponibles**
```sql
SELECT vehiculos.modelo, vehiculos.marcar, vehiculos.precio_dia, 
alquileres.fecha_inicio, alquileres.fecha_fin
FROM Vehiculos
LEFT JOIN Alquileres on vehiculos.id_vehiculo = alquileres.id_vehiculo
WHERE (alquileres.fecha_inicio <= '2025-03-18' AND alquileres.fecha_fin <= '2025-03-18');
```
> **Propósito:** Muestra disponibilidad de vehículos para fechas específicas

### 7. **Vehículos Más Populares**
```sql
SELECT vehiculos.marcar, vehiculos.modelo
FROM Vehiculos
INNER JOIN Alquileres ON alquileres.id_vehiculo = vehiculos.id_vehiculo
WHERE MONTH(alquileres.fecha_inicio) = 3 AND YEAR(alquileres.fecha_inicio) = 2025
GROUP BY vehiculos.id_vehiculo, vehiculos.marcar, vehiculos.modelo
HAVING COUNT(alquileres.id_alquiler) > 1;
```
> **Propósito:** Identifica los vehículos con mayor demanda

### 8. **Total de Ingresos por Cliente**
```sql
SELECT clientes.nombre AS Nombre_Cliente, SUM(pagos.monto) AS Total_Pago
FROM Clientes
INNER JOIN Alquileres ON alquileres.id_cliente = clientes.id_cliente
INNER JOIN Pagos ON alquileres.id_alquiler = pagos.id_alquiler
WHERE pagos.monto IS NOT NULL
GROUP BY clientes.id_cliente, clientes.nombre;
```
> **Propósito:** Calcula los ingresos totales generados por cada cliente

### 9. **Historial de Alquileres por Vehículo**
```sql
SELECT clientes.nombre, alquileres.fecha_inicio, alquileres.fecha_fin, 
vehiculos.modelo, vehiculos.marcar
FROM Clientes
JOIN alquileres ON alquileres.id_cliente = clientes.id_cliente
JOIN vehiculos ON vehiculos.id_vehiculo = alquileres.id_vehiculo
WHERE vehiculos.id_vehiculo = 3;
```
> **Propósito:** Muestra el historial completo de un vehículo específico

### 10. **Ranking de Clientes VIP**
```sql
SELECT clientes.nombre AS Nombre_Cliente,
SUM(DATEDIFF(alquileres.fecha_fin,alquileres.fecha_inicio)) AS Total_Dias_Alquilados
FROM Clientes
JOIN Alquileres ON clientes.id_cliente = alquileres.id_cliente
GROUP BY clientes.id_cliente, clientes.nombre
ORDER BY Total_Dias_Alquilados DESC;
```
> **Propósito:** Clasifica clientes por días totales de alquiler

---

## Requisitos Técnicos

<div align="center">

| Componente | Versión Mínima | Recomendado |
|---|---|---|
| **MySQL** | 5.7+ | 8.0+ |
| **MariaDB** | 10.2+ | 10.6+ |
| **PHP** | 7.4+ | 8.1+ |

</div>

### Funciones SQL Utilizadas

- `DATEDIFF()` - Cálculo de días
- `MONTH()` y `YEAR()` - Filtrado temporal  
- `COUNT()`, `SUM()`, `AVG()` - Agregaciones
- `INNER JOIN`, `LEFT JOIN` - Relaciones entre tablas

---

## Casos de Uso Empresariales

<div align="center">

| Categoría | Consultas | Aplicación |
|---|---|---|
| **Reportes Financieros** | 3, 5, 8 | Análisis de ingresos y rentabilidad |
| **Gestión de Flota** | 2, 6, 7, 9 | Optimización y mantenimiento |
| **Análisis de Clientes** | 1, 4, 10 | Segmentación y fidelización |
| **Operaciones Diarias** | 1, 6 | Disponibilidad en tiempo real |

</div>

---

## Optimización y Rendimiento

### **Recomendaciones de Performance**

- **Índices en campos de fecha** para consultas temporales
- **Índices compuestos** en `(fecha_inicio, fecha_fin)`
- **Particionamiento por fecha** para grandes volúmenes
- **Análisis de planes de ejecución** para JOINs complejos
