-- =========================================================
-- PUNTO 10
-- Generación de registros aleatorios en la tabla tamanio
-- Medición de tiempo de procesamiento y tamaño de almacenamiento
-- Cantidad: 1.000.000 registros
-- =========================================================

TRUNCATE TABLE tamanio;

INSERT INTO tamanio (
    id_registro,
    id_departamento,
    id_municipio,
    id_producto,
    fecha,
    cantidad,
    estado
)
SELECT
    gs AS id_registro,
    m.id_departamento,
    m.id_municipio,
    FLOOR(RANDOM() * 4 + 1)::BIGINT AS id_producto,
    CURRENT_DATE - FLOOR(RANDOM() * 365)::INT AS fecha,
    FLOOR(RANDOM() * 500 + 1)::BIGINT AS cantidad,
    CASE 
        WHEN RANDOM() < 0.5 THEN 'A'
        ELSE 'I'
    END AS estado
FROM generate_series(1, 1000000) AS gs
JOIN LATERAL (
    SELECT id_municipio, id_departamento
    FROM municipios
    ORDER BY RANDOM()
    LIMIT 1
) AS m ON true;

SELECT COUNT(*) AS total_registros_tamanio
FROM tamanio;

SELECT 
    pg_total_relation_size('tamanio') / 1024 AS tamanio_tabla_kb;

SELECT 
    pg_database_size('bigdata') / 1024 AS tamanio_bd_kb;

SELECT 
    ROUND(
        (pg_total_relation_size('tamanio') * 100.0 / pg_database_size('bigdata'))::numeric,
        2
    ) AS porcentaje_almacenamiento;