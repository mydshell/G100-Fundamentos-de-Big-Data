-- =========================================================
-- Consulta 7.5
-- Consultar la cantidad de gaseosas vendidas de cada
-- producto por cada región, ordenadas de mayor a menor.
-- Datos solicitados: id de región, nombre de la región,
-- nombre del producto y cantidad total vendida.
-- =========================================================

SELECT id_region, region, producto, SUM(cantidad) AS cantidad_total
FROM vista_operaciones
GROUP BY id_region, region, producto
ORDER BY cantidad_total DESC;
