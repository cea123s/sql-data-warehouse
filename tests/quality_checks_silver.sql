/*
================================================================================
Chequeo de Calidad de Datos en el esquema "Silver"
================================================================================
Propósito del Script:
  Este script ejecuta varios chequeos de calidad, consistencia, y estandarización, en todas las tablas del esquema "Silver".
  Incluye los siguientes chequeos:
    -Duplicados o NULLs en claves primarias.
    -Espacios no deseados: aseguramos consistencia y uniformidad, en todos los registros.
    -Estandarización y normalización: mapea valores codificados a descripciones más significativas (Por ej., de 'M' a 'Male').
    -Fechas inválidas: rangos y órdenes incorrectos.
    -Consistencia de Datos: reivsa la consistencia entre campos relacionados.

Notas para el uso:
  -Correr este script luego de cargar datos en el esquema "Silver".
  -Investigar y resolver cualquier inconsistencia encontrada.
================================================================================
*/

-- ====================================================================
-- Revisando 'silver.crm_cust_info'
-- ====================================================================

-- Chequeo de NULLS o duplicados en la Clave Primaria
-- Resultado esperado de la consulta: ningún resultado
SELECT 
    cst_id,
    COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;

-- Chequeo de espacios innecesarios
-- Resultado esperado de la consulta: ningún resultado
SELECT 
    cst_key 
FROM silver.crm_cust_info
WHERE cst_key != TRIM(cst_key);

-- Estandarización y Consistencia de los datos
-- Resultado esperado de la consulta: valores bien definidos sin abreviaturas (Por ej. 'S' -> 'Single')
SELECT DISTINCT 
    cst_marital_status 
FROM silver.crm_cust_info;

-- ====================================================================
-- Revisando 'silver.crm_prd_info'
-- ====================================================================

-- Chequeo de NULLS o duplicados en la Clave Primaria
-- Resultado esperado de la consulta: sin resultado
SELECT 
    prd_id,
    COUNT(*) 
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*) > 1 OR prd_id IS NULL;

-- Chequeo de espacios innecesarios
-- Resultado esperado de la consulta: sin resultado
SELECT 
    prd_nm 
FROM silver.crm_prd_info
WHERE prd_nm != TRIM(prd_nm);

-- Chequeo de NULLs o valores negativos en el campo 'Cost'
-- Resultado esperado de la consulta: sin resultado
SELECT 
    prd_cost 
FROM silver.crm_prd_info
WHERE prd_cost < 0 OR prd_cost IS NULL;

-- Estandarización y Consistencia de los datos
-- Resultado esperado de la consulta: valores bien definidos
SELECT DISTINCT 
    prd_line 
FROM silver.crm_prd_info;

-- Chequeo de inconsistencia en el órden de las fechas (Por ej., Start Date > End Date)
-- Resultado esperado de la consulta: sin resultado
SELECT 
    * 
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt;

-- ====================================================================
-- Revisando 'silver.crm_sales_details'
-- ====================================================================

-- Chequeo de Fechas inválidas
-- Resultado esperado de la consulta: sin fechas inválidas
SELECT 
    sls_due_dt,
    sls_order_dt,
    sls_ship_dt
FROM silver.crm_sales_details
WHERE 
    LEN(sls_due_dt) != 10
    OR sls_due_dt > '2050-01-01'
    OR sls_due_dt < '1900-01-01'
    OR LEN(sls_order_dt) !=10
    OR sls_order_dt > '2050-01-01'
    OR sls_order_dt < '1900-01-01'
    OR LEN(sls_ship_dt) !=10
    OR sls_ship_dt > '2050-01-01'
    OR sls_ship_dt < '1900-01-01';

-- Chequeo de inconsistencia en el órden de las fechas (Por ej., Order Date > Shipping Date)
-- Resultado esperado de la consulta: sin resultado
SELECT 
    * 
FROM silver.crm_sales_details
WHERE sls_order_dt > sls_ship_dt 
   OR sls_order_dt > sls_due_dt;

-- Chequeo de consistencia: Ventas = Cantidad * Precio
-- Resultado esperado de la consulta: sin resultado
SELECT DISTINCT 
    sls_sales,
    sls_quantity,
    sls_price 
FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity * sls_price
   OR sls_sales IS NULL 
   OR sls_quantity IS NULL 
   OR sls_price IS NULL
   OR sls_sales <= 0 
   OR sls_quantity <= 0 
   OR sls_price <= 0
ORDER BY sls_sales, sls_quantity, sls_price;

-- ====================================================================
-- Revisando 'silver.erp_cust_az12'
-- ====================================================================
-- Identificar fechas fuera de rango
-- Resultado esperado de la consulta: sin resultado
SELECT DISTINCT 
    bdate 
FROM silver.erp_cust_az12
WHERE bdate < '1900-01-01' 
   OR bdate > GETDATE();

-- Estandarización y Consistencia de los datos
-- Resultado esperado de la consulta: valores bien definidos sin abreviar (Ej. 'M' -> 'Male')
SELECT DISTINCT 
    gen 
FROM silver.erp_cust_az12;

-- ====================================================================
-- Revisando 'silver.erp_loc_a101'
-- ====================================================================
-- Estandarización y Consistencia de los datos
-- Resultado esperado de la consulta: valores bien definidos sin abreviar (Ej. 'US' -> 'United States')

SELECT DISTINCT 
    cntry 
FROM silver.erp_loc_a101
ORDER BY cntry;

-- ====================================================================
-- Revisando 'silver.erp_px_cat_g1v2'
-- ====================================================================
-- Chequear espacios innecesarios
-- Resultado esperado de la consulta: sin resultado
SELECT 
    * 
FROM silver.erp_px_cat_g1v2
WHERE cat != TRIM(cat) 
   OR subcat != TRIM(subcat) 
   OR maintenance != TRIM(maintenance);

-- Estandarización y Consistencia de los datos
-- Resultado esperado de la consulta: valores bien definidos sin abreviar (Ej. 'Y' -> 'Yes')
SELECT DISTINCT 
    maintenance 
FROM silver.erp_px_cat_g1v2;
