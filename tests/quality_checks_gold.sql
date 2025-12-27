/*
===============================================================================
Chequeo de Calidad de Datos en el esquema "Gold"
===============================================================================
Propósito del Script:
    Este script realiza chequeos de calidad para validar la integridad, consistencia
    y precisión de la capa Gold. Estos chequeos aseguran:
    - Que no existan duplicados en las claves sustitutas de las tablas de dimensión.
    - Integridad referencial entre las tablas de hecho y de dimensión.
    - Validación de las relaciones del modelo de datos para fines analíticos.

Notas de uso:
    - Investigar y resolver cualquier discrepancia encontrada.
===============================================================================
*/

-- ====================================================================
-- Chequear 'gold.dim_customers'
-- ====================================================================
-- Verificar que no existan duplicados en "customer_key"
-- Resultado esperado: ningún resultado
SELECT 
    customer_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_customers
GROUP BY customer_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Chequear 'gold.product_key'
-- ====================================================================
-- Verifica que no existan duplicados en "product_key"
-- Resultado esperado: ningún resultado 
SELECT 
    product_key,
    COUNT(*) AS duplicate_count
FROM gold.dim_products
GROUP BY product_key
HAVING COUNT(*) > 1;

-- ====================================================================
-- Chequear 'gold.fact_sales'
-- ====================================================================
-- Verificar las relaciones entre las tablas de dimensión y de hecho
SELECT * 
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON c.customer_key = f.customer_key
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL OR c.customer_key IS NULL  
