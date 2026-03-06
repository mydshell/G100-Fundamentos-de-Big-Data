-- =========================================================
-- Creación de la vista vista_operaciones
-- Esta vista integra la información de las tablas operaciones,
-- municipios, departamentos, productos y región.
-- Además calcula el monto total de venta multiplicando la
-- cantidad de productos vendidos por el precio del producto.
-- =========================================================

DROP VIEW IF EXISTS vista_operaciones;

CREATE VIEW vista_operaciones AS
SELECT
    o.id_registro,
    d.nombre AS departamento,
    m.nombre AS municipio,
    p.nombre AS producto,
    r.nombre_region AS region,
    o.id_region,
    o.fecha,
    o.cantidad,
    p.precio,
    (o.cantidad * p.precio) AS monto
FROM operaciones o
JOIN municipios m
    ON o.id_municipio = m.id_municipio
JOIN departamentos d
    ON m.id_departamento = d.id_departamento
JOIN productos p
    ON o.id_producto = p.id_producto
JOIN region r
    ON o.id_region = r.id_region;

-- =========================================================
-- Verificación del proceso de limpieza de datos
-- Se compara el número total de registros de la tabla
-- operaciones con los registros obtenidos en la vista
-- vista_operaciones.
-- Si ambos valores son iguales, significa que la limpieza
-- de datos fue realizada correctamente.
-- =========================================================

SELECT COUNT(*) AS total_operaciones
FROM operaciones;

SELECT COUNT(*) AS total_vista_operaciones
FROM vista_operaciones;