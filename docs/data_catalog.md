# Catálogo de Datos para la Capa "Gold"

## Descripción General
La **Capa Gold** es la representación de datos a nivel de negocio, estructurada para soportar casos de uso analíticos y de generación de reportes. Consiste en **tablas de dimensiones** y **tablas de hechos** para métricas específicas del negocio.

---

### 1. **gold.dim_customers**
- **Propósito:** Almacena detalles de clientes, enriquecidos con datos demográficos y geográficos.
- **Columnas:**

| Nombre de Columna | Tipo de Dato   | Descripción                                                                                   |
|-------------------|----------------|-----------------------------------------------------------------------------------------------|
| customer_key      | INT            | Clave sustituta que identifica de manera única cada registro de cliente.                      |
| customer_id       | INT            | Identificador numérico único asignado a cada cliente.                                         |
| customer_number   | NVARCHAR(50)   | Identificador alfanumérico que representa al cliente, usado para seguimiento y referencia.    |
| first_name        | NVARCHAR(50)   | Nombre del cliente, tal como está registrado en el sistema.                                   |
| last_name         | NVARCHAR(50)   | Apellido del cliente.                                                                         |
| country           | NVARCHAR(50)   | País de residencia del cliente (ejemplo: 'Australia').                                        |
| marital_status    | NVARCHAR(50)   | Estado civil del cliente (ejemplo: 'Married', 'Single').                                      |
| gender            | NVARCHAR(50)   | Género del cliente (ejemplo: 'Male', 'Female', 'n/a').                                        |
| birthdate         | DATE           | Fecha de nacimiento del cliente, en formato YYYY-MM-DD (ejemplo: 1971-10-06).                 |
| create_date       | DATE           | Fecha y hora en que se creó el registro del cliente en el sistema.                            |

---

### 2. **gold.dim_products**
- **Propósito:** Proporciona información sobre los productos y sus atributos.
- **Columnas:**

| Nombre de Columna    | Tipo de Dato   | Descripción                                                                                           |
|----------------------|----------------|-------------------------------------------------------------------------------------------------------|
| product_key          | INT            | Clave sustituta que identifica de manera única cada registro de producto.                             |
| product_id           | INT            | Identificador único asignado al producto para seguimiento y referencia interna.                       |
| product_number       | NVARCHAR(50)   | Código alfanumérico estructurado que representa el producto, usado para categorización o inventario.  |
| product_name         | NVARCHAR(50)   | Nombre descriptivo del producto, incluyendo detalles clave como tipo, color y tamaño.                 |
| category_id          | NVARCHAR(50)   | Identificador único de la categoría del producto, vinculando su clasificación de alto nivel.          |
| category             | NVARCHAR(50)   | Clasificación general del producto (ejemplo: 'Bikes', 'Components') para agrupar ítems relacionados.  |
| subcategory          | NVARCHAR(50)   | Clasificación más detallada del producto dentro de la categoría, como tipo de producto.               |
| maintenance_required | NVARCHAR(50)   | Indica si el producto requiere mantenimiento (ejemplo: 'Yes', 'No').                                  |
| cost                 | INT            | Costo o precio base del producto, medido en unidades monetarias.                                      |
| product_line         | NVARCHAR(50)   | Línea o serie específica a la que pertenece el producto (ejemplo: 'Road', 'Mountain').                |
| start_date           | DATE           | Fecha en que el producto estuvo disponible para la venta o uso.                                       |

---

### 3. **gold.fact_sales**
- **Propósito:** Almacena datos transaccionales de ventas para fines analíticos.
- **Columnas:**

| Nombre de Columna | Tipo de Dato   | Descripción                                                                                   |
|-------------------|----------------|-----------------------------------------------------------------------------------------------|
| order_number      | NVARCHAR(50)   | Identificador alfanumérico único para cada orden de venta (ejemplo: 'SO54496').               |
| product_key       | INT            | Clave sustituta que vincula la orden con la tabla de dimensión de productos.                  |
| customer_key      | INT            | Clave sustituta que vincula la orden con la tabla de dimensión de clientes.                   |
| order_date        | DATE           | Fecha en que se realizó la orden.                                                             |
| shipping_date     | DATE           | Fecha en que la orden fue enviada al cliente.                                                 |
| due_date          | DATE           | Fecha de vencimiento del pago de la orden.                                                    |
| sales_amount      | INT            | Valor monetario total de la venta para el ítem, en unidades enteras de moneda (ejemplo: 25).  |
| quantity          | INT            | Número de unidades del producto ordenadas para el ítem (ejemplo: 1).                          |
| price             | INT            | Precio por unidad del producto para el ítem, en unidades enteras de moneda (ejemplo: 25).     |
