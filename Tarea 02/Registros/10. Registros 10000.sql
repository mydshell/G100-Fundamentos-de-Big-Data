-- =========================================================
-- PUNTO 10
-- Generación de registros aleatorios en la tabla tamanio
-- Medición de tiempo de procesamiento y tamaño de almacenamiento
-- Cantidad: 10.000 registros
-- =========================================================

-- Limpiar la tabla antes de la prueba
TRUNCATE TABLE tamanio;

-- Insertar 10.000 registros aleatorios
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
FROM generate_series(1, 10000) AS gs
JOIN LATERAL (
    SELECT id_municipio, id_departamento
    FROM municipios
    ORDER BY RANDOM()
    LIMIT 1
) AS m ON true;

-- Contar registros insertados
SELECT COUNT(*) AS total_registros_tamanio
FROM tamanio;

-- Tamaño de la tabla tamanio en KB
SELECT 
    pg_total_relation_size('tamanio') / 1024 AS tamanio_tabla_kb;

-- Tamaño de la base de datos bigdata en KB
SELECT 
    pg_database_size('bigdata') / 1024 AS tamanio_bd_kb;

-- Porcentaje de almacenamiento de la tabla con respecto a la BD
SELECT 
    ROUND(
        (pg_total_relation_size('tamanio') * 100.0 / pg_database_size('bigdata'))::numeric,
        2
    ) AS porcentaje_almacenamiento;