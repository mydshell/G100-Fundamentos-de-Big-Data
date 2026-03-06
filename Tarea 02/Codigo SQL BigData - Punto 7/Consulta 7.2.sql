
-- =========================================================
-- Consulta 7.2
-- Seleccionar los 15 municipios con mayor cantidad de
-- productos vendidos en el departamento de Antioquia,
-- ordenados de mayor a menor.
-- Datos solicitados: nombre del municipio y cantidad total
-- de productos vendidos.
-- =========================================================

SELECT municipio, SUM(cantidad) AS cantidad_total
FROM vista_operaciones
WHERE departamento = 'ANTIOQUIA'
GROUP BY municipio
ORDER BY cantidad_total DESC
LIMIT 15;
