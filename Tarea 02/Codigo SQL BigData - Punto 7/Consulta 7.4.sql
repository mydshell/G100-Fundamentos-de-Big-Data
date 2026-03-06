-- =========================================================
-- Consulta 7.4
-- Seleccionar los 5 municipios con el menor monto de
-- ventas de gaseosas, ordenados de menor a mayor.
-- Datos solicitados: nombre del departamento, nombre
-- del municipio y monto total de ventas por municipio.
-- =========================================================

SELECT departamento, municipio, SUM(monto) AS monto_total
FROM vista_operaciones
GROUP BY departamento, municipio
ORDER BY monto_total ASC
LIMIT 5;
