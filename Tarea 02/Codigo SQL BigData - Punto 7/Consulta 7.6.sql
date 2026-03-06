-- =========================================================
-- Consulta 7.6
-- Consultar el total del monto de ventas de cada producto
-- en el departamento de Antioquia, ordenados de mayor a menor.
-- Datos solicitados: nombre del producto y monto total de ventas.
-- =========================================================

SELECT producto, SUM(monto) AS monto_total
FROM vista_operaciones
WHERE departamento = 'ANTIOQUIA'
GROUP BY producto
ORDER BY monto_total DESC;