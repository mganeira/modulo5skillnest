# Sistema de Gestión de Reparaciones - Ejercicio Grupal 2

<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Transactions](https://img.shields.io/badge/Transactions-ACID-FF6B6B?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-28a745?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

</div>

---

## Descripción General

Este proyecto implementa un **sistema completo de gestión de reparaciones** con enfoque en **transacciones SQL avanzadas**. El sistema incluye gestión de clientes, artículos en reparación, citas y pagos, con especial énfasis en la integridad de datos mediante transacciones ACID.

## Características Principales

- **Transacciones SQL Completas**
- **Control de Integridad Referencial**
- **Gestión de Estados de Reparación**
- **Sistema de Rollback Automático**
- **Inserción de Datos Relacionados**

---

## Estructura de la Base de Datos

<div align="center">

| Entidad | Descripción | Función Principal |
|---------|-------------|------------------|
| **Clientes** | Datos personales y contacto | Gestión de propietarios |
| **Artículos** | Equipos en reparación | Control de inventario |
| **Citas** | Programación de servicios | Agenda de trabajo |
| **Pagos** | Transacciones financieras | Control de ingresos |

</div>

---

## Scripts SQL Incluidos

### 1. **Inserción de Datos Iniciales**

**Archivo:** `Insertar datos.sql`

```sql
-- Clientes base del sistema
INSERT INTO clientes (nombre, telefono, direccion) VALUES
('María González', 987654321, 'Av. Libertador 1234, Santiago'),
('Juan Pérez', 956789123, 'Calle Principal 567, Valparaíso'),
('Ana Rodríguez', 945123789, 'Pasaje Los Robles 89, Concepción'),
('Carlos Martínez', 932456789, 'Av. O\'Higgins 2345, La Serena'),
('Sofía López', 921789456, 'Calle Arturo Prat 678, Temuco'),
('Diego Hernández', 914567832, 'Av. Brasil 1567, Iquique'),
('Camila Torres', 908765432, 'Calle Baquedano 234, Antofagasta');
```

```sql
-- Artículos con diferentes estados de reparación
INSERT INTO articulos (tipo_articulo, estado, clientes_id_cliente) VALUES
('Televisor LED 32"', 'En reparación', 1),
('Microondas', 'Terminado', 2),
('Refrigerador', 'En proceso', 3),
('Lavadora', 'Pendiente', 1),
('Computadora Desktop', 'En reparación', 4),
('Tablet', 'Terminado', 5),
('Licuadora', 'En proceso', 3);
```

> **Propósito:** Poblar la base de datos con información inicial para pruebas y desarrollo

### 2. **Transacción con Rollback**

**Archivo:** `Rollback.sql`

```sql
START TRANSACTION;

INSERT INTO clientes (nombre, telefono, direccion) 
VALUES ('Ana Silva', 956111222, 'Av. Nueva 456');

-- Esta inserción fallará por FK inexistente
INSERT INTO articulos (tipo_articulo, estado, clientes_id_cliente) 
VALUES ('Televisor', 'Pendiente', 999);

-- Revierte todos los cambios
ROLLBACK;
```

> **Propósito:** Demuestra el manejo de errores y reversión automática de transacciones

### 3. **Transacción con ID Manual**

**Archivo:** `Transaccion id manual.sql`

```sql
START TRANSACTION;

-- Insertar cliente con ID específico
INSERT INTO clientes (id_cliente, nombre, telefono, direccion) 
VALUES (10, 'Luis Torres', 945888999, 'Pasaje Los Alamos 789');

-- Insertar artículo relacionado
INSERT INTO articulos (tipo_articulo, estado, clientes_id_cliente) 
VALUES ('Microondas', 'Pendiente', 10);

COMMIT;
```

> **Propósito:** Control manual de IDs para casos específicos de migración o sincronización

### 4. **Transacción con LAST_INSERT_ID**

**Archivo:** `Transaccion lastinsertid.sql`

```sql
START TRANSACTION;

-- Insertar cliente nuevo
INSERT INTO clientes (nombre, telefono, direccion) 
VALUES ('Pedro Sánchez', 912345678, 'Calle Nueva 123');

-- Capturar ID automático
SET @cliente_id = LAST_INSERT_ID();

-- Usar ID en inserción relacionada
INSERT INTO articulos (clientes_id_cliente, tipo_articulo, estado)
VALUES (@cliente_id, 'Microondas', 'Pendiente');

-- Operación adicional de limpieza
DELETE FROM articulos WHERE estado = 'Terminado' LIMIT 1;

COMMIT;
```

> **Propósito:** Automatización de relaciones entre tablas usando IDs generados dinámicamente

---

## Estados de Artículos

<div align="center">

| Estado | Descripción | Flujo de Trabajo |
|--------|-------------|------------------|
| **Pendiente** | Recién ingresado, sin revisar | Estado inicial |
| **En proceso** | Diagnóstico completado | En reparación |
| **En reparación** | Reparación activa | Trabajo técnico |
| **Terminado** | Listo para entrega | Estado final |

</div>

---

## Consultas de Verificación

### **Resumen por Cliente**
```sql
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
```

> **Utilidad:** Verificación de integridad de datos y resumen ejecutivo por cliente

---

## Conceptos de Transacciones Implementados

### **ACID Compliance**

<div align="center">

| Propiedad | Implementación | Beneficio |
|-----------|----------------|-----------|
| **Atomicidad** | START TRANSACTION / COMMIT / ROLLBACK | Todo o nada |
| **Consistencia** | Validación de FK | Integridad referencial |
| **Aislamiento** | Transacciones independientes | Concurrencia segura |
| **Durabilidad** | COMMIT persistente | Datos seguros |

</div>

### **Patrones de Transacción**

1. **Transacción Simple**
   - Una operación atómica
   - Rollback automático en error

2. **Transacción Compuesta**
   - Múltiples operaciones relacionadas
   - Control manual de flujo

3. **Transacción con Variables**
   - Uso de LAST_INSERT_ID()
   - Datos dinámicos entre operaciones

---

## Casos de Uso Empresariales

### **Escenarios de Aplicación**

- **Ingreso de Nuevos Clientes:** Registro completo con primer artículo
- **Gestión de Reparaciones:** Control de estados y flujos de trabajo
- **Facturación Integrada:** Pagos vinculados a servicios completados
- **Agenda de Servicios:** Programación de citas y seguimiento

### **Ventajas del Sistema Transaccional**

- **Integridad Garantizada:** No hay datos huérfanos
- **Rollback Automático:** Recuperación de errores transparente  
- **Trazabilidad Completa:** Historial de todas las operaciones
- **Escalabilidad:** Soporte para operaciones concurrentes

---

## Requisitos Técnicos

<div align="center">

| Componente | Versión Mínima | Recomendado |
|------------|----------------|-------------|
| **MySQL** | 5.7+ | 8.0+ |
| **MariaDB** | 10.2+ | 10.6+ |
| **InnoDB Engine** | Obligatorio | Para transacciones |

</div>

### **Configuración Recomendada**

```sql
-- Configuración de transacciones
SET autocommit = 0;
SET innodb_lock_wait_timeout = 50;
SET transaction_isolation = 'READ-COMMITTED';
```

---

## Instrucciones de Ejecución

### **1. Preparación del Entorno**
```bash
# Conectar a MySQL
mysql -u usuario -p nombre_base_datos
```

### **2. Ejecutar Scripts en Orden**
```sql
-- 1. Datos iniciales
SOURCE Insertar\ datos.sql;

-- 2. Probar rollback
SOURCE Rollback.sql;

-- 3. Transacción con ID manual
SOURCE Transaccion\ id\ manual.sql;

-- 4. Transacción con LAST_INSERT_ID
SOURCE Transaccion\ lastinsertid.sql;
```

### **3. Verificación de Resultados**
- Comprobar integridad de datos
- Validar estados de artículos
- Confirmar relaciones FK

---

## Manejo de Errores

### **Errores Comunes y Soluciones**

<div align="center">

| Error | Causa | Solución |
|-------|-------|----------|
| **FK Constraint** | ID inexistente | Validar clientes antes de insertar |
| **Duplicate Entry** | ID duplicado | Usar AUTO_INCREMENT |
| **Lock Wait Timeout** | Transacción larga | Optimizar consultas |

</div>


**Sistema transaccional robusto para gestión de reparaciones**

</div>
