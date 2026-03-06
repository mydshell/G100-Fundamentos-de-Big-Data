-- =========================================================
-- Consulta 7.3
-- Seleccionar los 5 departamentos con mayor cantidad de
-- gaseosas vendidas del producto "MANZALOCA", ordenados
-- de mayor a menor.
-- Datos solicitados: nombre del departamento y cantidad
-- total vendida del producto.
-- =========================================================

SELECT departamento, SUM(cantidad) AS cantidad_total
FROM vista_operaciones
WHERE producto = 'MANZALOCA'
GROUP BY departamento
ORDER BY cantidad_total DESC
LIMIT 5;
