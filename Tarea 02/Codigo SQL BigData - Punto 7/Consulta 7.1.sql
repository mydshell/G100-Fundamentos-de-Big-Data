-- =========================================================
-- Consulta 7.1
-- Seleccionar los 8 departamentos con mayor volumen de ventas
-- de productos ordenados de mayor a menor según el monto total.
-- Datos solicitados: nombre del departamento y monto total
-- por departamento de todos los productos vendidos.
-- =========================================================

SELECT departamento, SUM(monto) AS monto_total
FROM vista_operaciones
GROUP BY departamento
ORDER BY monto_total DESC
LIMIT 8;